#!/usr/bin/env bash
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
#
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#==========================================================================
S_FP_DIR_TMP_0="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" 
S_FN_SCRIPTFILE_TMP_0="`basename ${BASH_SOURCE[0]}`"
if [ "$MMMV_USERSPACE_DISTRO_T1_HOME" == "" ]; then
    MMMV_USERSPACE_DISTRO_T1_HOME="`cd $S_FP_DIR_TMP_0/../; pwd`/mmmv_userspace_distro_t1"
fi
#--------------------------------------------------------------------------

if [ "$MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1" != "mode_ok_to_load" ]; then
    S_ERR_CODE="1"
    echo ""
    echo "This script is expected to be a sub-part of the "
    #--------------------
    #echo "/home/mmmv/mmmv_userspace_distro_t1/mmmv/etc/common_bashrc/common_bashrc_main.bash"
    echo "$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/common_bashrc/common_bashrc_main.bash"
    #--------------------
    if [ "$MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1" != "" ]; then
        echo ""
        echo "    MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1==$MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1"
        echo ""
    fi
    echo -e "\e[31mExiting with an error code $S_ERR_CODE\e[39m ."
    echo "GUID=='a1645614-52ab-4b9d-8410-2291b03088e7'"
    echo ""
    exit $S_ERR_CODE # exit with an error
fi
#--------------------------------------------------------------------------
MMMV_USERSPACE_DISTRO_T1_BIN_INSTALLED_PROGRAM_SPECIFIC="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin_installed_program_specific"
#--------------------------------------------------------------------------
if [ "$SB_RUBY_EXISTS_ON_PATH" != "t" ]; then
   if [ "`which ruby 2> /dev/null`" != "" ]; then
       SB_RUBY_EXISTS_ON_PATH="t"
   fi
fi
if [ "$SB_VIM_EXISTS_ON_PATH" != "t" ]; then
    if [ "`which vim 2> /dev/null`" != "" ]; then
        SB_VIM_EXISTS_ON_PATH="t"
    fi
fi
#----------------------------------------
SB_OK_TO_INLCUDE="f"
if [ "$SB_RUBY_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_VIM_EXISTS_ON_PATH" == "t" ]; then
        SB_OK_TO_INLCUDE="t"
    fi
fi
#----------------------------------------
if [ "$SB_OK_TO_INLCUDE" == "t" ]; then
    #------------------------------------
    S_TMP_0="$MMMV_USERSPACE_DISTRO_T1_BIN_INSTALLED_PROGRAM_SPECIFIC/mmmv_admin_vimwiki_list_of_wikis_2_vimrc_subpart_t1"
    export Z_PATH="$S_TMP_0/bin:$Z_PATH"
    #------------------------------------
fi
#--------------------------------------------------------------------------
# On PATH the binary of the par text formatter by Adam M. Costello, the  
# 
#     http://www.nicemice.net/par/
# 
# can have a name collision with "Perl Archive Toolkit"
# 
#     https://metacpan.org/pod/PAR
#     https://metacpan.org/dist/PAR/view/lib/PAR/Tutorial.pod
# 
# One way to overcome this issue is to rename the binary of the par text
# formatter to something else. In this case the relatively arbitrary
# choice has been:
# 
#     par -> par_text_formatter
# 
# If the par text formatter comes from a Debian package collection, then
# one option is to put a symlink to par on PATH and name that symlink to
# par_text_formatter.
if [ "$SB_PAR_TEXT_FORMATTER_EXISTS_ON_PATH" == "" ]; then
    SB_PAR_TEXT_FORMATTER_EXISTS_ON_PATH="f"
    #if [ "`which par 2> /dev/null`" != "" ]; then
    if [ "`which par_text_formatter 2> /dev/null`" != "" ]; then
        SB_PAR_TEXT_FORMATTER_EXISTS_ON_PATH="t"
        export PARINIT="rTbgqR B=.,?_A_a Q=_s>|" # from the par man page
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "par_text_formatter" "37a4e36a-ee4e-493b-8110-2291b03088e7"
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_PAR_TEXT_FORMATTER_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_UUID_EXISTS_ON_PATH" == "t" ]; then
        #------------------------------------
        S_TMP_0="$MMMV_USERSPACE_DISTRO_T1_BIN_INSTALLED_PROGRAM_SPECIFIC/par_text_formatter_dependent_bashrc_subparts/etc/clipboard_text_formatter_bashrc_subpart.bash"
        func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_TMP_0"
        #------------------------------------
    fi
fi
#--------------------------------------------------------------------------
S_TMP_0="$MMMV_USERSPACE_DISTRO_T1_BIN_INSTALLED_PROGRAM_SPECIFIC/bc_date_grep_GNUsed_rev"
if [ "$SB_SED_OR_GSED_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_BC_EXISTS_ON_PATH" == "t" ]; then
        if [ "$SB_GREP_EXISTS_ON_PATH" == "t" ]; then
            if [ "$SB_REV_EXISTS_ON_PATH" == "t" ]; then
                export Z_PATH="$S_TMP_0/bin:$Z_PATH"
            fi
        fi
    fi
fi
#--------------------------------------------------------------------------
S_TMP_0="$MMMV_USERSPACE_DISTRO_T1_BIN_INSTALLED_PROGRAM_SPECIFIC/setxkbmap_specific"
if [ "$SB_SETXKBMAP_EXISTS_ON_PATH" == "t" ]; then
    export Z_PATH="$S_TMP_0/bin:$Z_PATH"
fi
#--------------------------------------------------------------------------
if [ "$SB_QUTEBROWSER_EXISTS_ON_PATH" == "t" ]; then
    S_TMP_0="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin_installed_program_specific/qutebrowser_specific/bin"
    func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
        "$S_TMP_0" \
        "e280168b-ed56-4bd4-a310-2291b03088e7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        Z_PATH="$S_TMP_0:$Z_PATH"
    fi
fi
#--------------------------------------------------------------------------
S_TMP_0="$MMMV_USERSPACE_DISTRO_T1_BIN_INSTALLED_PROGRAM_SPECIFIC/par2_error_correction_file_utility_dependent_bashrc_subparts"
if [ "$SB_PAR2_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_SED_OR_GSED_EXISTS_ON_PATH" == "t" ]; then
        if [ "$SB_GREP_EXISTS_ON_PATH" == "t" ]; then
            if [ "$SB_FIND_EXISTS_ON_PATH" == "t" ]; then
                if [ "$SB_PRINTF_EXISTS_ON_PATH" == "t" ]; then
                    if [ "$SB_CAT_EXISTS_ON_PATH" == "t" ]; then
                        export Z_PATH="$S_TMP_0/bin:$Z_PATH"
                    fi
                fi
            fi
        fi
    fi
fi
#==========================================================================
# S_VERSION_OF_THIS_FILE="74605d3e-909f-4412-9410-2291b03088e7"
#==========================================================================
