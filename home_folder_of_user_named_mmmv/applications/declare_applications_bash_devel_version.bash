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
    echo "GUID=='4e1bd3d5-8ff7-40bd-91bc-13b3e03068e7'"
    echo ""
    exit $S_ERR_CODE # exit with an error
fi
#--------------------------------------------------------------------------
SB_APPLICATION_DECLARATION_SCRIPT_CUSTOMISED="t"
func_first_use_warning(){
    echo ""
    echo ""
    echo -e "\e[33mPlease customise this script\e[39m, the "
    echo ""
    echo -e "\e[33m    $S_FP_DIR_TMP_0/$S_FN_SCRIPTFILE_TMP_0\e[39m"
    echo ""
    echo "so that it matches Your setup. This message has been "
    echo "displayed from Bash code that resides near the following GUID:"
    echo "GUID=='4bb35b5b-2969-4b50-84bc-13b3e03068e7'"
    echo "Thank You."
    echo ""
    SB_APPLICATION_DECLARATION_SCRIPT_CUSTOMISED="f"
    # "exit 1" must not be here, because 
    # an exit clause would end the login session.
} # func_first_use_warning
#func_first_use_warning # Please outcomment this line after
                       # the customisations have been made. Thank You.
#--------------------------------------------------------------------------
func_declare_OpenJ9_alias_t1(){
    #----------------------------------------
    local MMMV_OPENJ9_HOME="$1"
    local S_ALIAS_NAME="$2"
    #----------------------------------------
    local MMMV_OPENJ9_LD_LIBRARY_PATH="$MMMV_OPENJ9_HOME/lib:$MMMV_OPENJ9_HOME/lib/server:$MMMV_OPENJ9_HOME/lib/j9vm:$MMMV_OPENJ9_HOME/lib/default"
    local S_TMP_0="mmmv/etc/common_bashrc/subparts/mmmv_userspace_distro_t1_specific/common_bashrc_java_related_OpenJ9.bash"
    local S_FP_OPENJ9_CONFIG="/home/mmmv/mmmv_userspace_distro_t1/$S_TMP_0"
    if [ "$MMMV_USERSPACE_DISTRO_T1_HOME" != "" ]; then
        S_FP_OPENJ9_CONFIG="$MMMV_USERSPACE_DISTRO_T1_HOME/$S_TMP_0"
    fi
    #----------------------------------------
    func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
        "$MMMV_OPENJ9_HOME" "8cc53f1a-6506-42bb-92bc-13b3e03068e7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        #----------------------------------------
        func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
            "$S_FP_OPENJ9_CONFIG" "2c459532-496c-498d-92bc-13b3e03068e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
            #alias mmmv_ui_add2PATH_Java_OpenJ9_2_envs_t1="export JAVA_HOME=\"$MMMV_OPENJ9_HOME\" ; export PATH=\"$MMMV_OPENJ9_HOME/bin:\$PATH\" ; export MANPATH=\"$MMMV_OPENJ9_HOME/man:\$MANPATH\" ; export LD_LIBRARY_PATH=\"$MMMV_OPENJ9_LD_LIBRARY_PATH:\$LD_LIBRARY_PATH\" ; source \"$S_FP_OPENJ9_CONFIG\" ; "
            S_TMP_0="alias $S_ALIAS_NAME=\"export JAVA_HOME=\\\"$MMMV_OPENJ9_HOME\\\" ; export PATH=\\\"$MMMV_OPENJ9_HOME/bin:\\\$PATH\\\" ; export MANPATH=\\\"$MMMV_OPENJ9_HOME/man:\\\$MANPATH\\\" ; export LD_LIBRARY_PATH=\\\"$MMMV_OPENJ9_LD_LIBRARY_PATH:\\\$LD_LIBRARY_PATH\\\" ; source \\\"$S_FP_OPENJ9_CONFIG\\\" ; \""
            eval ${S_TMP_0}
        fi
        #----------------------------------------
    fi
    #----------------------------------------
} # func_declare_OpenJ9_alias
#--------------------------------------------------------------------------
if [ "$SB_APPLICATION_DECLARATION_SCRIPT_CUSTOMISED" == "t" ]; then
#--------------------------------------------------------------------------
    S_FP_APPLICATIONS="$S_FP_DIR_TMP_0"
    #----------------------------------------------------------------------
    export M2="$S_FP_APPLICATIONS/Maven/v_3_6_3" # ..../bin/mvn depends on sh
    if [ "$SB_SH_EXISTS_ON_PATH" == "t" ]; then # TODO: eliminate the if-clause by updating the function below
        func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
            "$M2" "17617749-7a46-4762-85bc-13b3e03068e7" 
        alias mmmv_admin_mvn_download_plugin_org_apache_maven_plugins="nice -n 5 mvn dependency:get -DrepoUrl=mvnrepository.com/artifact/org.apache.maven.plugins "
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Ruby/v_x_x_x_in_use"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "576a2044-e807-4978-92bc-13b3e03068e7" 
    #----------------------------------------------------------------------
    #S_TMP_0="$S_FP_APPLICATIONS/rhash/v_1_4_2"
    S_TMP_0="$S_FP_APPLICATIONS/rhash/v_1_4_4"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "2a904842-c6d2-4345-a3bc-13b3e03068e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Par_text_formatter/v_1_53_0"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "2b79c4b5-e86a-4346-9cbc-13b3e03068e7" 
    SB_PAR_TEXT_FORMATTER_EXISTS_ON_PATH="t"
    export PARINIT="rTbgqR B=.,?_A_a Q=_s>|" # from the par man page
    #----------------------------------------------------------------------
    #S_TMP_0="$S_FP_APPLICATIONS/glimpse_search_engine/v_4_18_6"
    S_TMP_0="$S_FP_APPLICATIONS/glimpse_search_engine/v_4_18_6_modification_01"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "f2491334-cd6a-4c3e-84bc-13b3e03068e7" 
    export MANPATH="$S_TMP_0/man:$MANPATH" # needed due to nonconventional path
    SB_GLIMPSE_EXISTS_ON_PATH="t"
    SB_GLIMPSEINDEX_EXISTS_ON_PATH="t"
    SB_AGREP_EXISTS_ON_PATH="t"
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/libtool_GNU/v_2_4_6"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "ce35f824-3ab3-4ae2-92bc-13b3e03068e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Fossil/v_2_19"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "92dc24c0-e3a7-4108-a5bc-13b3e03068e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/DRAKON/v2014_08_04_DRAKON"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "5203eba2-3253-4c1c-81bc-13b3e03068e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/JAVA_gnuplot_GUI/precompiled_with_OpenJ9_Java8"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "45f1e493-0d61-408d-b1bc-13b3e03068e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/tiv/v2023_12_07"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "3bf3b673-0177-4384-b2bc-13b3e03068e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/neofetch/v2021_12_10"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "a46a0236-e49f-40eb-b4bc-13b3e03068e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/par2cmdline/v2023_05_31"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "3821e391-3986-4a08-99ac-13b3e03068e7" 
    SB_PAR2_EXISTS_ON_PATH="t"
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/static-web-server_net/v_2_24_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "156c9cd0-4be4-419d-9cac-13b3e03068e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Ncdu/v_1_19"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "a544f757-9251-4145-95ac-13b3e03068e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/GNU_Wget/v_1_21"      # wget  from 2020_12_31
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "1da52c36-b6e4-494b-b4ac-13b3e03068e7"
        #----------------------------------------
        S_TMP_0="$S_FP_APPLICATIONS/GNU_Wget/v_2_1_0" # wget2 from 2023_08_31
        func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
            "$S_TMP_0" "4201ef04-702d-4ace-88ac-13b3e03068e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Xdialog/v_2_3_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "b83da41a-52b0-4f4a-94ac-13b3e03068e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/lib_openssl/v_3_1_4"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "40c51fe2-21aa-426e-82ac-13b3e03068e7" 
    export LD_LIBRARY_PATH="$S_TMP_0/lib:$LD_LIBRARY_PATH"
    export CPATH="$S_TMP_0/include:$CPATH"
    # export CPLUS_INCLUDE_PATH="$S_TMP_0/include:$CPLUS_INCLUDE_PATH"
    # export C_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:$C_INCLUDE_PATH"
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/FOX_Toolkit/v_1_7_84"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "1f4ac251-1923-45d8-b5ac-13b3e03068e7"
    export LD_LIBRARY_PATH="$S_TMP_0/lib:$LD_LIBRARY_PATH"
    export CPLUS_INCLUDE_PATH="$S_TMP_0/include:$CPLUS_INCLUDE_PATH"
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/mmmv_hardwarethreadcount_t1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "21f6c750-0ef4-4525-a2ac-13b3e03068e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/CMake/v_3_25_1"
    #func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #    "$S_TMP_0" "687cc51c-06ed-40ed-b2ac-13b3e03068e7" 
    if [ -e "$S_TMP_0" ]; then
        if [ -d "$S_TMP_0" ]; then
            alias mmmv_ui_add2PATH_CMake_v_3_25_1="export PATH=\"$S_TMP_0/bin:\$PATH\"; export MANPATH=\"$S_TMP_0/share/man:\$MANPATH\" "
        else
            SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                "$S_TMP_0" "8edbb216-8c36-4846-a4ac-13b3e03068e7" \
                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
        fi
    fi
    #----------------------------------------------------------------------
    MMMV_OPENJ9_HOME_JAVA17="$S_FP_APPLICATIONS/Java/jdk-17.0.1+12"
    # func_declare_OpenJ9_alias_t1 \
    #     "$MMMV_OPENJ9_HOME_JAVA17" \
    #     "mmmv_ui_add2PATH_Java_OpenJ9_Java17"
    MMMV_OPENJ9_HOME_JAVA8="$S_FP_APPLICATIONS/Java/jdk8u312-b07"
    # func_declare_OpenJ9_alias_t1 \
    #   "$MMMV_OPENJ9_HOME_JAVA8" \
    #   "mmmv_ui_add2PATH_Java_OpenJ9_Java8"
    #----------------------------------------------------------------------
    # S_TMP_0="$S_FP_APPLICATIONS/Vim/v_9_x"
    # func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #     "$S_TMP_0" "cbfe0b54-4e8d-4457-81ac-13b3e03068e7" 
    #----------------------------------------------------------------------
    # S_TMP_0="$S_FP_APPLICATIONS/Minase/v2023_01_01"
    # func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #     "$S_TMP_0" "115494f2-f582-4ef4-b3ac-13b3e03068e7" 
    #----------------------------------------------------------------------
    # S_TMP_0="$S_FP_APPLICATIONS/MinEd_Text_Editor/v2015_03_xx"
    # func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #     "$S_TMP_0" "31977116-2e5a-4e02-a5ac-13b3e03068e7" 
    #----------------------------------------------------------------------
