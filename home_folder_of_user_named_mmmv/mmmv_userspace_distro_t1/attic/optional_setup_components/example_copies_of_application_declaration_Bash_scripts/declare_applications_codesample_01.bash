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
    echo "GUID=='e9afd750-9b7e-4e93-94e6-3113e060b9e7'"
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
    echo "GUID=='e7199143-1772-4fce-b4e6-3113e060b9e7'"
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
    local S_TMP_0="mmmv/etc/common_bashrc/subparts/mmmv_userspace_distro_t1_specific/common_bashrc_Java_related_OpenJ9.bash"
    local S_FP_OPENJ9_CONFIG="/home/mmmv/mmmv_userspace_distro_t1/$S_TMP_0"
    if [ "$MMMV_USERSPACE_DISTRO_T1_HOME" != "" ]; then
        S_FP_OPENJ9_CONFIG="$MMMV_USERSPACE_DISTRO_T1_HOME/$S_TMP_0"
    fi
    #----------------------------------------
    func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
        "$MMMV_OPENJ9_HOME" "370a3854-8ed4-4374-83e6-3113e060b9e7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        #----------------------------------------
        func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
            "$S_FP_OPENJ9_CONFIG" "716b2b46-1d7a-4318-96d6-3113e060b9e7" \
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
        SB_MAVEN_EXISTS_ON_PATH="f"
        func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
            "$M2" "3b41745b-25c5-4ec5-91d6-3113e060b9e7"
        if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
            SB_MAVEN_EXISTS_ON_PATH="t"
            alias mmmv_admin_mvn_download_plugin_org_apache_maven_plugins="nice -n 5 mvn dependency:get -DrepoUrl=mvnrepository.com/artifact/org.apache.maven.plugins "
        fi
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Ruby/v_x_x_x_in_use"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "0e722341-a9b2-467c-a5d6-3113e060b9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_RUBY_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    #S_TMP_0="$S_FP_APPLICATIONS/rhash/v_1_4_2"
    S_TMP_0="$S_FP_APPLICATIONS/rhash/v_1_4_4"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "d842b743-ec04-4878-a2d6-3113e060b9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_RHASH_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/xxHash/v_0_8_3"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "76e98f36-e7de-4cc3-a1d6-3113e060b9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_XXHASH_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Par_text_formatter/v_1_53_0"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "4463c249-c6c3-4f5e-94d6-3113e060b9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_PAR_TEXT_FORMATTER_EXISTS_ON_PATH="t"
        export PARINIT="rTbgqR B=.,?_A_a Q=_s>|" # from the par man page
    fi
    #----------------------------------------------------------------------
    #S_TMP_0="$S_FP_APPLICATIONS/glimpse_search_engine/v_4_18_6"
    S_TMP_0="$S_FP_APPLICATIONS/glimpse_search_engine/v_4_18_6_modification_01"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "414c4ff3-0f2f-4250-a1d6-3113e060b9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_GLIMPSE_EXISTS_ON_PATH="t"
        SB_GLIMPSEINDEX_EXISTS_ON_PATH="t"
        SB_AGREP_EXISTS_ON_PATH="t"
        export MANPATH="$S_TMP_0/man:$MANPATH" # needed due to nonconventional path
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/libtool_GNU/v_2_4_6"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "18c690e1-e20a-4668-84d6-3113e060b9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_LIBTOOL_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Fossil/v_2_19"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "6c688540-2c92-4a59-a1d6-3113e060b9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_FOSSIL_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/geomyidae_Gopher_server/v2025_05_10"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "800ba82a-06f4-4bbd-b2d6-3113e060b9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_GEOMYIDAE_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/GNU_grep/v_3_11"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "912e6c17-7a7b-492b-b2d6-3113e060b9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_GREP_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Silver_Searcher_text_search_program/v2025_09_28_Debian_branch"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "1c1fff65-0c39-4274-93d6-3113e060b9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_AG_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/GNU_sed/v_4_9"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "5e574e48-a8cf-45cf-a3d6-3113e060b9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_SED_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/DilloPlus_web_browser/v2024_12_18_DilloPlus"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "ac15024c-35f7-4426-a3c6-3113e060b9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_DILLOPLUS_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/MotionProject_security_camera_software/v_4_6_0_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "9a9fc537-c0b9-4250-a3c6-3113e060b9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_MOTIONPROJECT_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/DoubleCommander_file_manager/v_1_1_22"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "35df07b1-607b-4745-82c6-3113e060b9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_DOUBLECOMMANDER_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Inkscape/v_1_3"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "8ff07d53-0da5-47a0-81c6-3113e060b9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_INKSCAPE_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/NeoMutt_email_client/v2025_01_13"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "51991643-155d-49ba-b5c6-3113e060b9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_NEOMUTT_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/GNU_M4/v_1_4_20"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "a598cd54-ea40-4105-b4c6-3113e060b9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_M4_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    # S_TMP_0="$S_FP_APPLICATIONS/ParaSail/parasail_release_9_3/install"
    # func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #     "$S_TMP_0" "c1ae2bb2-56f5-49b5-acc6-3113e060b9e7"
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/mmmv_hardwarethreadcount_t1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "19bb2925-d0d5-41d9-a4c6-3113e060b9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
       SB_MMMV_HARDWARETHREADCOUNT_T1_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/CMake/v_3_25_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "c8e86b41-bdf6-41b8-85c6-3113e060b9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_CMAKE_EXISTS_ON_PATH="t"
        #alias mmmv_ui_add2PATH_CMake_v_3_25_1="export PATH=\"$S_TMP_0/bin:\$PATH\"; export MANPATH=\"$S_TMP_0/share/man:\$MANPATH\" "
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Ninja_build_system/v_1_13_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "170849d4-42c9-4028-81c6-3113e060b9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_NINJA_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/DRAKON/v2014_08_04_DRAKON"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "33913725-e733-4aa5-bfc6-3113e060b9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_DRAKON_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Graphviz/v_13_1_0"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "0a2cc357-71dd-4118-94c6-3113e060b9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_GRAPHVIZ_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Doxygen/v_1_14_0"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "0628c413-3435-418d-81c6-3113e060b9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_DOXYGEN_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/KreativeKorp_Hexcellent_hex_editor/KreativeKorp_Hexcellent_v_1_0_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "746d7170-ed93-4788-b1c6-3113e060b9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_KREATIVEKORPHEXCELLENT_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/KreativeKorp_PowerPaint/2024_12_20_downloaded_KreativeKorp_PowerPaint/src_and_bytecode_compiled_with_OpenJ9_JVM_Java8"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "576aa3c3-d454-4562-83c6-3113e060b9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_KREATIVEKORPPOWERPAINT_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Logisim/v_2_7_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "35cf7a1f-6f50-46c5-b4b6-3113e060b9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_LOGISIM_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/JAVA_gnuplot_GUI/precompiled_with_OpenJ9_Java8"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "5cbc25e4-14c5-452d-94b6-3113e060b9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_JAVAGNUPLOTGUI_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/tiv/v2023_12_07"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "be2d451e-9ca6-474f-84b6-3113e060b9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_TIV_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/neofetch/v2021_12_10"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "d74ae14a-7cc3-4a77-85b6-3113e060b9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_NEOFETCH_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Brother_scanner_utility_brscan/v_0_2_4_4"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "cfb56516-1d55-42d1-82b6-3113e060b9e7"
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/par2_file_corruption_mitigator/v2023_05_31"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "db088c15-9368-4832-93b6-3113e060b9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_PAR2_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/redupe_file_corruption_mitigator/v2024_08_12_redupe"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "b82fa143-b985-4cb3-a2b6-3113e060b9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_REDUPE_EXISTS_ON_PATH="t"
        export LD_LIBRARY_PATH="$S_TMP_0/lib:$LD_LIBRARY_PATH"
        export CPLUS_INCLUDE_PATH="$S_TMP_0/include:$CPLUS_INCLUDE_PATH"
        alias mmmv_redupe_50="nice -n 14 redupe -o 50 "
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/sc-im_spreadsheet_program/v_0_8_4"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "b6eb4cf1-9333-4488-9fb6-3113e060b9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_SCIMSPREADSHEETPROGRAM_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/static-web-server_net/v_2_24_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "9b3cb229-7a4e-4047-94b6-3113e060b9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_STATICWEBSERVERNET_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Tor/v_0_4_8_15"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "d8470a44-2bbd-45e7-a3b6-3113e060b9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_TOR_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/ncdu/v_1_19"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "39df91a3-eb04-4cb6-91b6-3113e060b9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_NCDU_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/REDUCE_Computer_Algebra_System/v_svn6547"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "3568065a-57a8-4049-a8b6-3113e060b9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_REDUCE_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    #S_TMP_0="$S_FP_APPLICATIONS/Vim/v_8_1"
    S_TMP_0="$S_FP_APPLICATIONS/Vim/2024_06_22_cloned_v_9_1_512"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "5583c953-e462-432a-8eb6-3113e060b9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_VIM_EXISTS_ON_PATH="t"
        SB_FP_VIM="$S_TMP_0/bin/vim"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/GNU_Wget/v_1_21"      # wget  from 2020_12_31
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "bd7e2636-5582-45e9-82a6-3113e060b9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_WGET_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/GNU_Wget/v_2_1_0" # wget2 from 2023_08_31
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "2ded4053-f0d9-434d-81a6-3113e060b9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_WGET2_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Xdialog/v_2_3_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "0726f45b-f070-43a1-92a6-3113e060b9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_XDIALOG_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/lrzsz_BBS_X_Y_Z_Modem_file_upload_software/v_0_12_20"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "3f709138-4e4b-4605-85a6-3113e060b9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_LRZSZBBSXYZMODEMFILEUPLOADSOFTWARE_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Worker_file_manager/v_5_1_0"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "c0e0e836-55d9-41f8-a5a6-3113e060b9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_WORKERFILEMANAGER_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/nnn_file_manager/v_5_0"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "27cd2d4e-23f7-4d86-81a6-3113e060b9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_NNNFILEMANAGER_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    #S_TMP_0="$S_FP_APPLICATIONS/lib_openssl/v_3_1_4"
    #func_mmmv_add_lib_2_LD_LIBRARY_PATH_and_include_2_CPATH_t1 \
    #    "$S_TMP_0" "4939ea11-67f5-4d51-85a6-3113e060b9e7"
    #if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
    #    SB_LIBOPENSSL_EXISTS_ON_PATH="t"
    #fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/lib_popt/v_1_19"
    func_mmmv_add_lib_2_LD_LIBRARY_PATH_and_include_2_CPATH_t1 \
        "$S_TMP_0" "10a7e642-0b70-4696-95a6-3113e060b9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_LIBPOPT_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/lib_jemalloc/v_5_3_0"
    func_mmmv_add_lib_2_LD_LIBRARY_PATH_and_include_2_CPATH_t1 \
        "$S_TMP_0" "42b88183-78d7-4714-b2a6-3113e060b9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_LIBJEMALLOC_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/FOX_Toolkit/v_1_7_84"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "ecb53f20-cb6d-424d-85a6-3113e060b9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_FOXTOOLKIT_EXISTS_ON_PATH="t"
        export LD_LIBRARY_PATH="$S_TMP_0/lib:$LD_LIBRARY_PATH"
        export CPLUS_INCLUDE_PATH="$S_TMP_0/include:$CPLUS_INCLUDE_PATH"
    fi
    #----------------------------------------------------------------------
    MMMV_OPENJ9_HOME_JAVA17="$S_FP_APPLICATIONS/Java/jdk-17.0.1+12"
    if [ -e "$MMMV_OPENJ9_HOME_JAVA17" ]; then
        func_declare_OpenJ9_alias_t1 \
            "$MMMV_OPENJ9_HOME_JAVA17" \
            "mmmv_ui_add2PATH_Java_OpenJ9_Java17"
    fi
    MMMV_OPENJ9_HOME_JAVA8="$S_FP_APPLICATIONS/Java/jdk8u312-b07"
    if [ -e "$MMMV_OPENJ9_HOME_JAVA8" ]; then
        func_declare_OpenJ9_alias_t1 \
          "$MMMV_OPENJ9_HOME_JAVA8" \
          "mmmv_ui_add2PATH_Java_OpenJ9_Java8"
    fi
    #----------------------------------------------------------------------
