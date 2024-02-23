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
    echo "GUID=='1a0a5542-2e92-4c72-956b-a1e1f07128e7'"
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
    echo "GUID=='53ac82e1-d4a5-45b0-b56b-a1e1f07128e7'"
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
        "$MMMV_OPENJ9_HOME" "482e8a52-c0ba-4b38-b56b-a1e1f07128e7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        #----------------------------------------
        func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
            "$S_FP_OPENJ9_CONFIG" "40ab8482-d21f-4a67-856b-a1e1f07128e7" \
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
            "$M2" "909e1e1f-6563-4290-b46b-a1e1f07128e7" 
        alias mmmv_admin_mvn_download_plugin_org_apache_maven_plugins="nice -n 5 mvn dependency:get -DrepoUrl=mvnrepository.com/artifact/org.apache.maven.plugins "
    fi
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Ruby/v_x_x_x_in_use"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "a208707c-776e-4d94-a16b-a1e1f07128e7" 
    #----------------------------------------------------------------------
    #S_TMP_0="$S_FP_APPLICATIONS/rhash/v_1_4_2"
    S_TMP_0="$S_FP_APPLICATIONS/rhash/v_1_4_4"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "8571b72c-ffe0-4eac-b26b-a1e1f07128e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Par_text_formatter/v_1_53_0"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "4346df2e-da3f-471f-a56b-a1e1f07128e7" 
    SB_PAR_TEXT_FORMATTER_EXISTS_ON_PATH="t"
    export PARINIT="rTbgqR B=.,?_A_a Q=_s>|" # from the par man page
    #----------------------------------------------------------------------
    #S_TMP_0="$S_FP_APPLICATIONS/glimpse_search_engine/v_4_18_6"
    S_TMP_0="$S_FP_APPLICATIONS/glimpse_search_engine/v_4_18_6_modification_01"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "47e61463-6d15-4983-976b-a1e1f07128e7" 
    export MANPATH="$S_TMP_0/man:$MANPATH" # needed due to nonconventional path
    SB_GLIMPSE_EXISTS_ON_PATH="t"
    SB_GLIMPSEINDEX_EXISTS_ON_PATH="t"
    SB_AGREP_EXISTS_ON_PATH="t"
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/libtool_GNU/v_2_4_6"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "37947e01-6b07-4c02-a96b-a1e1f07128e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Fossil/v_2_19"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "4ca84cf3-82d1-418b-946b-a1e1f07128e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/DRAKON/v2014_08_04_DRAKON"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "db6cb625-1c1a-4b93-945b-a1e1f07128e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/JAVA_gnuplot_GUI/precompiled_with_OpenJ9_Java8"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "03513238-f666-493c-835b-a1e1f07128e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/tiv/v2023_12_07"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "cdfa7741-085f-45c6-b45b-a1e1f07128e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/neofetch/v2021_12_10"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "788dd931-d924-4585-9e5b-a1e1f07128e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/par2cmdline/v2023_05_31"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "7e9b3e5b-7124-4a6e-b55b-a1e1f07128e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/static-web-server_net/v_2_24_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "1cc2d430-b16d-4d4c-955b-a1e1f07128e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Ncdu/v_1_19"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "03003624-5a09-4690-b45b-a1e1f07128e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/GNU_Wget/v_1_21"      # wget  from 2020_12_31
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "2bc4201c-6e58-4a5c-825b-a1e1f07128e7"
        #----------------------------------------
        S_TMP_0="$S_FP_APPLICATIONS/GNU_Wget/v_2_1_0" # wget2 from 2023_08_31
        func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
            "$S_TMP_0" "6d696f2e-a411-492b-925b-a1e1f07128e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/Xdialog/v_2_3_1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "5a333942-5a19-488b-815b-a1e1f07128e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/lib_openssl/v_3_1_4"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "d2483e42-3cab-4df0-955b-a1e1f07128e7" 
    export LD_LIBRARY_PATH="$S_TMP_0/lib:$LD_LIBRARY_PATH"
    export CPATH="$S_TMP_0/include:$CPATH"
    # export CPLUS_INCLUDE_PATH="$S_TMP_0/include:$CPLUS_INCLUDE_PATH"
    # export C_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:$C_INCLUDE_PATH"
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/FOX_Toolkit/v_1_7_84"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "e9008001-dbe2-4866-b25b-a1e1f07128e7"
    export LD_LIBRARY_PATH="$S_TMP_0/lib:$LD_LIBRARY_PATH"
    export CPLUS_INCLUDE_PATH="$S_TMP_0/include:$CPLUS_INCLUDE_PATH"
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/mmmv_hardwarethreadcount_t1"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "4d013b8e-26e8-4857-9b5b-a1e1f07128e7" 
    #----------------------------------------------------------------------
    S_TMP_0="$S_FP_APPLICATIONS/CMake/v_3_25_1"
    #func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #    "$S_TMP_0" "f642ab4e-8c17-405e-925b-a1e1f07128e7" 
    if [ -e "$S_TMP_0" ]; then
        if [ -d "$S_TMP_0" ]; then
            alias mmmv_ui_add2PATH_CMake_v_3_25_1="export PATH=\"$S_TMP_0/bin:\$PATH\"; export MANPATH=\"$S_TMP_0/share/man:\$MANPATH\" "
        else
            SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                "$S_TMP_0" "1436a150-e731-4da8-a45b-a1e1f07128e7" \
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
    #     "$S_TMP_0" "6fe09516-de7f-4dae-945b-a1e1f07128e7" 
    #----------------------------------------------------------------------
    # S_TMP_0="$S_FP_APPLICATIONS/Minase/v2023_01_01"
    # func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #     "$S_TMP_0" "45587a8d-5d9b-410b-b35b-a1e1f07128e7" 
    #----------------------------------------------------------------------
    # S_TMP_0="$S_FP_APPLICATIONS/MinEd_Text_Editor/v2015_03_xx"
    # func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #     "$S_TMP_0" "238cff28-afd5-4d88-b15b-a1e1f07128e7" 
    #----------------------------------------------------------------------
