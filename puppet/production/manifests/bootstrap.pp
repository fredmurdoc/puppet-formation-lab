# Class: bootstrap
#
#

class bootstrap(
  $users,
  $groups,
  $files,
  $ssh_authorized_keys
  ) {
  # declaration de la classes avec include
  include vars
  class {'manage_ssh':}
  create_resources('user', $users)
  create_resources('group', $groups)
  create_resources('file', $files)
  create_resources('ssh_authorized_key', $ssh_authorized_keys)

}
