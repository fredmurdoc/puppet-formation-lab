

user { 'test':
  ensure             => 'present',
  comment            => ',,,',
  gid                => 1020,
  home               => '/home/test',
  managehome         => true,
  password_max_age   => 99999,
  password_min_age   => 0,
  password_warn_days => 7,
  shell              => '/bin/bash',
  uid                => 1009,
}

group { 'fakeusers':
  ensure => 'present',
  gid    => 1020,
}

service { 'syslog.service':
  ensure => 'running',
  enable => true,
}

package { 'zip':
  ensure   => '3.0-11',
  provider => 'apt',
}
