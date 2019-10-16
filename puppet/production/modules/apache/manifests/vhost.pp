# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include apache::vhost
define apache::vhost(
  $apache_hostname
) {
  include apache::params

  $vhost_htmldir = "${apache::params::www_dir_prefix}/${apache_hostname}"

  file{ "${apache::params::www_dir_prefix}/${apache_hostname}":
    ensure => 'directory',
    mode   => '0775',
    owner   => "${apache::params::user}",
    group   => "${apache::params::group}",
  }

  file{ "${apache::params::www_dir_prefix}/${apache_hostname}/index.html":
    ensure  => 'present',
    mode    => '0775',
    owner   => "${apache::params::user}",
    group   => "${apache::params::group}",
    content      => template('apache/index.default.vhost.erb'),
  }

  file{ "/etc/${apache::params::service}/${apache::params::vhost_confdir}/${apache_hostname}.conf":
    content      => template('apache/vhost.conf.erb'),
    ensure       => 'file',
    mode         => '0775',
    owner   => "${apache::params::user}",
    group   => "${apache::params::group}",
    #validate_cmd => "/usr/sbin/${service} -t -f %",
  }

  # utilisation de resources statiques
  file{"${apache::params::www_dir_prefix}/${apache_hostname}/nm.png":
    source  => 'puppet:///modules/apache/nm.png',
    mode    => '0755',
    owner   => "${apache::params::user}",
    group   => "${apache::params::group}",
  }
  file{"${apache::params::www_dir_prefix}/${apache_hostname}/puppet.svg":
    source  => 'puppet:///modules/apache/Puppet_Logo.svg',
    mode    => '0755',
    owner   => "${apache::params::user}",
    group   => "${apache::params::group}",
  }

  if apache::params::is_debian_like == true {
    file{ "/etc/${apache::params::service}/sites-enabled/${apache_hostname}.conf":
      ensure       => 'link',
      target       => "/etc/${apache::params::service}/${apache::params::vhost_confdir}/${apache_hostname}.conf",
      mode         => '0775',
      owner   => "${apache::params::user}",
      group   => "${apache::params::group}",
    }
  }
}
