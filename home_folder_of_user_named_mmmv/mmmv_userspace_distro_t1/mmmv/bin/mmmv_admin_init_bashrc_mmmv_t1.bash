#!/usr/bin/env bash
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#==========================================================================
S_FP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
S_FP_ORIG="`pwd`"
S_TIMESTAMP="`date +%Y`_`date +%m`_`date +%d`_T_`date +%H`h_`date +%M`min_`date +%S`s"
#--------------------------------------------------------------------------

func_mmmv_wait_and_sync_t1(){
    wait # for background processes started by this Bash script to exit/finish
    sync # network drives, USB-sticks, etc.
    wait # for sync to finish
} # func_mmmv_wait_and_sync_t1

#--------------------------------------------------------------------------

func_mmmv_exc_verify_S_FP_ORIG_t1() {
    if [ "$S_FP_ORIG" == "" ]; then
        echo ""
        echo "The code of this script is flawed."
        echo "The environment variable S_FP_ORIG is expected "
        echo "to be initialized at the start of the script by "
        echo ""
        echo "    S_FP_ORIG=\"\`pwd\`\""
        echo ""
        echo "Aborting script."
        echo "GUID=='5d53d4f3-4c54-4295-b1ba-f1f0b03088e7'"
        echo ""
        exit 1 # exit with an error
    fi
    #------------------------
    local SB_IS_SYMLINK="f"      # possible values: "t", "f"
    if [ -h "$S_FP_ORIG" ]; then # Returns "false" for paths that 
                                 # do not refer to anything.
        SB_IS_SYMLINK="t"
    fi
    #--------
    if [ ! -e "$S_FP_ORIG" ]; then
        if [ "$SB_IS_SYMLINK" == "t" ]; then
            echo "The "
        else
            echo "The file or folder "
        fi
        echo ""
        echo "    S_FP_ORIG==$S_FP_ORIG "
        echo ""
        if [ "$SB_IS_SYMLINK" == "t" ]; then
            echo "is a broken symlink. It is expected to be a folder that "
        else
            echo "does not exist. It is expected to be a folder that "
        fi
        echo "contains the script that prints this error message."
        echo "Aborting script."
        echo "GUID=='db131e5c-e013-4c52-a1ba-f1f0b03088e7'"
        echo ""
        exit 1 # exit with an error
    fi
    #------------------------
    if [ ! -d "$S_FP_ORIG" ]; then
        echo "The "
        echo ""
        echo "    S_FP_ORIG==$S_FP_ORIG "
        echo ""
        echo "is not a folder. It is expected to be a folder that "
        echo "contains the script that prints this error message."
        echo "Aborting script."
        echo "GUID=='6b5ab342-853d-4738-84ba-f1f0b03088e7'"
        echo ""
        exit 1 # exit with an error
    fi
} # func_mmmv_exc_verify_S_FP_ORIG_t1

#--------------------------------------------------------------------------

func_mmmv_exc_exit_with_an_error_t1(){
    local S_GUID_CANDIDATE="$1" # first function argument
    func_mmmv_exc_verify_S_FP_ORIG_t1
    #--------
    echo ""
    echo "The code of this script is flawed."
    echo "Aborting script."
    if [ "$S_GUID_CANDIDATE" != "" ]; then 
        echo "GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
    fi
    echo "GUID=='623b7b1d-b827-4847-93aa-f1f0b03088e7'"
    echo ""
    cd "$S_FP_ORIG"
    exit 1 # exit with an error
} # func_mmmv_exc_exit_with_an_error_t1

#--------------------------------------------------------------------------

func_mmmv_exit_if_not_on_path_t2() { # S_COMMAND_NAME
    local S_COMMAND_NAME="$1"
    #--------
    local S_LOCAL_VARIABLE="`which $S_COMMAND_NAME 2>/dev/null`"
    if [ "$S_LOCAL_VARIABLE" == "" ]; then
        echo ""
        echo "Command \"$S_COMMAND_NAME\" could not be found from the PATH. "
        echo "The execution of this Bash script is aborted."
        echo "GUID=='9a73ba54-faf1-440e-b1aa-f1f0b03088e7'"
        echo ""
        cd "$S_FP_ORIG"
        exit 1;
    fi
} # func_mmmv_exit_if_not_on_path_t2

