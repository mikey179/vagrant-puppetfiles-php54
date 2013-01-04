class php54::pear {

  package { 'php-pear':
    ensure  => present,
    before  => Exec['pear config-set auto_discover 1'],
    require => Package['php5-cli'],
  }

  exec { 'pear config-set auto_discover 1':
    command => '/usr/bin/pear config-set auto_discover 1',
    before  => Exec['pear upgrade'],
  }

  exec { 'pear upgrade':
    command => '/usr/bin/pear upgrade',
    before  => Exec['pear install pear.phpunit.de/PHPUnit'],
  }

  exec { 'pear install pear.phpunit.de/PHPUnit':
    command => '/usr/bin/pear install pear.phpunit.de/PHPUnit',
    creates => '/usr/share/php/PHPUnit/Autoload.php',
  }

  package { 'graphviz':
    ensure => present,
    before => Exec['pear install pear.phpdoc.org/phpDocumentor-alpha'],
  }

  exec { 'pear install pear.phpdoc.org/phpDocumentor-alpha':
    command => '/usr/bin/pear install pear.phpdoc.org/phpDocumentor-alpha',
    creates => '/usr/share/php/phpDocumentor/installer.php',
  }
}
