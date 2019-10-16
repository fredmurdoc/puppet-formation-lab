# Class: bootstrap
#
#

class bootstrap {
  # declaration de la classes avec include
  include vars
  class {'manage_ssh':}
  create_resources('user', hiera('bootstrap::users'))

}
