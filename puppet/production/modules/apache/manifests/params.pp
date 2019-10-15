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
    }
    'RedHat', 'CentOs' : {
      $package = 'httpd';
      $service = 'httpd';
      $user = 'apache';
      $group = 'apache';
      $vhost_confdir = 'conf.d';
      $www_dir_prefix = "/usr/share/${service}"
    }
    default:{
      $package = 'kamoulox';
      $service = 'kamoulox';
      fail("cannot define package and service for ${facts['os']['family']}")
    }
  }
}
