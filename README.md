Appliance Setup
===============

Quick Start
-----------

1.  Boot [TurnKey Core 12](http://www.turnkeylinux.org/core)

    [Suggested route using VMDK in VirtualBox follows.  Continue on step
    2 using alternate VM hosting solution.]

    A. Create home for virtual hard disk on host and download image

        mkdir /opt/vm_virtual_disk
        cd /opt/vm_virtual_disk
        wget http://www.turnkeylinux.org/download?file=turnkey-core-12.0-squeeze-x86-vmdk.zip
        unzip turnkey*.zip

    B. Start up Virtual Box, and create a New Virtual Machine.

        name:  <anything>
        Operating System:  Linux
        Version: Ubuntu

        Memory: <at least 256 MB>
        Virtual Hard Disk: <select the *.vmdk from the expanded download above>

    C. Networking- it's likely you'll want to select the 'Bridged
       Adapter' under the network configuration for the VM, to be able to
       access the VM from the host or elsewhere.

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
