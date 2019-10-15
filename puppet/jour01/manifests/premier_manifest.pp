file { '/tmp/formation':
  ensure  => 'present',
  content => "Premier Manifest Puppet \n Hello every body\n",
}