func_mmmv_exit_if_not_on_path_t2 "cat"
func_mmmv_exit_if_not_on_path_t2 "grep"

#--------------------------------------------------------------------------

func_mmmv_assert_error_code_zero_t1(){
    local S_ERR_CODE="$1" # the "$?"
    local S_GUID_CANDIDATE="$2"
    #------------------------------
    if [ "$S_GUID_CANDIDATE" == "" ]; then
        echo ""
        echo "The Bash code that calls this function is flawed."
        echo ""
        echo "    S_GUID_CANDIDATE==\"\""
        echo ""
        echo "but it is expected to be a GUID."
        echo "Aborting script."
        echo "GUID=='19b5f35e-9f14-4208-84aa-f1f0b03088e7'"
        echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        echo ""
        #--------
        cd "$S_FP_ORIG"
        exit 1
    fi
    #------------------------------
    # If the "$?" were evaluated in this function, 
    # then it would be "0" even, if it is
    # something else at the calling code.
    if [ "$S_ERR_CODE" != "0" ];then
        echo ""
        echo "Something went wrong. Error code: $S_ERR_CODE"
        echo "Aborting script."
        echo "GUID=='58834924-8d90-40d8-92aa-f1f0b03088e7'"
        echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        echo ""
        #--------
        cd "$S_FP_ORIG"
        exit 1
    fi
    #------------------------------
    func_mmmv_wait_and_sync_t1
} # func_mmmv_assert_error_code_zero_t1

#--------------------------------------------------------------------------

# It differs form the 
# func_mmmv_assert_error_code_zero_t1 
# by the fact that it does not include the 
#
#     cd "$S_FP_ORIG"
#
func_mmmv_assert_error_code_zero_t2(){
    local S_ERR_CODE="$1" # the "$?"
    local S_GUID_CANDIDATE="$2"
    #------------------------------
    if [ "$S_GUID_CANDIDATE" == "" ]; then
        echo ""
        echo "The Bash code that calls this function is flawed."
        echo ""
        echo "    S_GUID_CANDIDATE==\"\""
        echo ""
        echo "but it is expected to be a GUID."
        echo "Aborting script."
        echo "GUID=='bfb9432c-e72a-46f3-83aa-f1f0b03088e7'"
        echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        echo ""
        #--------
        exit 1
    fi
    #------------------------------
    # If the "$?" were evaluated in this function, then it would be "0"
    # even, if it is something else at the calling code.
    if [ "$S_ERR_CODE" != "0" ];then
        echo ""
        echo "Something went wrong. Error code: $S_ERR_CODE"
        echo "Aborting script."
        echo "GUID=='42f88956-29fd-48ff-b2aa-f1f0b03088e7'"
        echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        echo ""
        #--------
        exit 1
    fi
    #------------------------------
} # func_mmmv_assert_error_code_zero_t2

#--------------------------------------------------------------------------