#     S_TMP_0="$S_FP_APPLICATIONS/img2sixel/v2022_12_26"
#     func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
#         "$S_TMP_0" "42290bbe-8485-48a9-93ac-13b3e03068e7" 
#     #----------------------------------------------------------------------
#     S_TMP_0="$S_FP_APPLICATIONS/exa/v_0_10_1"
#     func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
#         "$S_TMP_0" "01e8ea55-6f3e-4260-83ac-13b3e03068e7" 
#     SB_EXA_EXISTS_ON_PATH="t"
#     #----------------------------------------------------------------------
#     S_TMP_0="$S_FP_APPLICATIONS/Bash/v_5_1"
#     #func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
#     #    "$S_TMP_0" "5eb5c102-bb17-4094-a5ac-13b3e03068e7" 
#     if [ -e "$S_TMP_0" ]; then
#         if [ -d "$S_TMP_0" ]; then
#             alias mmmv_ui_add2PATH_Bash_v_5_1="export PATH=\"$S_TMP_0/bin:\$PATH\"; export MANPATH=\"$S_TMP_0/share/man:\$MANPATH\" "
#         else
#             SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
#             func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
#                 "$S_TMP_0" "dc9ca95f-7c42-4e18-93ac-13b3e03068e7" \
#                 "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
#         fi
#     fi
#     #----------------------------------------------------------------------
#     S_TMP_0="$S_FP_APPLICATIONS/XTerm/v2023_01_07_newest"
#     #func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
#     #    "$S_TMP_0" "9d9d5d1f-d7a4-480b-93ac-13b3e03068e7" 
#     if [ -e "$S_TMP_0" ]; then
#         if [ -d "$S_TMP_0" ]; then
#             alias mmmv_ui_add2PATH_Xterm_v2023_01_07_newest="export PATH=\"$S_TMP_0/bin:\$PATH\"; export MANPATH=\"$S_TMP_0/share/man:\$MANPATH\" "
#         else
#             SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
#             func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
#                 "$S_TMP_0" "485f2f52-115e-4c95-859c-13b3e03068e7" \
#                 "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
#         fi
#     fi
#     #----------------------------------------------------------------------
#     S_TMP_0="$S_FP_APPLICATIONS/GCC/v_11_2_0"
#     #func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
#     #    "$S_TMP_0" "1f5a950e-4bab-4f42-919c-13b3e03068e7" 
#     if [ -e "$S_TMP_0" ]; then
#         if [ -d "$S_TMP_0" ]; then
#             alias mmmv_ui_add2PATH_GCC_v_11_2_0="export PATH=\"$S_TMP_0/bin:\$PATH\" ; export MANPATH=\"$S_TMP_0/share/man:\$MANPATH\" ; export LD_LIBRARY_PATH=\"$S_TMP_0/lib64:\$LD_LIBRARY_PATH\" ; export CPLUS_INCLUDE_PATH=\"$S_TMP_0/include/c++/11.2.1:$CPLUS_INCLUDE_PATH\""
#         else
#             SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
#             func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
#                 "$S_TMP_0" "840bbd4d-6848-4fd7-b29c-13b3e03068e7" \
#                 "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
#         fi
#     fi
#     # https://stackoverflow.com/questions/2497344/what-is-the-environment-variable-for-gcc-g-to-look-for-h-files  -during-compila
#     #C_INCLUDE_PATH
#     #----------------------------------------------------------------------
#     export MMMV_ADA_HOME="$S_FP_APPLICATIONS/Ada/v2019_05_17_GNAT_Community"
#     MMMV_ADA_INCLUDE="$MMMV_ADA_HOME/include"
#     MMMV_ADA_LD_LIBRARY_PATH="$MMMV_ADA_HOME/lib64:$MMMV_ADA_HOME/lib"
#     #func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
#     #    "$MMMV_ADA_HOME" "7dfc665f-ee06-465c-a19c-13b3e03068e7" 
#     alias mmmv_ui_add2PATH_Ada_2_envs_t1="export PATH=\"$MMMV_ADA_HOME/bin:\$PATH\" ; export MANPATH=\"$MMMV_ADA_HOME/share/man:\$MANPATH\" ; export LD_LIBRARY_PATH=\"$MMMV_ADA_LD_LIBRARY_PATH:\$LD_LIBRARY_PATH\" ; "
#     #----------------------------------------------------------------------
#     export MMMV_PARASAIL_HOME="$S_FP_APPLICATIONS/ParaSail/parasail_release_8_4"
#     if [ "$SB_TCSH_EXISTS_ON_PATH" == "t" ]; then
#         #------------------------------------------------------------------
#         SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
#         func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
#             "$MMMV_PARASAIL_HOME" "82a4bea3-42a0-4c0e-8d9c-13b3e03068e7" \
#             "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
#         if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
#             #----------------------------------------
#             # The order, how different MMMV_PARASAIL_HOME
#             # subparts are added to the PATH and MANPATH, 
#             # is somewhat important, id est the order of 
#             # func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1(...) 
#             # calls is not totally random in this if-clause.
#             #----------------------------------------
#             SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
#             #----------------------------------------
#             S_FP_CANDIDATE="$MMMV_PARASAIL_HOME/bin/pslc.csh"
#             func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
#                 "$S_FP_CANDIDATE" "64b7c420-0ad7-4f3a-849c-13b3e03068e7" \
#                 "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
#             if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
#                 #--------
#                 func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
#                     "$MMMV_PARASAIL_HOME" "3874b1f3-9ac5-4f0c-8e9c-13b3e03068e7"
#                 #$MMMV_PARASAIL_HOME/bin/pslc.csh -b3
#                 alias mmmv_admin_ParaSail_bootstrap_compiler_ParaSailHOMEbin=" cd $MMMV_PARASAIL_HOME ; nice -n 12 $S_FP_CANDIDATE -b3 "
#                 #--------
#             fi
#             #----------------------------------------
#             S_FP_TMP_0="$MMMV_PARASAIL_HOME/_linux"
#             func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
#                 "$S_FP_TMP_0" "6fec3751-cea0-490a-849c-13b3e03068e7"
#             if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
#                 func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
#                     "$S_FP_TMP_0" "1050895a-4057-4978-949c-13b3e03068e7"
#             fi
#             #----------------------------------------
#             MMMV_PARASAIL_HOME_INSTALL="$MMMV_PARASAIL_HOME/install"
#             func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
#                 "$MMMV_PARASAIL_HOME_INSTALL" \
#                 "21c53884-322b-433b-a89c-13b3e03068e7" \
#                 "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
#             if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
#                 #--------------------
#                 func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
#                     "$MMMV_PARASAIL_HOME_INSTALL" \
#                     "2e81ea2c-fe35-4ff2-b49c-13b3e03068e7" 
#                 #--------------------
#                 S_FP_PSLC_CSH="$MMMV_PARASAIL_HOME_INSTALL/bin/pslc.csh"
#                 S_FP_PARASAIL_PSLC_CSH="$MMMV_PARASAIL_HOME_INSTALL/bin/parasail_pslc.csh"
#                 func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
#                     "$S_FP_PSLC_CSH" "25842ec5-f7f6-4bbf-949c-13b3e03068e7" \
#                     "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
#                 if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
#                     #--------
#                     if [ ! -e "$S_FP_PARASAIL_PSLC_CSH" ]; then
#                         ln -s "$S_FP_PSLC_CSH" "$S_FP_PARASAIL_PSLC_CSH"
#                     fi
#                     #$MMMV_PARASAIL_HOME/bin/pslc.csh -b3
#                     alias mmmv_admin_ParaSail_bootstrap_compiler_ParaSailHOMEinstallbin=" cd $MMMV_PARASAIL_HOME_INSTALL ; nice -n 12 $S_FP_PSLC_CSH -b3 "
#                     #--------
#                 fi
#                 #--------------------
#             fi
#             #----------------------------------------
#         fi
#         #------------------------------------------------------------------
#     fi
#     #----------------------------------------
#     SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="f"
#     S_FP_TMP_0="$S_FP_APPLICATIONS/ParaSail/v_6_5"
#     func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
#         "$S_FP_TMP_0" "69f5982b-0a61-46ad-959c-13b3e03068e7" \
#         "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
#     if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
#         S_FP_1="$S_FP_APPLICATIONS/ParaSail/v_6_5/build"
#         SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
#         func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
#             "$S_FP_1" "3d35c01d-c2fe-4fc3-859c-13b3e03068e7" \
#             "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
#         if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
#             S_FP_2="$S_FP_1/bin"
#             alias mmmv_ParaSail_6_5_parasail_main="$S_FP_2/parasail_main"
#             alias mmmv_ParaSail_6_5_parython_main="$S_FP_2/parython_main"
#             alias mmmv_ParaSail_6_5_test_runtime="$S_FP_2/test_runtime"
#             alias mmmv_ParaSail_6_5_sparkel_main="$S_FP_2/sparkel_main"
#         fi
#     fi
    #----------------------------------------------------------------------
    # S_TMP_0="$S_FP_APPLICATIONS/jigdo/v_0_8_1"
    # func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #     "$S_TMP_0" "d5874852-faa7-49a4-b49c-13b3e03068e7"
    #----------------------------------------------------------------------
    # export MMMV_RETHINKDB_HOME="$S_FP_APPLICATIONS/RethinkDB/v2017_04_12"
    # func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #     "$MMMV_RETHINKDB_HOME" "34b83841-2141-4a77-a29c-13b3e03068e7" "t"
    # #----------------------------------------------------------------------
    # export MMMV_NODEJS_HOME="$S_FP_APPLICATIONS/NodeJS/v_6_10_3"
    # func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #     "$MMMV_NODEJS_HOME" "01e61328-f375-4282-a59c-13b3e03068e7" 
    # #----------------------------------------------------------------------
    # export MMMV_UNISON_HOME="$S_FP_APPLICATIONS/Unison/v_2_48_4"
    # func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #     "$MMMV_UNISON_HOME" "2a28eb2c-1a90-4cb8-929c-13b3e03068e7" 
    # #----------------------------------------------------------------------
    # #export GOROOT_FINAL="$S_FP_APPLICATIONS/Go/v2016_06"
    # #export GOROOT="$GOROOT_FINAL"
    # #export GOARCH="arm"
    # #export GOOS="linux"
    # #----------------------------------------------------------------------
