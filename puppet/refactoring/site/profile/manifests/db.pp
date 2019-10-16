# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include profile::db
class profile::db{

  class { '::mysql::server':
    root_password           => 'strongpassword',
    remove_default_accounts => true,
    override_options        => $override_options
  }

  create_resources('mysql::db', hiera('profile::db::databases'))


}