func_mmmv_assert_file_exists_t1() {  # S_FP, S_GUID
    local S_FP="$1"
    local S_GUID="$2"
    #------------------------------
    if [ "$S_GUID" == "" ]; then
        echo ""
        echo "The code that calls this function is flawed."
        echo "This function requires 2 parameters: S_FP, S_GUID"
        echo "GUID=='5862dc85-c310-4f0a-81aa-f1f0b03088e7'"
        echo ""
        #--------
        cd "$S_FP_ORIG"
        exit 1 # exiting with an error
    fi
    #------------------------------
    if [ ! -e "$S_FP" ]; then
        if [ -h "$S_FP" ]; then
            echo ""
            echo "The path "
            echo ""
            echo "    $S_FP "
            echo ""
            echo "points to a broken symlink, but a file or "
            echo "a symlinkt to a file is expected."
            echo "GUID==\"$S_GUID\""
            echo "GUID=='4fc34b9d-bdbf-43c1-91aa-f1f0b03088e7'"
            echo ""
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        else
            echo ""
            echo "The file "
            echo ""
            echo "    $S_FP "
            echo ""
            echo "does not exist."
            echo "GUID==\"$S_GUID\""
            echo "GUID=='90329324-5a47-4dbf-b3aa-f1f0b03088e7'"
            echo ""
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        fi
    else
        if [ -d "$S_FP" ]; then
            echo ""
            if [ -h "$S_FP" ]; then
                echo "The symlink to the folder "
            else
                echo "The folder "
            fi
            echo ""
            echo "    $S_FP "
            echo ""
            echo "exists, but a file or a symlink to a file is expected."
            echo "GUID==\"$S_GUID\""
            echo "GUID=='23bd4937-3e93-4549-93aa-f1f0b03088e7'"
            echo ""
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        fi
    fi
} # func_mmmv_assert_file_exists_t1

#--------------------------------------------------------------------------

func_mmmv_assert_folder_exists_t1() {
    local S_FP="$1"
    local S_GUID_CANDIDATE="$2"
    local SB_OPTIONAL_BAN_SYMLINKS="$3" # domain: {"t", "f", ""} default: "f"
                                        # is the last formal parameter in
                                        # stead of the S_GUID_CANDIDATE,
                                        # because that way this function
                                        # is backwards compatible with
                                        # an earlier version of this function.
    #------------------------------
    local SB_LACK_OF_PARAMETERS="f"
    if [ "$S_FP" == "" ]; then
        SB_LACK_OF_PARAMETERS="t"
    fi
    if [ "$S_GUID_CANDIDATE" == "" ]; then
        SB_LACK_OF_PARAMETERS="t"
    fi
    if [ "$SB_LACK_OF_PARAMETERS" == "t" ]; then
        echo ""
        echo "The code that calls this function is flawed. This"
        echo "function requires 2 parameters, which are S_FP,"
        echo "S_GUID_CANDIDATE, and it has an optional 3. parameter,"
        echo "which is SB_OPTIONAL_BAN_SYMLINKS."
        if [ "$S_GUID_CANDIDATE" != "" ]; then
            echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        fi
        echo "GUID=='30c2f039-d2b8-40e3-95aa-f1f0b03088e7'"
        echo ""
        #--------
        cd "$S_FP_ORIG"
        exit 1 # exiting with an error
    else
        if [ "$SB_LACK_OF_PARAMETERS" != "f" ]; then
            echo "This code is flawed."
            echo "GUID=='21f10bd1-88d3-4853-86aa-f1f0b03088e7'"
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        fi
    fi
    #------------------------------
    if [ "$SB_OPTIONAL_BAN_SYMLINKS" == "" ]; then
        # The default value of the 
        SB_OPTIONAL_BAN_SYMLINKS="f"
        # must be backwards compatible with the version of this function,
        # where symlinks to folders were treated as actual folders.
    else
        if [ "$SB_OPTIONAL_BAN_SYMLINKS" != "t" ]; then
            if [ "$SB_OPTIONAL_BAN_SYMLINKS" != "f" ]; then
                echo ""
                echo "The "
                echo ""
                echo "    SB_OPTIONAL_BAN_SYMLINKS==\"$SB_OPTIONAL_BAN_SYMLINKS\""
                echo ""
                echo "but the valid values for the SB_OPTIONAL_BAN_SYMLINKS"
                echo "are: \"t\", \"f\", \"\"."
                echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
                echo "GUID=='782bee2a-5088-4b88-a29a-f1f0b03088e7'"
                echo ""
                #--------
                cd "$S_FP_ORIG"
                exit 1 # exiting with an error
            fi
        fi
    fi
    #------------------------------
    if [ ! -e "$S_FP" ]; then
        if [ -h "$S_FP" ]; then
            echo ""
            echo "The path "
            echo ""
            echo "    $S_FP "
            echo ""
            echo "points to a broken symlink, but "
            if [ "$SB_OPTIONAL_BAN_SYMLINKS" == "t" ]; then
                echo "a folder is expected."
            else
                echo "a folder or a symlink to a folder is expected."
            fi
            echo "S_GUID_CANDIDATE==\"$S_GUID_CANDIDATE\""
            echo "GUID=='4e1fd332-e0a0-48e2-b19a-f1f0b03088e7'"
            echo ""
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        else
            echo ""
            if [ "$SB_OPTIONAL_BAN_SYMLINKS" == "t" ]; then
                echo "The folder "
            else
                echo "The folder or a symlink to a folder "
            fi
            echo ""
            echo "    $S_FP "
            echo ""
            echo "does not exist."
            echo "S_GUID_CANDIDATE==\"$S_GUID_CANDIDATE\""
            echo "GUID=='f841d910-66b6-4748-819a-f1f0b03088e7'"
            echo ""
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        fi
    else
        if [ ! -d "$S_FP" ]; then
            echo ""
            if [ -h "$S_FP" ]; then
                echo "The symlink to an existing file "
            else
                echo "The file "
            fi
            echo ""
            echo "    $S_FP "
            echo ""
            printf "exists, but "
            if [ "$SB_OPTIONAL_BAN_SYMLINKS" == "t" ]; then
                echo "a folder is expected."
            else
                echo "a folder or a symlink to a folder is expected."
            fi
            echo "S_GUID_CANDIDATE==\"$S_GUID_CANDIDATE\""
            echo "GUID=='ae426ee7-5172-464f-859a-f1f0b03088e7'"
            echo ""
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        else
            if [ "$SB_OPTIONAL_BAN_SYMLINKS" == "t" ]; then
                if [ -h "$S_FP" ]; then 
                    echo ""
                    echo "The "
                    echo ""
                    echo "    $S_FP"
                    echo ""
                    echo "is a symlink to a folder, but a folder is expected."
                    echo "S_GUID_CANDIDATE==\"$S_GUID_CANDIDATE\""
                    echo "GUID=='e8d0b82a-ccc0-4a03-839a-f1f0b03088e7'"
                    echo ""
                    #--------
                    cd "$S_FP_ORIG"
                    exit 1 # exiting with an error
                fi
            fi
        fi
    fi
} # func_mmmv_assert_folder_exists_t1

