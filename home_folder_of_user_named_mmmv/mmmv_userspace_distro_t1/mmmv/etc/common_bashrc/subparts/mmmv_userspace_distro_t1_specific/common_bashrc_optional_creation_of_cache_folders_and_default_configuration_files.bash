#!/usr/bin/env bash
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
#
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#==========================================================================
if [ "$MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1" != "mode_ok_to_load" ]; then
    S_ERR_CODE="1"
    echo ""
    echo "This script is expected to be a sub-part of the "
    echo "/home/mmmv/mmmv_userspace_distro_t1/mmmv/etc/common_bashrc/common_bashrc_main.bash"
    if [ "$MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1" != "" ]; then
        echo ""
        echo "    MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1==$MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1"
        echo ""
    fi
    echo "Exiting with an error code $S_ERR_CODE ."
    echo "GUID=='63982938-58a6-4040-a37c-931390f05ae7'"
    echo ""
    exit $S_ERR_CODE # exit with an error
fi
#--------------------------------------------------------------------------
SB_MAVEN_EXISTS_ON_PATH="f"
if [ "`which mvn 2> /dev/null`" != "" ]; then
    SB_MAVEN_EXISTS_ON_PATH="t"
else
    if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" != "f" ]; then
        echo ""
        echo "The Java build system called Maven is missing from the PATH."
        echo "GUID=='44cbd8f2-0235-4710-9f7c-931390f05ae7'"
        echo ""
    fi
fi

