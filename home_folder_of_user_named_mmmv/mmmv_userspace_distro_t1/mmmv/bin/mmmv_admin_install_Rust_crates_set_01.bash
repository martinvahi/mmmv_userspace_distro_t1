#!/usr/bin/env bash
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#
# This script consists of 3 parts, which can be 
# navigated by searching for the following strings:
#
#     script_boilerplate_section
#     script_core
#     script_data_section
#
# The boilerplate might be seen as the library of Bash functions that
# the rest of this script depends on.
#
#--------------------------------------------------------------------------
#::::::::::::::::::::::script_boilerplate_section:::start::::::::::::::::::
#--------------------------------------------------------------------------
#S_FP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
S_FP_ORIG="`pwd`"
#S_TIMESTAMP="`date +%Y`_`date +%m`_`date +%d`_T_`date +%H`h_`date +%M`min_`date +%S`s"
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
        echo "GUID=='315c8f04-1229-4ddb-a721-d2a15061b8e7'"
        echo ""
        exit 1 # exit with an error
    fi
    #------------------------
    local SB_IS_SYMLINK="f"     # possible values: "t", "f"
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
        echo "GUID=='2e932531-de60-41a7-9210-d2a15061b8e7'"
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
        echo "GUID=='4278af7a-9d47-488a-b050-d2a15061b8e7'"
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
    echo "GUID=='55823c84-3615-4f17-9e20-d2a15061b8e7'"
    echo ""
    cd "$S_FP_ORIG"
    exit 1 # exit with an error
} # func_mmmv_exc_exit_with_an_error_t1

#--------------------------------------------------------------------------

func_mmmv_exc_exit_with_an_error_t2(){
    local S_GUID_CANDIDATE="$1"   # first function argument
    local S_OPTIONAL_ERR_MSG="$2" # second function argument
    func_mmmv_exc_verify_S_FP_ORIG_t1
    #--------
    if [ "$S_GUID_CANDIDATE" == "" ]; then 
        echo ""
        echo "The code of this script is flawed. "
        if [ "$S_OPTIONAL_ERR_MSG" != "" ]; then 
            echo "$S_OPTIONAL_ERR_MSG"
        fi
        echo "Aborting script."
        echo "GUID=='522c8681-1070-44f3-8920-d2a15061b8e7'"
        echo ""
        cd "$S_FP_ORIG"
        exit 1 # exit with an error
    else
        echo ""
        echo "Something went wrong."
        if [ "$S_OPTIONAL_ERR_MSG" != "" ]; then 
            echo "$S_OPTIONAL_ERR_MSG"
        fi
        echo "Aborting script."
        echo "GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        echo "GUID=='9254854b-7869-4344-9110-d2a15061b8e7'"
        echo ""
        cd "$S_FP_ORIG"
        exit 1 # exit with an error
    fi
} # func_mmmv_exc_exit_with_an_error_t2

#--------------------------------------------------------------------------

func_mmmv_exit_if_not_on_path_t2() { # S_COMMAND_NAME
    local S_COMMAND_NAME="$1"
    #--------
    local S_LOCAL_VARIABLE="`which $S_COMMAND_NAME 2>/dev/null`"
    if [ "$S_LOCAL_VARIABLE" == "" ]; then
        echo ""
        echo "Command \"$S_COMMAND_NAME\" could not be found from the PATH. "
        echo "The execution of this Bash script is aborted."
        echo "GUID=='44946ad4-3e4c-461d-b920-d2a15061b8e7'"
        echo ""
        cd "$S_FP_ORIG"
        exit 1;
    fi
} # func_mmmv_exit_if_not_on_path_t2

#--------------------------------------------------------------------------

func_mmmv_assert_error_code_zero_t1(){
    local S_ERR_CODE="$1" # the "$?"
    local S_GUID_CANDIDATE="$2"
    #--------
    # If the "$?" were evaluated in this function,
    # then it would be "0" even, if it is something
    # else at the calling code.
    if [ "$S_ERR_CODE" != "0" ];then
        echo ""
        echo "Something went wrong. Error code: $S_ERR_CODE"
        echo "Aborting script."
        echo "GUID=='123420d4-83f9-484b-a550-d2a15061b8e7'"
        echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        echo ""
        cd "$S_FP_ORIG"
        exit 1
    fi
} # func_mmmv_assert_error_code_zero_t1

#--------------------------------------------------------------------------

func_mmmv_assert_file_exists_t1() {  # S_FP, S_GUID
    local S_FP="$1"
    local S_GUID="$2"
    #------------------------------
    if [ "$S_GUID" == "" ]; then
        echo ""
        echo "The code that calls this function is flawed."
        echo "This function requires 2 parameters: S_FP, S_GUID"
        echo "GUID=='3a156e03-1611-4e09-ab10-d2a15061b8e7'"
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
            echo "a symlink to a file is expected."
            echo "GUID==\"$S_GUID\""
            echo "GUID=='a594f5ce-abc2-4f05-a930-d2a15061b8e7'"
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
            echo "GUID=='f26cb334-f172-4ca2-8f20-d2a15061b8e7'"
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
            echo "GUID=='b29893c5-c9ca-40fd-a820-d2a15061b8e7'"
            echo ""
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        fi
    fi
} # func_mmmv_assert_file_exists_t1