#--------------------------------------------------------------------------

func_angervaks_optionally_update_GUIDs_in_bashrc(){
    #--------
    if [ "$SB_RUBY_EXISTS_ON_PATH" != "t" ]; then # includes the value of ""
        SB_RUBY_EXISTS_ON_PATH="f" # global variable
        if [ "`which ruby 2> /dev/null`" != "" ]; then
            # The Ruby version might be wrong, but at least 
            # something called "ruby" is on PATH.
            SB_RUBY_EXISTS_ON_PATH="t" 
        fi
    fi
    #--------
    if [ "$SB_RUBY_EXISTS_ON_PATH" == "t" ]; then
        func_mmmv_wait_and_sync_t1 # just in case, just for reliability
        S_FP_UPGUID_BASH="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/lib/mmmv_devel_tools/2015_01_22_mmmv_devel_tools_without_JumpGUID_and_IDE_integration_v_02_with_UpGUID_bugfix/src/mmmv_devel_tools/GUID_trace/src/UpGUID/src/upguid"
        func_mmmv_assert_file_exists_t1 "$S_FP_UPGUID_BASH" \
            "9348573e-afb4-47e9-83ba-f1f0b03088e7"
        $S_FP_UPGUID_BASH -f $S_FP_BASHRC
        func_mmmv_assert_error_code_zero_t1 "$?" \
            "5199574b-77ce-4a0d-b4ba-f1f0b03088e7"
        chmod 0700 "$S_FP_BASHRC" 
        func_mmmv_wait_and_sync_t1
    fi
    #--------
} # func_angervaks_optionally_update_GUIDs_in_bashrc

#--------------------------------------------------------------------------
S_FP_BASHRC="$HOME/.bashrc"

