#!/usr/bin/env bash
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
#
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#==========================================================================
S_FP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
S_FP_ORIG="`pwd`"
#--------------------------------------------------------------------------

func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1() {  # S_FP, S_GUID_CANDIDATE
    local S_FP="$1"
    local S_GUID_CANDIDATE="$2"
    local SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="$3" # domain: {"t","f",""}
                                                       # ""==="t", default "t"
    #----------------------------------------------------------------------
    # A global variable for storing function output.
    SB_VERIFICATION_FAILED="f" # domain: "t", "f" .
    #------------------------------
    if [ "$S_GUID_CANDIDATE" == "" ]; then
        echo ""
        echo -e "\e[31mThe code that calls this function is flawed.\e[39m"
        echo "This function requires 2 parameters: S_FP, S_GUID_CANDIDATE"
        echo "and has an optional 3. parameter: SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
        echo "GUID=='6552d2e9-dd46-4819-8031-13a0b03119e7'"
        echo ""
        #--------
        SB_VERIFICATION_FAILED="t"
    fi
    #------------------------------
    local SB_DISPLAY_VERIF_FAILURE_MSG="t" # the default
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE" != "" ]; then
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE" == "f" ]; then
                SB_DISPLAY_VERIF_FAILURE_MSG="f"
            else
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE" != "t" ]; then
                    echo ""
                    echo -e "\e[31mThe code that calls this function is flawed.\e[39m"
                    echo ""
                    echo "  SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE==\"$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE\""
                    echo ""
                    echo "Valid values are: \"t\", \"f\", \"\" ."
                    echo "\"\" defaults to \"t\"."
                    echo "GUID=='d34243ef-f4eb-4c20-8b51-13a0b03119e7'"
                    echo ""
                    #--------
                    SB_VERIFICATION_FAILED="t"
                fi
            fi
        fi
    fi
    #------------------------------
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        if [ ! -e "$S_FP" ]; then
            if [ -h "$S_FP" ]; then
                if [ "$SB_DISPLAY_VERIF_FAILURE_MSG" == "t" ]; then
                    echo ""
                    echo "The path "
                    echo ""
                    echo "    $S_FP "
                    echo ""
                    echo -e "points to a\e[31m broken symlink\e[39m, but a file or"
                    echo "a symlink to a file is expected."
                    echo "GUID==\"$S_GUID_CANDIDATE\""
                    echo "GUID=='b23779ac-13b0-43ae-9031-13a0b03119e7'"
                    echo ""
                fi
                #--------
                SB_VERIFICATION_FAILED="t"
            else
                if [ "$SB_DISPLAY_VERIF_FAILURE_MSG" == "t" ]; then
                    echo ""
                    echo "The file "
                    echo ""
                    echo "    $S_FP "
                    echo ""
                    echo -e "\e[31mdoes not exist\e[39m."
                    echo "GUID==\"$S_GUID_CANDIDATE\""
                    echo "GUID=='eb43a0f4-41d0-4488-8d11-13a0b03119e7'"
                    echo ""
                fi
                #--------
                SB_VERIFICATION_FAILED="t"
            fi
        else
            if [ -d "$S_FP" ]; then
                if [ "$SB_DISPLAY_VERIF_FAILURE_MSG" == "t" ]; then
                    echo ""
                    if [ -h "$S_FP" ]; then
                        echo "The symlink to the folder "
                    else
                        echo "The folder "
                    fi
                    echo ""
                    echo "    $S_FP "
                    echo ""
                    echo -e "exists, but a\e[31m file or a symlink to a file is expected\e[39m."
                    echo "GUID==\"$S_GUID_CANDIDATE\""
                    echo "GUID=='5624ba82-afe2-4194-bb41-13a0b03119e7'"
                    echo ""
                fi
                #--------
                SB_VERIFICATION_FAILED="t"
            fi
        fi
    fi #  "$SB_VERIFICATION_FAILED" == "f"
    #------------------------------
    if [ "$SB_VERIFICATION_FAILED" != "t" ]; then
        if [ "$SB_VERIFICATION_FAILED" != "f" ]; then
            echo ""
            echo -e "\e[31mThe code of this Bash function is flawed.\e[39m"
            echo "GUID=='42b628c4-f051-45e0-b331-13a0b03119e7'"
            echo ""
        fi
    fi
    #------------------------------
} # func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1

