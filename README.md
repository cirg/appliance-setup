Appliance Setup
===============

1) Boot TurnKey Core (12)

    http://www.turnkeylinux.org/core

2) Clone appliance-setup repo to /opt/appliance-setup

    git clone --recursive \
        https://github.com/cirg/appliance-setup.git \
        /opt/appliance-setup

   (Optional) Check out a specific version (tag or branch)

    cd /opt/appliance-setup && git checkout <tag|branch>

3) Run setup

    /opt/appliance-setup/bin/appliance-setup apply
