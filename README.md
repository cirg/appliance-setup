Appliance Setup
===============

Quick Start
-----------

1.  Boot [TurnKey Core 12](http://www.turnkeylinux.org/core)

2.  Clone appliance-setup repo to /opt/appliance-setup

        git clone --recursive \
            https://github.com/cirg/appliance-setup.git \
            /opt/appliance-setup

   (Optional) Check out a specific version (tag or branch)

        cd /opt/appliance-setup && git checkout <tag|branch>

3.  Run setup

        APPLIANCE_COMPONENTS="kenyaemr" /opt/appliance-setup/bin/appliance-setup apply

    Look at the files under
    `puppet/modules/appliance_components/manifests` for available
    components.