#--------------------------------------------------------------------------

func_mmmv_assert_error_code_zero_t1(){
    local S_ERR_CODE="$1" # the "$?"
    local S_GUID_CANDIDATE="$2"
    #----------------------------------------------------------------------
    if [ "$S_GUID_CANDIDATE" == "" ]; then
        echo ""
        echo -e "\e[31mThe Bash code that calls this function is flawed. \e[39m"
        echo ""
        echo "    S_GUID_CANDIDATE==\"\""
        echo ""
        echo "but it is expected to be a GUID."
        echo "Aborting script."
        echo "GUID=='4ee2e955-fe70-46c2-9c31-13a0b03119e7'"
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
        echo -e "\e[31mAborting script. \e[39m"
        echo "GUID=='6ac6f075-c404-4dfa-9e21-13a0b03119e7'"
        echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        echo ""
        #--------
        cd "$S_FP_ORIG"
        exit 1
    fi
    #------------------------------
} # func_mmmv_assert_error_code_zero_t1

#--------------------------------------------------------------------------

func_mmmv_exit_if_not_on_path_t2() { # S_COMMAND_NAME
    local S_COMMAND_NAME="$1"
    #--------
    local S_LOCAL_VARIABLE="`which $S_COMMAND_NAME 2>/dev/null`"
    if [ "$S_LOCAL_VARIABLE" == "" ]; then
        echo ""
        echo "Command \"$S_COMMAND_NAME\" could not be found from the PATH. "
        echo "The execution of this Bash script is aborted."
        echo "GUID=='3b9097e2-55f0-4af2-8931-13a0b03119e7'"
        echo ""
        cd "$S_FP_ORIG"
        exit 1;
    fi
} # func_mmmv_exit_if_not_on_path_t2

#func_mmmv_exit_if_not_on_path_t2 "pip3"
func_mmmv_exit_if_not_on_path_t2 "pipx"

#--------------------------------------------------------------------------

func_install(){
    #----------------------------------------------------------------------
    local S_PACKETNAME="$1"
    #----------------------------------------------------------------------
    # local S_FP_PIP3_BASH="$S_FP_DIR/mmmv_pip3_install"
    # func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
    #     "$S_FP_PIP3_BASH" \
    #     "e39d530c-1041-4179-a031-13a0b03119e7"
    #----------------------------------------------------------------------
    local S_CMD_NICE="nice -n 15 "
    $S_CMD_NICE pipx install "$S_PACKETNAME"
    func_mmmv_assert_error_code_zero_t1 "$?" \
        "84fa89bb-58cb-42ae-a4b1-13a0b03119e7"
    #----------------------------------------------------------------------
} # func_install

#--------------------------------------------------------------------------
# The autopep8 
# https://pypi.org/project/autopep8/
# is a Python code formatter that
# formats the code so that it conforms to the 
# Python Style Guide "PEP 8"
# https://peps.python.org/pep-0008/
func_install autopep8 

# The trafilatura 
#     https://github.com/adbar/trafilatura
# is a Python3 program that parses HTML and outputs 
# the analysis/parsing results in some structured text format. 
# For example, JSON. Usage example:
#
#     trafilatura --precision --no-comments --json --URL "https://sogenbits.com"  | \
#         python -m json.tool | jq '.["raw_text"]'
#
# The json.tool at the line above is a Python2 program that
# is used for formatting/pretty-printing JSON. The jq 
#     https://github.com/jqlang/jq
#     https://jqlang.github.io/jq/manual/#Basicfilters
# is a C program that can probably be obtained from
# a standard package collection.
func_install trafilatura

#--------------------------------------------------------------------------
# https://www.antlr.org/
# https://github.com/antlr/
func_install antlr4-tools

#--------------------------------------------------------------------------
# https://www.jefftk.com/icdiff
func_install icdiff

#--------------------------------------------------------------------------
# uv is a Python package manager that is implemented in Rust.
# https://github.com/astral-sh/uv
func_install uv
# The following command may come handy:
#
#     uv self update
#
#==========================================================================
# S_VERSION_OF_THIS_FILE="6f42df9d-e107-4913-9251-13a0b03119e7"
#==========================================================================
