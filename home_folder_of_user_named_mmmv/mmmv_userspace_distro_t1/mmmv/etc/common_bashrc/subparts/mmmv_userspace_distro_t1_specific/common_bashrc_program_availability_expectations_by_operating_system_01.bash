#!/usr/bin/env bash
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
#
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#==========================================================================
S_FP_DIR_TMP_0="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [ "$MMMV_USERSPACE_DISTRO_T1_HOME" == "" ]; then
    MMMV_USERSPACE_DISTRO_T1_HOME="`cd $S_FP_DIR_TMP_0/../../../../../; pwd`"
fi
#--------------------------------------------------------------------------
if [ "$MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1" != "mode_ok_to_load" ]; then
    S_ERR_CODE="1"
    echo ""
    echo "This script is expected to be a sub-part of the "
    #--------------------
    echo "$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/common_bashrc/common_bashrc_main.bash"
    #--------------------
    if [ "$MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1" != "" ]; then
        echo ""
        echo "    MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1==$MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1"
        echo ""
    fi
    echo -e "\e[31mExiting with an error code $S_ERR_CODE . \e[39m"
    echo "GUID=='45168418-8e69-48d0-94e9-11d251e05ae7'"
    echo ""
    exit $S_ERR_CODE # exit with an error
fi
#--------------------------------------------------------------------------
# Code for copy-pasting:
# if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
# if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID" == "f" ]; then
# if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
# if [ "$SB_OPERATINGSYSTEM_BSD" == "t" ]; then
# if [ "$SB_OPERATINGSYSTEM_LINUX_WSL" == "f" ]; then
#--------------------------------------------------------------------------
SB_I3WINDOW_MANAGER_EXPECTED_TO_BE_INSTALLABLE="f"
if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID" == "f" ]; then
        if [ "$SB_OPERATINGSYSTEM_LINUX_WSL" == "f" ]; then
            SB_I3WINDOW_MANAGER_EXPECTED_TO_BE_INSTALLABLE="t"
        fi
    fi
else
    if [ "$SB_OPERATINGSYSTEM_BSD" == "t" ]; then
        SB_I3WINDOW_MANAGER_EXPECTED_TO_BE_INSTALLABLE="t"
    fi
fi
#==========================================================================
# S_VERSION_OF_THIS_FILE="519f9235-1fcc-4dd1-a2e9-11d251e05ae7"
#==========================================================================
