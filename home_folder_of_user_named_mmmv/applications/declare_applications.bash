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
    echo "GUID=='a02cd158-bb10-41f0-a3d8-13a070107ae7'"
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
    echo "GUID=='4876d325-fa5d-44c4-92d8-13a070107ae7'"
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
        "$MMMV_OPENJ9_HOME" "598a7262-7c18-4944-a5d8-13a070107ae7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        #----------------------------------------
        func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
            "$S_FP_OPENJ9_CONFIG" "b41a3535-a023-4c78-82d8-13a070107ae7" \
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
            "$M2" "a0ea7630-37b9-4576-94d8-13a070107ae7"
        if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
            SB_MAVEN_EXISTS_ON_PATH="t"
            alias mmmv_admin_mvn_download_plugin_org_apache_maven_plugins="nice -n 5 mvn dependency:get -DrepoUrl=mvnrepository.com/artifact/org.apache.maven.plugins "
        fi
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Ruby/v_x_x_x_in_use"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "ffd0d853-abce-454f-94d8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_RUBY_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    #S_TMP_0="$S_FP_APPLICATIONS/rhash/v_1_4_2"
    S_TMP_0="$S_FP_APPLICATIONS/rhash/v_1_4_4"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "8a557111-e37f-4faf-b4d8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_RHASH_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/xxHash/v_0_8_3"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "53ea3111-46e7-428f-98d8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_XXHASH_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Par_text_formatter/v_1_53_0"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "ec957128-5cee-4e69-b1d8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_PAR_TEXT_FORMATTER_EXISTS_ON_PATH="t"
        export PARINIT="rTbgqR B=.,?_A_a Q=_s>|" # from the par man page
    fi
    #----------------------------------------------------------------------
    #S_TMP_0="$S_FP_APPLICATIONS/glimpse_search_engine/v_4_18_6"
    S_TMP_0="$S_FP_APPLICATIONS/glimpse_search_engine/v_4_18_6_modification_01"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "e09a085d-742e-4ffb-a4d8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_GLIMPSE_EXISTS_ON_PATH="t"
        SB_GLIMPSEINDEX_EXISTS_ON_PATH="t"
        SB_AGREP_EXISTS_ON_PATH="t"
        export MANPATH="$S_TMP_0/man:$MANPATH" # needed due to nonconventional path
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/libtool_GNU/v_2_4_6"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "de7da442-47f9-45a9-92d8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_LIBTOOL_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Fossil/v_2_19"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "29297148-ceaf-4194-83d8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_FOSSIL_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/geomyidae_Gopher_server/v2025_05_10"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "3dab82d3-2ff3-4fd1-95d8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_GEOMYIDAE_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/GNU_grep/v_3_11"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "41d22f44-91d4-4af0-82d8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_GREP_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Silver_Searcher_text_search_program/v2025_09_28_Debian_branch"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "1c2b9510-cdb6-42d6-84d8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_AG_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Zettair_search_engine/v_0_9_4_09_03_modified_by_MV_01"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "9bcb7d42-dd63-4a34-92c8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_ZET_EXISTS_ON_PATH="t"
        SB_ZET_CAT_EXISTS_ON_PATH="t"
        SB_ZET_IMPACTIFY_EXISTS_ON_PATH="t"
        SB_ZET_TREC_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/GNU_sed/v_4_9"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "92ac578c-c293-4f8f-82c8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_SED_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/DilloPlus_web_browser/v2024_12_18_DilloPlus"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "936f2620-a12e-4640-b2c8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_DILLOPLUS_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/MotionProject_security_camera_software/v_4_6_0_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "16a14022-320c-4686-b1c8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_MOTIONPROJECT_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/DoubleCommander_file_manager/v_1_1_22"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "2f72d5fe-2cc6-443e-83c8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_DOUBLECOMMANDER_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Inkscape/v_1_3"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "7f883149-099a-49a8-b4c8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_INKSCAPE_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/NeoMutt_email_client/v2025_01_13"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "1e8fab52-3c81-4f21-a2c8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_NEOMUTT_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/GNU_M4/v_1_4_20"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "a0d4294a-ca3d-404b-91c8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_M4_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    # S_TMP_0="$S_FP_APPLICATIONS/ParaSail/parasail_release_9_3/install"
    # func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #     "$S_TMP_0" "6ca22f10-d31d-434c-b1c8-13a070107ae7"
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/mmmv_hardwarethreadcount_t1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "6c63855e-5852-49cf-94c8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
       SB_MMMV_HARDWARETHREADCOUNT_T1_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/CMake/v_3_25_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "553c81b9-da81-40d5-a3c8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_CMAKE_EXISTS_ON_PATH="t"
        #alias mmmv_ui_add2PATH_CMake_v_3_25_1="export PATH=\"$S_TMP_0/bin:\$PATH\"; export MANPATH=\"$S_TMP_0/share/man:\$MANPATH\" "
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/AutoGen/v_5_18_16"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "215f9a2a-9d98-4426-a4c8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_AUTOGEN_EXISTS_ON_PATH="t"
        #alias mmmv_ui_add2PATH_AutoGen_v_5_18_16="export PATH=\"$S_TMP_0/bin:\$PATH\"; export MANPATH=\"$S_TMP_0/share/man:\$MANPATH\" "
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Ninja_build_system/v_1_13_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "4e62e2f4-1ce0-404b-a2c8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_NINJA_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/DRAKON/v2014_08_04_DRAKON"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "1b525017-6f98-445b-93c8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_DRAKON_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Graphviz/v_13_1_0"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "8f298c1a-075c-45d2-a4c8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_GRAPHVIZ_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Doxygen/v_1_14_0"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "1b69ebe3-cf63-4caf-a2c8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_DOXYGEN_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/KreativeKorp_Hexcellent_hex_editor/KreativeKorp_Hexcellent_v_1_0_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "364e2814-e0fe-4ece-82c8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_KREATIVEKORPHEXCELLENT_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/KreativeKorp_PowerPaint/2024_12_20_downloaded_KreativeKorp_PowerPaint/src_and_bytecode_compiled_with_OpenJ9_JVM_Java8"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "c28b01bb-9757-4484-a2c8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_KREATIVEKORPPOWERPAINT_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Logisim/v_2_7_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "f9a46dfa-562a-4fb6-a1c8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_LOGISIM_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/JAVA_gnuplot_GUI/precompiled_with_OpenJ9_Java8"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "c516c2aa-28aa-42ec-92c8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_JAVAGNUPLOTGUI_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/QBE_compiler_backend/v_1_2"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "6af0f21e-7289-4dc5-93c8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_QBE_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/scdoc/v2025_12_15"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "15362c2e-ab12-40ed-b5c8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_SCDOC_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/tiv/v2023_12_07"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "17cd1243-5a64-4990-85c8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_TIV_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/neofetch/v2021_12_10"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "5a441d16-f67e-4926-a1c8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_NEOFETCH_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Brother_scanner_utility_brscan/v_0_2_4_4"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "5bc55480-344d-4d73-84c8-13a070107ae7"
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/par2_file_corruption_mitigator/v2023_05_31"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "e6100537-ab6b-42ee-82c8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_PAR2_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/redupe_file_corruption_mitigator/v2024_08_12_redupe"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "5655921c-e7a5-41b8-a5c8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_REDUPE_EXISTS_ON_PATH="t"
        export LD_LIBRARY_PATH="$S_TMP_0/lib:$LD_LIBRARY_PATH"
        export CPLUS_INCLUDE_PATH="$S_TMP_0/include:$CPLUS_INCLUDE_PATH"
        alias mmmv_redupe_50="nice -n 14 redupe -o 50 "
    fi
    #----------------------------------------------------------------------
    #S_TMP_0="$S_FP_APPLICATIONS/ffmpeg/v_2026_01_10_frugal"
    S_TMP_0="$S_FP_APPLICATIONS/ffmpeg/v_2026_01_10_ample"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "35976491-5ee7-44bc-a2c8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_FFMPEG_EXISTS_ON_PATH="t"
        export LD_LIBRARY_PATH="$S_TMP_0/lib:$LD_LIBRARY_PATH"
        export CPLUS_INCLUDE_PATH="$S_TMP_0/include:$CPLUS_INCLUDE_PATH"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/sc-im_spreadsheet_program/v_0_8_4"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "ff749928-75c7-4aea-a5c8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_SCIMSPREADSHEETPROGRAM_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/calcurse_calendar/v_4_8_2"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "57f055b1-9b91-4b3a-83c8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_CALCURSE_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/static-web-server_net/v_2_24_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "6d259533-e5e2-4612-a3c8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_STATICWEBSERVERNET_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Tor/v_0_4_8_15"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "7e8e6152-88e2-446d-b4c8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_TOR_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/ncdu/v_1_19"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "10252523-e779-4dad-b5c8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_NCDU_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/REDUCE_Computer_Algebra_System/v_svn6547"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "23e5a453-0ab9-43d8-94c8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_REDUCE_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    #S_TMP_0="$S_FP_APPLICATIONS/Vim/v_8_1"
    S_TMP_0="$S_FP_APPLICATIONS/Vim/2024_06_22_cloned_v_9_1_512"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "4d5a51ff-8369-44d1-83c8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_VIM_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Geany/v_2_0"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "dd1d0520-1fe6-4c9c-a4c8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_GEANY_EXISTS_ON_PATH="t"
        export LD_LIBRARY_PATH="$S_TMP_0/lib:$LD_LIBRARY_PATH"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/GNU_Wget/v_1_21"      # wget  from 2020_12_31
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "a71b7a47-2dcf-4cad-94c8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_WGET_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/GNU_Wget/v_2_1_0" # wget2 from 2023_08_31
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "3f332d3a-dfc2-4f82-b4b8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_WGET2_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Xdialog/v_2_3_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "e8158956-5c8c-465c-91b8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_XDIALOG_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/lrzsz_BBS_X_Y_Z_Modem_file_upload_software/v_0_12_20"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "32c06d19-bee0-434d-a4b8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_LRZSZBBSXYZMODEMFILEUPLOADSOFTWARE_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Worker_file_manager/v_5_1_0"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "0dfda951-e6eb-4907-81b8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_WORKERFILEMANAGER_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/nnn_file_manager/v_5_0"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "729e1abf-d998-4fd4-98b8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_NNNFILEMANAGER_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    #S_TMP_0="$S_FP_APPLICATIONS/lib_openssl/v_3_1_4"
    #func_mmmv_add_lib_2_LD_LIBRARY_PATH_and_include_2_CPATH_t1 \
    #    "$S_TMP_0" "e16eed2c-43d5-4ee7-94b8-13a070107ae7"
    #if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
    #    SB_LIBOPENSSL_EXISTS_ON_PATH="t"
    #fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/lib_popt/v_1_19"
    func_mmmv_add_lib_2_LD_LIBRARY_PATH_and_include_2_CPATH_t1 \
        "$S_TMP_0" "50c8764a-9fe1-4aa7-a2b8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_LIBPOPT_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/lib_NetCDF_C/v_4_10_0"
    func_mmmv_add_lib_2_LD_LIBRARY_PATH_and_include_2_CPATH_t1 \
        "$S_TMP_0" "cafec616-2240-462e-b4b8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_LIBNETCDFC_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/lib_jemalloc/v_5_3_0"
    func_mmmv_add_lib_2_LD_LIBRARY_PATH_and_include_2_CPATH_t1 \
        "$S_TMP_0" "2e2b8964-be4a-400f-a7b8-13a070107ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_LIBJEMALLOC_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/FOX_Toolkit/v_1_7_84"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "2feb4afa-d8c8-4a0b-85b8-13a070107ae7"
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
        echo "GUID=='ea95b7c2-cffc-4e24-a7d8-13a070107ae7'"
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
                #     echo "GUID=='4df5d19d-9593-460b-83d8-13a070107ae7'"
                #     echo ""
                # fi
                func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
                    "$S_FP_1" "44c36623-a4f1-4446-b1b8-13a070107ae7" \
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
                #     echo "GUID=='9232ec1d-8888-430c-94d8-13a070107ae7'"
                #     echo ""
                # fi
                func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
                    "$S_FP_1" "8c62b6e8-bdb3-4fc6-91b8-13a070107ae7" \
                    "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
            fi
            #--------------------------------------------------------------
        fi
    else
        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
            "$S_FP_0" "29d913e4-e583-498c-a3b8-13a070107ae7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    fi
fi
#==========================================================================
# S_VERSION_OF_THIS_FILE="90196542-8a72-4127-81b8-13a070107ae7"
#==========================================================================
