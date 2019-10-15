export PATH=${PATH}:/opt/puppetlabs/bin
mhostname="$(hostname)"
if [ "${mhostname}" == "master" ]; then
    echo "install server master : $mhostname"
    systemctl enable puppetserver
    systemctl start puppetserver
else
    echo "install client : $mhostname"
    echo -e "[main]\nserver = master\n" | tee -a /etc/puppetlabs/puppet/puppet.conf
    puppet agent -t
fi
