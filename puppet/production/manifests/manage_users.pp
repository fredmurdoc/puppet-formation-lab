# Class: manage_users
#
#
class manage_users {
  # resources
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

  file { '/home/test/.ssh':
    ensure => 'directory',
    mode   => '0700',
    owner  => 'test',
    group  => 'fakeusers'
  }

  ssh_authorized_key { 'test@fake':
    ensure => 'present',
    user   => 'test',
    key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDANG24ezaSLseB3fMkFR7U69I9akRKNvPwBnfll1k1J0+RrIneZoFkaVu0r6v89g1ADJb+qQxT0E6iw6slqSwFR8nO6pibeFJ7QlJaIqnvQ5QQDS6ScFK00ed9M6OwC9xHGmNKSDDE0Z68eRsbJzkvloJFCwMINx9kB5n9IEbm4ZdkhCdN0vTjIynTozbvIJ4Ljp7XZxPhHSB3NG0xxIq7qEll7IN9iLZyb6+/PfjZpFdLawTtFqiowNbd5yY/Taclr8Th/NKKoRJO1EbO9QZ5vlHWDVLMgEwJNSN028fywb+3w3iXhcwTkf68OFa2SWtzYQjJJAcBmXapRWfbdhcl',
    type   => 'ssh-rsa',
  }

  #sshkey {'testkey':
  #  ensure => 'present',
  #  name   => 'srv01',
  #  type   => 'ssh-rsa',
  #  key    => 'MIIEpAIBAAKCAQEAwDRtuHs2ki7Hgd3zJBUe1OvSPWpESjbz8AZ35ZdZNSdPkayJ3maBZGlbtK+r/PYNQAyW/qkMU9BOosOrJaksBUfJzuqYm3hSe0JSWiKp70OUEA0uknBStNHnfTOjsAvcRxpjSkgwxNGevHkbGyc5L5aCRQsDCDcfZAeZ/SBG5uGXZIQnTdL04yMp06M27yCeC46e12cT4R0gdzRtMcSKu6hJZeyDfYi2cm+vvz342aRXS2sE7RaoqMDW3ecmP02nJa/E4fzSiqESTtRGzvUGeb5R1g1SzIBMCTUjdNvH8sG/t8N4l4XME5H+vDhWtklrc2EIySQHAZl2qUVn23YXJQIDAQABAoIBAG4LFm6zDLFxWwR9oMGd3gMl6T8EYojjIZLhATBQEOEf2qyazmyo35gvwjOXCK9R6JAtJR40hzxNXVhPEuQDEZMMYPy40BrjLsYnWKMGiajVViZChdGNwayJKTJDqIoYoEuNTh+vaUymf22FIQHQ2SrnzzncbiX7+Vr6By4nlrCEpXxbHxJrn/o+AwiwuS5wlVAaR3vF4360iGkura3oBBY+RL3m+bmurNbwuLCPr5xtQ2Jqop0SeZImuyHvUBh4X53h18ygzQUZKCDIVpY2TD1bII9ksNh2uqH+Vh9SXjzVE/VoaO0PWIGd0nXoTOGAwWt+ZckmSpMZlIutmZjmrtkCgYEA8lAL0zl2E9NjssknjtWhddVcLE26diOAef43NAohp7+Z8eS/NsyewMFsjKY6dhzd+7Sx6SDmlXXQx2fG2QX9J+6hZc7pJyw1oUkSMCpu3lJx9AtKwL/ws7xC5g3PZG4sJskJsoTM8zkEonNXZg4pMjbi4Yoa/hnP2CiikCDa6a8CgYEAyw/Ml50Hl9dyhiC9fwhqE6S9mvR0CLPM/PHrlm4oTA1GJP0Jmx6zlFyo6q3eN4KLVFFnmRdMQwkEaRRTuw5+AOYFLTYWLrursGDPbJq/elB79jvtBP1LcVMX+2cEi7H5MHJqCrL4j2F2GDy+JxpaeBy9yVCcJZ6NUqc14ER6BWsCgYAUe7fEL0NQAbqXznFNnbl8YIDeLePpQK8HoPnBqGmX6JZ24ENZuopg+PjYGuUuPtp1AJ1Ze7KCR+dSM++XQO5Zhc6W8Jq8+Pu/mpGzCKM+n/GKE7pJ+O+8AdoV4Gz7rGSHEs+DC77XgKZnpSBqPCA3YnRjZG1LtZrgRu8XB+/5eQKBgQCIjQRRBEkB4+Dgr42eqmLi+MqENFT/MSHtCyYYz9ULZ3W/E+XsyVWLtE/nGKqxe3kEZ4WaHl+rSJoNq5yu0o0LP6NFhvSd0pgfEMsLxnhy4UKrEBtQWqDsASvEZL9azYC8AoSq0zVw/eIzZE2e8ArccL9zbGDEr31rkoQZXxMLJwKBgQCmSetPRzjZDzZoEThVwqXqlHRq+iFoiPrIUc3k53IU1LH3XNlaZnO69I8mpfLv8qvP94ZmUk2pFbI3U0cTfPbloNvFUgLHsVAlUtZg2ykZR8/3SYgRnTTm+7F34PLCiWa2rgB5eyvRMcVj3Ga5zAHQ4AwE4utO/G5ti+spgvMzgA==',
  #  #notify => Service['sshd'],
  #  }
  notify{'include_class_user' :
    message  => 'complexe : class inclue',
    withpath => true,
  }
}
