# Class: bootstrap
#
#

class bootstrap {
  # declaration de la classes avec include
  include vars
  class {'manage_ssh':}
  # declaration de la classes via le mode resource, afin de spécifier des parametres
  class {'manage_users':}
}
