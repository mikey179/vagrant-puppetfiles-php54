class php54::composer {

  file { '/home/vagrant/bin':
    ensure => directory,
    owner  => 'vagrant',
    before => Package['curl'],
  }

  package { 'curl':
    ensure => present,
    before => Exec['install composer'],
  }

  exec { 'install composer':
    command => '/usr/bin/curl -s http://getcomposer.org/installer | /usr/bin/php -- --install-dir=/home/vagrant/bin',
    path    => '/home/vagrant/bin',
    require => Package['php5-cli'],
    creates => '/home/vagrant/bin/composer.phar'
  }

  file { '/home/vagrant/bin/composer.phar':
    mode    => '0755',
    owner   => 'vagrant',
    require => Exec['install composer'],
  }
}
