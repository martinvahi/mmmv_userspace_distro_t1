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
    echo "GUID=='69550b25-d02a-4d43-9b11-c051502059e7'"
    echo ""
    exit $S_ERR_CODE # exit with an error
fi

#--------------------------------------------------------------------------
SB_OK2ATTEMPT="t"

func_mmmv_userspace_distro_t1_core_Nodejs_related_preparations_create_folder(){
    local S_FP_FOLDER="$1"
    #----------------------------------------------------------------------
    if [ "$SB_OK2ATTEMPT" == "t" ]; then
        if [ ! -e "$S_FP_FOLDER" ]; then
            if [ -h "$S_FP_FOLDER" ]; then # broken symlink
                rm  $S_FP_FOLDER
                if [ "$?" != "0" ]; then
                    if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" != "f" ]; then
                        echo ""
                        echo -e "\e[31mFailed to delete\e[39m a broken symlink "
                        echo "    $S_FP_FOLDER"
                        echo "GUID=='97f92120-0055-4ca1-8211-c051502059e7'"
                        echo ""
                    fi
                    SB_OK2ATTEMPT="f"
                fi
                func_mmmv_wait_and_sync_t1
            fi
        fi
    fi
    #----------------------------------------------------------------------
    if [ "$SB_OK2ATTEMPT" == "t" ]; then
        if [ ! -e "$S_FP_FOLDER" ]; then
            mkdir -p $S_FP_FOLDER
            if [ "$?" != "0" ]; then
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" != "f" ]; then
                    echo ""
                    echo -e "\e[31mFailed to create \e[39m"
                    echo "    $S_FP_FOLDER"
                    echo "GUID=='1cd0b624-6ca1-41a2-ae11-c051502059e7'"
                    echo ""
                fi
                SB_OK2ATTEMPT="f"
            fi
            func_mmmv_wait_and_sync_t1
            if [ ! -e "$S_FP_FOLDER" ]; then
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" != "f" ]; then
                    echo ""
                    echo -e "\e[31mFailed to create \e[39m"
                    echo "    $S_FP_FOLDER"
                    echo "GUID=='52fa9941-3127-4485-9311-c051502059e7'"
                    echo ""
                fi
                SB_OK2ATTEMPT="f"
            fi
        fi
    fi
    #----------------------------------------------------------------------
} # func_mmmv_userspace_distro_t1_core_Nodejs_related_preparations_create_folder

#--------------------------------------------------------------------------

func_mmmv_userspace_distro_t1_core_Nodejs_related_preparations_declare_npm_related_aliases(){
    #----------------------------------------------------------------------
    if [ "$SB_NPM_EXISTS_ON_PATH" == "t" ]; then
        if [ "$MMMV_USERSPACE_DISTRO_T1_NPM_PACKAGES" != "" ]; then
            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                "$MMMV_USERSPACE_DISTRO_T1_NPM_PACKAGES" \
                "55474881-83ea-456a-9311-c051502059e7" \
                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
            #if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
                # The next 4 lines are for testing during development:
                #alias mmmv_npm="S_FP_0=\"\`pwd\`\" ; cd \"$MMMV_USERSPACE_DISTRO_T1_NPM_PACKAGES\" ; nice -n 5 npm  version ; cd \"\$S_FP_0\" "
                #alias mmmv_npm='S_FP_0="`pwd`" ; cd "$MMMV_USERSPACE_DISTRO_T1_NPM_PACKAGES" ; nice -n 5 npm  version ; cd "$S_FP_0" '
                #mmmv_polish_ABC_2_A_C_B_exec_t1 'S_FP_0="`pwd`" ; cd "$MMMV_USERSPACE_DISTRO_T1_NPM_PACKAGES" ; nice -n 5 npm  ' ' ; cd "$S_FP_0" '  'version ' 
                # As of 2025_03_09 The 
                #alias mmmv_npm_global="PREFIX=\"$MMMV_USERSPACE_DISTRO_T1_NPM_PACKAGES\" ; nice -n 5 npm  " 
                # does not work for some reason. TODO: figure out, why
            #fi
        fi
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "npm" "f8b80833-be96-45e8-9211-c051502059e7"
    fi
    #----------------------------------------------------------------------
} # func_mmmv_userspace_distro_t1_core_Nodejs_related_preparations_declare_npm_related_aliases


