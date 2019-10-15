# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include apache::vhost
class apache::vhost(
  $apache_hostname
) inherits apache::params{

  file{ "${www_dir_prefix}/${apache_hostname}":
    ensure => 'directory',
    mode   => '0775',
    owner   => "${user}",
    group   => "${group}",
  }

  file{ "${www_dir_prefix}/${apache_hostname}/index.html":
    ensure  => 'present',
    mode    => '0775',
    owner   => "${user}",
    group   => "${group}",
    content      => template('apache/index.default.vhost.erb'),
  }

  file{ "/etc/${service}/${vhost_confdir}/${apache_hostname}.conf":
    content      => template('apache/vhost.conf.erb'),
    ensure       => 'file',
    mode         => '0775',
    owner   => "${user}",
    group   => "${group}",
    #validate_cmd => "/usr/sbin/${service} -t -f %",
  }

  # utilisation de resources statiques
  file{"${www_dir_prefix}/${apache_hostname}/nm.png":
    source  => 'puppet:///modules/apache/nm.png',
    mode    => '0755',
    owner   => "${user}",
    group   => "${group}",
  }
  file{"${www_dir_prefix}/${apache_hostname}/puppet.svg":
    source  => 'puppet:///modules/apache/Puppet_Logo.svg',
    mode    => '0755',
    owner   => "${user}",
    group   => "${group}",
  }

  if $facts['os']['family'] == 'Debian' {
    file{ "/etc/${service}/sites-enabled/${apache_hostname}.conf":
      ensure       => 'link',
      target       => "/etc/${service}/${vhost_confdir}/${apache_hostname}.conf",
      mode         => '0775',
      owner   => "${user}",
      group   => "${group}",
    }
  }
}
