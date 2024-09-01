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
    echo "GUID=='aab68238-3e2b-45cd-a3d9-1050804088e7'"
    echo ""
    exit $S_ERR_CODE # exit with an error
fi
#--------------------------------------------------------------------------
MMMV_USERSPACE_DISTRO_T1_CORE_APPLICATIONS_SET_01="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/lib/core_applications_set_01"
#--------------------------------------------------------------------------
# POOLELI: all olev kasutusele v8tta p2rast kui mmmv_HTMLfile_2_list_of_a_tag_URLs_file_extensions_set_01_t1 valmis on.
# S_TMP_0="$MMMV_USERSPACE_DISTRO_T1_CORE_APPLICATIONS_SET_01/mmmv_HTMLfile_2_list_of_a_tag_URLs_file_extensions_set_01_t1"
# if [ -e "$S_TMP_0" ]; then
#     if [ "$SB_SORT_EXISTS_ON_PATH" == "t" ]; then
#         if [ "$SB_SED_OR_GSED_EXISTS_ON_PATH" == "t" ]; then
#             if [ "$SB_GREP_EXISTS_ON_PATH" == "t" ]; then
#                 if [ "$SB_TR_EXISTS_ON_PATH" == "t" ]; then
#                     if [ "$SB_PRINTF_EXISTS_ON_PATH" == "t" ]; then
#                         if [ "$SB_CAT_EXISTS_ON_PATH" == "t" ]; then
#                             export Z_PATH="$S_TMP_0/bin:$Z_PATH"
#                         fi
#                     fi
#                 fi
#             fi
#         fi
#     fi
# fi
#==========================================================================
# S_VERSION_OF_THIS_FILE="259fa011-5669-40da-b2d9-1050804088e7"
#==========================================================================
