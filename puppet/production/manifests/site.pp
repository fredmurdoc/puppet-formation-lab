# Manifest principal

# Include d'une classe
node default {
  include bootstrap
}

node srv01.formation.lan, srv02.formation.lan {
  class {'apache::engine':
    mod_proxy => true
  }
  apache::vhost{'www.example.com':
    apache_hostname => 'www.example.com'
  }

  apache::vhost{'www.example2.com':
    apache_hostname => 'www.example2.com'
  }
}
