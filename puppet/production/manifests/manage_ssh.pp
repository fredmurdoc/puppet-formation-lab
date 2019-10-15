# Class: name
#
#
class manage_ssh {
  require vars

  service { 'sshd':
    ensure => 'running',
    enable => true,
  }

  package {'openssh-server':
    ensure => 'latest',
    }

  augeas { 'ssh_config':
    context => '/files/etc/ssh/sshd_config',
    changes => [
      'set PermitRootLogin yes',
      'set PasswordAuthentication no',
    ],
    notify  => Service[$vars::packages['sshd']],
    require => Package[$vars::packages['sshserver']]
  }

  notify{'include_class_ssh' :
    message  => 'complexe : class inclue',
    withpath => true,
  }
}
