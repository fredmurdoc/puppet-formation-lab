# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include apache::engine
class apache::engine (
  $mod_proxy = true
) inherits apache::params {

  if $mod_proxy{
    exec { 'active_proxy_mod':
      command => '/usr/sbin/a2enmod proxy_http',
      notify  => Service[$service]
    }
  }
  else{
    exec { 'desactive_proxy_mod':
      command => '/usr/sbin/a2dismod proxy_http',
      notify  => Service[$service]
    }
  }

  notify{'install_apache_package' :
    message => "package ${package}";
    }

  package { $package:
    ensure => 'latest'
  }
  notify{'install_apache_service' :
    message => "service ${package}";
    }

  notice("apache package ${package} and service ${service}")


  service { $service:
    ensure => 'running',
    enable => true,
  }

  # utilisation de resources statiques
  file{"${www_dir_prefix}/clean.sh":
    source  => 'puppet:///modules/apache/clean.sh',
    mode    => '0755',
    owner   => "${user}",
    group   => "${group}",
    replace => 'no',
    }
}