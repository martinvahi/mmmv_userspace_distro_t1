#!/usr/bin/env bash
#==========================================================================
# Author of this file: <INCOMPLETE: name of the author comes here>
# This file is in public domain.
#
# Initial author of the template of this file: Martin.Vahi@softf1.com
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#==========================================================================
#S_FP_DIR_TMP_0="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#if [ "$MMMV_USERSPACE_DISTRO_T1_HOME" == "" ]; then
#    MMMV_USERSPACE_DISTRO_T1_HOME="`cd $S_FP_DIR_TMP_0/../../../../../../; pwd`"
#fi
#--------------------------------------------------------------------------
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
    echo "GUID=='795f03ee-e302-4bdd-9fe5-7201d080a9e7'"
    echo ""
    exit $S_ERR_CODE # exit with an error
fi
#--------------------------------------------------------------------------
if [ "`whoami`" == "INCOMPLETE_please_update_this_blank_here" ]; then
    #----------------------------------------------------------------------
    S_FP_0="/home/mmmv/applications/declare_applications.bash"
    func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_FP_0"
    #----------------------------------------------------------------------
    # S_FP_BASHFILE="/some/custom/foo.bash"
    # SB_OK_4_THE_BASHFILE_2_BE_MISSING_OPTIONAL="f" # domain: {"","t","f"}
    # func_mmmv_include_bashfile_if_possible_t2 "$S_FP_BASHFILE" \
    #     "2ddf355a-788c-4c42-95e5-7201d080a9e7" "$SB_OK_4_THE_BASHFILE_2_BE_MISSING_OPTIONAL"
    #----------------------------------------------------------------------
    # S_TMP_PRINTERNAME="Martini_OKI_ML5520_maatriksprinter"
    # alias mmmv_print_OKI_ML5520_maatriksprinter="lp -d $S_TMP_PRINTERNAME " # name of the file comes here
    #----------------------------------------------------------------------
    S_TMP_0="$HOME/m_local/etc/list_of_vimwikis.txt"
    if [ "$SB_VIM_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_vim_edit_list_of_vimwikis="nice -n 2 vim $S_TMP_0 ; "
    fi
    if [ "$SB_RUBY_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_admin_update_list_of_vimwikis="mmmv_admin_vimwiki_list_of_wikis_2_vimrc_subpart_t1.rb '--origin=$S_TMP_0'"
    fi
    #----------------------------------------------------------------------
    # S_ALIASNAME="fm"
    # S_FP="/home/mmmv/applications/DoubleCommander_file_manager/v_1_1_22/bin/doublecmd"
    # if [ -e "$S_FP" ]; then
    #     if [ ! -d "$S_FP" ]; then
    #         S_TMP_0="`which $S_ALIASNAME 2> /dev/null`"
    #         if [ "$S_TMP_0" == ""  ]; then
    #             #----------------------------------------------------------
    #             S_TMP_1="`alias | grep -E \"alias +$S_ALIASNAME *[=]\"`"
    #             if [ "$S_TMP_1" == "" ]; then
    #                 S_SCRIPT="alias $S_ALIASNAME=\"$S_FP ./ \" "
    #                 eval ${S_SCRIPT}
    #             # else
    #             #     # The defined alias might be some alias other
    #             #     # than the one defined 4 lines upwards from this line.
    #             fi
    #             #----------------------------------------------------------
    #         else
    #             echo ""
    #             echo -e "Bash alias \"$S_ALIASNAME\"\e[31m will not be defined\e[39m,"
    #             echo "because a file with the path of "
    #             echo ""
    #             echo "    $S_TMP_0"
    #             echo ""
    #             echo -e "is\e[31m already on PATH\e[39m."
    #             echo "GUID=='32f77b92-cfca-4ff3-a1e5-7201d080a9e7'"
    #             echo ""
    #         fi
    #     fi
    # fi
    #----------------------------------------------------------------------
    # S_TMP_0="/home/mmmv/mmmv_userspace_distro_t1/attic/documentation/application_specific_documentation/vimwiki/notes_set_01/in_vimwiki_format/index.wiki"
    # if [ -e "$S_TMP_0" ]; then
    #     if [ ! -d "$S_TMP_0" ]; then
    #         alias mmmv_vimwiki_userspace_distro_t1_notes_set_01="vim $S_TMP_0 "
    #     fi
    # fi
    #----------------------------------------------------------------------
    # S_TMP_0="/home/mmmv/mmmv_userspace_distro_t1/attic/documentation/development_ideas/arendusideede_vimwiki/index.wiki"
    # if [ -e "$S_TMP_0" ]; then
    #     if [ ! -d "$S_TMP_0" ]; then
    #         alias mmmv_vimwiki_userspace_distro_t1_development_ideas="vim $S_TMP_0 "
    #     fi
    # fi
    #----------------------------------------------------------------------
    MMMV_USERSPACE_DISTRO_T1_HOSTNAME_SPECIFIC_INITIALISATIONS_TIMESTAMP="$S_TIMESTAMP"
fi
#==========================================================================
# S_VERSION_OF_THIS_FILE="65b1cf1e-0f29-4f67-b5e5-7201d080a9e7"
#==========================================================================
