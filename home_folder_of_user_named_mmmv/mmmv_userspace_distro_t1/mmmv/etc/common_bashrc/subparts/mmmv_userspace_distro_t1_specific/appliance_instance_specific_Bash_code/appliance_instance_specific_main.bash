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
    MMMV_USERSPACE_DISTRO_T1_HOME="`cd $S_FP_DIR_TMP_0/../../../../../../; pwd`"
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
    echo "GUID=='4510f5b3-c01d-4768-925e-4183602088e7'"
    echo ""
    exit $S_ERR_CODE # exit with an error
fi
#--------------------------------------------------------------------------
S_FP_APPLICATIONS="`cd $MMMV_USERSPACE_DISTRO_T1_HOME/../; pwd`/applications"
#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "t" ]; then
    if [ "$HOSTNAME" == "localhost" ]; then
    #----------------------------------------------------------------------
        S_FP_0="$S_FP_APPLICATIONS/declare_applications.bash"
        #func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_FP_0"
        #------------------------------------------------------------------
        S_TMP_0="/sdcard/Martin"
        SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING="f"
        func_mmmv_userspace_distro_t1_declare_alias_cd_t1 \
            "mmmv_go_Martin" "$S_TMP_0" \
            "5b129893-0fff-49a3-973e-4183602088e7" \
            "$SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING"
        #------------------------------------------------------------------
        MMMV_USERSPACE_DISTRO_T1_HOSTNAME_SPECIFIC_INITIALISATIONS_TIMESTAMP="$S_TIMESTAMP"
        #------------------------------------------------------------------
    fi
    #----------------------------------------------------------------------
fi
#--------------------------------------------------------------------------
S_FP_0="$S_FP_APPLICATIONS/declare_applications.bash"
if [ -e "$S_FP_0" ]; then
    func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
        "$S_FP_0" "381f1d02-64f7-4c06-971e-4183602088e7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_FP_0"
    fi
fi

#==========================================================================
# S_VERSION_OF_THIS_FILE="1c452642-3899-4636-a73e-4183602088e7"
#==========================================================================
