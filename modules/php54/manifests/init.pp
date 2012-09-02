require basic
class php54 {
    package { 'python-software-properties':
        ensure => present,
        before => Exec['add-apt-repository ppa:ondrej/php5'],
    }

    exec { 'add-apt-repository ppa:ondrej/php5':
        command => '/usr/bin/add-apt-repository ppa:ondrej/php5',
        require => Package['python-software-properties']
    }

    exec { 'apt-get update 2':
        command => '/usr/bin/apt-get update',
        require => Exec['add-apt-repository ppa:ondrej/php5'],
    }

    package { 'php5-cli':
        ensure => present,
        require => Exec['apt-get update 2'],
    }

    package { 'php5-xdebug':
        ensure => present,
        require => Package['php5-cli'],
    }

    package { 'php5-xsl':
        ensure => present,
        require => Package['php5-cli'],
    }

    file { '/etc/php5/mods-available/date.ini':
        ensure => file,
        require => Package['php5-cli'],
        content => 'date.timezone = "Europe/Berlin"',
    }

    file { '/etc/php5/conf.d/10-date.ini':
        ensure => link,
        target => '/etc/php5/mods-available/date.ini',
    }
}
