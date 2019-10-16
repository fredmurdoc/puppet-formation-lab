# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include profile::web
class profile::web {

  class {'apache::engine':
      mod_proxy => true
    }

  hiera('virtual_hosts').each |$key, $vhostrp|{
    notice("${vhostrp}")
    notice("${vhostrp} - generate apache reverse proxy vhost ${vhostrp['apache_hostname']} to ${vhostrp['upstream_server']}")
    apache::vhostrp{"${vhostrp['apache_hostname']}":
      apache_hostname => "${vhostrp['apache_hostname']}",
      upstream_server => "${vhostrp['upstream_server']}"
    }
    #create_resources('apache::vhostrp', $vhostrp)
  }

}
