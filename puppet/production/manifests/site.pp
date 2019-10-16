# Manifest principal

# Include d'une classe
node default {
  include bootstrap
}

node srv01.formation.lan, srv02.formation.lan {
  class {'apache::engine':
    mod_proxy => true
  }
}


hiera('virtual_hosts').each |$key, $vhost|{
  notice("${vhost}")
  notice("${vhost} - generate apache colorized ${vhost['color']} vhost ${vhost['hostname']}")
  apache::vhost{"${vhost['hostname']}":
    apache_hostname => "${vhost['hostname']}",
    color           => "${vhost['color']}"
  }
}