if [ "$SB_MAVEN_EXISTS_ON_PATH" == "t" ]; then
    #----------------------------------------------------------------------
    S_FP_MMMV_DOT_M2="/home/mmmv/.m2"
    S_FP_HOME_DOT_M2="$HOME/.m2"
    #----------------------------------------------------------------------
    if [ "$M2" != "" ]; then
        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
            "$M2" "3124f320-8239-4ce5-a47c-931390f05ae7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    fi
    #----------------------------------------------------------------------
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
        if [ -e "$S_FP_HOME_DOT_M2" ]; then
            # Just to check that it is a folder and not a file.
            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                "$S_FP_HOME_DOT_M2" "36095a95-836a-487b-b27c-931390f05ae7" \
                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        else # we try to copy it to create a seed version of it
            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                "$S_FP_MMMV_DOT_M2" "7584b365-25ef-4fab-817c-931390f05ae7" \
                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
            if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" != "f" ]; then
                    echo ""
                    echo ""
                    echo -e "Attempting to initialize the\e[33m Maven build system\e[39m related "
                    echo -e "\e[33m    $S_FP_HOME_DOT_M2 \e[39m"
                    echo "by copying files there .."
                fi
                    nice -n 2 cp -f -R "$S_FP_MMMV_DOT_M2" "$S_FP_HOME_DOT_M2"
                    S_TMP_0="$?"
                    func_mmmv_wait_and_sync_t1
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" != "f" ]; then
                    echo ".. done copying files."
                    if [ "$S_TMP_0" != 0 ]; then
                        echo -e \e[31m"The cp exited with an error code of $S_TMP_0 \e[39m"
                    fi
                    echo "GUID=='45f3db21-65c1-4038-857c-931390f05ae7'"
                    echo ""
                fi
                func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                    "$S_FP_HOME_DOT_M2" "2994131e-f0e6-4cb8-a17c-931390f05ae7" \
                    "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
            fi
        fi
    fi
    #----------------------------------------------------------------------
    if [ "$MAVEN_OPTS" == "" ]; then
        #export MAVEN_OPTS="-Xmx1G" # The 1GiB is required for
                                    # building some applications.
        export MAVEN_OPTS="-Xmx400M"
    fi
    #----------------------------------------------------------------------
else # Maven not on PATH
    if [ "$M2" != "" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" != "f" ]; then
            echo ""
            echo "The Maven related environment variable, "
            echo ""
            echo "    M2 != \"\" ==$M2"
            echo ""
            echo "is defined, but the Maven itself is not available on the PATH."
            echo "GUID=='dcea7e2d-9513-4f48-a57c-931390f05ae7'"
            echo ""
        fi
    fi
fi

#--------------------------------------------------------------------------
# It seems that the Apache Maven lacks proper console parameters
# for using the Apache Maven with proxy servers. According to the
#
#     https://maven.apache.org/settings.html#Proxies
#
# the
#
#     ~/.m2/settings.xml
#
# is supposed to contain information about the use of proxy servers.
#
#     -----untested--citation--start---------------------------------------
#     <settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
#       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
#       xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
#                           https://maven.apache.org/xsd/settings-1.0.0.xsd">
#       <proxies>
#         <proxy>
#           <id>myproxy</id>
#           <active>true</active>
#           <protocol>http</protocol>
#           <host>proxy.somewhere.com</host>
#           <port>8080</port>
#           <username>proxyuser</username>
#           <password>somepassword</password>
#           <nonProxyHosts>*.google.com|ibiblio.org</nonProxyHosts>
#         </proxy>
#       </proxies>
#     </settings>
#     -----untested--citation--end-----------------------------------------
#--------------------------------------------------------------------------
func_mmmv_userspace_distro_t1_generate_bobbuildtool_config_files(){
    # The global setting code example:
    #     https://bob-build-tool.readthedocs.io/en/latest/installation.html#recommended-configuration
    S_FP_BOBBUILDTOOL_GLOBAL_CONFIG_FILE_PARENT_FOLDER="$HOME/.config/bob"
    S_FP_BOBBUILDTOOL_CACHE_MIRROR_FOLDER="$HOME/.cache/bob/mirror"
    S_FP_BOBBUILDTOOL_CACHE_PKGS_FOLDER="$HOME/.cache/bob/pkgs"
    mkdir -p $S_FP_BOBBUILDTOOL_GLOBAL_CONFIG_FILE_PARENT_FOLDER
    mkdir -p $S_FP_BOBBUILDTOOL_CACHE_MIRROR_FOLDER
    mkdir -p $S_FP_BOBBUILDTOOL_CACHE_PKGS_FOLDER
    func_mmmv_wait_and_sync_t1
    S_FP_BOBBUILDTOOL_GLOBAL_CONFIG_FILE="$S_FP_BOBBUILDTOOL_GLOBAL_CONFIG_FILE_PARENT_FOLDER/default.yaml"
    if [ ! -e $S_FP_BOBBUILDTOOL_GLOBAL_CONFIG_FILE ]; then
        #--------------------
        if [ -h $S_FP_BOBBUILDTOOL_GLOBAL_CONFIG_FILE ]; then # broken symlink
            rm -f $S_FP_BOBBUILDTOOL_GLOBAL_CONFIG_FILE
            func_mmmv_wait_and_sync_t1
        fi
        #--------------------
        S_TMP_0="$S_FP_BOBBUILDTOOL_GLOBAL_CONFIG_FILE"
        echo "preMirrorPrepend:" >> $S_TMP_0
        echo "    scm: url" >> $S_TMP_0
        echo "    url: \"https?://(.*)\"" >> $S_TMP_0
        echo "    mirror: \"$S_FP_BOBBUILDTOOL_CACHE_MIRROR_FOLDER/\\\\1\"" >> $S_TMP_0
        echo "    upload: True" >> $S_TMP_0
        echo "share:" >> $S_TMP_0
        echo "    path: $S_FP_BOBBUILDTOOL_CACHE_PKGS_FOLDER" >> $S_TMP_0
        echo "    quota: \"5G\"" >> $S_TMP_0
        echo "    autoClean: True" >> $S_TMP_0
        echo "" >> $S_TMP_0
        #--------------------
        # https://muen.sk/?utm_source=chatgpt.com#building-muen
        echo "command:" >> $S_TMP_0
        echo "  dev:" >> $S_TMP_0
        if [ "$MMMV_USERSPACE_DISTRO_T1_SI_N_OF_COMPILATION_THREADS_T1" != "" ]; then
            echo "    jobs: $MMMV_USERSPACE_DISTRO_T1_SI_N_OF_COMPILATION_THREADS_T1" >> $S_TMP_0
        else
            echo "    jobs: 1" >> $S_TMP_0
        fi
        echo "    sandbox: dev" >> $S_TMP_0
        echo "" >> $S_TMP_0
        #--------------------
        func_mmmv_wait_and_sync_t1
        #--------------------
    fi
    func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
        "$S_FP_BOBBUILDTOOL_GLOBAL_CONFIG_FILE" \
        "7d440039-53c2-438f-b56c-931390f05ae7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
} # func_mmmv_userspace_distro_t1_generate_bobbuildtool_config_files
if [ "$SB_BOBBUILDTOOL_EXISTS_ON_PATH" == "t" ]; then
    func_mmmv_userspace_distro_t1_generate_bobbuildtool_config_files
fi
#==========================================================================
# S_VERSION_OF_THIS_FILE="3d61c161-77a9-492a-b16c-931390f05ae7"
#==========================================================================
