exec { "apt-get update":
  path => "/usr/bin",
}
package { "apache2":
  ensure  => present,
  require => Exec["apt-get update"],
}
service { "apache2":
  ensure  => "running",
  require => Package["apache2"],
}

package { "git":
  ensure  => present,
  require => Exec["apt-get update"],
}

package { "mysql-server":
	ensure => present,
	require => Exec["apt-get update"],
}
package { "mysql-client":
	ensure => present,
	require => Exec["apt-get update"],
}

package { "php5":
	ensure => present,
	require => Exec["apt-get update"],
}
package { "php5-curl":
	ensure => present,
	require => Package["php5"],
}
package { "curl":
	ensure => present,
}
exec { "curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer":
  path => "/usr/bin/local",
  require => [	Package["php5-curl"],
  				Package["curl"]
  			]
}

file { "/var/www/respond":
  ensure  => "link",
  target  => "/vagrant/respond",
  require => Package["apache2"],
  notify  => Service["apache2"],
}