#!/bin/bash

echo "setenv MGC_HOME /s/mentor-2018/@sys/V10.0BSXE/MGC_HOME.ixl" >> ~/.cshrc
echo "setenv SDD_HOME /s/mentor-2018/@sys/V10.0BSXE/SDD_HOME" >> ~/.cshrc
echo "setenv PATH $PATH:/s/mentor-2018/@sys/bin:/s/mentor-2018/@sys/bin.pclinux:/s/mentor2018/@sys/V10.0BSXE/MGC_HOME.ixl/bin:/s/mentor-2018/@sys/modelsim_dlx/bin" >> ~/.cshrc
echo "setenv MGLS_LICENSE_FILE /s/mentor-2018/etc/cust/mgls/mgc.licenses" >> ~/.cshrc
echo "Finished environment configuration for vsim"