#--------------------------------------------------------------------------

func_mmmv_userspace_distro_t1_core_Nodejs_related_preparations_npm(){
    #----------------------------------------------------------------------
    SB_OK2ATTEMPT="t"
    #----------------------------------------------------------------------
    if [ "$SB_NPM_EXISTS_ON_PATH" == "" ]; then
        SB_NPM_EXISTS_ON_PATH="f"
        if [ "`which npm 2> /dev/null`" != "" ]; then
            SB_NPM_EXISTS_ON_PATH="t"
        else
            SB_OK2ATTEMPT="f"
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "npm" "c6c0e713-6c09-4063-a311-c051502059e7"
        fi
    else
        if [ "$SB_NPM_EXISTS_ON_PATH" != "t" ]; then
            SB_OK2ATTEMPT="f"
        fi
    fi
    #----------------------------------------------------------------------
    if [ "$SB_OK2ATTEMPT" == "t" ]; then
        export MMMV_USERSPACE_DISTRO_T1_NPM_PACKAGES="$HOME/.mmmv/mmmv_npm_packages"
        func_mmmv_userspace_distro_t1_core_Nodejs_related_preparations_create_folder \
            "$MMMV_USERSPACE_DISTRO_T1_NPM_PACKAGES"
    fi
    #----------------------------------------------------------------------
    local S_FP_0="$MMMV_USERSPACE_DISTRO_T1_NPM_PACKAGES/bin"
    if [ "$SB_OK2ATTEMPT" == "t" ]; then
        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
            "$MMMV_USERSPACE_DISTRO_T1_NPM_PACKAGES" \
            "4af6f602-8caa-4f39-8511-c051502059e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        if [ "$SB_VERIFICATION_FAILED" == "t" ]; then
            export MMMV_USERSPACE_DISTRO_T1_NPM_PACKAGES="" # to let other programs know of the setup failure
            SB_OK2ATTEMPT="f"
        else
            func_mmmv_userspace_distro_t1_core_Nodejs_related_preparations_create_folder \
                "$S_FP_0"
            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                "$S_FP_0" \
                "f333344d-980f-4234-8311-c051502059e7" \
                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
            if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
                export Z_PATH="$S_FP_0:$Z_PATH"
            else
                SB_OK2ATTEMPT="f"
            fi
        fi
    fi
    #----------------------------------------------------------------------
    if [ "$SB_OK2ATTEMPT" == "t" ]; then
        if [ "$MMMV_USERSPACE_DISTRO_T1_NPM_PACKAGES" != "" ]; then
            func_mmmv_userspace_distro_t1_core_Nodejs_related_preparations_declare_npm_related_aliases
        fi
    fi
    #----------------------------------------------------------------------
} # func_mmmv_userspace_distro_t1_core_Nodejs_related_preparations_npm


#--------------------------------------------------------------------------

