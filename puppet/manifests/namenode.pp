class { '::rvm': }

rvm_system_ruby { 'ruby-1.9':
    ensure      => 'present',
    default_use => true,
}
