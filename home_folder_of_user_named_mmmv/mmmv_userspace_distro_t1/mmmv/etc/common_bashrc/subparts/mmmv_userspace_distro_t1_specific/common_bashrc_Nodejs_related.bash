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
    echo "GUID=='05660d35-d42d-4429-a191-411300a188e7'"
    echo ""
    exit $S_ERR_CODE # exit with an error
fi

#--------------------------------------------------------------------------

func_mmmv_userspace_distro_t1_core_Nodejs_related_preparations_declare_npm_related_aliases(){
    #----------------------------------------------------------------------
    if [ "$SB_NPM_EXISTS_ON_PATH" == "" ]; then
        SB_NPM_EXISTS_ON_PATH="f"
        if [ "`which npm 2> /dev/null`" != "" ]; then
            SB_NPM_EXISTS_ON_PATH="t"
        fi
    fi
    #----------------------------------------------------------------------
    if [ "$SB_NPM_EXISTS_ON_PATH" == "t" ]; then
        if [ "$MMMV_USERSPACE_DISTRO_T1_NPM_PACKAGES" != "" ]; then
            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                "$MMMV_USERSPACE_DISTRO_T1_NPM_PACKAGES" \
                "17491251-2cd1-46f6-9691-411300a188e7" \
                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
            if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
                # The next 4 lines are for testing during development:
                #alias mmmv_npm="S_FP_0=\"\`pwd\`\" ; cd \"$MMMV_USERSPACE_DISTRO_T1_NPM_PACKAGES\" ; nice -n 5 npm  version ; cd \"\$S_FP_0\" "
                #alias mmmv_npm='S_FP_0="`pwd`" ; cd "$MMMV_USERSPACE_DISTRO_T1_NPM_PACKAGES" ; nice -n 5 npm  version ; cd "$S_FP_0" '
                #mmmv_polish_ABC_2_A_C_B_exec_t1 'S_FP_0="`pwd`" ; cd "$MMMV_USERSPACE_DISTRO_T1_NPM_PACKAGES" ; nice -n 5 npm  ' ' ; cd "$S_FP_0" '  'version ' 
                #alias mmmv_npm="mmmv_polish_ABC_2_A_C_B_exec_t1 'S_FP_0=\"\`pwd\`\" ; cd \"\$MMMV_USERSPACE_DISTRO_T1_NPM_PACKAGES\" ; nice -n 5 npm  ' ' ; cd \"\$S_FP_0\" '  'version' "
                alias mmmv_npm="mmmv_polish_ABC_2_A_C_B_exec_t1 'S_FP_0=\"\`pwd\`\" ; cd \"\$MMMV_USERSPACE_DISTRO_T1_NPM_PACKAGES\" ; nice -n 5 npm  ' ' ; cd \"\$S_FP_0\" ' " 
            fi
        fi
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "npm" "4460a452-191e-4789-9191-411300a188e7"
    fi
    #----------------------------------------------------------------------
} # func_mmmv_userspace_distro_t1_core_Nodejs_related_preparations_declare_npm_related_aliases


#--------------------------------------------------------------------------

# This function should be executed only once durign the
# execution of the $HOME/.bashrc
func_mmmv_userspace_distro_t1_core_Nodejs_related_preparations(){
    #----------------------------------------------------------------------
    local SB_OK2ATTEMPT="t"
    if [ "$SB_OK2ATTEMPT" == "t" ]; then
        if [ "$MMMV_USERSPACE_DISTRO_T1_NPM_PACKAGES" != "" ]; then
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" != "f" ]; then
                echo ""
                echo -e "The set of $HOME/.bashrc subscripts as a whole"
                echo -e "\e[31mis flawed\e[39m.  At the code region that"
                echo -e "outputs this error message the environment variable"
                echo -e "MMMV_USERSPACE_DISTRO_T1_NPM_PACKAGES should be an empty"
                echo -e "string, but"
                echo -e ""
                echo -e "    MMMV_USERSPACE_DISTRO_T1_NPM_PACKAGES=$MMMV_USERSPACE_DISTRO_T1_NPM_PACKAGES "
                echo -e ""
                echo -e "GUID=='7925d453-b236-4efc-8191-411300a188e7'"
                echo -e ""
            fi
            SB_OK2ATTEMPT="f"
        else
            export MMMV_USERSPACE_DISTRO_T1_NPM_PACKAGES="$HOME/.mmmv/mmmv_npm_packages"
        fi
    fi
    #----------------------------------------------------------------------
    if [ "$SB_OK2ATTEMPT" == "t" ]; then
        if [ ! -e "$MMMV_USERSPACE_DISTRO_T1_NPM_PACKAGES" ]; then
            mkdir -p $MMMV_USERSPACE_DISTRO_T1_NPM_PACKAGES/bin 
            func_mmmv_wait_and_sync_t1
            if [ ! -e "$MMMV_USERSPACE_DISTRO_T1_NPM_PACKAGES" ]; then
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" != "f" ]; then
                    echo ""
                    echo "The MMMV_USERSPACE_DISTRO_T1_NPM_PACKAGES (== "
                    echo "$MMMV_USERSPACE_DISTRO_T1_NPM_PACKAGES"
                    echo -e ") is missing. and its \e[31mcreation\e[39m also\e[31m failed\e[39m."
                    echo "GUID=='baf08be8-ca8a-4129-8291-411300a188e7'"
                    echo ""
                fi
                SB_OK2ATTEMPT="f"
            fi
        fi
    fi
    #----------------------------------------------------------------------
    local S_FP_0=""
    if [ "$SB_OK2ATTEMPT" == "t" ]; then
        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
            "$MMMV_USERSPACE_DISTRO_T1_NPM_PACKAGES" \
            "da907627-e8dd-45be-b591-411300a188e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        if [ "$SB_VERIFICATION_FAILED" == "t" ]; then
            export MMMV_USERSPACE_DISTRO_T1_NPM_PACKAGES="" # to let other programs know of the setup failure
            SB_OK2ATTEMPT="f"
        else
            S_FP_0="$MMMV_USERSPACE_DISTRO_T1_NPM_PACKAGES/bin"
            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                "$S_FP_0" \
                "39bb74e2-8150-451b-b491-411300a188e7" \
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
} # func_mmmv_userspace_distro_t1_core_Nodejs_related_preparations
func_mmmv_userspace_distro_t1_core_Nodejs_related_preparations


#==========================================================================
# S_VERSION_OF_THIS_FILE="49b0d34a-fa3f-4db7-a491-411300a188e7"
#==========================================================================
