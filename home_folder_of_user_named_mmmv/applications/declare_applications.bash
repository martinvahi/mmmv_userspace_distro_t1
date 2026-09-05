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
    echo "GUID=='a03c8c21-1207-41aa-93cf-c27080509ae7'"
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
    echo "GUID=='36ad6051-7a75-4dd9-a2cf-c27080509ae7'"
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
        "$MMMV_OPENJ9_HOME" "86344c5a-43f2-4184-84cf-c27080509ae7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        #----------------------------------------
        func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
            "$S_FP_OPENJ9_CONFIG" "293c36ff-5414-4c2b-91cf-c27080509ae7" \
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

# Does not throw. Returns the test result as the value of SB_VERIFICATION_FAILED in_set{"t","f"}
func_test_GNU_Core_Utilities_operating_system_distribution_version_and_buildable_version_match(){
    local S_EXPECTED_STRING_AT_LSDASHDASHVERSION_OUTPUT="$1" # ls --version | grep 'the expected string'
    #----------------------------------------------------------------------
    SB_VERIFICATION_FAILED="f"
    #----------------------------------------------------------------------
    if [ "$S_EXPECTED_STRING_AT_LSDASHDASHVERSION_OUTPUT" == "" ]; then
        SB_VERIFICATION_FAILED="t"
        # A value that consists of only spaces and tabulation
        # charactersh should also be illegal, but that check
        # would clutter this script.
        echo ""
        echo -e "\e[31mThis Bash script is flawed \e[39m."
        echo "GUID=='c77fc41e-a694-4146-a5cf-c27080509ae7'"
        echo ""
    fi
    #----------------------------------------------------------------------
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        #------------------------------------------------------------------
        # According to 2026_08_09 version of mistral.ai
        # mistral-large-latest chatbot different Linux, BSD, Solaris
        # distributions, including the Windows Subsystem for Linux, may
        # have the program "ls" at one of the following paths:
        #
        #     /bin/ls
        #     /data/data/com.termux/files/usr/bin/ls
        #     /run/current-system/profile/bin/ls
        #     /run/current-system/sw/bin/ls
        #     /usr/bin/ls
        #     /usr/gnu/bin/ls
        #     /usr/local/bin/ls
        #     /usr/ucb/ls
        #     /usr/xpg4/bin/ls
        #
        # The "which ls" is not usable here, because the PATH might have
        # been modified so that the "which ls" does not give the path
        # that the operating system distribution originally used for the "ls".
        local S_FP_LS_DISTRO="/tmp/not_yet_initialized"
        # The conditions of the fallowing nested if-clauses try to catch the
        # most frequently used cases first.
        S_FP_LS_DISTRO="/usr/bin/ls"
        if [ "`which $S_FP_LS_DISTRO 2> /dev/null`" == "" ]; then
            S_FP_LS_DISTRO="/bin/ls"
            if [ "`which $S_FP_LS_DISTRO 2> /dev/null`" == "" ]; then
                S_FP_LS_DISTRO="/usr/local/bin/ls"
                if [ "`which $S_FP_LS_DISTRO 2> /dev/null`" == "" ]; then
                    S_FP_LS_DISTRO="/usr/gnu/bin/ls"
                    if [ "`which $S_FP_LS_DISTRO 2> /dev/null`" == "" ]; then
                        S_FP_LS_DISTRO="/usr/ucb/ls"
                        if [ "`which $S_FP_LS_DISTRO 2> /dev/null`" == "" ]; then
                            S_FP_LS_DISTRO="/run/current-system/sw/bin/ls"
                            if [ "`which $S_FP_LS_DISTRO 2> /dev/null`" == "" ]; then
                                S_FP_LS_DISTRO="/run/current-system/profile/bin/ls"
                                if [ "`which $S_FP_LS_DISTRO 2> /dev/null`" == "" ]; then
                                    S_FP_LS_DISTRO="/usr/xpg4/bin/ls"
                                    if [ "`which $S_FP_LS_DISTRO 2> /dev/null`" == "" ]; then
                                        S_FP_LS_DISTRO="/data/data/com.termux/files/usr/bin/ls"
                                        if [ "`which $S_FP_LS_DISTRO 2> /dev/null`" == "" ]; then
                                            #------------------------------
                                            SB_VERIFICATION_FAILED="t"
                                            echo -e "\e[31m"
                                            echo -e "Failed to find the path of the "
                                            echo -e "operating system distribution binary \"ls\".\e[39m The "
                                            echo ""
                                            echo "    \`which ls\`==\"`which ls`\""
                                            echo ""
                                            echo -e "but this script requires a full path of"
                                            echo -e "the \"ls\" that is not derived from the"
                                            echo -e "value of the PATH environment variable."
                                            echo "GUID=='4603d923-9bc1-486d-94cf-c27080509ae7'"
                                            echo ""
                                            #------------------------------
                                        fi
                                    fi
                                fi
                            fi
                        fi
                    fi
                fi
            fi
        fi
        #------------------------------------------------------------------
    fi
    #----------------------------------------------------------------------
    local S_LS_DISTRO=""
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        S_LS_DISTRO="` ls --version | grep \"$S_EXPECTED_STRING_AT_LSDASHDASHVERSION_OUTPUT\" `"
        # echo "S_LS_DISTRO==[$S_LS_DISTRO]"
        if [ "$S_LS_DISTRO" == "" ]; then
            #------------------------------
            SB_VERIFICATION_FAILED="t"
            echo ""
            echo -e "GNU Core Utilities depend on Linux kernel and therefore the"
            echo -e "version of GNU Core Utilities that can be compiled/built/used"
            echo -e "depends on the version of Linux kernel that runs the build"
            echo -e "computer. As the only reason for recompiling GNU Core"
            echo -e "Utilities is to be able to use CPU specific binaries, it"
            echo -e "is highly recommended to compile/build the same version of"
            echo -e "GNU Core Utilities that got installed by default as part of"
            echo -e "operating system distribution. As of 2026_08_09 the home page"
            echo -e "of GNU Core Utilities is:"
            echo -e ""
            echo -e "    https://www.gnu.org/software/coreutils/"
            echo -e "    https://ftp.gnu.org/gnu/coreutils/"
            echo -e ""
            echo -e "GUID=='c2718712-b484-41e2-85cf-c27080509ae7'"
            echo ""
            #------------------------------
        fi
    fi
    #----------------------------------------------------------------------
    if [ "$SB_VERIFICATION_FAILED" != "t" ]; then
        if [ "$SB_VERIFICATION_FAILED" != "f" ]; then
            #--------------------------------------------------------------
            SB_VERIFICATION_FAILED="t"
            echo ""
            echo -e "\e[31mThe code of this Bash function is flawed.\e[39m."
            echo "GUID=='3337823c-0a98-45eb-95cf-c27080509ae7'"
            echo ""
            #--------------------------------------------------------------
        fi
    fi
    #----------------------------------------------------------------------
} # func_test_GNU_Core_Utilities_operating_system_distribution_version_and_buildable_version_match