#--------------------------------------------------------------------------
else
    if [ "$SB_APPLICATION_DECLARATION_SCRIPT_CUSTOMISED" != "f" ]; then
        echo ""
        echo -e "\e[31mThis script is flawed.\e[39m"
        echo "SB_APPLICATION_DECLARATION_SCRIPT_CUSTOMISED == \"$SB_APPLICATION_DECLARATION_SCRIPT_CUSTOMISED\""
        echo "GUID=='643d0017-bf64-4ac7-92bc-13b3e03068e7'"
        echo ""
        # "exit 1" must not be here, because 
        # an exit clause would end the login session.
    fi
fi # SB_APPLICATION_DECLARATION_SCRIPT_CUSTOMISED == "t"
#--------------------------------------------------------------------------
S_FP_0="`cd $MMMV_USERSPACE_DISTRO_T1_HOME/../ ; pwd `/applications/doc_incomplete_dependence_graph"
if [ -e "$S_FP_0" ]; then
    if [ -d "$S_FP_0" ]; then
        #------------------------------------------------------------------
        S_FP_1="$S_FP_0/graph.jpeg"
        if [ -e "$S_FP_1" ]; then
            if [ ! -d "$S_FP_1" ]; then
                if [ "$SB_VIEWNIOR_EXISTS_ON_PATH" == "" ]; then
                    SB_VIEWNIOR_EXISTS_ON_PATH="f"
                    if [ "`which viewnior 2> /dev/null`" != "" ]; then
                        SB_VIEWNIOR_EXISTS_ON_PATH="t"
                    fi
                fi
                if [ "$SB_VIEWNIOR_EXISTS_ON_PATH" == "t" ]; then
                    alias mmmv_devel_mmmv_userspace_distro_t1_display_partial_dependence_graph_t1="nice -n 5 viewnior --fullscreen $S_FP_1 ; "
                fi
            else
                # if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                #     echo ""
                #     echo "The "
                #     echo ""
                #     echo "    $S_FP_1"
                #     echo ""
                #     echo -e "\e[31mis a folder\e[39m, but a file is expected."
                #     echo "GUID=='165f8fa4-2cb4-47d0-b2bc-13b3e03068e7'"
                #     echo ""
                # fi
                func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
                    "$S_FP_1" "2df7bd31-2ada-453b-919c-13b3e03068e7" \
                    "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
            fi
        else
            # It's OK for the file to be totally missing.
            if [ -h "$S_FP_1" ]; then # a broken symlink
                # if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                #     echo ""
                #     echo "The "
                #     echo ""
                #     echo "    $S_FP_1"
                #     echo ""
                #     echo -e "\e[31mis a broken symlink\e[39m, but a file is expected."
                #     echo "GUID=='081da61a-1c59-4de2-92bc-13b3e03068e7'"
                #     echo ""
                # fi
                func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
                    "$S_FP_1" "15257093-78e7-4fae-969c-13b3e03068e7" \
                    "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
            fi
            #--------------------------------------------------------------
        fi
    else
        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
            "$S_FP_0" "a9beee44-c6a0-4ede-a38c-13b3e03068e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    fi
fi
#==========================================================================
# S_VERSION_OF_THIS_FILE="352e389c-5b05-4535-818c-13b3e03068e7"
#==========================================================================
