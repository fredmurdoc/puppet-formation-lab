# Manifest principal

# Include d'une classe
node default {
  include bootstrap
}

node srv01.formation.lan, srv02.formation.lan {
  class {'apache::engine':
    mod_proxy => true
  }
  class {'apache::vhost':
    apache_hostname => 'www.example.com'
  }
}