#     S_TMP_0="$S_FP_APPLICATIONS/img2sixel/v2022_12_26"
#     func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
#         "$S_TMP_0" "d0fd7d39-5a91-459f-a35b-a1e1f07128e7" 
#     #----------------------------------------------------------------------
#     S_TMP_0="$S_FP_APPLICATIONS/exa/v_0_10_1"
#     func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
#         "$S_TMP_0" "5287d664-b272-4570-a25b-a1e1f07128e7" 
#     SB_EXA_EXISTS_ON_PATH="t"
#     #----------------------------------------------------------------------
#     S_TMP_0="$S_FP_APPLICATIONS/Bash/v_5_1"
#     #func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
#     #    "$S_TMP_0" "c655c711-bff4-4462-a25b-a1e1f07128e7" 
#     if [ -e "$S_TMP_0" ]; then
#         if [ -d "$S_TMP_0" ]; then
#             alias mmmv_ui_add2PATH_Bash_v_5_1="export PATH=\"$S_TMP_0/bin:\$PATH\"; export MANPATH=\"$S_TMP_0/share/man:\$MANPATH\" "
#         else
#             SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
#             func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
#                 "$S_TMP_0" "4795c7c1-0fdf-4d48-834b-a1e1f07128e7" \
#                 "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
#         fi
#     fi
#     #----------------------------------------------------------------------
#     S_TMP_0="$S_FP_APPLICATIONS/XTerm/v2023_01_07_newest"
#     #func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
#     #    "$S_TMP_0" "b0ac0d54-9761-4951-824b-a1e1f07128e7" 
#     if [ -e "$S_TMP_0" ]; then
#         if [ -d "$S_TMP_0" ]; then
#             alias mmmv_ui_add2PATH_Xterm_v2023_01_07_newest="export PATH=\"$S_TMP_0/bin:\$PATH\"; export MANPATH=\"$S_TMP_0/share/man:\$MANPATH\" "
#         else
#             SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
#             func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
#                 "$S_TMP_0" "bccd0530-c56e-434a-a24b-a1e1f07128e7" \
#                 "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
#         fi
#     fi
#     #----------------------------------------------------------------------
#     S_TMP_0="$S_FP_APPLICATIONS/GCC/v_11_2_0"
#     #func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
#     #    "$S_TMP_0" "dc39221d-5dba-4720-854b-a1e1f07128e7" 
#     if [ -e "$S_TMP_0" ]; then
#         if [ -d "$S_TMP_0" ]; then
#             alias mmmv_ui_add2PATH_GCC_v_11_2_0="export PATH=\"$S_TMP_0/bin:\$PATH\" ; export MANPATH=\"$S_TMP_0/share/man:\$MANPATH\" ; export LD_LIBRARY_PATH=\"$S_TMP_0/lib64:\$LD_LIBRARY_PATH\" ; export CPLUS_INCLUDE_PATH=\"$S_TMP_0/include/c++/11.2.1:$CPLUS_INCLUDE_PATH\""
#         else
#             SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
#             func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
#                 "$S_TMP_0" "6b918050-acfb-4963-834b-a1e1f07128e7" \
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
#     #    "$MMMV_ADA_HOME" "c95f7721-cb94-4b40-924b-a1e1f07128e7" 
#     alias mmmv_ui_add2PATH_Ada_2_envs_t1="export PATH=\"$MMMV_ADA_HOME/bin:\$PATH\" ; export MANPATH=\"$MMMV_ADA_HOME/share/man:\$MANPATH\" ; export LD_LIBRARY_PATH=\"$MMMV_ADA_LD_LIBRARY_PATH:\$LD_LIBRARY_PATH\" ; "
#     #----------------------------------------------------------------------
#     export MMMV_PARASAIL_HOME="$S_FP_APPLICATIONS/ParaSail/parasail_release_8_4"
#     if [ "$SB_TCSH_EXISTS_ON_PATH" == "t" ]; then
#         #------------------------------------------------------------------
#         SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
#         func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
#             "$MMMV_PARASAIL_HOME" "7d7a9ef4-21af-4778-b84b-a1e1f07128e7" \
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
#                 "$S_FP_CANDIDATE" "f7e1cc11-aa6e-4827-834b-a1e1f07128e7" \
#                 "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
#             if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
#                 #--------
#                 func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
#                     "$MMMV_PARASAIL_HOME" "a4ffd31c-6929-4f32-b34b-a1e1f07128e7"
#                 #$MMMV_PARASAIL_HOME/bin/pslc.csh -b3
#                 alias mmmv_admin_ParaSail_bootstrap_compiler_ParaSailHOMEbin=" cd $MMMV_PARASAIL_HOME ; nice -n 12 $S_FP_CANDIDATE -b3 "
#                 #--------
#             fi
#             #----------------------------------------
#             S_FP_TMP_0="$MMMV_PARASAIL_HOME/_linux"
#             func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
#                 "$S_FP_TMP_0" "35613833-8498-40fa-924b-a1e1f07128e7"
#             if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
#                 func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
#                     "$S_FP_TMP_0" "51b606f4-4197-4f5e-b34b-a1e1f07128e7"
#             fi
#             #----------------------------------------
#             MMMV_PARASAIL_HOME_INSTALL="$MMMV_PARASAIL_HOME/install"
#             func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
#                 "$MMMV_PARASAIL_HOME_INSTALL" \
#                 "574a5a82-0875-4c9d-b34b-a1e1f07128e7" \
#                 "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
#             if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
#                 #--------------------
#                 func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
#                     "$MMMV_PARASAIL_HOME_INSTALL" \
#                     "145e8802-0b0c-4ad3-a94b-a1e1f07128e7" 
#                 #--------------------
#                 S_FP_PSLC_CSH="$MMMV_PARASAIL_HOME_INSTALL/bin/pslc.csh"
#                 S_FP_PARASAIL_PSLC_CSH="$MMMV_PARASAIL_HOME_INSTALL/bin/parasail_pslc.csh"
#                 func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
#                     "$S_FP_PSLC_CSH" "658fe248-15c3-419b-a34b-a1e1f07128e7" \
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
#         "$S_FP_TMP_0" "59aaa378-8321-4351-a24b-a1e1f07128e7" \
#         "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
#     if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
#         S_FP_1="$S_FP_APPLICATIONS/ParaSail/v_6_5/build"
#         SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
#         func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
#             "$S_FP_1" "05341831-4afd-4532-b54b-a1e1f07128e7" \
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
    #     "$S_TMP_0" "e47ea34d-97f2-44e6-844b-a1e1f07128e7"
    #----------------------------------------------------------------------
    # export MMMV_RETHINKDB_HOME="$S_FP_APPLICATIONS/RethinkDB/v2017_04_12"
    # func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #     "$MMMV_RETHINKDB_HOME" "3075f485-687a-46b9-824b-a1e1f07128e7" "t"
    # #----------------------------------------------------------------------
    # export MMMV_NODEJS_HOME="$S_FP_APPLICATIONS/NodeJS/v_6_10_3"
    # func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #     "$MMMV_NODEJS_HOME" "0228a32c-3797-4025-954b-a1e1f07128e7" 
    # #----------------------------------------------------------------------
    # export MMMV_UNISON_HOME="$S_FP_APPLICATIONS/Unison/v_2_48_4"
    # func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
    #     "$MMMV_UNISON_HOME" "feb8f946-fa45-446c-b54b-a1e1f07128e7" 
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
        echo "GUID=='3d236d5b-cac5-454b-b26b-a1e1f07128e7'"
        echo ""
        # "exit 1" must not be here, because 
        # an exit clause would end the login session.
    fi
fi # SB_APPLICATION_DECLARATION_SCRIPT_CUSTOMISED == "t"
#--------------------------------------------------------------------------
# S_VERSION_OF_THIS_FILE="df16c746-1fba-48ff-a44b-a1e1f07128e7"
#==========================================================================
