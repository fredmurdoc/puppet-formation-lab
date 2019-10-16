#poitn d'entrée

node default {
  $role = hiera('role')
  if $role{
    notice("chargement du role role::${role}")
    include "role::${role}"
  }
  else{
    notice('chargement du role role::base')
    include role::base
  }
}
