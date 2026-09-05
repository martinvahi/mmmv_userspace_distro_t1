#!/usr/bin/env bash
#==========================================================================
# Author of this file: <INCOMPLETE: name of the author comes here>
# Author of the template of this file: Martin.Vahi@softf1.com
# This file is in public domain.
#
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#==========================================================================
if [ "$MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1" != "mode_ok_to_load" ]; then
    S_ERR_CODE="1"
    echo ""
    echo "This script is expected to be a sub-part of the "
    if [ "$MMMV_USERSPACE_DISTRO_T1_HOME" != "" ]; then
        echo "$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/common_bashrc/common_bashrc_main.bash"
    else
        echo "\$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/common_bashrc/common_bashrc_main.bash"
    fi
    if [ "$MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1" != "" ]; then
        echo ""
        echo "    MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1==$MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1"
        echo ""
    fi
    echo -e "\e[31mExiting with an error code $S_ERR_CODE . \e[39m"
    echo "GUID=='7440512d-b472-4285-b501-51a1c0309ae7'"
    echo ""
    exit $S_ERR_CODE # exit with an error
fi
#--------------------------------------------------------------------------
if [ "$HOSTNAME" == "BLANKFORHOSTNAME" ]; then
    #----------------------------------------------------------------------
    S_FP_0="/home/mmmv/applications/declare_applications.bash"
    func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_FP_0"
    #----------------------------------------------------------------------
    # S_FP_BASHFILE="/some/custom/foo.bash"
    # SB_OK_4_THE_BASHFILE_2_BE_MISSING_OPTIONAL="f" # domain: {"","t","f"}
    # func_mmmv_include_bashfile_if_possible_t2 "$S_FP_BASHFILE" \
    #     "3850a461-8f24-4b99-8101-51a1c0309ae7" "$SB_OK_4_THE_BASHFILE_2_BE_MISSING_OPTIONAL"
    #----------------------------------------------------------------------
    if [ "$S_WHOAMI" == "" ]; then
        S_WHOAMI="`whoami`"
    fi
    #----------------------------------------------------------------------
    S_FP_FOLDER_WHERE_RAM_PARTITION_IS_EXPECTED_TO_BE_MOUNTED="/opt/custom_mount_points/RAM_30MiB"
    S_FP_1="$S_FP_FOLDER_WHERE_RAM_PARTITION_IS_EXPECTED_TO_BE_MOUNTED/$S_WHOAMI"
    if [ -e "$S_FP_FOLDER_WHERE_RAM_PARTITION_IS_EXPECTED_TO_BE_MOUNTED" ]; then
        if [ -d "$S_FP_FOLDER_WHERE_RAM_PARTITION_IS_EXPECTED_TO_BE_MOUNTED" ]; then
            if [ ! -h "$S_FP_FOLDER_WHERE_RAM_PARTITION_IS_EXPECTED_TO_BE_MOUNTED" ]; then
                alias mmmv_go_folder_RAM_partition_t1="cd $S_FP_FOLDER_WHERE_RAM_PARTITION_IS_EXPECTED_TO_BE_MOUNTED "
                alias mmmv_go_RAM_partition_t1="cd $S_FP_FOLDER_WHERE_RAM_PARTITION_IS_EXPECTED_TO_BE_MOUNTED "
                export MMMV_USERSPACE_DISTRO_T1_FP_RAM_PARTITION_64K="$S_FP_FOLDER_WHERE_RAM_PARTITION_IS_EXPECTED_TO_BE_MOUNTED"
            else
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo -e "Please fix the\e[31m issue\e[39m near GUID "
                    echo "    '09b40918-ae1d-4891-b301-51a1c0309ae7' "
                    echo -e "It is related to an\e[31m optional subpart of the $HOME/.bashrc \e[39m."
                    echo ""
                fi
            fi
        else
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                echo ""
                echo -e "Please fix the\e[31m issue\e[39m near GUID "
                echo "    '24ca4895-1f51-4890-a301-51a1c0309ae7' "
                echo -e "It is related to an\e[31m optional subpart of the $HOME/.bashrc \e[39m."
                echo ""
            fi
        fi
    else
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo -e "Please fix the\e[31m issue\e[39m near GUID "
            echo "    '100fdf18-ca36-4581-9201-51a1c0309ae7' "
            echo -e "It is related to an\e[31m optional subpart of the $HOME/.bashrc \e[39m."
            echo ""
        fi
    fi
    #----------------------------------------------------------------------
fi
#==========================================================================
# S_VERSION_OF_THIS_FILE="911b2d61-3f1e-4f30-ae01-51a1c0309ae7"
#==========================================================================