#--------------------------------------------------------------------------

func_mmmv_userspace_distro_t1_declare_applications_bash_GNU_Core_Utilities_v_9_1(){
    S_TMP_0="$S_FP_APPLICATIONS/GNU_Core_Utilities_id_est_coreutils/v_9_1"
    func_test_GNU_Core_Utilities_operating_system_distribution_version_and_buildable_version_match \
        "ls (GNU coreutils) 9.1"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
            "$S_TMP_0" "b838fb69-9c91-4ea3-95cf-c27080509ae7"
    fi
} # func_mmmv_userspace_distro_t1_declare_applications_bash_GNU_Core_Utilities_v_9_1

func_mmmv_userspace_distro_t1_declare_applications_bash_GNU_Core_Utilities_v_9_4(){
    S_TMP_0="$S_FP_APPLICATIONS/GNU_Core_Utilities_id_est_coreutils/v_9_4"
    func_test_GNU_Core_Utilities_operating_system_distribution_version_and_buildable_version_match \
        "ls (GNU coreutils) 9.4"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
            "$S_TMP_0" "b29c4328-ec1f-417d-a1cf-c27080509ae7"
    fi
} # func_mmmv_userspace_distro_t1_declare_applications_bash_GNU_Core_Utilities_v_9_4

#--------------------------------------------------------------------------
if [ "$SB_APPLICATION_DECLARATION_SCRIPT_CUSTOMISED" == "t" ]; then
#--------------------------------------------------------------------------
    S_FP_APPLICATIONS="$S_FP_DIR_TMP_0"
    #----------------------------------------------------------------------
    export M2="$S_FP_APPLICATIONS/Maven/v_3_6_3" # ..../bin/mvn depends on sh
    if [ "$SB_SH_EXISTS_ON_PATH" == "t" ]; then # TODO: eliminate the if-clause by updating the function below
        SB_MAVEN_EXISTS_ON_PATH="f"
        func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
            "$M2" "541bb9e3-3b59-4102-83cf-c27080509ae7"
        if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
            SB_MAVEN_EXISTS_ON_PATH="t"
            alias mmmv_admin_mvn_download_plugin_org_apache_maven_plugins="nice -n 5 mvn dependency:get -DrepoUrl=mvnrepository.com/artifact/org.apache.maven.plugins "
        fi
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Ruby/v_x_x_x_in_use"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "a6106b57-c283-4480-a5cf-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_RUBY_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    #S_TMP_0="$S_FP_APPLICATIONS/rhash/v_1_4_2"
    S_TMP_0="$S_FP_APPLICATIONS/rhash/v_1_4_4"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "cb7b5f59-b37b-4175-84cf-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_RHASH_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/xxHash/v_0_8_3"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "2eb1d239-ef00-4482-95cf-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_XXHASH_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Par_text_formatter/v_1_53_0"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "5a675455-5b9b-4ca6-bfcf-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_PAR_TEXT_FORMATTER_EXISTS_ON_PATH="t"
        export PARINIT="rTbgqR B=.,?_A_a Q=_s>|" # from the par man page
    fi
    #----------------------------------------------------------------------
    #S_TMP_0="$S_FP_APPLICATIONS/glimpse_search_engine/v_4_18_6"
    S_TMP_0="$S_FP_APPLICATIONS/glimpse_search_engine/v_4_18_6_modification_01"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "f996b04c-b77d-4057-a3bf-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_GLIMPSE_EXISTS_ON_PATH="t"
        SB_GLIMPSEINDEX_EXISTS_ON_PATH="t"
        SB_AGREP_EXISTS_ON_PATH="t"
        export MANPATH="$S_TMP_0/man:$MANPATH" # needed due to nonconventional path
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/libtool_GNU/v_2_4_6"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "448a73c4-9ffb-4101-85bf-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_LIBTOOL_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    # GNU Core Utilities depend on Linux Kernel version, so only the version
    # that comes with the operating system distribution by default should be
    # used, but custom-compiling them is an efficiency/speed hack anyway, so if
    # its build script fails for whatever reason, for example, if some of GNU
    # Core Utilities tests fail, which are run by the build script, then it's
    # recommended to just not bother custom-compiling them. The binaries that
    # come with operating system distribution work just fine.
    # func_mmmv_userspace_distro_t1_declare_applications_bash_GNU_Core_Utilities_v_9_1
    # func_mmmv_userspace_distro_t1_declare_applications_bash_GNU_Core_Utilities_v_9_4
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Fossil/v_2_19"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "41a4c771-ea16-44fa-a6bf-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_FOSSIL_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/geomyidae_Gopher_server/v2025_05_10"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "499efd52-16aa-4be1-b4bf-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_GEOMYIDAE_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/GNU_grep/v_3_11"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "a86d851f-7222-46ea-b4bf-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_GREP_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Silver_Searcher_text_search_program/v2025_09_28_Debian_branch"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "4cb0bc1c-2492-4dab-83bf-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_AG_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Zettair_search_engine/v_0_9_4_09_03_modified_by_MV_01"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "6fb9b8b2-9e29-4c5c-84bf-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_ZET_EXISTS_ON_PATH="t"
        SB_ZET_CAT_EXISTS_ON_PATH="t"
        SB_ZET_IMPACTIFY_EXISTS_ON_PATH="t"
        SB_ZET_TREC_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/GNU_sed/v_4_9"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "b167161a-aef0-43c7-a2bf-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_SED_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/jq_JSON_processing_tool/v2026_07_19"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "41328c27-1ce4-477d-92bf-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_JQ_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/DilloPlus_web_browser/v2024_12_18_DilloPlus"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "f1145f5b-5e08-4d4f-82bf-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_DILLOPLUS_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/MotionProject_security_camera_software/v_4_6_0_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "b0708c21-e89a-4b87-a4bf-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_MOTIONPROJECT_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/DoubleCommander_file_manager/v_1_1_22"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "e8d93b3c-81c7-437d-a4bf-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_DOUBLECOMMANDER_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Inkscape/v_1_3"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "676c6d45-76d7-45b9-83bf-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_INKSCAPE_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/NeoMutt_email_client/v2025_01_13"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "a85c3596-8c79-465e-a6bf-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_NEOMUTT_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/GNU_M4/v_1_4_20"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "9735a840-c9f4-49cc-b5bf-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_M4_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    # S_TMP_0="$S_FP_APPLICATIONS/ParaSail/parasail_release_9_3/install"
    # func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #     "$S_TMP_0" "f7017727-053b-46d2-b3bf-c27080509ae7"
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/mmmv_hardwarethreadcount_t1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "56d31983-eaa5-4a21-8dbf-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
       SB_MMMV_HARDWARETHREADCOUNT_T1_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    #S_TMP_0="$S_FP_APPLICATIONS/CMake/v_3_25_1"
    S_TMP_0="$S_FP_APPLICATIONS/CMake/v_4_4_3"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "f82a141a-50df-4267-b5bf-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_CMAKE_EXISTS_ON_PATH="t"
        #alias mmmv_ui_add2PATH_CMake_v_3_25_1="export PATH=\"$S_TMP_0/bin:\$PATH\"; export MANPATH=\"$S_TMP_0/share/man:\$MANPATH\" "
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/AutoGen/v_5_18_16"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "3d99617b-75d1-4978-a2bf-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_AUTOGEN_EXISTS_ON_PATH="t"
        #alias mmmv_ui_add2PATH_AutoGen_v_5_18_16="export PATH=\"$S_TMP_0/bin:\$PATH\"; export MANPATH=\"$S_TMP_0/share/man:\$MANPATH\" "
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Ninja_build_system/v_1_13_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "24ec9e91-2022-4e72-aabf-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_NINJA_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/DRAKON/v2014_08_04_DRAKON"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "2717b526-aa51-4ce3-84bf-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_DRAKON_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Graphviz/v_13_1_0"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "5bce6574-600e-4188-bdbf-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_GRAPHVIZ_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Doxygen/v_1_14_0"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "3eac431d-7a4a-4966-84bf-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_DOXYGEN_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/KreativeKorp_Hexcellent_hex_editor/KreativeKorp_Hexcellent_v_1_0_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "0256f355-5725-409b-a5bf-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_KREATIVEKORPHEXCELLENT_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/KreativeKorp_PowerPaint/2024_12_20_downloaded_KreativeKorp_PowerPaint/src_and_bytecode_compiled_with_OpenJ9_JVM_Java8"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "0a89eb22-3330-4789-a2bf-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_KREATIVEKORPPOWERPAINT_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Logisim/v_2_7_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "f4ff2aeb-75c0-4fdf-b2bf-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_LOGISIM_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/JAVA_gnuplot_GUI/precompiled_with_OpenJ9_Java8"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "38d858d1-b310-40bb-b7bf-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_JAVAGNUPLOTGUI_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/QBE_compiler_backend/v_1_2"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "d560b02e-fcd4-4261-94bf-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_QBE_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/scdoc/v2025_12_15"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "367c8885-7c66-41f9-99bf-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_SCDOC_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/tiv/v2023_12_07"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "80f2812e-f232-4473-a5bf-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_TIV_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/neofetch/v2021_12_10"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "171ed4f4-de8c-4015-b2af-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_NEOFETCH_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Brother_scanner_utility_brscan/v_0_2_4_4"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "9807903a-6b89-4ec0-b1af-c27080509ae7"
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/par2_file_corruption_mitigator/v2023_05_31"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "31f0a833-f3ee-4950-b2af-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_PAR2_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/redupe_file_corruption_mitigator/v2024_08_12_redupe"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "1b8e552e-1afe-4501-b5af-c27080509ae7"
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
        "$S_TMP_0" "77293926-3dec-47b4-b1af-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_FFMPEG_EXISTS_ON_PATH="t"
        export LD_LIBRARY_PATH="$S_TMP_0/lib:$LD_LIBRARY_PATH"
        export CPLUS_INCLUDE_PATH="$S_TMP_0/include:$CPLUS_INCLUDE_PATH"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/sc-im_spreadsheet_program/v_0_8_4"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "b26cde11-1684-438b-82af-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_SCIMSPREADSHEETPROGRAM_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/calcurse_calendar/v_4_8_2"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "f9b77145-c49d-4854-85af-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_CALCURSE_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/static-web-server_net/v_2_24_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "84fa6711-d6a1-482a-a3af-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_STATICWEBSERVERNET_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Tor/v_0_4_8_15"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "c2cb8b12-59c1-4d13-85af-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_TOR_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/ncdu/v_1_19"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "2c4772a0-6102-47c7-81af-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_NCDU_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/REDUCE_Computer_Algebra_System/v_svn6547"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "4bf5bb24-a745-4e0c-83af-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_REDUCE_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    #S_TMP_0="$S_FP_APPLICATIONS/Vim/v_8_1"
    S_TMP_0="$S_FP_APPLICATIONS/Vim/2024_06_22_cloned_v_9_1_512"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "3d381e4a-57cb-49b3-81af-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_VIM_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Geany/v_2_0"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "188acae3-9058-45ec-94af-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_GEANY_EXISTS_ON_PATH="t"
        export LD_LIBRARY_PATH="$S_TMP_0/lib:$LD_LIBRARY_PATH"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/GNU_Wget/v_1_21"      # wget  from 2020_12_31
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "770b6d56-07fa-4439-93af-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_WGET_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/GNU_Wget/v_2_1_0" # wget2 from 2023_08_31
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "627f7657-17d7-4219-a5af-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_WGET2_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Xdialog/v_2_3_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "d4aed42e-7dbc-4b61-84af-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_XDIALOG_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/lrzsz_BBS_X_Y_Z_Modem_file_upload_software/v_0_12_20"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "9cdb85f7-16c1-4215-b1af-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_LRZSZBBSXYZMODEMFILEUPLOADSOFTWARE_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Worker_file_manager/v_5_1_0"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "8203e674-f712-49c4-91af-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_WORKERFILEMANAGER_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/nnn_file_manager/v_5_0"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "242f9d49-05b2-473d-b4af-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_NNNFILEMANAGER_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    #S_TMP_0="$S_FP_APPLICATIONS/lib_openssl/v_3_1_4"
    #func_mmmv_add_lib_2_LD_LIBRARY_PATH_and_include_2_CPATH_t1 \
    #    "$S_TMP_0" "1a70ea42-e6c4-481a-b1af-c27080509ae7"
    #if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
    #    SB_LIBOPENSSL_EXISTS_ON_PATH="t"
    #fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/lib_popt/v_1_19"
    func_mmmv_add_lib_2_LD_LIBRARY_PATH_and_include_2_CPATH_t1 \
        "$S_TMP_0" "b1dc7147-fcce-4028-a4af-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_LIBPOPT_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/lib_NetCDF_C/v_4_10_0"
    func_mmmv_add_lib_2_LD_LIBRARY_PATH_and_include_2_CPATH_t1 \
        "$S_TMP_0" "125fe6a5-68cc-4c16-a1af-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_LIBNETCDFC_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/lib_jemalloc/v_5_3_0"
    func_mmmv_add_lib_2_LD_LIBRARY_PATH_and_include_2_CPATH_t1 \
        "$S_TMP_0" "2395de43-ef53-4f79-b1af-c27080509ae7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        SB_LIBJEMALLOC_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/FOX_Toolkit/v_1_7_84"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "36851664-b8b9-4036-94af-c27080509ae7"
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
        echo "GUID=='1dcfaf58-6024-41d7-83cf-c27080509ae7'"
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
                #     echo "GUID=='7f134851-5f40-4892-94cf-c27080509ae7'"
                #     echo ""
                # fi
                func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
                    "$S_FP_1" "d63eb723-0fa0-4ced-b5af-c27080509ae7" \
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
                #     echo "GUID=='b2a30540-4c08-422f-a4cf-c27080509ae7'"
                #     echo ""
                # fi
                func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
                    "$S_FP_1" "b5fd0420-b43a-4836-85af-c27080509ae7" \
                    "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
            fi
            #--------------------------------------------------------------
        fi
    else
        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
            "$S_FP_0" "ab2d5e56-a01c-4773-a1af-c27080509ae7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    fi
fi
#==========================================================================
# S_VERSION_OF_THIS_FILE="73aec61a-4dd3-4890-a2af-c27080509ae7"
#==========================================================================
