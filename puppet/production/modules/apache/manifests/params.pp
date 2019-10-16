# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include apache::params
class apache::params {

  case $facts['os']['family'] {
    'Debian' : {
      $package = 'apache2';
      $service = 'apache2';
      $vhost_confdir = 'sites-available';
      $user = 'www-data';
      $group = 'www-data';
      $www_dir_prefix = '/var/www'
      $is_debian_like = true
    }
    'RedHat', 'CentOs' : {
      $package = 'httpd';
      $service = 'httpd';
      $user = 'apache';
      $group = 'apache';
      $vhost_confdir = 'conf.d';
      $www_dir_prefix = "/usr/share/${service}"
      $is_debian_like = false
    }
    default:{
      $package = 'kamoulox';
      $service = 'kamoulox';
      $is_debian_like = false
      fail("cannot define package and service for ${facts['os']['family']}")
    }
  }
}