#--------------------------------------------------------------------------

func_mmmv_assert_folder_exists_t1() {  # S_FP, S_GUID
    local S_FP="$1"
    local S_GUID="$2"
    #------------------------------
    if [ "$S_GUID" == "" ]; then
        echo ""
        echo "The code that calls this function is flawed."
        echo "This function requires 2 parameters: S_FP, S_GUID"
        echo "GUID=='3ce81f75-4134-4283-bd50-d2a15061b8e7'"
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
            echo "points to a broken symlink, but a folder "
            echo "or a symlink to a folder is expected."
            echo "GUID==\"$S_GUID\""
            echo "GUID=='b40b0b41-c505-4cc4-a650-d2a15061b8e7'"
            echo ""
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        else
            echo ""
            echo "The folder "
            echo ""
            echo "    $S_FP "
            echo ""
            echo "does not exist."
            echo "GUID==\"$S_GUID\""
            echo "GUID=='119a4740-c895-4388-9d4f-d2a15061b8e7'"
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
            echo "exists, but a folder is expected."
            echo "GUID==\"$S_GUID\""
            echo "GUID=='1fe38394-e936-4d3c-964f-d2a15061b8e7'"
            echo ""
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        fi
    fi
} # func_mmmv_assert_folder_exists_t1

#--------------------------------------------------------------------------
#:::::::::::::::::::::script_boilerplate_section:::end:::::::::::::::::::::
#::::::::::::::::::::::::::script_core:::start:::::::::::::::::::::::::::::
#--------------------------------------------------------------------------

# Downloads the source of a crate named S_CRATE_NAME and compiles it, 
# including all of the missing crates that the S_CRATE_NAME depends on. 
func_install_Rust_crate(){
    local S_CRATE_NAME="$1" # the part after the "gem install "
    local S_GUID_CANDIDATE="$2"
    #--------
    local S_CARGO_PARAMS=" "
    if [ "$MMMV_USERSPACE_DISTRO_T1_SI_N_OF_COMPILATION_THREADS_T1" != "" ]; then
        S_CARGO_PARAMS=" -j $MMMV_USERSPACE_DISTRO_T1_SI_N_OF_COMPILATION_THREADS_T1 "
    fi
    #--------
    nice -n 15 cargo install $S_CARGO_PARAMS $S_CRATE_NAME
    func_mmmv_assert_error_code_zero_t1 "$?" "$S_GUID_CANDIDATE"
    func_mmmv_wait_and_sync_t1
    #--------
} # func_install_Rust_crate

#--------------------------------------------------------------------------

# It's a small speed-hack for computers that have more than 2 hardware
# threads. It also tries to take advantage of mmmv_userspace_distro_t1
# specific environment variables, if they are available.
func_initialise_if_needed_and_possible_MMMV_USERSPACE_DISTRO_T1_SI_N_OF_COMPILATION_THREADS_T1(){
    if [ "$MMMV_USERSPACE_DISTRO_T1_SI_N_OF_COMPILATION_THREADS_T1" == "" ]; then
        if [ "$SB_BC_EXISTS_ON_PATH" == "" ]; then
            SB_BC_EXISTS_ON_PATH="f"
            if [ "`which bc 2> /dev/null`" != "" ]; then
                SB_BC_EXISTS_ON_PATH="t"
            fi
        fi
        if [ "$SB_TR_EXISTS_ON_PATH" == "" ]; then
            SB_TR_EXISTS_ON_PATH="f"
            if [ "`which tr 2> /dev/null`" != "" ]; then
                SB_TR_EXISTS_ON_PATH="t"
            fi
        fi
        if [ "$SB_BC_EXISTS_ON_PATH" == "t" ]; then
            if [ "$SB_TR_EXISTS_ON_PATH" == "t" ]; then
                if [ "`which mmmv_hardwarethreadcount_t1 2> /dev/null`" != "" ]; then
                    S_TMP_0="`mmmv_hardwarethreadcount_t1 `"
                    #------------------------------------------------------
                    # The line:
                    #     echo " 4-1 " | bc | tr -d '\n'
                    # works on both, FreeBSD and Linux.
                    #------------------------------------------------------
                    S_TMP_1="`echo \" $S_TMP_0-1 \" | bc | tr -d '\\n' `"
                    MMMV_USERSPACE_DISTRO_T1_SI_N_OF_COMPILATION_THREADS_T1="$S_TMP_1"
                fi
                #----------------------------------------------------------
            fi
        fi
    fi
} # func_initialise_if_needed_and_possible_MMMV_USERSPACE_DISTRO_T1_SI_N_OF_COMPILATION_THREADS_T1

