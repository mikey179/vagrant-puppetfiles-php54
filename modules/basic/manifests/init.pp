class basic {

  exec { 'apt-get update':
    command => '/usr/bin/apt-get update',
  }

  package { 'vim':
    ensure  => present,
    require => Exec['apt-get update'],
  }

  file { '/home/vagrant/workspace':
    ensure => link,
    target => '/vagrant',
    owner  => 'vagrant',
  }
}
