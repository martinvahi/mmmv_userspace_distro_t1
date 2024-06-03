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
    echo "GUID=='eb01a05d-57ad-445e-92e1-00b3e03068e7'"
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
    echo "GUID=='653ad64c-cd36-4f5b-94e1-00b3e03068e7'"
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
        "$MMMV_OPENJ9_HOME" "7a7fb65f-74d3-4bb2-82e1-00b3e03068e7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        #----------------------------------------
        func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
            "$S_FP_OPENJ9_CONFIG" "8c18c040-31ec-439b-85e1-00b3e03068e7" \
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
            "$M2" "4dfee34c-8edd-4929-b4e1-00b3e03068e7" 
        alias mmmv_admin_mvn_download_plugin_org_apache_maven_plugins="nice -n 5 mvn dependency:get -DrepoUrl=mvnrepository.com/artifact/org.apache.maven.plugins "
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Ruby/v_x_x_x_in_use"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "2d04a829-e42b-4f5b-94d1-00b3e03068e7" 
    #----------------------------------------------------------------------
    #S_TMP_0="$S_FP_APPLICATIONS/rhash/v_1_4_2"
    S_TMP_0="$S_FP_APPLICATIONS/rhash/v_1_4_4"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "d5766337-f859-4b1b-b3d1-00b3e03068e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Par_text_formatter/v_1_53_0"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "e16a524f-bd5e-4338-93d1-00b3e03068e7" 
    SB_PAR_TEXT_FORMATTER_EXISTS_ON_PATH="t"
    export PARINIT="rTbgqR B=.,?_A_a Q=_s>|" # from the par man page
    #----------------------------------------------------------------------
    #S_TMP_0="$S_FP_APPLICATIONS/glimpse_search_engine/v_4_18_6"
    S_TMP_0="$S_FP_APPLICATIONS/glimpse_search_engine/v_4_18_6_modification_01"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "1351252b-1231-47f5-92d1-00b3e03068e7" 
    export MANPATH="$S_TMP_0/man:$MANPATH" # needed due to nonconventional path
    SB_GLIMPSE_EXISTS_ON_PATH="t"
    SB_GLIMPSEINDEX_EXISTS_ON_PATH="t"
    SB_AGREP_EXISTS_ON_PATH="t"
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/libtool_GNU/v_2_4_6"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "a2ee1e2b-64be-4e27-91d1-00b3e03068e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Fossil/v_2_19"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "3ece583a-f9b5-43f2-81d1-00b3e03068e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/MotionProject_security_camera_software/v_4_6_0_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "63156a10-e3ac-4f33-82d1-00b3e03068e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Inkscape/v_1_3"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "1d91815e-fbe3-47bc-95d1-00b3e03068e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/ParaSail/parasail_release_9_3/install"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "310fd873-3700-4f4e-b1d1-00b3e03068e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/mmmv_hardwarethreadcount_t1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "620b3528-b8a1-4237-84d1-00b3e03068e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/CMake/v_3_25_1"
    #func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #    "$S_TMP_0" "4887c4ec-3670-43f0-a3d1-00b3e03068e7" 
    if [ -e "$S_TMP_0" ]; then
        if [ -d "$S_TMP_0" ]; then
            alias mmmv_ui_add2PATH_CMake_v_3_25_1="export PATH=\"$S_TMP_0/bin:\$PATH\"; export MANPATH=\"$S_TMP_0/share/man:\$MANPATH\" "
        else
            SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                "$S_TMP_0" "30d9f850-3833-4780-82d1-00b3e03068e7" \
                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
        fi
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/DRAKON/v2014_08_04_DRAKON"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "a6a0ac54-303c-4c5f-82d1-00b3e03068e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/JAVA_gnuplot_GUI/precompiled_with_OpenJ9_Java8"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "6677b33a-699d-4790-83d1-00b3e03068e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/tiv/v2023_12_07"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "337e3516-5bdc-43ab-b4d1-00b3e03068e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/neofetch/v2021_12_10"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "1dd75e25-8d69-4fba-9ed1-00b3e03068e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/par2cmdline/v2023_05_31"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "aff94111-9087-4532-a3d1-00b3e03068e7" 
    SB_PAR2_EXISTS_ON_PATH="t"
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/static-web-server_net/v_2_24_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "1ed786ab-17c3-4be9-a1d1-00b3e03068e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Ncdu/v_1_19"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "f5bf441f-9d86-466d-81d1-00b3e03068e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/REDUCE_Computer_Algebra_System/v_svn6547"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "b5b85539-6efc-4afd-a4d1-00b3e03068e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/GNU_Wget/v_1_21"      # wget  from 2020_12_31
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "8d1c2047-a628-45b0-a2d1-00b3e03068e7"
        #----------------------------------------
        S_TMP_0="$S_FP_APPLICATIONS/GNU_Wget/v_2_1_0" # wget2 from 2023_08_31
        func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
            "$S_TMP_0" "23576744-df23-4f09-a3d1-00b3e03068e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Xdialog/v_2_3_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "0250eeb7-f29d-44a5-93d1-00b3e03068e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/lib_openssl/v_3_1_4"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "616ba3d9-6f16-4309-b3d1-00b3e03068e7" 
    export LD_LIBRARY_PATH="$S_TMP_0/lib:$LD_LIBRARY_PATH"
    export CPATH="$S_TMP_0/include:$CPATH"
    # export CPLUS_INCLUDE_PATH="$S_TMP_0/include:$CPLUS_INCLUDE_PATH"
    # export C_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:$C_INCLUDE_PATH"
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/FOX_Toolkit/v_1_7_84"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "8acb0057-5a91-40b1-b5d1-00b3e03068e7"
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
        echo "GUID=='0c9d572a-64f3-4f98-a5e1-00b3e03068e7'"
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
                #     echo "GUID=='379a855d-a81a-4f3c-a4d1-00b3e03068e7'"
                #     echo ""
                # fi
                func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
                    "$S_FP_1" "1abe06c3-fc5e-447b-bbd1-00b3e03068e7" \
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
                #     echo "GUID=='e9c51c19-dce0-4370-82d1-00b3e03068e7'"
                #     echo ""
                # fi
                func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
                    "$S_FP_1" "812df045-b32b-4efd-95d1-00b3e03068e7" \
                    "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
            fi
            #--------------------------------------------------------------
        fi
    else
        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
            "$S_FP_0" "31252955-3dca-4f67-a4c1-00b3e03068e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    fi
fi
#==========================================================================
# S_VERSION_OF_THIS_FILE="63aca012-7d06-4346-bbc1-00b3e03068e7"
#==========================================================================
