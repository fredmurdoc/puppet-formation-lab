
if [ ! -f /etc/debian_version ]; then
    echo "RH-LIKE"
    
    sudo yum install -y wget
    cd /tmp
    wget http://yum.puppetlabs.com/puppet6-release-el-7.noarch.rpm
    sudo rpm -i puppet6-release-el-7.noarch.rpm
    sudo yum install -y puppet-agent
else
    echo "DEBIAN-LIKE"
    cd /tmp
    wget http://apt.puppetlabs.com/puppet6-release-xenial.deb

    sudo dpkg -i puppet6-release-xenial.deb

    sudo apt update

    mhostname="$(hostname)"
    if [ "${mhostname}" == "master" ]; then
        echo "install server master : $mhostname"
        sudo apt install -y puppetserver
    else
        echo "install client : $mhostname"
        sudo apt install -y puppet-agent
    fi
fi