func_angervaks_grep_for_inclusion_line_t1() {
    #--------
    if [ ! -e "$S_FP_BASHRC" ]; then
        if [ -h "$S_FP_BASHRC" ]; then
            echo ""
            echo "The "
            echo ""
            echo "    $S_FP_BASHRC"
            echo ""
            echo "is a broken symlink. Aborting script."
            echo "GUID=='bebbb93b-16b6-4d6d-929a-f1f0b03088e7'"
            echo ""
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        else
            # Create an empty text file.
            echo "#!/usr/bin/env bash" >> "$S_FP_BASHRC" # The ">>" is used in stead of the ">" for safety.
            func_mmmv_assert_error_code_zero_t1 "$?" \
                "37990195-1a58-4539-a5ba-f1f0b03088e7"
            func_mmmv_wait_and_sync_t1
            echo "#===========================================================================" >> "$S_FP_BASHRC"
            func_mmmv_assert_error_code_zero_t1 "$?" \
                "6bc44b20-9211-4298-93aa-f1f0b03088e7"
            func_mmmv_wait_and_sync_t1
        fi
    else
        # To make sure that it is not a folder or a symlink to a folder.
        func_mmmv_assert_file_exists_t1 "$S_FP_BASHRC" \
            "6b0b8545-db11-4f90-81aa-f1f0b03088e7"
    fi
    #--------
    S_TMP_0="`grep -E \"source[ ]+\\\"$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/common_bashrc/common_bashrc_main.bash\\\"\" ~/.bashrc `"
    if [ "$S_TMP_0" == "" ]; then
        S_TMP_0="`grep -E \"MMMV_FP_COMMON_BASHRC[=]\\\"$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/common_bashrc/common_bashrc_main.bash\\\"\" ~/.bashrc `"
    fi
    if [ "$S_TMP_0" == "" ]; then
        S_TMP_0="`grep -i -E \"[#][-]+mmmv[-]+machine[-]+instance[-]+specific[-]+section[-]+start[-]+\" ~/.bashrc `"
    fi
} # func_angervaks_grep_for_inclusion_line_t1

#--------------------------------------------------------------------------
# Usually the
#export MMMV_USERSPACE_DISTRO_T1_HOME="/home/mmmv/mmmv_userspace_distro_t1"
# would do, but there are use cases, where user "mmmv" is not used and 
# for that reason the value for the MMMV_USERSPACE_DISTRO_T1_HOME is derived.
#--------------------
# To avoid assigning a wrong value to the MMMV_USERSPACE_DISTRO_T1_HOME,
# there is a slight check that this script resides at a right path in
# relation to the correct value of the MMMV_USERSPACE_DISTRO_T1_HOME.
S_TMP_0="`cd $S_FP_DIR/../../ ; pwd`"
func_mmmv_assert_folder_exists_t1 \
    "$S_TMP_0/mmmv/bin" "2d68d715-8b3c-4ca8-81aa-f1f0b03088e7"
#--------------------
func_mmmv_assert_folder_exists_t1 \
    "$S_TMP_0" "5c842585-e95a-47bf-b3aa-f1f0b03088e7"
export MMMV_USERSPACE_DISTRO_T1_HOME="$S_TMP_0"
#--------------------------------------------------------------------------
S_FP_TEMPLATE="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/lib/templates/_bashrc_suffix_template_t1.bash"
# The 
func_mmmv_assert_file_exists_t1 "$S_FP_TEMPLATE" \
    "485c4af6-b2b2-4d28-a6aa-f1f0b03088e7"
# is meant to give a warning also when the template is not needed.

#--------------------------------------------------------------------------
S_TMP_0=""
SB_MODIFY_THE_BASHRC="t"
func_angervaks_grep_for_inclusion_line_t1
if [ "$S_TMP_0" != "" ]; then
    SB_MODIFY_THE_BASHRC="f"
