if $facts['kernel'] == 'windows' {
  warning('code not implemented')
}
elsif $facts['kernel'] == 'linux' {
  notice('linux is there !!!')
}
else {
  error('system not supported')
}


if $facts['os']['family'] =~ '^[a-zA-Z]+ian' {
  warning("OS Family (${facts['os']['family']}) is Debian family!!!!")
}

if $facts['hostname'] =~ '^srv\d+.+' {
  notify{'Real client' :
    message => "your server hostname (${facts['hostname']}) is not an master !!! "
    }
}

case $facts['hostname']{
  /master/ : {warning('master side!!!!')}
  /srv(\d+)/ : {warning("client side!!!! ${1}")}
  /web(\d+)/ : {warning("web side!!!! ${1}")}
  default: { err('unknown')}
}


$packages = $facts['os']['family'] ? {
  'Debian' => ['apache2'],
  'RedHat' => ['httpd'],
}

notice("apache packages : ${packages}"")
