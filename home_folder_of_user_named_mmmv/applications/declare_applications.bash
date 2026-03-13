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
    echo "GUID=='61ba0714-a960-4efb-b555-b051b0d03ae7'"
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
    echo "GUID=='8edb4e2d-21b2-4763-8255-b051b0d03ae7'"
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
        "$MMMV_OPENJ9_HOME" "02e643e9-156e-4240-9555-b051b0d03ae7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        #----------------------------------------
        func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
            "$S_FP_OPENJ9_CONFIG" "9e20c177-47cf-4575-9155-b051b0d03ae7" \
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
            "$M2" "18ec7442-09cc-4c6a-9355-b051b0d03ae7"
        if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
            SB_MAVEN_EXISTS_ON_PATH="t"
            alias mmmv_admin_mvn_download_plugin_org_apache_maven_plugins="nice -n 5 mvn dependency:get -DrepoUrl=mvnrepository.com/artifact/org.apache.maven.plugins "
        fi
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Ruby/v_x_x_x_in_use"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "3eb7c9f5-e630-4a97-b155-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_RUBY_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    #S_TMP_0="$S_FP_APPLICATIONS/rhash/v_1_4_2"
    S_TMP_0="$S_FP_APPLICATIONS/rhash/v_1_4_4"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "cc74a83b-61f6-4b7c-a355-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_RHASH_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/xxHash/v_0_8_3"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "10ac81a5-3483-4691-b155-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_XXHASH_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Par_text_formatter/v_1_53_0"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "f0d6d72a-9b9e-4ac2-b355-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_PAR_TEXT_FORMATTER_EXISTS_ON_PATH="t"
        export PARINIT="rTbgqR B=.,?_A_a Q=_s>|" # from the par man page
    fi
    #----------------------------------------------------------------------
    #S_TMP_0="$S_FP_APPLICATIONS/glimpse_search_engine/v_4_18_6"
    S_TMP_0="$S_FP_APPLICATIONS/glimpse_search_engine/v_4_18_6_modification_01"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "4052e5b1-13dc-4b59-9355-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_GLIMPSE_EXISTS_ON_PATH="t"
        SB_GLIMPSEINDEX_EXISTS_ON_PATH="t"
        SB_AGREP_EXISTS_ON_PATH="t"
        export MANPATH="$S_TMP_0/man:$MANPATH" # needed due to nonconventional path
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/libtool_GNU/v_2_4_6"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "7585615c-2bc0-4bff-9555-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_LIBTOOL_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Fossil/v_2_19"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "b3349a30-664d-4108-a555-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_FOSSIL_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/geomyidae_Gopher_server/v2025_05_10"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "295f8725-df55-43e4-ad55-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_GEOMYIDAE_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/GNU_grep/v_3_11"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "e74e8f2b-11c2-4c2a-bb55-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_GREP_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Silver_Searcher_text_search_program/v2025_09_28_Debian_branch"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "22450402-d2a2-4cec-9555-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_AG_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/GNU_sed/v_4_9"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "0e54de54-9d21-4768-8255-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_SED_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/DilloPlus_web_browser/v2024_12_18_DilloPlus"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "30c46567-71cc-4812-9555-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_DILLOPLUS_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/MotionProject_security_camera_software/v_4_6_0_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "e7e86957-50a8-4450-9355-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_MOTIONPROJECT_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/DoubleCommander_file_manager/v_1_1_22"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "94e04894-d9df-4dda-8655-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_DOUBLECOMMANDER_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Inkscape/v_1_3"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "220446ec-b602-43c2-b355-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_INKSCAPE_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/NeoMutt_email_client/v2025_01_13"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "a277ea2f-2853-4261-8955-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_NEOMUTT_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/GNU_M4/v_1_4_20"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "39cf2d22-40ed-46c3-8455-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_M4_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    # S_TMP_0="$S_FP_APPLICATIONS/ParaSail/parasail_release_9_3/install"
    # func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #     "$S_TMP_0" "a0c72e39-845b-4a14-9155-b051b0d03ae7"
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/mmmv_hardwarethreadcount_t1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "264eb464-c0b9-4651-9455-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
       SB_MMMV_HARDWARETHREADCOUNT_T1_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/CMake/v_3_25_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "46293145-376a-4075-9555-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_CMAKE_EXISTS_ON_PATH="t"
        #alias mmmv_ui_add2PATH_CMake_v_3_25_1="export PATH=\"$S_TMP_0/bin:\$PATH\"; export MANPATH=\"$S_TMP_0/share/man:\$MANPATH\" "
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Ninja_build_system/v_1_13_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "d074e3fb-b62b-42bc-9255-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_NINJA_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/DRAKON/v2014_08_04_DRAKON"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "5eddaf1a-13ee-4023-8155-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_DRAKON_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Graphviz/v_13_1_0"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "36418240-65d0-440c-9555-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_GRAPHVIZ_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Doxygen/v_1_14_0"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "0172db42-e837-4ad9-9255-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_DOXYGEN_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/KreativeKorp_Hexcellent_hex_editor/KreativeKorp_Hexcellent_v_1_0_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "405e6cd7-89c0-4944-9355-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_KREATIVEKORPHEXCELLENT_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/KreativeKorp_PowerPaint/2024_12_20_downloaded_KreativeKorp_PowerPaint/src_and_bytecode_compiled_with_OpenJ9_JVM_Java8"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "48a1ea64-924d-4851-9555-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_KREATIVEKORPPOWERPAINT_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Logisim/v_2_7_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "272ae5c1-0f2e-4a0c-8355-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_LOGISIM_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/JAVA_gnuplot_GUI/precompiled_with_OpenJ9_Java8"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "57e4115e-1fcd-424a-b245-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_JAVAGNUPLOTGUI_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/QBE_compiler_backend/v_1_2"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "4e69c4f4-c9b2-4faa-9345-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_QBE_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/scdoc/v2025_12_15"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "6a03ad3a-dd70-4487-8145-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_SCDOC_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/tiv/v2023_12_07"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "81cb891a-27be-4791-8345-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_TIV_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/neofetch/v2021_12_10"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "cf132f5e-383f-410c-9445-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_NEOFETCH_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Brother_scanner_utility_brscan/v_0_2_4_4"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "042a874f-bda2-47bf-a545-b051b0d03ae7"
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/par2_file_corruption_mitigator/v2023_05_31"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "8bc00954-6ac9-4dfc-8345-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_PAR2_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/redupe_file_corruption_mitigator/v2024_08_12_redupe"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "4b693217-f1f6-486b-b145-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_REDUPE_EXISTS_ON_PATH="t"
        export LD_LIBRARY_PATH="$S_TMP_0/lib:$LD_LIBRARY_PATH"
        export CPLUS_INCLUDE_PATH="$S_TMP_0/include:$CPLUS_INCLUDE_PATH"
        alias mmmv_redupe_50="nice -n 14 redupe -o 50 "
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/ffmpeg/v_2026_01_10"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "b6892240-f165-4417-a545-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_FFMPEG_EXISTS_ON_PATH="t"
        export LD_LIBRARY_PATH="$S_TMP_0/lib:$LD_LIBRARY_PATH"
        export CPLUS_INCLUDE_PATH="$S_TMP_0/include:$CPLUS_INCLUDE_PATH"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/sc-im_spreadsheet_program/v_0_8_4"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "9b42663e-224e-46ca-9545-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_SCIMSPREADSHEETPROGRAM_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/static-web-server_net/v_2_24_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "4e2a8041-a36c-4e61-a245-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_STATICWEBSERVERNET_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Tor/v_0_4_8_15"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "483cb829-b7fd-4aaa-a245-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_TOR_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/ncdu/v_1_19"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "c3033d5b-dc06-4ec8-a445-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_NCDU_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/REDUCE_Computer_Algebra_System/v_svn6547"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "86c1ac58-707f-4751-b345-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_REDUCE_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    #S_TMP_0="$S_FP_APPLICATIONS/Vim/v_8_1"
    S_TMP_0="$S_FP_APPLICATIONS/Vim/2024_06_22_cloned_v_9_1_512"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "93540b35-1dda-4182-b345-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_VIM_EXISTS_ON_PATH="t"
        SB_FP_VIM="$S_TMP_0/bin/vim"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/GNU_Wget/v_1_21"      # wget  from 2020_12_31
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "439bed24-220f-4bf0-8145-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_WGET_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/GNU_Wget/v_2_1_0" # wget2 from 2023_08_31
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "09d59c39-3f40-45c1-b545-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_WGET2_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Xdialog/v_2_3_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "ab7f253f-6c8c-454c-8545-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_XDIALOG_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/lrzsz_BBS_X_Y_Z_Modem_file_upload_software/v_0_12_20"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "2ffa6db5-e637-4244-b345-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_LRZSZBBSXYZMODEMFILEUPLOADSOFTWARE_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Worker_file_manager/v_5_1_0"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "53ba2a91-c087-437e-8a45-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_WORKERFILEMANAGER_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/nnn_file_manager/v_5_0"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "cb528139-9481-4e18-8445-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_NNNFILEMANAGER_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    #S_TMP_0="$S_FP_APPLICATIONS/lib_openssl/v_3_1_4"
    #func_mmmv_add_lib_2_LD_LIBRARY_PATH_and_include_2_CPATH_t1 \
    #    "$S_TMP_0" "51c6b328-c67e-4033-8345-b051b0d03ae7"
    #if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
    #    SB_LIBOPENSSL_EXISTS_ON_PATH="t"
    #fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/lib_popt/v_1_19"
    func_mmmv_add_lib_2_LD_LIBRARY_PATH_and_include_2_CPATH_t1 \
        "$S_TMP_0" "ed01cd2c-15b5-45fc-8245-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_LIBPOPT_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/lib_jemalloc/v_5_3_0"
    func_mmmv_add_lib_2_LD_LIBRARY_PATH_and_include_2_CPATH_t1 \
        "$S_TMP_0" "3c883f51-d645-4c1e-9245-b051b0d03ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_LIBJEMALLOC_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/FOX_Toolkit/v_1_7_84"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "39a2084e-2e9b-4f1b-a445-b051b0d03ae7"
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
        echo "GUID=='e518a08f-6c13-4c98-8155-b051b0d03ae7'"
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
                #     echo "GUID=='208a7d72-63f8-456e-9555-b051b0d03ae7'"
                #     echo ""
                # fi
                func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
                    "$S_FP_1" "60be1847-98f5-495b-a445-b051b0d03ae7" \
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
                #     echo "GUID=='5d6b297d-b69f-42a8-9155-b051b0d03ae7'"
                #     echo ""
                # fi
                func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
                    "$S_FP_1" "32182108-b29e-4818-a645-b051b0d03ae7" \
                    "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
            fi
            #--------------------------------------------------------------
        fi
    else
        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
            "$S_FP_0" "071bcc1e-7dd9-4718-b445-b051b0d03ae7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    fi
fi
#==========================================================================
# S_VERSION_OF_THIS_FILE="4a380325-c75d-4e69-b345-b051b0d03ae7"
#==========================================================================
