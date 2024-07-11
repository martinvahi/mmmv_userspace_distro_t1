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
    echo "GUID=='7471431a-e95d-41af-824d-4250706168e7'"
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
    echo "GUID=='2f91f246-c561-466b-a14d-4250706168e7'"
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
        "$MMMV_OPENJ9_HOME" "407a4fb2-2613-4c59-a24d-4250706168e7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        #----------------------------------------
        func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
            "$S_FP_OPENJ9_CONFIG" "f21da45d-8bc9-4bff-944d-4250706168e7" \
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
            "$M2" "4ec01325-dd7a-4a2d-a14d-4250706168e7" 
        alias mmmv_admin_mvn_download_plugin_org_apache_maven_plugins="nice -n 5 mvn dependency:get -DrepoUrl=mvnrepository.com/artifact/org.apache.maven.plugins "
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Ruby/v_x_x_x_in_use"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "31785643-0e11-4c74-a14d-4250706168e7" 
    #----------------------------------------------------------------------
    #S_TMP_0="$S_FP_APPLICATIONS/rhash/v_1_4_2"
    S_TMP_0="$S_FP_APPLICATIONS/rhash/v_1_4_4"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "15024fa5-1159-4bbe-a94d-4250706168e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Par_text_formatter/v_1_53_0"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "55906cf8-8252-449c-b24d-4250706168e7" 
    SB_PAR_TEXT_FORMATTER_EXISTS_ON_PATH="t"
    export PARINIT="rTbgqR B=.,?_A_a Q=_s>|" # from the par man page
    #----------------------------------------------------------------------
    #S_TMP_0="$S_FP_APPLICATIONS/glimpse_search_engine/v_4_18_6"
    S_TMP_0="$S_FP_APPLICATIONS/glimpse_search_engine/v_4_18_6_modification_01"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "ea8afb5f-63d8-4d9a-924d-4250706168e7" 
    export MANPATH="$S_TMP_0/man:$MANPATH" # needed due to nonconventional path
    SB_GLIMPSE_EXISTS_ON_PATH="t"
    SB_GLIMPSEINDEX_EXISTS_ON_PATH="t"
    SB_AGREP_EXISTS_ON_PATH="t"
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/libtool_GNU/v_2_4_6"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "7deee23b-7c02-43cf-944d-4250706168e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/GNU_grep/v_3_11"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "762f9574-e0fb-4126-ae1b-a31080b078e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Fossil/v_2_19"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "02f84428-37bc-45f5-a24d-4250706168e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/MotionProject_security_camera_software/v_4_6_0_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "e75b8f15-e1d4-4fcf-a44d-4250706168e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Inkscape/v_1_3"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "8506d751-7682-44e2-a24d-4250706168e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/ParaSail/parasail_release_9_3/install"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "3e476c34-466a-4564-914d-4250706168e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/mmmv_hardwarethreadcount_t1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "34928183-5427-435a-9a4d-4250706168e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/CMake/v_3_25_1"
    #func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #    "$S_TMP_0" "28ff3e18-7796-4ce2-953d-4250706168e7" 
    if [ -e "$S_TMP_0" ]; then
        if [ -d "$S_TMP_0" ]; then
            alias mmmv_ui_add2PATH_CMake_v_3_25_1="export PATH=\"$S_TMP_0/bin:\$PATH\"; export MANPATH=\"$S_TMP_0/share/man:\$MANPATH\" "
        else
            SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                "$S_TMP_0" "1d0db41e-2fbc-473a-a33d-4250706168e7" \
                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
        fi
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/DRAKON/v2014_08_04_DRAKON"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "bbc62233-04a9-49e8-b53d-4250706168e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/JAVA_gnuplot_GUI/precompiled_with_OpenJ9_Java8"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "9c3a8314-f0d1-4856-b23d-4250706168e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/tiv/v2023_12_07"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "b61d2e40-bd98-40f9-953d-4250706168e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/neofetch/v2021_12_10"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "130364cc-c176-4ade-a33d-4250706168e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/par2cmdline/v2023_05_31"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "2692da25-71b5-4cbe-b33d-4250706168e7" 
    SB_PAR2_EXISTS_ON_PATH="t"
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/static-web-server_net/v_2_24_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "f9e4d356-dc31-4853-953d-4250706168e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/ncdu/v_1_19"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "da33a824-b16e-412d-833d-4250706168e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/REDUCE_Computer_Algebra_System/v_svn6547"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "1f6866e4-a03a-4118-a33d-4250706168e7" 
    #----------------------------------------------------------------------
    #S_TMP_0="$S_FP_APPLICATIONS/Vim/v_8_1"
    S_TMP_0="$S_FP_APPLICATIONS/Vim/2024_06_22_cloned_v_9_1_512"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "06b01349-0378-4971-a43d-4250706168e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/GNU_Wget/v_1_21"      # wget  from 2020_12_31
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "2413ae30-8475-4de7-b33d-4250706168e7"
        #----------------------------------------
        S_TMP_0="$S_FP_APPLICATIONS/GNU_Wget/v_2_1_0" # wget2 from 2023_08_31
        func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
            "$S_TMP_0" "36d529b5-3bdb-49ca-873d-4250706168e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Xdialog/v_2_3_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "61caa82e-3298-4642-a23d-4250706168e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/lib_openssl/v_3_1_4"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "86d04d3c-2037-4861-843d-4250706168e7" 
    export LD_LIBRARY_PATH="$S_TMP_0/lib:$LD_LIBRARY_PATH"
    export CPATH="$S_TMP_0/include:$CPATH"
    # export CPLUS_INCLUDE_PATH="$S_TMP_0/include:$CPLUS_INCLUDE_PATH"
    # export C_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:$C_INCLUDE_PATH"
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/FOX_Toolkit/v_1_7_84"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "f56c7d53-be83-41d7-a23d-4250706168e7"
    export LD_LIBRARY_PATH="$S_TMP_0/lib:$LD_LIBRARY_PATH"
    export CPLUS_INCLUDE_PATH="$S_TMP_0/include:$CPLUS_INCLUDE_PATH"
    #----------------------------------------------------------------------
    MMMV_OPENJ9_HOME_JAVA17="$S_FP_APPLICATIONS/Java/jdk-17.0.1+12"
    func_declare_OpenJ9_alias_t1 \
        "$MMMV_OPENJ9_HOME_JAVA17" \
        "mmmv_ui_add2PATH_Java_OpenJ9_Java17"
    MMMV_OPENJ9_HOME_JAVA8="$S_FP_APPLICATIONS/Java/jdk8u312-b07"
    func_declare_OpenJ9_alias_t1 \
      "$MMMV_OPENJ9_HOME_JAVA8" \
      "mmmv_ui_add2PATH_Java_OpenJ9_Java8"
    #----------------------------------------------------------------------
