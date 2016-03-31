$master1_hostname = 'nn1.example.com'
$master2_hostname = 'nn2.example.com'
$slaves           = ['dn1.example.com', 'dn2.example.com', 'dn3.example.com']
$frontends        = ['nn1.example.com']
$quorum_hostnames = [$master1_hostname, $master2_hostname, 'nn3.example.com']
$cluster_name     = 'example'

$hdfs_deployed      = true
$zookeeper_deployed = true

$packages = ['unzip', 'rubygems']

node default {

    package{ $packages:
        ensure  => present,
    }

    package { 'weavr':
        ensure      => present,
        provider    => gem,
        require     => Package[$packages]
    }
}

node 'nn1.example.com' {

    include ambari

    class { 'ambari::server':
        ownhostname => $master1_hostname
    }

    class { 'ambari::agent':
        ownhostname    => $::fqdn,
        serverhostname => $master1_hostname
    }
}

node /dn\d+.example.com/{

    include ambari

    class { 'ambari::agent':
        ownhostname    => $::fqdn,
        serverhostname => $master1_hostname
    }
}