#--------------------------------------------------------------------------

# Some basic checks:
func_mmmv_exit_if_not_on_path_t2 "cargo"
func_mmmv_exit_if_not_on_path_t2 "rustc"

func_initialise_if_needed_and_possible_MMMV_USERSPACE_DISTRO_T1_SI_N_OF_COMPILATION_THREADS_T1

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#:::::::::::::::::::::::::::script_core:::end::::::::::::::::::::::::::::::
#::::::::::::::::::::::script_data_section:::start:::::::::::::::::::::::::
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::



#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#::::::::::::::::::::::::::::build::tools::::::::::::::::::::::::::::::::::
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Used in projects like 
#
#     https://github.com/tinysearch/tinysearch
#
func_install_Rust_crate "wasm-pack" \
    "2bbf4405-8659-4dfc-be30-d2a15061b8e7"
# but for some reason as of 2024_08_26 the documentation of the 
func_install_Rust_crate "tinysearch" \
    "0a705c22-1b49-4ef5-9910-d2a15061b8e7"
# says that those 2 should be installed separately.
# Unfortunately the generated JavaScript based search engine
# for a static site does not work with all web browsers that
# run JavaScript.

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#::::::::::::::::::::::::filesystem::utilities:::::::::::::::::::::::::::::
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

func_install_Rust_crate "exa" \
    "10159e32-98df-467a-8a10-d2a15061b8e7"

func_install_Rust_crate "mcfly" \
    "63d154f4-55da-4f42-8950-d2a15061b8e7"
    # The 
    #     https://github.com/cantino/mcfly
    # is a neural network based Bash history 
    # search engine. If the ~/.bashrc includes
    #
    #     eval "$(mcfly init bash)"
    # 
    # then the mcfly will be used for the
    # Bash history retrieval command "Ctrl-r"
    #
    
func_install_Rust_crate "fd-find" \
    "33ade554-0cc6-46b8-8810-d2a15061b8e7"
    # installs command "fd", which is a "find" analogue.
    # https://github.com/sharkdp/fd

func_install_Rust_crate "zoxide" \
    "55481212-8dc0-4879-9350-d2a15061b8e7"
    # is an experimental "cd" analogue.

func_install_Rust_crate "broot" \
    "31192095-3ede-4b01-9420-d2a15061b8e7"
    # is a TUI file manager.
    # https://dystroy.org/broot/install/
    # https://github.com/Canop/broot
    #
    # Installation of its dependencies on a Debian Linux distribution:
    #     apt install build-essential libxcb1-dev libxcb-render0-dev libxcb-shape0-dev libxcb-xfixes0-dev 
    #

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#::::::::::::::::repository::systems::and::related::tools::::::::::::::::::
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# For some reason it does not build any more. Some
# of its dependencies seem to have changed so that
# its code does not comply with the interface of the dependency.
# func_install_Rust_crate "gitui" \
#     "1a7f9fd1-d501-4ce1-8d30-d2a15061b8e7"

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#:::::::::::::::::::::text::search::and::processing::::::::::::::::::::::::
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

func_install_Rust_crate "ripgrep" \
    "95683110-572e-4e16-8820-d2a15061b8e7"
    # installs the command line utility "rg".

func_install_Rust_crate "hgrep" \
    "32bdd3cb-9bcb-471c-8140-d2a15061b8e7"
    # installs a fancy grep alternative.

func_install_Rust_crate "huniq" \
    "12a84986-89c7-40e1-ad50-d2a15061b8e7"
    # installs a Rust based replacement for a 
    # Bash command snippet " sort | uniq ", 
    # which removes duplicate text lines.
    # As of 2024_01: https://github.com/koraa/huniq

func_install_Rust_crate "bat" \
    "51610fc4-41f3-4af4-8950-d2a15061b8e7"
    # allows to view Markdown files by executing:
    #
    #     bat Foo.md
    #

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#:::::::::::::::::technical::documentation::geneneration:::::::::::::::::::
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# TODO: list crates here

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#:::::::::::::::::::::::::::data::conversion:::::::::::::::::::::::::::::::
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# https://pngquant.org
# https://github.com/kornelski/pngquant
func_install_Rust_crate "pngquant" \
    "265659a5-b346-415b-9730-d2a15061b8e7"

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#::::::::::::::::::::::database::engine::interfaces::::::::::::::::::::::::
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# TODO: list crates here

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#:::::::::::::::::online::service::specific::applications::::::::::::::::::
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Wikipedia surfing tui-application.
# func_install_Rust_crate "wiki-tui" \
#     "3239eca8-fc01-4ee4-be4f-d2a15061b8e7"

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#::::::::::::::::::::::script_data_section:::end:::::::::::::::::::::::::::
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
cd "$S_FP_ORIG"
exit 0 # no errors occurred
#==========================================================================
# S_VERSION_OF_THIS_FILE="d55b64c8-49bb-4264-a2ef-d2a15061b8e7"
#==========================================================================