#--------------------------------------------------------------------------
else
    if [ "$SB_APPLICATION_DECLARATION_SCRIPT_CUSTOMISED" != "f" ]; then
        echo ""
        echo -e "\e[31mThis script is flawed.\e[39m"
        echo "SB_APPLICATION_DECLARATION_SCRIPT_CUSTOMISED == \"$SB_APPLICATION_DECLARATION_SCRIPT_CUSTOMISED\""
        echo "GUID=='b88f0c25-ba9d-4614-814d-4250706168e7'"
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
                #     echo "GUID=='97b75621-4911-40b7-854d-4250706168e7'"
                #     echo ""
                # fi
                func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
                    "$S_FP_1" "250cad13-9d82-46ed-833d-4250706168e7" \
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
                #     echo "GUID=='f3456d57-724d-4e13-a14d-4250706168e7'"
                #     echo ""
                # fi
                func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
                    "$S_FP_1" "1bb09e39-49f7-412c-a33d-4250706168e7" \
                    "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
            fi
            #--------------------------------------------------------------
        fi
    else
        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
            "$S_FP_0" "9520c21d-dd46-4999-953d-4250706168e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    fi
fi
#==========================================================================
# S_VERSION_OF_THIS_FILE="2655a11d-f50e-4cfc-b43d-4250706168e7"
#==========================================================================
