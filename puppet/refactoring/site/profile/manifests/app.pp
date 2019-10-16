# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include profile::app
class profile::app {

package { 'openjdk-8-jdk':
  ensure => 'present'
}

tomcat::install { '/opt/tomcat':
  source_url => 'https://www.apache.org/dist/tomcat/tomcat-7/v7.0.96/bin/apache-tomcat-7.0.96.tar.gz',
}
tomcat::instance { 'default':
  catalina_home => '/opt/tomcat',
}

tomcat::config::server::connector { 'tomcat-http':
  catalina_base         => '/opt/tomcat',
  port                  => '8081',
  protocol              => 'HTTP/1.1',
  additional_attributes => {
    'redirectPort' => '8443'
  },
}

}
