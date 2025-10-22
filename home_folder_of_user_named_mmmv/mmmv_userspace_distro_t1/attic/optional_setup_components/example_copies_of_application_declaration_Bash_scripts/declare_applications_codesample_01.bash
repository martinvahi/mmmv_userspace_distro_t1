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
    echo "GUID=='f4c5d3b1-f1af-478e-bf33-8003e061a9e7'"
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
    echo "GUID=='586d0204-772a-471a-a523-8003e061a9e7'"
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
        "$MMMV_OPENJ9_HOME" "25b17f71-5997-4fa3-b443-8003e061a9e7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        #----------------------------------------
        func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
            "$S_FP_OPENJ9_CONFIG" "45cfc521-58e8-478a-ab22-8003e061a9e7" \
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
            "$M2" "65c1cfe0-47c9-4320-8c12-8003e061a9e7"
        if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
            SB_MAVEN_EXISTS_ON_PATH="t"
            alias mmmv_admin_mvn_download_plugin_org_apache_maven_plugins="nice -n 5 mvn dependency:get -DrepoUrl=mvnrepository.com/artifact/org.apache.maven.plugins "
        fi
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Ruby/v_x_x_x_in_use"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "44d06e5a-441f-4480-91d2-8003e061a9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_RUBY_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    #S_TMP_0="$S_FP_APPLICATIONS/rhash/v_1_4_2"
    S_TMP_0="$S_FP_APPLICATIONS/rhash/v_1_4_4"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "29d078d5-57d2-48fc-a142-8003e061a9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_RHASH_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/xxHash/v_0_8_3"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "8e64b7f4-7456-4e8c-b322-8003e061a9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_XXHASH_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Par_text_formatter/v_1_53_0"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "8243e1f4-f4df-4ee3-8c12-8003e061a9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_PAR_TEXT_FORMATTER_EXISTS_ON_PATH="t"
        export PARINIT="rTbgqR B=.,?_A_a Q=_s>|" # from the par man page
    fi
    #----------------------------------------------------------------------
    #S_TMP_0="$S_FP_APPLICATIONS/glimpse_search_engine/v_4_18_6"
    S_TMP_0="$S_FP_APPLICATIONS/glimpse_search_engine/v_4_18_6_modification_01"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "95e23512-8649-412f-9732-8003e061a9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_GLIMPSE_EXISTS_ON_PATH="t"
        SB_GLIMPSEINDEX_EXISTS_ON_PATH="t"
        SB_AGREP_EXISTS_ON_PATH="t"
        export MANPATH="$S_TMP_0/man:$MANPATH" # needed due to nonconventional path
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/libtool_GNU/v_2_4_6"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "42e7ff04-4efa-4b63-a832-8003e061a9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_LIBTOOL_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Fossil/v_2_19"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "59cf5981-d40c-4a80-9122-8003e061a9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_FOSSIL_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/geomyidae_Gopher_server/v2025_05_10"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "c40f554e-8d69-4b3f-a832-8003e061a9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_GEOMYIDAE_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/GNU_grep/v_3_11"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "a25362dd-7d57-4fdd-b212-8003e061a9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_GREP_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Silver_Searcher_text_search_program/v2025_09_28_Debian_branch"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "26371cb3-aae3-4f83-ad32-8003e061a9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_AG_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/GNU_sed/v_4_9"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "3a58a874-c757-4621-b642-8003e061a9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_SED_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/DilloPlus_web_browser/v2024_12_18_DilloPlus"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "22202c84-8d99-4a24-ae22-8003e061a9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_DILLOPLUS_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/MotionProject_security_camera_software/v_4_6_0_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "5e800022-e9df-40b0-9842-8003e061a9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_MOTIONPROJECT_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/DoubleCommander_file_manager/v_1_1_22"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "3211a563-49c1-4886-9532-8003e061a9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_DOUBLECOMMANDER_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Inkscape/v_1_3"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "51f63571-7706-400f-9042-8003e061a9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_INKSCAPE_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/NeoMutt_email_client/v2025_01_13"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "b3f91245-ffa9-413b-bb42-8003e061a9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_NEOMUTT_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/GNU_M4/v_1_4_20"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "24793606-0e06-4329-8b12-8003e061a9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_M4_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    # S_TMP_0="$S_FP_APPLICATIONS/ParaSail/parasail_release_9_3/install"
    # func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #     "$S_TMP_0" "a1579803-4f12-4257-94c2-8003e061a9e7"
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/mmmv_hardwarethreadcount_t1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "48390ff3-6573-49fa-a112-8003e061a9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
       SB_MMMV_HARDWARETHREADCOUNT_T1_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/CMake/v_3_25_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "021463d4-5b13-4bee-b812-8003e061a9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_CMAKE_EXISTS_ON_PATH="t"
        #alias mmmv_ui_add2PATH_CMake_v_3_25_1="export PATH=\"$S_TMP_0/bin:\$PATH\"; export MANPATH=\"$S_TMP_0/share/man:\$MANPATH\" "
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Ninja_build_system/v_1_13_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "38649b81-4c85-42b3-b432-8003e061a9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_NINJA_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/DRAKON/v2014_08_04_DRAKON"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "146c9332-6017-4b5e-a322-8003e061a9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_DRAKON_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Graphviz/v_13_1_0"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "396f23b5-0a8a-43cf-8812-8003e061a9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_GRAPHVIZ_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Doxygen/v_1_14_0"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "d32753d1-c3a3-4192-be22-8003e061a9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_DOXYGEN_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/KreativeKorp_Hexcellent_hex_editor/KreativeKorp_Hexcellent_v_1_0_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "49e32c52-787a-43ec-b612-8003e061a9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_KREATIVEKORPHEXCELLENT_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/KreativeKorp_PowerPaint/2024_12_20_downloaded_KreativeKorp_PowerPaint/src_and_bytecode_compiled_with_OpenJ9_JVM_Java8"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "426c87d2-76a5-4c8f-9652-8003e061a9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_KREATIVEKORPPOWERPAINT_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Logisim/v_2_7_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "2c2336a5-a1d9-4a19-8b32-8003e061a9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_LOGISIM_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/JAVA_gnuplot_GUI/precompiled_with_OpenJ9_Java8"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "826861df-0f7d-4709-9352-8003e061a9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_JAVAGNUPLOTGUI_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/tiv/v2023_12_07"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "5fdfedc1-2732-4617-b642-8003e061a9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_TIV_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/neofetch/v2021_12_10"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "e56d4753-a67d-4bdb-9032-8003e061a9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_NEOFETCH_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/par2_file_corruption_mitigator/v2023_05_31"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "13278825-ebd0-4a64-8632-8003e061a9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_PAR2_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/redupe_file_corruption_mitigator/v2024_08_12_redupe"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "4fd71e84-5518-4cd4-9e22-8003e061a9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_REDUPE_EXISTS_ON_PATH="t"
        export LD_LIBRARY_PATH="$S_TMP_0/lib:$LD_LIBRARY_PATH"
        export CPLUS_INCLUDE_PATH="$S_TMP_0/include:$CPLUS_INCLUDE_PATH"
        alias mmmv_redupe_50="nice -n 14 redupe -o 50 "
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/sc-im_spreadsheet_program/v_0_8_4"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "4841bf25-a80c-4dd5-9152-8003e061a9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_SCIMSPREADSHEETPROGRAM_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/static-web-server_net/v_2_24_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "1a90b004-b6db-4b5e-a411-8003e061a9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_STATICWEBSERVERNET_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Tor/v_0_4_8_15"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "5d2f6794-080a-42b5-9331-8003e061a9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_TOR_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/ncdu/v_1_19"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "4e7ecf03-6989-418a-be51-8003e061a9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_NCDU_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/REDUCE_Computer_Algebra_System/v_svn6547"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "5c7faca2-39ec-42fd-b231-8003e061a9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_REDUCE_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    #S_TMP_0="$S_FP_APPLICATIONS/Vim/v_8_1"
    S_TMP_0="$S_FP_APPLICATIONS/Vim/2024_06_22_cloned_v_9_1_512"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "5ed48e25-6a58-4129-aa11-8003e061a9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_VIM_EXISTS_ON_PATH="t"
        SB_FP_VIM="$S_TMP_0/bin/vim"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/GNU_Wget/v_1_21"      # wget  from 2020_12_31
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "41f335b2-1ccd-47a7-8611-8003e061a9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_WGET_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/GNU_Wget/v_2_1_0" # wget2 from 2023_08_31
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "321f19ab-f731-4131-9d31-8003e061a9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_WGET2_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Xdialog/v_2_3_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "3d2d71e3-78f8-4174-9241-8003e061a9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_XDIALOG_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/lrzsz_BBS_X_Y_Z_Modem_file_upload_software/v_0_12_20"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "f1f9620f-f59d-42bf-a451-8003e061a9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_LRZSZBBSXYZMODEMFILEUPLOADSOFTWARE_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Worker_file_manager/v_5_1_0"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "83b36814-6927-4663-bf21-8003e061a9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_WORKERFILEMANAGER_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/nnn_file_manager/v_5_0"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "35dcf0b1-f71e-4e3b-ad31-8003e061a9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_NNNFILEMANAGER_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    #S_TMP_0="$S_FP_APPLICATIONS/lib_openssl/v_3_1_4"
    #func_mmmv_add_lib_2_LD_LIBRARY_PATH_and_include_2_CPATH_t1 \
    #    "$S_TMP_0" "1c0f0d44-395d-49ac-8231-8003e061a9e7"
    #if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
    #    SB_LIBOPENSSL_EXISTS_ON_PATH="t"
    #fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/lib_popt/v_1_19"
    func_mmmv_add_lib_2_LD_LIBRARY_PATH_and_include_2_CPATH_t1 \
        "$S_TMP_0" "22a6925b-d9d4-4464-a891-8003e061a9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_LIBPOPT_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/lib_jemalloc/v_5_3_0"
    func_mmmv_add_lib_2_LD_LIBRARY_PATH_and_include_2_CPATH_t1 \
        "$S_TMP_0" "8379668f-bf01-4cc5-ba41-8003e061a9e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_LIBJEMALLOC_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/FOX_Toolkit/v_1_7_84"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "210456a0-39cf-4568-8991-8003e061a9e7"
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
        echo "GUID=='533f2242-23cf-4c78-8f12-8003e061a9e7'"
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
                #     echo "GUID=='20251753-a485-4c2f-b332-8003e061a9e7'"
                #     echo ""
                # fi
                func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
                    "$S_FP_1" "de46df43-a854-44cc-8d41-8003e061a9e7" \
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
                #     echo "GUID=='15d74b38-6159-4828-b422-8003e061a9e7'"
                #     echo ""
                # fi
                func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
                    "$S_FP_1" "35737c62-febe-4e8b-9411-8003e061a9e7" \
                    "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
            fi
            #--------------------------------------------------------------
        fi
    else
        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
            "$S_FP_0" "42790602-57fa-4920-9c21-8003e061a9e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    fi
fi
#==========================================================================
# S_VERSION_OF_THIS_FILE="52c36eca-b436-414a-9021-8003e061a9e7"
#==========================================================================