fi
#--------------------
if [ "$SB_MODIFY_THE_BASHRC" == "t" ]; then
    #--------
    S_TMP_0="/tmp"
    if [ -e "$HOME/tmp" ]; then
        S_TMP_0="$HOME/tmp"
    fi
    if [ -e "$HOME/tmp_" ]; then
        S_TMP_0="$HOME/tmp_"
    fi
    S_TMP_1="$S_TMP_0/_bashrc_old_$S_TIMESTAMP"
    if [ -e $S_TMP_1 ]; then
        echo ""
        echo "This script is probably flawed."
        echo "A file or a folder with the path of "
        echo ""
        echo "    $S_TMP_1"
        echo ""
        echo "already exists. Aborting script."
        echo "GUID=='2d069819-545b-4977-949a-f1f0b03088e7'"
        echo ""
        #----
        cd "$S_FP_ORIG"
        exit 1 # exit with error
    fi
    func_mmmv_assert_file_exists_t1 "$S_FP_BASHRC" \
        "3a9fa7f2-0820-4430-93aa-f1f0b03088e7"
    #--------
    cp ~/.bashrc $S_TMP_1
    func_mmmv_assert_error_code_zero_t1 "$?" \
        "ee987915-106c-4829-95aa-f1f0b03088e7"
    func_mmmv_wait_and_sync_t1
    func_mmmv_assert_file_exists_t1 "$S_TMP_1" \
        "db6d633f-d936-492b-92aa-f1f0b03088e7"
    #--------
    cat $S_FP_TEMPLATE >> $S_FP_BASHRC
    func_mmmv_assert_error_code_zero_t1 "$?" \
        "4a22c52f-9f10-4f3e-a1aa-f1f0b03088e7"
    func_mmmv_wait_and_sync_t1
    func_angervaks_grep_for_inclusion_line_t1
    if [ "$S_TMP_0" == "" ]; then
        echo ""
        echo "The adding of the mmmv inclusion line "
        echo "to the ~/.bashrc failed. Aborting script."
        echo "GUID=='cab89135-94d6-4a6a-b59a-f1f0b03088e7'"
        echo ""
        #----
        cd "$S_FP_ORIG"
        exit 1 # exit with error
    fi
    #--------
    func_angervaks_optionally_update_GUIDs_in_bashrc
    if [ "`whoami`" == "mmmv" ]; then
        chmod 0755 "$S_FP_BASHRC" # mmmv_userspace_distro_t1 specific requirement
                                  # is that all users can read the /home/mmmv content.
    else
        chmod 0700 "$S_FP_BASHRC" 
    fi
    func_mmmv_wait_and_sync_t1
    #--------
    echo ""
    echo -e "Added Bash code to the suffix of the\e[32m $S_FP_BASHRC \e[39m."
    echo ""
    #--------
else
    if [ "$SB_MODIFY_THE_BASHRC" != "f" ]; then
        func_mmmv_exc_exit_with_an_error_t1 \
            "39436a92-4057-48ab-83aa-f1f0b03088e7"
    fi
    echo ""
    echo "The "
    echo ""
    echo -e "\e[33m    $S_FP_BASHRC \e[39m"
    echo ""
    echo -e "seems to have been \e[33malready initialized\e[39m by the current"
    echo -e "script. Not adding anything to the\e[33m $S_FP_BASHRC \e[39m."
    echo "GUID=='35757b55-9bfb-4d03-949a-f1f0b03088e7'"
    echo ""
fi

#--------------------------------------------------------------------------

func_mmmv_cd_S_FP_ORIG_and_exit_t1(){
    func_mmmv_exc_verify_S_FP_ORIG_t1
    cd "$S_FP_ORIG"
    func_mmmv_assert_error_code_zero_t2 "$?" \
        "07549827-58d8-43f6-a4aa-f1f0b03088e7"
    exit 0
} # func_mmmv_cd_S_FP_ORIG_and_exit_t1

func_mmmv_cd_S_FP_ORIG_and_exit_t1
#==========================================================================
# S_VERSION_OF_THIS_FILE="3eff933b-10ee-4733-929a-f1f0b03088e7"
#==========================================================================