else
    if [ "$SB_APPLICATION_DECLARATION_SCRIPT_CUSTOMISED" != "f" ]; then
        echo ""
        echo -e "\e[31mThis script is flawed.\e[39m"
        echo "SB_APPLICATION_DECLARATION_SCRIPT_CUSTOMISED == \"$SB_APPLICATION_DECLARATION_SCRIPT_CUSTOMISED\""
        echo "GUID=='f7dac422-7424-43a9-b4d6-3113e060b9e7'"
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
                #     echo "GUID=='31846c49-b545-4cd7-92d6-3113e060b9e7'"
                #     echo ""
                # fi
                func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
                    "$S_FP_1" "4201ebd4-1bd4-4265-b4a6-3113e060b9e7" \
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
                #     echo "GUID=='b47bbe8b-8c8f-4d76-9ad6-3113e060b9e7'"
                #     echo ""
                # fi
                func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
                    "$S_FP_1" "6887835e-944f-46ee-83a6-3113e060b9e7" \
                    "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
            fi
            #--------------------------------------------------------------
        fi
    else
        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
            "$S_FP_0" "b6ec0a2e-fd57-4ef5-91a6-3113e060b9e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    fi
fi
#==========================================================================
# S_VERSION_OF_THIS_FILE="0a73cf13-376e-4250-a4a6-3113e060b9e7"
#==========================================================================