func_mmmv_userspace_distro_t1_core_Nodejs_related_preparations_yarn(){
    #----------------------------------------------------------------------
    # https://yarnpkg.com/
    # https://github.com/yarnpkg
    #----------------------------------------------------------------------
    SB_OK2ATTEMPT="t"
    local S_FP_YARN="$HOME/.mmmv/yarn"
    local S_FP_YARN_CONFIG_FOLDER="$S_FP_YARN/configuration"
    local S_FP_YARN_CACHE_FOLDER="$S_FP_YARN/cache"
    #----------------------------------------------------------------------
    if [ "$SB_YARN_EXISTS_ON_PATH" == "" ]; then
        SB_YARN_EXISTS_ON_PATH="f"
        if [ "`which yarn 2> /dev/null`" != "" ]; then
            SB_YARN_EXISTS_ON_PATH="t"
        else
            SB_OK2ATTEMPT="f"
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "yarn" "8966e116-1dff-4836-8211-c051502059e7"
        fi
    else
        if [ "$SB_YARN_EXISTS_ON_PATH" != "t" ]; then
            SB_OK2ATTEMPT="f"
        fi
    fi
    #----------------------------------------------------------------------
    func_mmmv_userspace_distro_t1_core_Nodejs_related_preparations_create_folder \
        "$S_FP_YARN"
    #----------------------------------------------------------------------
    if [ "$SB_OK2ATTEMPT" == "t" ]; then
        export MMMV_USERSPACE_DISTRO_T1_YARN_PACKAGES="$S_FP_YARN/packages"
        func_mmmv_userspace_distro_t1_core_Nodejs_related_preparations_create_folder \
            "$MMMV_USERSPACE_DISTRO_T1_YARN_PACKAGES"
    fi
    if [ "$SB_OK2ATTEMPT" == "t" ]; then
        export YARN_GLOBAL_FOLDER="$MMMV_USERSPACE_DISTRO_T1_YARN_PACKAGES"
        func_mmmv_userspace_distro_t1_core_Nodejs_related_preparations_create_folder \
            "$S_FP_YARN_CONFIG_FOLDER"
    fi
    if [ "$SB_OK2ATTEMPT" == "t" ]; then
        export YARN_CONFIG_FOLDER="$S_FP_YARN_CONFIG_FOLDER"
        func_mmmv_userspace_distro_t1_core_Nodejs_related_preparations_create_folder \
            "$S_FP_YARN_CACHE_FOLDER"
    fi
    if [ "$SB_OK2ATTEMPT" == "t" ]; then
        export YARN_CACHE_FOLDER="$S_FP_YARN_CACHE_FOLDER"
    fi
    #----------------------------------------------------------------------
    if [ "$SB_OK2ATTEMPT" == "t" ]; then
        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
            "$MMMV_USERSPACE_DISTRO_T1_YARN_PACKAGES" \
            "aa559057-7f5b-4c6c-9311-c051502059e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        if [ "$SB_VERIFICATION_FAILED" == "t" ]; then
            SB_OK2ATTEMPT="f"
        fi
    fi
    if [ "$SB_OK2ATTEMPT" == "t" ]; then
        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
            "$S_FP_YARN_CONFIG_FOLDER" \
            "64c25e37-a557-4629-aa11-c051502059e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        if [ "$SB_VERIFICATION_FAILED" == "t" ]; then
            SB_OK2ATTEMPT="f"
        fi
    fi
    if [ "$SB_OK2ATTEMPT" == "t" ]; then
        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
            "$S_FP_YARN_CACHE_FOLDER" \
            "45e75142-0c13-429c-8311-c051502059e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        if [ "$SB_VERIFICATION_FAILED" == "t" ]; then
            SB_OK2ATTEMPT="f"
        fi
    fi
    #----------------------------------------------------------------------
} # func_mmmv_userspace_distro_t1_core_Nodejs_related_preparations_yarn

#--------------------------------------------------------------------------

# This function should be executed only once durign the
# execution of the $HOME/.bashrc
func_mmmv_userspace_distro_t1_core_Nodejs_related_preparations(){
    func_mmmv_userspace_distro_t1_core_Nodejs_related_preparations_npm
    func_mmmv_userspace_distro_t1_core_Nodejs_related_preparations_yarn
} # func_mmmv_userspace_distro_t1_core_Nodejs_related_preparations
func_mmmv_userspace_distro_t1_core_Nodejs_related_preparations

#==========================================================================
# S_VERSION_OF_THIS_FILE="4a980682-c564-4655-9311-c051502059e7"
#==========================================================================
