class ambari::server ($ownhostname) {
  Exec {
    path => ["/bin/", "/sbin/", "/usr/bin/", "/usr/sbin/"] }

  # Ambari Repo
  exec { 'get-ambari-server-repo':
    command => "wget http://public-repo-1.hortonworks.com/ambari/centos6/2.x/updates/2.1.0/ambari.repo",
    cwd     => '/etc/yum.repos.d/',
    creates => '/etc/yum.repos.d/ambari.repo',
    user    => root
  }

  package { 'postgresql-server':
    ensure  => present,
    require => Exec[get-ambari-server-repo]
  }

  # Ambari Server
  package { 'ambari-server':
    provider    => rpm,
    source      => '/vagrant/ambari-server-2.1.0-1470.x86_64.rpm',
    ensure  => present,
    require => Package[postgresql-server]
  }

  exec { 'ambari-setup':
    command => "ambari-server setup -s",
    user    => root,
    timeout => 3000,
    require => Package[ambari-server]
  }

#  ambari_service { 'ambari-server':
#  }

  exec { 'ambari-server-start':
    command => "ambari-server start",
    require => [Package[ambari-server], Exec[ambari-setup]],
    onlyif  => 'ambari-server status | grep "not running"'
  }
}