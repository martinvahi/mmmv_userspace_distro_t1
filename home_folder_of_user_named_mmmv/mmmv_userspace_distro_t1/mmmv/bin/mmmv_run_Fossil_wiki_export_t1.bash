#!/usr/bin/env bash
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
#
# This Bash script is a wrapper to the command
#
#     fossil wiki ....
#
# Execution of this script without any command line arguments
# should display usage instructions. Some related links:
#
#     https://fossil-scm.org/home/doc/trunk/www/javascript.md
#     archival copy: https://archive.ph/PleEJ
#
#     https://fossil-scm.org/forum/forumpost/8c22b865e1
#     archival copy: https://archive.ph/uKHHJ
#
#--------------------------------------------------------------------------
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#==========================================================================
S_FP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" # to restore its value
S_FP_ORIG="`pwd`"
# In the case of a particular Bash application the collection of 
# Bash functions in this Bash script will probably contain a considerable
# amount of dead code. The Bash application specific copy of this
# Bash file is expected to be pruned form dead code.
# Example code for the inclusion of this file:
#
#     S_FP_0="$HOME/<path to this script here>"
#     if [ -e "$S_FP_0" ]; then
#         if [ -d "$S_FP_0" ]; then
#             echo ""
#             echo "A folder with the path of "
#             echo ""
#             echo "    S_FP_0==$S_FP_0"
#             echo ""
#             echo "exists, but a file is expected."
#             echo "GUID=='7b2b92bc-aee7-4886-82d6-7032619038e7'"
#             echo ""
#         else
#             source "$S_FP_0"
#         fi
#     else
#         echo ""
#         echo "~/.bashrc sub-part with the path of "
#         echo ""
#         echo "    S_FP_0==$S_FP_0"
#         echo ""
#         echo "could not be found."
#         echo "GUID=='4c997956-be4c-49f2-94d6-7032619038e7'"
#         echo ""
#     fi
#
#==========================================================================
#::the::start::of::2022_02_08_version_of_bashrc_subpart_func_core_t2:::::::
#!/usr/bin/env bash
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
#
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#
# As exiting from the ~/.bashrc exits the Bash session,
# the ~/.bashrc and its subparts must not call "exit".
# This script and all of the functions defined in it are "exit" free.
#==========================================================================
# S_VERSION_OF_THIS_FILE="19e8fa87-41a3-45a6-b5d6-7032619038e7"

func_mmmv_wait_and_sync_t1(){
    wait # for background processes started by this Bash script to exit/finish
    sync # network drives, USB-sticks, etc.
    wait # for sync
} # func_mmmv_wait_and_sync_t1

#--------------------------------------------------------------------------
func_mmmv_init_s_timestamp_if_not_inited_t1(){
    if [ "$S_TIMESTAMP" == "" ]; then
        if [ "`which date 2> /dev/null`" != "" ]; then
            S_TIMESTAMP="`date +%Y`_`date +%m`_`date +%d`_T_`date +%H`h_`date +%M`min_`date +%S`s"
        else
            S_TIMESTAMP="0000_00_00_T_00h_00min_00s"
            echo ""
            echo -e "The console program \"\e[31mdate\e[39m\" is missing from the PATH."
            echo "Using a constant value, "
            echo ""
            echo "    S_TIMESTAMP=\"$S_TIMESTAMP\""
            echo ""
            echo "GUID=='05256122-d663-455a-92c6-7032619038e7'"
            echo ""
        fi
    fi
} # func_mmmv_init_s_timestamp_if_not_inited_t1

#--------------------------------------------------------------------------

func_mmmv_verify_S_FP_ORIG_but_do_not_exit_t1(){
    SB_S_FP_ORIG_VERIFICATION_FAILED="f"
    if [ "$S_FP_ORIG" == "" ]; then 
        SB_S_FP_ORIG_VERIFICATION_FAILED="t"
        echo ""
        echo -e "\e[31mThe code of this script has the flaw\e[39m that"
        echo "the variable S_FP_ORIG has not been set."
        echo "GUID=='f97c1f4b-1a8c-4548-b4c6-7032619038e7'"
        echo ""
    else
        if [ ! -e "$S_FP_ORIG" ]; then 
            SB_S_FP_ORIG_VERIFICATION_FAILED="t"
            echo ""
            echo -e "\e[31mThe code of this script has the flaw\e[39m that "
            echo "the variable S_FP_ORIG has been declared, but "
            echo "its value is some string that is not a file or folder path."
            echo "It is expected to be a folder path."
            echo ""
            echo "    S_FP_ORIG==\"$S_FP_ORIG\""
            echo ""
            echo "GUID=='91331a31-50f4-474b-a4c6-7032619038e7'"
            echo ""
        else
            if [ ! -d "$S_FP_ORIG" ]; then 
                SB_S_FP_ORIG_VERIFICATION_FAILED="t"
                echo ""
                echo -e "\e[31mThe code of this script has the flaw\e[39m that "
                echo "the variable S_FP_ORIG references a file, but "
                echo "it is expected to reference a folder."
                echo ""
                echo "    S_FP_ORIG==$S_FP_ORIG"
                echo ""
                echo "GUID=='9d26f04f-3a3b-49f4-a1c6-7032619038e7'"
                echo ""
            fi
        fi
    fi
    #----------------------------------------------------------------------
    # exit 1 # must NOT be called in ~/.bashrc, because 
             # exiting from the ~/.bashrc exits the session.
    #----------------------------------------------------------------------
    # Usage example:
    #    func_mmmv_verify_S_FP_ORIG_but_do_not_exit_t1
    #    if [ "$SB_S_FP_ORIG_VERIFICATION_FAILED" == "f" ]; then 
    #        cd "$S_FP_ORIG"
    #    else 
    #        echo ""
    #        echo "The code of this script is flawed."
    #        echo "GUID=='1ed3bf21-3c4c-470d-84c6-7032619038e7'"
    #        echo ""
    #    fi
} # func_mmmv_verify_S_FP_ORIG_but_do_not_exit_t1

#--------------------------------------------------------------------------
SB_FUNC_MMMV_VERIFY_S_FP_ORIG_BUT_DO_NOT_EXIT_T2_S_FB_ORIG_ALREADY_VERIFIED="f"
func_mmmv_verify_S_FP_ORIG_but_do_not_exit_t2(){
    if [ "$SB_FUNC_MMMV_VERIFY_S_FP_ORIG_BUT_DO_NOT_EXIT_T2_S_FB_ORIG_ALREADY_VERIFIED" != "t" ]; then
        if [ "$SB_FUNC_MMMV_VERIFY_S_FP_ORIG_BUT_DO_NOT_EXIT_T2_S_FB_ORIG_ALREADY_VERIFIED" != "f" ]; then
            echo ""
            echo -e "\e[31mThe code that calls this function is flawed. \e[39m"
            echo "The global variable "
            echo ""
            echo "    SB_FUNC_MMMV_VERIFY_S_FP_ORIG_BUT_DO_NOT_EXIT_T2_S_FB_ORIG_ALREADY_VERIFIED==\"$SB_FUNC_MMMV_VERIFY_S_FP_ORIG_BUT_DO_NOT_EXIT_T2_S_FB_ORIG_ALREADY_VERIFIED\""
            echo ""
            echo "has a domain of {\"f\", \"t\"}."
            echo "GUID=='3eb84923-9ee2-42e8-b4b6-7032619038e7'"
            echo ""
        else
            func_mmmv_verify_S_FP_ORIG_but_do_not_exit_t1
            SB_FUNC_MMMV_VERIFY_S_FP_ORIG_BUT_DO_NOT_EXIT_T2_S_FB_ORIG_ALREADY_VERIFIED="t"
        fi
    fi
} # func_mmmv_verify_S_FP_ORIG_but_do_not_exit_t2

#--------------------------------------------------------------------------
SB_NO_ERRORS_YET="t" # domain=={"t","f"} 
func_mmmv_assert_nonempty_string_but_do_not_exit_t1(){
    local S_IN="$1"
    local S_VARIABLE_NAME_IN_CALLING_CODE="$2"
    local S_GUID_CANDIDATE="$3"
    #----------------------------------------------------------------------
    local SB_NO_ERRORS_YET_1="t"
    if [ "$S_GUID_CANDIDATE" == "" ]; then 
        echo ""
        echo -e "\e[31mThe code that calls this function is flawed.\e[39m The"
        echo ""
        echo "    S_GUID_CANDIDATE==\"\""
        echo ""
        echo "but it is expected to be a GUID."
        echo "GUID=='9179553d-5c46-4b84-b2b6-7032619038e7'"
        echo ""
        SB_NO_ERRORS_YET_1="f"
    fi
    #--------------------
    if [ "$SB_NO_ERRORS_YET" != "t" ]; then 
        echo ""
        echo -e "\e[31mThe code that calls this function is flawed. \e[39m"
        echo "The global variable "
        echo ""
        echo "    SB_NO_ERRORS_YET==\"$SB_NO_ERRORS_YET\""
        echo ""
        if [ "$SB_NO_ERRORS_YET" == "f" ]; then 
            echo "is expected to be initialized to \"t\" before calling this function."
            echo "GUID=='90f71b44-8ca1-40cc-a2b6-7032619038e7'"
        else
            echo "is expected to be initialized to \"t\" before calling this function"
            echo "and its domain is {\"f\", \"t\"}."
            echo "GUID=='5c749e49-b683-4458-82b6-7032619038e7'"
        fi
        if [ "$SB_NO_ERRORS_YET_1" == "t" ]; then 
            echo "GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        fi
        echo ""
        SB_NO_ERRORS_YET="f"
    fi
    #--------------------
    if [ "$SB_NO_ERRORS_YET_1" == "f" ]; then 
        SB_NO_ERRORS_YET="f"
    fi
    #----------------------------------------------------------------------
    if [ "$SB_NO_ERRORS_YET" == "t" ]; then 
        if [ "$S_VARIABLE_NAME_IN_CALLING_CODE" == "" ]; then 
            echo ""
            echo -e "\e[31mThe code that calls this function is flawed.\e[39m The"
            echo ""
            echo "    S_VARIABLE_NAME_IN_CALLING_CODE==\"\""
            echo ""
            echo "GUID=='2a39ee48-2c6b-4cec-b2a6-7032619038e7'"
            if [ "$SB_NO_ERRORS_YET_1" == "t" ]; then  # should be always true at this line
                echo "GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
            fi
            echo ""
            SB_NO_ERRORS_YET="f"
        fi
    fi
    #----------------------------------------------------------------------
    if [ "$SB_NO_ERRORS_YET" == "t" ]; then 
        if [ "$S_IN" == "" ]; then 
            echo ""
            echo -e "\e[31mThere is a flaw somewhere in the code\e[39m that"
            echo "uses a variable named \"$S_VARIABLE_NAME_IN_CALLING_CODE\"." 
            echo ""
            echo "    $S_VARIABLE_NAME_IN_CALLING_CODE==\"$S_IN\""
            echo ""
            echo "but it is expected to be something other than an empty string."
            echo "GUID=='a4f0b7bd-a3e3-45f0-a5a6-7032619038e7'"
            if [ "$SB_NO_ERRORS_YET_1" == "t" ]; then  # should be always true at this line
                echo "GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
            fi
            echo ""
            SB_NO_ERRORS_YET="f"
        fi
    fi
    #----------------------------------------------------------------------
} # func_mmmv_assert_nonempty_string_but_do_not_exit_t1

#--------------------------------------------------------------------------
# SB_NO_ERRORS_YET="t" # domain=={"t","f"}, initial declaration resides upwards from this line
func_mmmv_assert_sbvar_domain_t_f_but_do_not_exit_t1(){
    local SB_VARIABLE_VALUE="$1"
    local S_VARIABLE_NAME_IN_CALLING_CODE="$2"
    local S_GUID_CANDIDATE="$3"
    #----------------------------------------------------------------------
    local SB_NO_ERRORS_YET_1="t"
    if [ "$S_GUID_CANDIDATE" == "" ]; then 
        echo ""
        echo -e "\e[31mThe code that calls this function is flawed.\e[39m The"
        echo ""
        echo "    S_GUID_CANDIDATE==\"\""
        echo ""
        echo "but it is expected to be a GUID."
        echo "GUID=='b435b224-c675-4de9-81a6-7032619038e7'"
        echo ""
        SB_NO_ERRORS_YET_1="f"
    fi
    #--------------------
    if [ "$SB_NO_ERRORS_YET" != "t" ]; then 
        echo ""
        echo -e "\e[31mThe code that calls this function is flawed. \e[39m"
        echo "The global variable "
        echo ""
        echo "    SB_NO_ERRORS_YET==\"$SB_NO_ERRORS_YET\""
        echo ""
        if [ "$SB_NO_ERRORS_YET" == "f" ]; then 
            echo "is expected to be initialized to \"t\" before calling this function."
            echo "GUID=='33baba2a-1403-4c68-91a6-7032619038e7'"
        else
            echo "is expected to be initialized to \"t\" before calling this function"
            echo "and its domain is {\"f\", \"t\"}."
            echo "GUID=='5f30b82c-1d39-4199-a4a6-7032619038e7'"
        fi
        if [ "$SB_NO_ERRORS_YET_1" == "t" ]; then 
            echo "GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        fi
        echo ""
        SB_NO_ERRORS_YET="f"
    fi
    #--------------------
    if [ "$SB_NO_ERRORS_YET_1" == "f" ]; then 
        SB_NO_ERRORS_YET="f"
    fi
    #----------------------------------------------------------------------
    if [ "$SB_NO_ERRORS_YET" == "t" ]; then 
        if [ "$S_VARIABLE_NAME_IN_CALLING_CODE" == "" ]; then 
            echo ""
            echo -e "\e[31mThe code that calls this function is flawed.\e[39m The"
            echo ""
            echo "    S_VARIABLE_NAME_IN_CALLING_CODE==\"\""
            echo ""
            echo "GUID=='93a7552d-2d41-4522-8296-7032619038e7'"
            if [ "$SB_NO_ERRORS_YET_1" == "t" ]; then  # should be always true at this line
                echo "GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
            fi
            echo ""
            SB_NO_ERRORS_YET="f"
        fi
    fi
    #----------------------------------------------------------------------
    if [ "$SB_NO_ERRORS_YET" == "t" ]; then 
        if [ "$SB_VARIABLE_VALUE" != "t" ]; then 
            if [ "$SB_VARIABLE_VALUE" != "f" ]; then 
                echo ""
                echo -e "\e[31mThere is a flaw somewhere in the code\e[39m that"
                echo "uses a variable named \"$S_VARIABLE_NAME_IN_CALLING_CODE\". The " 
                echo ""
                echo "    $S_VARIABLE_NAME_IN_CALLING_CODE==\"$SB_VARIABLE_VALUE\""
                echo ""
                echo "but it is expected to be either \"t\" or \"f\"."
                echo "GUID=='bd95524a-78dc-4357-9496-7032619038e7'"
                if [ "$SB_NO_ERRORS_YET_1" == "t" ]; then  # should be always true at this line
                    echo "GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
                fi
                echo ""
                SB_NO_ERRORS_YET="f"
            fi
        fi
    fi
    #----------------------------------------------------------------------
} # func_mmmv_assert_sbvar_domain_t_f_but_do_not_exit_t1

#--------------------------------------------------------------------------

func_mmmv_report_an_error_but_do_not_exit_t1(){
    local S_GUID_CANDIDATE="$1" # first  function argument
    local S_ERR_MSG="$2"        # second function argument
    #----------------------------------------------------------------------
    if [ "$S_GUID_CANDIDATE" == "" ]; then 
        echo ""
        echo -e "\e[31mThe code of this script is flawed.\e[39m"
        if [ "$S_ERR_MSG" != "" ]; then 
            echo "$S_ERR_MSG"
        fi
        echo "GUID=='813c783d-f254-4dfc-9596-7032619038e7'"
        echo ""
    else
        echo ""
        echo -e "\e[31mThe code of this script is flawed.\e[39m"
        if [ "$S_ERR_MSG" != "" ]; then 
            echo "$S_ERR_MSG"
        fi
        echo "GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        echo "GUID=='13d95571-b0da-453b-a296-7032619038e7'"
        echo ""
    fi
    #----------------------------------------------------------------------
    # exit 1 # must NOT be called in ~/.bashrc, because 
             # exiting from the ~/.bashrc exits the session.
} # func_mmmv_report_an_error_but_do_not_exit_t1

#--------------------------------------------------------------------------

func_mmmv_report_missing_from_path_and_do_NOT_exit_t1() {
    local S_NAME_OF_THE_EXECUTABLE=$1 # first function argument
    #----------------------------------------------------------------------
    local S_TMP_0="\`which $S_NAME_OF_THE_EXECUTABLE 2>/dev/null\`"
    local S_TMP_1=""
    local S_TMP_2="S_TMP_1=$S_TMP_0"
    eval ${S_TMP_2}
    if [ "$S_TMP_1" == "" ] ; then
        echo ""
        echo "This bash script wished to use the "
        echo "\"$S_NAME_OF_THE_EXECUTABLE\" from the PATH, but "
        echo "it was missing from the PATH."
        echo "GUID=='5b416629-f894-46db-a286-7032619038e7'"
        echo ""
    fi
    #----------------------------------------------------------------------
    # exit 1 # must NOT be called in ~/.bashrc, because 
             # exiting from the ~/.bashrc exits the session.
} # func_mmmv_report_missing_from_path_and_do_NOT_exit_t1

#func_mmmv_report_missing_from_path_and_do_NOT_exit_t1 "ln"
#func_mmmv_report_missing_from_path_and_do_NOT_exit_t1 "date"
#func_mmmv_report_missing_from_path_and_do_NOT_exit_t1 "printf"
#func_mmmv_report_missing_from_path_and_do_NOT_exit_t1 "grep"
#func_mmmv_report_missing_from_path_and_do_NOT_exit_t1 "git"

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
        echo "GUID=='5366624e-9b19-4cc0-a386-7032619038e7'"
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
                    echo "GUID=='d61f114d-79cd-41ff-8186-7032619038e7'"
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
                    echo "points to a broken symlink, but a file or "
                    echo "a symlink to a file is expected."
                    echo "GUID==\"$S_GUID_CANDIDATE\""
                    echo "GUID=='0de5683d-fc31-45ec-9286-7032619038e7'"
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
                    echo "does not exist."
                    echo "GUID==\"$S_GUID_CANDIDATE\""
                    echo "GUID=='41ad8a12-8ccb-4fe6-b386-7032619038e7'"
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
                    echo "exists, but a file or a symlink to a file is expected."
                    echo "GUID==\"$S_GUID_CANDIDATE\""
                    echo "GUID=='5e72b84f-6bef-4a5a-9486-7032619038e7'"
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
            echo "GUID=='32f16c43-e0d3-4b4b-8386-7032619038e7'"
            echo ""
        fi
    fi
    #------------------------------
} # func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1

#--------------------------------------------------------------------------

func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1() {  # S_FP, S_GUID_CANDIDATE
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
        echo "GUID=='5735fa27-272c-4f3d-b386-7032619038e7'"
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
                    echo "GUID=='72707617-7df4-461e-a286-7032619038e7'"
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
                    echo "points to a broken symlink, but a folder "
                    echo "or a symlink to a folder is expected."
                    echo "GUID==\"$S_GUID_CANDIDATE\""
                    echo "GUID=='e2b97593-93fc-441c-9476-7032619038e7'"
                    echo ""
                fi
                #--------
                SB_VERIFICATION_FAILED="t"
            else
                if [ "$SB_DISPLAY_VERIF_FAILURE_MSG" == "t" ]; then
                    echo ""
                    echo "The folder "
                    echo ""
                    echo "    $S_FP "
                    echo ""
                    echo "does not exist."
                    echo "GUID==\"$S_GUID_CANDIDATE\""
                    echo "GUID=='afaf0b57-71b2-40d7-9376-7032619038e7'"
                    echo ""
                fi
                #--------
                SB_VERIFICATION_FAILED="t"
            fi
        else
            if [ ! -d "$S_FP" ]; then
                if [ "$SB_DISPLAY_VERIF_FAILURE_MSG" == "t" ]; then
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
                    echo "GUID==\"$S_GUID_CANDIDATE\""
                    echo "GUID=='31574e55-beab-4863-b476-7032619038e7'"
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
            echo "GUID=='9310071c-30f7-43b3-9a76-7032619038e7'"
            echo ""
        fi
    fi
    #------------------------------
} # func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1

#--------------------------------------------------------------------------

func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1(){
    local S_FP_INSTALLATION_FOLDER="$1" # is 
                      # the folder with the $S_FP_INSTALLATION_FOLDER/bin 
                      # and optionally  the $S_FP_INSTALLATION_FOLDER/share/man
    local S_GUID_CANDIDATE="$2"
    local SB_MAN_FOLDER_EXISTENCE_IS_MANDATORY="$3" # domain: {"t","f"} Default: "f"
    #----------------------------------------------------------------------
    # A global variable for storing function output.
    SB_VERIFICATION_FAILED="f" # domain: "t", "f" .
    #------------------------------
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        if [ "$S_GUID_CANDIDATE" == "" ]; then
            echo ""
            echo -e "\e[31mThe code that calls this function is flawed.\e[39m"
            echo ""
            echo "    S_GUID_CANDIDATE==\"\""
            echo ""
            echo "GUID=='0845455e-7dcd-4e56-a276-7032619038e7'"
            echo ""
            #--------
            SB_VERIFICATION_FAILED="t"
        fi
    fi
    #------------------------------
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        if [ "$S_FP_INSTALLATION_FOLDER" == "" ]; then
            echo ""
            echo -e "\e[31mThe code that calls this function is flawed.\e[39m"
            echo ""
            echo "    S_FP_INSTALLATION_FOLDER==\"\""
            echo ""
            echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
            echo "GUID=='b74d0b29-3fe5-4589-b176-7032619038e7'"
            echo ""
            #--------
            SB_VERIFICATION_FAILED="t"
        fi
    fi
    #------------------------------
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        if [ "$SB_MAN_FOLDER_EXISTENCE_IS_MANDATORY" == "" ]; then
            SB_MAN_FOLDER_EXISTENCE_IS_MANDATORY="f" # the default value
        else
            if [ "$SB_MAN_FOLDER_EXISTENCE_IS_MANDATORY" != "t" ]; then
                if [ "$SB_MAN_FOLDER_EXISTENCE_IS_MANDATORY" != "f" ]; then
                    echo ""
                    echo -e "\e[31mThe code that calls this function is flawed.\e[39m"
                    echo ""
                    echo "    SB_MAN_FOLDER_EXISTENCE_IS_MANDATORY==\"$SB_MAN_FOLDER_EXISTENCE_IS_MANDATORY\""
                    echo ""
                    echo "but its valid values are \"t\" and \"f\" and "
                    echo "\"\", which is automatically converted to the "
                    echo "default value of \"f\"."
                    echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
                    echo "GUID=='3f182f17-4ae3-4870-8476-7032619038e7'"
                    echo ""
                    #--------
                    SB_VERIFICATION_FAILED="t"
                fi
            fi
        fi
    fi
    #------------------------------
    local SB_MAN_FOLDER_OR_NONBROKEN_SYMLINK_TO_IT_EXISTS="f"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
            "$S_FP_INSTALLATION_FOLDER" "80f3bf34-ebc1-4b4a-85d6-7032619038e7"
        if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
            #--------------
            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                "$S_FP_INSTALLATION_FOLDER/bin" "2404f412-1bda-41a1-83c6-7032619038e7"
            if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
                Z_PATH="$S_FP_INSTALLATION_FOLDER/bin:$Z_PATH"
            fi
            #--------------
            if [ -e "$S_FP_INSTALLATION_FOLDER/share/man" ]; then
                if [ -d "$S_FP_INSTALLATION_FOLDER/share/man" ]; then
                    SB_MAN_FOLDER_OR_NONBROKEN_SYMLINK_TO_IT_EXISTS="t"
                fi
            fi
            if [ "$SB_MAN_FOLDER_OR_NONBROKEN_SYMLINK_TO_IT_EXISTS" == "f" ]; then
                if [ "$SB_MAN_FOLDER_EXISTENCE_IS_MANDATORY" == "t" ]; then
                    # The next 2 lines are for displaying an error message.
                    func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                        "$S_FP_INSTALLATION_FOLDER/share/man" "6c37735b-bd6f-4dba-83c6-7032619038e7"
                fi
            else
                MANPATH="$S_FP_INSTALLATION_FOLDER/share/man:$MANPATH"
            fi
            #--------------
        fi
    fi
    #------------------------------
    if [ "$SB_VERIFICATION_FAILED" != "t" ]; then
        if [ "$SB_VERIFICATION_FAILED" != "f" ]; then
            echo ""
            echo -e "\e[31mThe code of this Bash function is flawed.\e[39m"
            echo "GUID=='be9a643c-537d-4fc4-b476-7032619038e7'"
            echo ""
        fi
    fi
    #------------------------------
} # func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1

#--------------------------------------------------------------------------

#==========================================================================
#::the::::end::of::2022_02_08_version_of_bashrc_subpart_func_core_t2:::::::
#::the::start::of::2021_06_10_version_of_a_set_of_throwing_bash_functions::

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
        echo "GUID=='7a57f734-e508-4f1e-a376-7032619038e7'"
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
        echo "GUID=='f26f821c-7acc-41f9-8476-7032619038e7'"
        echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        echo ""
        #--------
        cd "$S_FP_ORIG"
        exit 1
    fi
    #------------------------------
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
    #----------------------------------------------------------------------
    if [ "$S_GUID_CANDIDATE" == "" ]; then
        echo ""
        echo -e "\e[31mThe Bash code that calls this function is flawed. \e[39m"
        echo ""
        echo "    S_GUID_CANDIDATE==\"\""
        echo ""
        echo "but it is expected to be a GUID."
        echo "Aborting script."
        echo "GUID=='397efc47-4058-419a-a276-7032619038e7'"
        echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        echo ""
        #--------
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
        echo "GUID=='83a65c5d-b9f8-4b42-b276-7032619038e7'"
        echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        echo ""
        #--------
        exit 1
    fi
    #------------------------------
} # func_mmmv_assert_error_code_zero_t2

#--------------------------------------------------------------------------

func_mmmv_assert_error_code_zero_t3(){
    local S_ERR_CODE="$1" # the "$?"
    local S_GUID_CANDIDATE="$2"
    #----------------------------------------------------------------------
    func_mmmv_assert_error_code_zero_t1 "$S_ERR_CODE" "$S_GUID_CANDIDATE"
    func_mmmv_wait_and_sync_t1
    #------------------------------
} # func_mmmv_assert_error_code_zero_t3

func_mmmv_assert_error_code_zero_t4(){
    local S_ERR_CODE="$1" # the "$?"
    local S_GUID_CANDIDATE="$2"
    #----------------------------------------------------------------------
    func_mmmv_assert_error_code_zero_t2 "$S_ERR_CODE" "$S_GUID_CANDIDATE"
    func_mmmv_wait_and_sync_t1
    #------------------------------
} # func_mmmv_assert_error_code_zero_t4

#--------------------------------------------------------------------------

func_mmmv_exc_verify_S_FP_ORIG_t1() {
    if [ "$S_FP_ORIG" == "" ]; then
        echo ""
        echo -e "\e[31mThe code of this script is flawed. \e[39m"
        echo "The environment variable S_FP_ORIG is expected "
        echo "to be initialized at the start of the script by "
        echo ""
        echo "    S_FP_ORIG=\"\`pwd\`\""
        echo ""
        echo "Aborting script."
        echo "GUID=='813a30d7-ce53-4d45-a266-7032619038e7'"
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
        echo -e "\e[31mAborting script. \e[39m"
        echo "GUID=='176a832e-2ef1-48f9-b266-7032619038e7'"
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
        echo -e "\e[31mAborting script. \e[39m"
        echo "GUID=='b1f5e51d-d8b1-4ee3-b166-7032619038e7'"
        echo ""
        exit 1 # exit with an error
    fi
} # func_mmmv_exc_verify_S_FP_ORIG_t1

#--------------------------------------------------------------------------

FUNC_MMMV_EXC_VERIFY_S_FP_ORIG_T2_S_FB_ORIG_ALREADY_VERIFIED="f"
func_mmmv_exc_verify_S_FP_ORIG_t2(){
    if [ "$FUNC_MMMV_EXC_VERIFY_S_FP_ORIG_T2_S_FB_ORIG_ALREADY_VERIFIED" != "t" ]; then
        if [ "$FUNC_MMMV_EXC_VERIFY_S_FP_ORIG_T2_S_FB_ORIG_ALREADY_VERIFIED" != "f" ]; then
            echo ""
            echo -e "\e[31mThe code that calls this function is flawed. \e[39m"
            echo "The global variable "
            echo ""
            echo "    FUNC_MMMV_EXC_VERIFY_S_FP_ORIG_T2_S_FB_ORIG_ALREADY_VERIFIED==\"$FUNC_MMMV_EXC_VERIFY_S_FP_ORIG_T2_S_FB_ORIG_ALREADY_VERIFIED\""
            echo ""
            echo "has a domain of {\"f\", \"t\"}."
            echo "GUID=='c6042102-8b04-46f9-9466-7032619038e7'"
            echo ""
        else
            func_mmmv_exc_verify_S_FP_ORIG_t1
            FUNC_MMMV_EXC_VERIFY_S_FP_ORIG_T2_S_FB_ORIG_ALREADY_VERIFIED="t"
        fi
    fi
} # func_mmmv_exc_verify_S_FP_ORIG_t2

#--------------------------------------------------------------------------

func_mmmv_cd_S_FP_ORIG_and_exit_t1(){
    func_mmmv_exc_verify_S_FP_ORIG_t1
    cd "$S_FP_ORIG"
    func_mmmv_assert_error_code_zero_t2 "$?" \
        "cef3fc10-d71e-4d1f-95c6-7032619038e7"
    exit 0
} # func_mmmv_cd_S_FP_ORIG_and_exit_t1

#--------------------------------------------------------------------------

func_mmmv_assert_nonempty_string_t1(){
    local S_IN="$1"
    local S_VARIABLE_NAME_IN_CALLING_CODE="$2"
    local S_GUID_CANDIDATE="$3"
    #----------------------------------------------------------------------
    func_mmmv_exc_verify_S_FP_ORIG_t2
    if [ "$S_GUID_CANDIDATE" == "" ]; then 
        echo ""
        echo -e "\e[31mThe code that calls this function is flawed.\e[39m The"
        echo ""
        echo "    S_GUID_CANDIDATE==\"\""
        echo ""
        echo "but it is expected to be a GUID."
        echo "GUID=='d2e75b50-d144-4665-b366-7032619038e7'"
        echo ""
        #--------
        cd "$S_FP_ORIG"
        exit 1 # exiting with an error
    fi
    #----------------------------------------------------------------------
    if [ "$S_VARIABLE_NAME_IN_CALLING_CODE" == "" ]; then 
        echo ""
        echo -e "\e[31mThe code that calls this function is flawed.\e[39m The"
        echo ""
        echo "    S_VARIABLE_NAME_IN_CALLING_CODE==\"\""
        echo ""
        echo "GUID=='1de38616-d913-4031-a266-7032619038e7'"
        echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        echo ""
        #--------
        cd "$S_FP_ORIG"
        exit 1 # exiting with an error
    fi
    #----------------------------------------------------------------------
    if [ "$S_IN" == "" ]; then 
        echo ""
        echo -e "\e[31mThere is a flaw somewhere in the code\e[39m that"
        echo "uses a variable named \"$S_VARIABLE_NAME_IN_CALLING_CODE\"." 
        echo ""
        echo "    $S_VARIABLE_NAME_IN_CALLING_CODE==\"$S_IN\""
        echo ""
        echo "but it is expected to be something other than an empty string."
        echo "GUID=='feef9831-3464-4a65-b266-7032619038e7'"
        echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        echo ""
        #--------
        cd "$S_FP_ORIG"
        exit 1 # exiting with an error
    fi
    #----------------------------------------------------------------------
} # func_mmmv_assert_nonempty_string_t1

#--------------------------------------------------------------------------

func_mmmv_assert_sbvar_domain_t_f_t1(){
    local SB_VARIABLE_VALUE="$1"
    local S_VARIABLE_NAME_IN_CALLING_CODE="$2"
    local S_GUID_CANDIDATE="$3"
    #----------------------------------------------------------------------
    func_mmmv_exc_verify_S_FP_ORIG_t2
    if [ "$S_GUID_CANDIDATE" == "" ]; then 
        echo ""
        echo -e "\e[31mThe code that calls this function is flawed.\e[39m The"
        echo ""
        echo "    S_GUID_CANDIDATE==\"\""
        echo ""
        echo "but it is expected to be a GUID."
        echo "GUID=='340ea4ec-2f07-4842-b466-7032619038e7'"
        echo ""
        #--------
        cd "$S_FP_ORIG"
        exit 1 # exiting with an error
    fi
    #----------------------------------------------------------------------
    if [ "$S_VARIABLE_NAME_IN_CALLING_CODE" == "" ]; then 
        echo ""
        echo -e "\e[31mThe code that calls this function is flawed.\e[39m The"
        echo ""
        echo "    S_VARIABLE_NAME_IN_CALLING_CODE==\"\""
        echo ""
        echo "GUID=='24c59452-3de1-4413-a556-7032619038e7'"
        echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        echo ""
        #--------
        cd "$S_FP_ORIG"
        exit 1 # exiting with an error
    fi
    #----------------------------------------------------------------------
    if [ "$SB_VARIABLE_VALUE" != "t" ]; then 
        if [ "$SB_VARIABLE_VALUE" != "f" ]; then 
            echo ""
            echo -e "\e[31mThere is a flaw somewhere in the code\e[39m that"
            echo "uses a variable named \"$S_VARIABLE_NAME_IN_CALLING_CODE\". The " 
            echo ""
            echo "    $S_VARIABLE_NAME_IN_CALLING_CODE==\"$SB_VARIABLE_VALUE\""
            echo ""
            echo "but it is expected to be either \"t\" or \"f\"."
            echo "GUID=='7ca65b4c-629c-494e-8256-7032619038e7'"
            echo "GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
            echo ""
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        fi
    fi
    #----------------------------------------------------------------------
} # func_mmmv_assert_sbvar_domain_t_f_t1

#--------------------------------------------------------------------------

func_mmmv_assert_file_exists_t1() {
    local S_FP="$1"
    local S_GUID_CANDIDATE="$2"
    local SB_OPTIONAL_BAN_SYMLINKS="$3" # domain: {"t", "f", ""} default: "f"
                                        # is the last formal parameter 
                                        # in stead of the S_GUID_CANDIDATE, 
                                        # because that way this function is 
                                        # backwards compatible with 
                                        # an earlier version of this 
                                        # function.
    #----------------------------------------------------------------------
    func_mmmv_exc_verify_S_FP_ORIG_t2
    local SB_LACK_OF_PARAMETERS="f"
    if [ "$S_FP" == "" ]; then
        SB_LACK_OF_PARAMETERS="t"
    fi
    if [ "$S_GUID_CANDIDATE" == "" ]; then
        SB_LACK_OF_PARAMETERS="t"
    fi
    if [ "$SB_LACK_OF_PARAMETERS" == "t" ]; then
        echo ""
        echo -e "\e[31mThe code that calls this function is flawed. \e[39m"
        echo "This function requires 2 parameters, which are "
        echo "S_FP, S_GUID_CANDIDATE, and it has an optional 3. parameter, "
        echo "which is SB_OPTIONAL_BAN_SYMLINKS."
        if [ "$S_GUID_CANDIDATE" != "" ]; then
            echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        fi
        echo "GUID=='92979a59-124c-40e8-9456-7032619038e7'"
        echo ""
        #--------
        cd "$S_FP_ORIG"
        exit 1 # exiting with an error
    else
        if [ "$SB_LACK_OF_PARAMETERS" != "f" ]; then
            echo -e "\e[31mThis code is flawed. \e[39m"
            echo "GUID=='842bba30-e247-4b09-9156-7032619038e7'"
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        fi
    fi
    #------------------------------
    if [ "$SB_OPTIONAL_BAN_SYMLINKS" == "" ]; then
        # The default value of the 
        SB_OPTIONAL_BAN_SYMLINKS="f"
        # must be backwards compatible with the
        # version of this function, where 
        # symlinks to files were treated as actual files.
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
                echo "GUID=='1c7eb6e2-1270-4fc2-8456-7032619038e7'"
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
                echo "a file is expected."
            else
                echo "a file or a symlink to a file is expected."
            fi
            echo "S_GUID_CANDIDATE==\"$S_GUID_CANDIDATE\""
            echo "GUID=='51d57cd2-8831-4e49-9656-7032619038e7'"
            echo ""
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        else
            echo ""
            if [ "$SB_OPTIONAL_BAN_SYMLINKS" == "t" ]; then
                echo "The file "
            else
                echo "The file or a symlink to a file "
            fi
            echo ""
            echo "    $S_FP "
            echo ""
            echo "does not exist."
            echo "S_GUID_CANDIDATE==\"$S_GUID_CANDIDATE\""
            echo "GUID=='63c1a953-932b-4289-b156-7032619038e7'"
            echo ""
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        fi
    else
        if [ -d "$S_FP" ]; then
            echo ""
            if [ -h "$S_FP" ]; then
                echo "The symlink to an existing folder "
            else
                echo "The folder "
            fi
            echo ""
            echo "    $S_FP "
            echo ""
            printf "exists, but "
            if [ "$SB_OPTIONAL_BAN_SYMLINKS" == "t" ]; then
                echo "a file is expected."
            else
                echo "a file or a symlink to a file is expected."
            fi
            echo "S_GUID_CANDIDATE==\"$S_GUID_CANDIDATE\""
            echo "GUID=='eed8fd52-2358-4e36-b356-7032619038e7'"
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
                    echo "is a symlink to a file, but a file is expected."
                    echo "S_GUID_CANDIDATE==\"$S_GUID_CANDIDATE\""
                    echo "GUID=='19c0e0d5-1b23-4cce-b646-7032619038e7'"
                    echo ""
                    #--------
                    cd "$S_FP_ORIG"
                    exit 1 # exiting with an error
                fi
            fi
        fi
    fi
} # func_mmmv_assert_file_exists_t1

#--------------------------------------------------------------------------

func_mmmv_assert_folder_exists_t1() {
    local S_FP="$1"
    local S_GUID_CANDIDATE="$2"
    local SB_OPTIONAL_BAN_SYMLINKS="$3" # domain: {"t", "f", ""} default: "f"
                                        # is the last formal parameter 
                                        # in stead of the S_GUID_CANDIDATE, 
                                        # because that way this function is 
                                        # backwards compatible with 
                                        # an earlier version of this 
                                        # function.
    #----------------------------------------------------------------------
    func_mmmv_exc_verify_S_FP_ORIG_t2
    local SB_LACK_OF_PARAMETERS="f"
    if [ "$S_FP" == "" ]; then
        SB_LACK_OF_PARAMETERS="t"
    fi
    if [ "$S_GUID_CANDIDATE" == "" ]; then
        SB_LACK_OF_PARAMETERS="t"
    fi
    if [ "$SB_LACK_OF_PARAMETERS" == "t" ]; then
        echo ""
        echo -e "\e[31mThe code that calls this function is flawed. \e[39m"
        echo "This function requires 2 parameters, which are "
        echo "S_FP, S_GUID_CANDIDATE, and it has an optional 3. parameter, "
        echo "which is SB_OPTIONAL_BAN_SYMLINKS."
        if [ "$S_GUID_CANDIDATE" != "" ]; then
            echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        fi
        echo "GUID=='4e49d422-f0d7-4268-8346-7032619038e7'"
        echo ""
        #--------
        cd "$S_FP_ORIG"
        exit 1 # exiting with an error
    else
        if [ "$SB_LACK_OF_PARAMETERS" != "f" ]; then
            echo -e "\e[31mThis code is flawed. \e[39m"
            echo "GUID=='0b5d6c2d-ba24-452c-a346-7032619038e7'"
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        fi
    fi
    #------------------------------
    if [ "$SB_OPTIONAL_BAN_SYMLINKS" == "" ]; then
        # The default value of the 
        SB_OPTIONAL_BAN_SYMLINKS="f"
        # must be backwards compatible with the
        # version of this function, where 
        # symlinks to folders were treated as actual folders.
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
                echo "GUID=='6337e643-01cb-421e-9146-7032619038e7'"
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
            echo "GUID=='4739d4e2-39dd-4729-a146-7032619038e7'"
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
            echo "GUID=='13917935-e732-494f-9e46-7032619038e7'"
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
            echo "GUID=='11668984-e275-42af-9446-7032619038e7'"
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
                    echo "GUID=='4ea2b613-174a-4da1-a846-7032619038e7'"
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

func_mmmv_exit_if_not_on_path_t2() { # S_COMMAND_NAME
    local S_COMMAND_NAME="$1"
    #----------------------------------------------------------------------
    func_mmmv_exc_verify_S_FP_ORIG_t2
    local S_LOCAL_VARIABLE="`which $S_COMMAND_NAME 2>/dev/null`"
    if [ "$S_LOCAL_VARIABLE" == "" ]; then
        echo ""
        echo -e "\e[31mCommand \"$S_COMMAND_NAME\" could not be found from the PATH. \e[39m"
        echo "The execution of this Bash script is aborted."
        echo "GUID=='4df6be42-1b42-4785-a546-7032619038e7'"
        echo ""
        cd "$S_FP_ORIG"
        exit 1;
    fi
} # func_mmmv_exit_if_not_on_path_t2

#--------------------------------------------------------------------------

func_mmmv_exit_t1(){
    local S_GUID_CANDIDATE="$1" # first function argument
    #----------------------------------------------------------------------
    echo ""
    echo -e "\e[32m\e[7m#======================================================="
    echo -e "\e[0m\e[32mIf You want to run this Bash script, the "
    echo "#--------------"
    echo "$S_FP_DIR/$S_FN_SCRIPTFILE_NAME"
    echo "#--------------"
    echo "then please edit it by outcommenting the line with the "
    echo "\"$S_GUID_CANDIDATE\"."
    echo "Thank You."
    echo -e "\e[32m\e[7m#======================================================="
    echo -e "\e[0m" # resets the text terminal style
    cd "$S_FP_ORIG"
    exit 1
} # func_mmmv_exit_t1

#--------------------------------------------------------------------------

func_mmmv_exc_exit_with_an_error_t1(){
    local S_GUID_CANDIDATE="$1" # first function argument
    #----------------------------------------------------------------------
    func_mmmv_exc_verify_S_FP_ORIG_t1
    echo ""
    echo -e "\e[31mThe code of this script is flawed. \e[39m"
    echo "Aborting script."
    if [ "$S_GUID_CANDIDATE" != "" ]; then 
        echo "GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
    fi
    echo "GUID=='41b5a3f8-3d80-4835-9146-7032619038e7'"
    echo ""
    cd "$S_FP_ORIG"
    exit 1 # exit with an error
} # func_mmmv_exc_exit_with_an_error_t1

#--------------------------------------------------------------------------

func_mmmv_exc_exit_with_an_error_t2(){
    local S_GUID_CANDIDATE="$1"   # first function argument
    local S_OPTIONAL_ERR_MSG="$2" # second function argument
    #----------------------------------------------------------------------
    func_mmmv_exc_verify_S_FP_ORIG_t1
    if [ "$S_GUID_CANDIDATE" == "" ]; then 
        echo ""
        echo -e "\e[31mThe code of this script is flawed. \e[39m"
        if [ "$S_OPTIONAL_ERR_MSG" != "" ]; then 
            echo "$S_OPTIONAL_ERR_MSG"
        fi
        echo "Aborting script."
        echo "GUID=='f709302f-e993-483a-a546-7032619038e7'"
        echo ""
        cd "$S_FP_ORIG"
        exit 1 # exit with an error
    else
        echo ""
        echo -e "\e[31mSomething went wrong. \e[39m"
        if [ "$S_OPTIONAL_ERR_MSG" != "" ]; then 
            echo "$S_OPTIONAL_ERR_MSG"
        fi
        echo "Aborting script."
        echo "GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        echo "GUID=='0034e41a-f12a-4064-b146-7032619038e7'"
        echo ""
        cd "$S_FP_ORIG"
        exit 1 # exit with an error
    fi
} # func_mmmv_exc_exit_with_an_error_t2

#--------------------------------------------------------------------------

S_AWK_CMD="exit 1;"
func_mmmv_exc_determine_Awk_command_t1() {
    func_mmmv_exc_verify_S_FP_ORIG_t2
    S_AWK_CMD="exit 1;" # for reliability
    local SB_THROW="f"
    if [ "`which gawk`" != "" ]; then
        S_AWK_CMD="gawk"
    else
        if [ "`which awk`" != "" ]; then
            S_AWK_CMD="awk"
        else
            SB_THROW="t"
        fi
    fi
    if [ "$SB_THROW" != "f" ]; then
        echo ""
        echo -e "\e[31mNeither 'gawk', nor 'awk' was available on PATH. \e[39m"
        echo "The execution of this Bash script is aborted."
        echo "GUID=='1c867248-ec5e-414f-b346-7032619038e7'"
        echo ""
        cd "$S_FP_ORIG"
        exit 1;
    fi
} # func_mmmv_exc_determine_Awk_command_t1

#--------------------------------------------------------------------------

func_mmmv_exc_is_file_t1() {
    local S_FP_CANDIDATE="$1" # folder path
    #----------------------------------------------------------------------
    if [ ! -e "$S_FP_CANDIDATE" ]; then 
        echo ""
        echo "The file"
        echo ""
        echo "    $S_FP_CANDIDATE "
        echo ""
        echo "does not exist."
        echo "GUID=='d4e01427-53b3-4d4c-b146-7032619038e7'"
        echo "Aborting without doing anything."
        echo ""
        exit 1 # exit with an error
    fi
    if [ -d "$S_FP_CANDIDATE" ]; then 
        echo ""
        echo "The path"
        echo ""
        echo "    $S_FP_CANDIDATE "
        echo ""
        if [ -h "$S_FP_CANDIDATE" ]; then 
            echo "references a symbolic link to a folder, "
        else
            echo "references a folder, "
        fi
        echo "but it is required to reference a file."
        echo "GUID=='f449ed3e-913a-4a70-9236-7032619038e7'"
        echo "Aborting without doing anything."
        echo ""
        exit 1 # exit with an error
    fi
} # func_mmmv_exc_is_file_t1

#--------------------------------------------------------------------------

func_mmmv_exc_is_folder_t1() {
    local S_FP_CANDIDATE="$1" # folder path
    #----------------------------------------------------------------------
    if [ ! -e "$S_FP_CANDIDATE" ]; then 
        echo ""
        echo "The folder"
        echo ""
        echo "    $S_FP_CANDIDATE "
        echo ""
        echo "does not exist."
        echo "GUID=='62f03c4e-734e-4cf0-9136-7032619038e7'"
        echo "Aborting without doing anything."
        echo ""
        exit 1 # exit with an error
    fi
    if [ ! -d "$S_FP_CANDIDATE" ]; then 
        echo ""
        echo "The path"
        echo ""
        echo "    $S_FP_CANDIDATE "
        echo ""
        if [ -h "$S_FP_CANDIDATE" ]; then 
            echo "references a symbolic link to a file, "
        else
            echo "references a file, "
        fi
        echo "but it is required to reference a folder."
        echo "GUID=='b4d0ef4d-dbec-4d36-a236-7032619038e7'"
        echo "Aborting without doing anything."
        echo ""
        exit 1 # exit with an error
    fi
} # func_mmmv_exc_is_folder_t1

# S_FP_TMP_0="/tmp/fff_testimine"
# S_FP_TMP_FF1="$S_FP_TMP_0/ff1"
# S_FP_TMP_FILE_1="$S_FP_TMP_0/file1.txt"
# S_FP_TMP_0_SYM_FLDR_OK="$S_FP_TMP_0/sym_folder_exists"
# S_FP_TMP_0_SYM_X_MISSING="$S_FP_TMP_0/sym_x_missing"
# S_FP_TMP_0_SYM_FILE_OK="$S_FP_TMP_0/sym_file_exists"
# rm -fr $S_FP_TMP_0
# mkdir -p $S_FP_TMP_FF1
# echo "Hello World :-)" > $S_FP_TMP_FILE_1
# ln -s $S_FP_TMP_FILE_1  $S_FP_TMP_0_SYM_FILE_OK
# ln -s $S_FP_TMP_FF1  $S_FP_TMP_0_SYM_FLDR_OK
# ln -s $S_FP_TMP_FF1/this_does_not_exist $S_FP_TMP_0_SYM_X_MISSING
# 
# # The following assertions must pass:
#     func_mmmv_exc_is_folder_t1 "$S_FP_TMP_FF1"
#     func_mmmv_exc_is_folder_t1 "$S_FP_TMP_0_SYM_FLDR_OK"
#     func_mmmv_exc_is_file_t1 "$S_FP_TMP_FILE_1"
#     func_mmmv_exc_is_file_t1 "$S_FP_TMP_0_SYM_FILE_OK"
# 
# # The following assertions must fail:
#     #func_mmmv_exc_is_folder_t1 "$S_FP_TMP_0_SYM_X_MISSING"
#     #func_mmmv_exc_is_file_t1 "$S_FP_TMP_0_SYM_X_MISSING"
# 
# rm -fr $S_FP_TMP_0
# exit 0

#--------------------------------------------------------------------------

func_mmmv_create_folder_t1(){
    local S_FP_FOLDER="$1" # first function argument
    #--------
    # The reason, why this function is used instead of the 
    #     mkdir -p $S_FP_FOLDER
    # is that there is no guarantee that the 
    #     mkdir -p $S_FP_FOLDER
    # succeeds and it would be a waste of
    # development time to write the file system related
    # tests from scratch every time a folder 
    # needs to be created.
    #----------------------------------------------------------------------
    func_mmmv_exc_verify_S_FP_ORIG_t2
    if [ "$S_FP_FOLDER" == "" ]; then
        echo ""
        echo "The function formal parameter S_FP_FOLDER "
        echo "is expected to be a full path to a folder that "
        echo "either already exists or that has to be created."
        echo "Aborting script."
        echo "GUID=='edbdac11-5477-41eb-9136-7032619038e7'"
        echo ""
        cd "$S_FP_ORIG"
        exit 1 # exit with an error
    fi
    #--------
    if [ -e "$S_FP_FOLDER" ]; then 
        if [ ! -d "$S_FP_FOLDER" ]; then 
            echo ""
            echo "The "
            echo ""
            echo "    $S_FP_FOLDER"
            echo ""
            echo "is a file or a symlink to a file, but it "
            echo "is expected to be a full path to a folder, "
            echo "a symlink to a folder or it should not "
            echo "reference anything that already exists."
            echo "Aborting script."
            echo "GUID=='92489812-e12e-4e26-b236-7032619038e7'"
            echo ""
            cd "$S_FP_ORIG"
            exit 1 # exit with an error
        fi
    else
        mkdir -p $S_FP_FOLDER
        local S_TMP_0="$?"
        wait # just in case
        sync # for network drives and USB-sticks
        wait # just in case
        if [ "$S_TMP_0" != "0" ]; then 
            func_mmmv_exc_exit_with_an_error_t2 "2f7c14fc-afe4-40b3-b4c6-7032619038e7" \
                "S_FP_FOLDER==$S_FP_FOLDER"
        fi
        if [ ! -e "$S_FP_FOLDER" ]; then 
            func_mmmv_exc_exit_with_an_error_t2 "590a8ab8-5abf-407e-a2b6-7032619038e7" \
                "Folder creation failed. S_FP_FOLDER==$S_FP_FOLDER"
        fi
    fi
    #--------
} # func_mmmv_create_folder_t1

#--------------------------------------------------------------------------

func_mmmv_exc_assure_tmp_folder_existence_t1() {  # S_FP_TMP, S_GUID
    local S_FP_TMP="$1"
    local S_GUID="$2"
    #----------------------------------------------------------------------
    func_mmmv_exc_verify_S_FP_ORIG_t2
    if [ "$S_GUID" == "" ]; then
        echo ""
        echo -e "\e[31mThe code that calls this function is flawed. \e[39m"
        echo "This function requires 2 parameters: S_FP_TMP, S_GUID"
        echo "GUID=='0be52946-2af2-44c8-b536-7032619038e7'"
        echo ""
        #--------
        cd "$S_FP_ORIG"
        exit 1 # exiting with an error
    fi
    #------------------------------
    if [ ! -e "$S_FP_TMP" ]; then
        if [ -h "$S_FP_TMP" ]; then
            rm -f "$S_FP_TMP" # deletes a broken symlink
            func_mmmv_assert_error_code_zero_t1 \
                "$?" "f2f4f13c-e56f-4a0b-b5b6-7032619038e7"
            func_mmmv_wait_and_sync_t1
            if [ -h "$S_FP_TMP" ]; then
                echo ""
                echo "The path "
                echo ""
                echo "    $S_FP_TMP"
                echo ""
                echo "points to a broken symlink, but a folder "
                echo "or a symlink to a folder is expected."
                echo "An attempt to delete the broken symlink failed."
                echo "GUID==\"$S_GUID\""
                echo "GUID=='032b5240-dbde-4f55-8436-7032619038e7'"
                echo ""
                #--------
                cd "$S_FP_ORIG"
                exit 1 # exiting with an error
            fi
        fi
        mkdir -p "$S_FP_TMP"
        func_mmmv_assert_error_code_zero_t1 \
            "$?" "c0be1810-ebed-46b1-94b6-7032619038e7"
        func_mmmv_wait_and_sync_t1
        func_mmmv_assert_folder_exists_t1 "$S_FP_TMP" \
            '1670b701-26c0-46ea-a336-7032619038e7'
    else
        if [ ! -d "$S_FP_TMP" ]; then
            echo ""
            if [ -h "$S_FP_TMP" ]; then
                echo "The symlink to an existing file "
            else
                echo "The file "
            fi
            echo ""
            echo "    $S_FP_TMP"
            echo ""
            echo "exists, but a folder or a symlink to a folder is expected."
            echo "GUID==\"$S_GUID\""
            echo "GUID=='b2029626-7816-44ef-a236-7032619038e7'"
            echo ""
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        fi
    fi
} # func_mmmv_exc_assure_tmp_folder_existence_t1

#--------------------------------------------------------------------------

func_mmmv_ln_create_hardlink_t1() { # S_FP_TARGET  S_FP_LINK
    local S_FP_TARGET="$1" # is allowed to be a broken symlink, but 
                           # must NOT be a folder and must be 
                           # on the same filesystem volume with the S_FP_LINK .

    local S_FP_LINK="$2"   # must not exist during the call of this function .

    local SB_THROW_ON_INVALID_DATA="$3" # Optional.
                                        # Domain: {"t","f","",<unassigned>}.
                                        # default=="t"
    #----------------------------------------------------------------------
    if [ "$SB_THROW_ON_INVALID_DATA" == "" ]; then
        SB_THROW_ON_INVALID_DATA="t"
    else
        if [ "$SB_THROW_ON_INVALID_DATA" != "t" ]; then
            if [ "$SB_THROW_ON_INVALID_DATA" != "f" ]; then
                echo ""
                echo -e "\e[31mThe code that calls this function is flawed. \e[39m"
                echo "Domain(SB_THROW_ON_INVALID_DATA) == "
                echo "    {\"t\",\"f\",\"\",<unassigned>}"
                echo ""
                echo "    SB_THROW_ON_INVALID_DATA==\"$SB_THROW_ON_INVALID_DATA\""
                echo ""
                echo "Aborting script."
                echo "GUID=='71d5388f-8af7-4faf-b336-7032619038e7'"
                echo ""
                exit 1 # because of a code defect, not just invalid data.
            fi
        fi
    fi
    local SB_DO_NOT_CREATE_THE_HARDLINK="f" #a fallback for not throwing/exiting
    #----------------------------------------------------------------------
    # The original file and the hardlink share the same inode 
    # and therefore the original file and the hardlink are
    # distinguishable from each other only by their paths. Hardlinks
    # to folders do not exist, can not be made, because that would
    # change a file system tree into a graph that has true loops,
    # not just symlink based loops. Hardlinks form a relation
    # between a file path and an inode of a file. Hardlinks to 
    # symlinks are possible, because symlinks are special purpose files
    # regardless of whether the symlinks reference a folder or a file or another symlink.
    # Revision control systems (Git, Subversion, etc.)
    # can/at_least_sometimes_do break hardlinks by making physical
    # copies of the files that are referenced by hardlinks.
    #
    #     https://superuser.com/questions/12972/how-can-you-see-the-actual-hard-link-by-ls
    #     (archival copy: https://archive.is/8feTw )
    #
    #     http://www.linfo.org/hard_link.html
    #     (archival copy: https://archive.is/HXFYC )
    #
    # Inode numbers can be displayed by executing
    #
    #     ls -l --inode   # short version is: "ls -li "
    # 
    # A 2019_06_30 citation of user "ninjalj" 2017_05_02 comment from  
    # 
    #     https://stackoverflow.com/questions/43733893/when-rm-a-file-but-hard-link-still-there-the-inode-will-be-marked-unused
    #     (archival copy: https://archive.is/5j0cv )
    #     ----citation--start----
    #     i-nodes contain a link count (visible in ls -l output). 
    #     Each hard link increments that count. Unlinking 
    #     (removing a link, be it the original filename->inode 
    #     link, or some hard link added later, which is the only thing 
    #     users can request) decrements the count.  
    #     ----citation--end------
    #
    #----------------------------------------------------------------------
    if [ -e "$S_FP_LINK" ]; then 
        if [ -d "$S_FP_LINK" ]; then # folder or a symlink to a folder
            if [ ! -h "$S_FP_LINK" ]; then # not a symlink, therefore a folder
                echo ""
                echo "The hardlink candidate, the "
                echo ""
                echo "    $S_FP_LINK"
                echo ""
                echo "already exists and it is a folder, not a symlink."
                echo "According to the implementation of this function "
                echo "this is a situation, where there is probably something wrong,"
                echo "because hardlinks can be made only to files and symlinks, "
                echo "regardless of whether the symlinks are broken or not."
                echo "Skipping the creation of the hardlink with the target path of "
                echo ""
                echo "    $S_FP_TARGET"
                echo ""
                echo "GUID=='c34fe912-1829-4e85-9336-7032619038e7'"
                echo ""
                if [ "$SB_THROW_ON_INVALID_DATA" == "t" ]; then
                    exit 1
                fi
                SB_DO_NOT_CREATE_THE_HARDLINK="t"
            # else # symlink to a folder
            fi
        # else # file or a symlink to a file
        fi
        if [ "$SB_DO_NOT_CREATE_THE_HARDLINK" == "f" ]; then
            echo ""
            echo "According to the specification of this function "
            echo "the hardlink, which in the case of this function call "
            echo "has the path of "
            echo ""
            echo "    $S_FP_LINK"
            echo ""
            echo "must not exist before the call to this function."
            echo "GUID=='b53cd740-e566-4569-a536-7032619038e7'"
            echo ""
            if [ "$SB_THROW_ON_INVALID_DATA" == "t" ]; then
                exit 1
            fi
            SB_DO_NOT_CREATE_THE_HARDLINK="t"
        fi
    else # missing or a broken symlink
        if [ "$SB_DO_NOT_CREATE_THE_HARDLINK" == "f" ]; then
            if [ -h "$S_FP_LINK" ]; then # a broken symlink, therefore NOT missing
                echo ""
                echo "The hardlink candidate, the "
                echo ""
                echo "    $S_FP_LINK"
                echo ""
                echo "already exists and it is a broken symlink. According to "
                echo "the specification of this function the hardlink "
                echo "must not exist before the call to this function."
                echo "GUID=='b4494853-31f1-4dfc-b336-7032619038e7'"
                echo ""
                if [ "$SB_THROW_ON_INVALID_DATA" == "t" ]; then
                    exit 1
                fi
                SB_DO_NOT_CREATE_THE_HARDLINK="t"
            fi
        fi
    fi
    #----------------------------------------------------------------------
    if [ "$SB_DO_NOT_CREATE_THE_HARDLINK" == "f" ]; then
        if [ -e "$S_FP_TARGET" ]; then
            if [ -d "$S_FP_TARGET" ]; then # a folder or a symlink to a folder
                if [ ! -h "$S_FP_TARGET" ]; then # not a symlink, therefore a folder
                    echo ""
                    echo "The hardlink target candidate, the "
                    echo ""
                    echo "    $S_FP_TARGET"
                    echo ""
                    echo "is a folder, not a symlink to a folder. "
                    echo "Hardlinks can be made only to files and symlinks, "
                    echo "regardless of whether the symlinks are broken or not."
                    echo "Skipping the creation of the hardlink with the path of "
                    echo ""
                    echo "    $S_FP_LINK"
                    echo ""
                    echo "GUID=='bdc6f659-6612-4b6f-9136-7032619038e7'"
                    echo ""
                    if [ "$SB_THROW_ON_INVALID_DATA" == "t" ]; then
                        exit 1
                    fi
                    SB_DO_NOT_CREATE_THE_HARDLINK="t"
                # else # symlink to a folder
                fi
            # else # file or a symlink to a file
            fi
        else # missing or a broken symlink
            if [ ! -h "$S_FP_TARGET" ]; then # not a symlink, therefore missing
                echo ""
                echo "The hardlink target candidate with the path of  "
                echo ""
                echo "    $S_FP_TARGET"
                echo ""
                echo "does not exist. Skipping the creation of a hardlink"
                echo "with the path of "
                echo ""
                echo "    $S_FP_LINK"
                echo ""
                echo "GUID=='24036291-f012-4134-b226-7032619038e7'"
                echo ""
                if [ "$SB_THROW_ON_INVALID_DATA" == "t" ]; then
                    exit 1
                fi
                SB_DO_NOT_CREATE_THE_HARDLINK="t"
            # else # broken symlink
                   # It is possible to create hardlinks to broken symlinks.
            fi
        fi
    fi
    #----------------------------------------------------------------------
    local S_TMP_0="not_set_yet GUID=='4c8022e3-664e-4d99-b426-7032619038e7'"
    if [ "$SB_DO_NOT_CREATE_THE_HARDLINK" == "f" ]; then
        ln  "$S_FP_TARGET" "$S_FP_LINK" 
        S_TMP_0="$?"
        if [ "$S_TMP_0" != "0" ]; then
            echo ""
            echo "The creation of a hardlink with the path of "
            echo ""
            echo "    $S_FP_LINK"
            echo ""
            echo "and the target path of "
            echo ""
            echo "    $S_FP_TARGET"
            echo ""
            echo "failed. The ln exited with the error code of $S_TMP_0 ."
            echo "GUID=='575b09e2-7542-4d47-8426-7032619038e7'"
            echo ""
            if [ "$SB_THROW_ON_INVALID_DATA" == "t" ]; then
                exit 1
            fi
            SB_DO_NOT_CREATE_THE_HARDLINK="t" # here to skip some tests later
        fi
        #------------------------------------------------------------------
        #func_mmmv_wait_and_sync_t1 # inlined at the next 2 lines
        wait # for background processes started by this Bash script to exit/finish
        sync # USB-sticks, etc.
        wait # for sync
        #------------------------------------------------------------------
        if [ "$SB_DO_NOT_CREATE_THE_HARDLINK" == "f" ]; then
            #--------------------------------------------------------------
            S_TMP_0="f" # "t" --- potential error condition detected
                        # "f" --- no error detected
            #--------------------------------------------------------------
            if [ -h "$S_FP_TARGET" ]; then
                # A broken symlink, including a hardlink to a broken symlink
                # gives "false" with the Bash "-e".
                if [ ! -h "$S_FP_LINK" ]; then
                    echo ""
                    echo "Problem detection branch marker "
                    echo "GUID=='e5de1322-7699-49ad-a526-7032619038e7'"
                    echo ""
                    S_TMP_0="t"
                else
                    if [ -e "$S_FP_TARGET" ]; then # symlink to a folder or a file
                        if [ ! -e "$S_FP_LINK" ]; then
                            echo ""
                            echo "Problem detection branch marker "
                            echo "GUID=='b6e72e1d-86be-41d8-9426-7032619038e7'"
                            echo ""
                            S_TMP_0="t"
                        else
                            if [ -d "$S_FP_TARGET" ]; then
                                if [ ! -d "$S_FP_LINK" ]; then
                                    echo ""
                                    echo "Problem detection branch marker "
                                    echo "GUID=='211c53cc-4ddc-47be-9426-7032619038e7'"
                                    echo ""
                                    S_TMP_0="t"
                                fi
                            else
                                if [ -d "$S_FP_LINK" ]; then
                                    echo ""
                                    echo "Problem detection branch marker "
                                    echo "GUID=='986a0825-5b7c-45f8-a426-7032619038e7'"
                                    echo ""
                                    S_TMP_0="t"
                                fi
                            fi
                        fi
                    else # broken symlink
                        if [ -e "$S_FP_LINK" ]; then
                            echo ""
                            echo "Problem detection branch marker "
                            echo "GUID=='205aa120-be16-489e-9126-7032619038e7'"
                            echo ""
                            S_TMP_0="t"
                        fi
                    fi
                fi
            else # As the S_FP_LINK can never be a hardlink to a folder and
                 # the S_FP_TARGET is not a symlink at this branch, the 
                 # S_FP_TARGET is a file. Therefore at this branch 
                 # the S_FP_LINK is also a file.
                if [ ! -e "$S_FP_TARGET" ]; then # just an extra test
                    echo ""
                    echo "Problem detection branch marker "
                    echo "GUID=='2ad6e445-e10b-4d39-b326-7032619038e7'"
                    echo ""
                    S_TMP_0="t"
                else
                    if [ -d "$S_FP_TARGET" ]; then # just an extra test
                        echo ""
                        echo "Problem detection branch marker "
                        echo "GUID=='185996e8-82b1-447c-a326-7032619038e7'"
                        echo ""
                        S_TMP_0="t"
                    else
                        if [ -h "$S_FP_LINK" ]; then
                            echo ""
                            echo "Problem detection branch marker "
                            echo "GUID=='18d4d2d5-c20d-43d7-8426-7032619038e7'"
                            echo ""
                            S_TMP_0="t"
                        else
                            if [ ! -e "$S_FP_LINK" ]; then
                                echo ""
                                echo "Problem detection branch marker "
                                echo "GUID=='c42a6923-b3f7-4222-b526-7032619038e7'"
                                echo ""
                                S_TMP_0="t"
                            else
                                if [ -d "$S_FP_LINK" ]; then
                                    echo ""
                                    echo "Problem detection branch marker "
                                    echo "GUID=='5aafcd44-a990-4a29-a226-7032619038e7'"
                                    echo ""
                                    S_TMP_0="t"
                                fi
                            fi
                        fi
                    fi
                fi
            fi
            #--------------------------------------------------------------
            if [ "$S_TMP_0" == "t" ]; then
                echo ""
                echo "The creation of a hardlink with the path of "
                echo ""
                echo "    $S_FP_LINK "
                echo ""
                echo "and the target path of "
                echo ""
                echo "    $S_FP_TARGET"
                echo ""
                echo "might have succeeded, but did not go as expected."
                echo "The ln command succeeded, but there might have been "
                echo "some other operating system processes that altered some "
                echo "related files or folders or symlinks on disk before "
                echo "this Bash function could exit. One possible debugging "
                echo "idea is that it is possible to chain symlinks "
                echo "together by making a symlink to symlink that references "
                echo "a symlink that references "
                echo "a symlink that references "
                echo "a symlink that references "
                echo "a symlink that references ..."
                echo "and the operating system processes might have "
                echo "altered any of the symlinks in the chain, including "
                echo "the file or folder at the very end of the symlink chain."
                echo "GUID=='371400b1-38c3-47c4-9126-7032619038e7'"
                echo ""
                if [ "$SB_THROW_ON_INVALID_DATA" == "t" ]; then
                    exit 1
                fi
            else
                if [ "$S_TMP_0" != "f" ]; then
                    echo ""
                    echo -e "\e[31mThe implementation of this function is flawed. \e[39m"
                    echo "Aborting script."
                    echo "GUID=='450ff9e5-74f9-4a67-b426-7032619038e7'"
                    echo ""
                    exit 1
                fi
            fi
            #--------------------------------------------------------------
        fi
        #------------------------------------------------------------------
    else
        if [ "$SB_DO_NOT_CREATE_THE_HARDLINK" != "t" ]; then
            echo ""
            echo -e "\e[31mThe implementation of this function is flawed. \e[39m"
            echo "Aborting script."
            echo "GUID=='eaa48f28-76d5-4a52-b426-7032619038e7'"
            echo ""
            exit 1
        fi
    fi
} # func_mmmv_ln_create_hardlink_t1

#--------------------------------------------------------------------------

func_mmmv_assert_environment_variable_set_t1() { 
    local S_ENVIRONMENT_VARIABLE_NAME="$1"
    local S_GUID_CANDIDATE="$2" 
    local S_OPTIONAL_ERR_MSG="$3" # will be appended to failure-message
    #----------------------------------------------------------------------
    local S_ENVIR_VALUE=""
    local S_SCRIPT_0="S_ENVIR_VALUE=\"\`echo \\\"\$$S_ENVIRONMENT_VARIABLE_NAME\\\" \`\""
    eval "$S_SCRIPT_0"
    if [ "$S_ENVIR_VALUE" == "" ]; then
        echo ""
        echo "The environment variable $S_ENVIRONMENT_VARIABLE_NAME is "
        echo "either not set or it has the value of an empty string."
        if [ "$S_OPTIONAL_ERR_MSG" != "" ]; then
            printf "%b" "$S_OPTIONAL_ERR_MSG"
        fi
        if [ "$S_GUID_CANDIDATE" != "" ]; then
            echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        fi 
        echo "GUID=='587aab01-d67d-4fc8-b916-7032619038e7'"
        echo ""
        exit 1 # exit with an error
    #else 
         # echo "S_ENVIR_VALUE==\"$S_ENVIR_VALUE\""
    fi
} # func_mmmv_assert_environment_variable_set_t1

#--------------------------------------------------------------------------

func_mmmv_ar_ls_t1() { # S_ARRAY_VARIABLE_NAME S_FP_LS
    local S_ARRAY_VARIABLE_NAME="$1"
    local S_FP_LS="$2"
    #----------------------------------------------------------------------
    # The "ls -m " works on both, BSD and Linux.
    local AR_0=$( ls -m $S_FP_LS )
    #--------
    local S_SCRIPT_0="$S_ARRAY_VARIABLE_NAME=()"
    eval "$S_SCRIPT_0"
    local s_iter=""
    S_SCRIPT_0="$S_ARRAY_VARIABLE_NAME+=(\$s_iter)"
    local S_TMP_IFS="$IFS"
    # The IFS is an internal Bash variable, "Internal Field Separator".
    IFS="," # That should handle file names that contain spaces.
    for s_iter in ${AR_0[@]}; do
        eval "$S_SCRIPT_0"
    done
    IFS="$S_TMP_IFS"
    if [ -z "$IFS" ]; then  # The "-z" returns true, if the string length is zero.
        unset IFS
    fi
} # func_mmmv_ar_ls_t1

# Test/demo code:
#    func_mmmv_ar_ls_t1 "AR_X" "$HOME"
# 
#    AR_2=${AR_X[@]}  # flawed array assignment that tokenizes by space
#    S_TMP=${#AR_X[@]}
#    echo "AR_X length: $S_TMP"
#    echo ""
#    for s_iter in ${AR_X[@]}; do
#         echo "AR_X element:[$s_iter]" 
#    done
#--------------------------------------------------------------------------

func_mmmv_exec_with_every_ar_element_t1() { # S_CMD_PART_0  S_ARRAY_VARIABLE_NAME_OF_AR_S_CMD_PART_1 S_CMD_PART_2
    local S_CMD_PART_0="$1"
    local S_ARRAY_VARIABLE_NAME_OF_AR_S_CMD_PART_1="$2"
    local S_CMD_PART_2="$3"
    #----------------------------------------------------------------------
    local S_SCRIPT_0=""
    local S_SCRIPT_1=""
    local S_SCRIPT_2=""
    local S_SCRIPT_x0=""
    local S_SCRIPT_x1=""
    local S_SCRIPT_x2=""
    #----------------
    # Wastefully left uncommented to detect flaws and to make life more comfortable :-)
    local S_TMP=""
    S_SCRIPT_0="S_TMP=\${#"
    S_SCRIPT_1="$S_ARRAY_VARIABLE_NAME_OF_AR_S_CMD_PART_1"
    S_SCRIPT_2="[@]}"
    eval "$S_SCRIPT_0$S_SCRIPT_1$S_SCRIPT_2" 
    #echo "The length of the $S_ARRAY_VARIABLE_NAME_OF_AR_S_CMD_PART_1 is: $S_TMP"
    #----------------
    # The newline trick 
    local S_NEWLINE=$'\n'
    # originates from the answer of Gordon Davisson:
    # https://stackoverflow.com/questions/17821277/how-to-separate-multiple-commands-passed-to-eval-in-bash
    # archival copy: https://archive.fo/7XI3a 
    #--------
    local S_ITER=""
    S_SCRIPT_0="for S_ITER in \${$S_ARRAY_VARIABLE_NAME_OF_AR_S_CMD_PART_1[@]}; do " 
    S_SCRIPT_x0="echo \"\"; echo \"\$S_ITER\""
    #S_SCRIPT_1="echo \"\$S_ITER\" " 
    S_SCRIPT_1="$S_CMD_PART_0 \$S_ITER  $S_CMD_PART_2 ;" 
    S_SCRIPT_x1="echo \"\""
    S_SCRIPT_2="done"
    S_SCRIPT_x2=""
    #----
    local S_TMP_0="$S_SCRIPT_0$S_NEWLINE$S_SCRIPT_x0$S_NEWLINE"
    local S_TMP_1="$S_SCRIPT_1$S_NEWLINE$S_SCRIPT_x1$S_NEWLINE"
    local S_TMP_2="$S_SCRIPT_2$S_NEWLINE$S_SCRIPT_x2$S_NEWLINE"
    eval "$S_TMP_0$S_TMP_1$S_TMP_2"
} # func_mmmv_exec_with_every_ar_element_t1

#--------------------------------------------------------------------------

func_mmmv_ar_range_t1() { #S_ARRAY_VARIABLE_NAME I_MINIMUM_INDEX I_MAXIMUM_INDEX
    local S_ARRAY_VARIABLE_NAME="$1"
    local I_MIN=$2
    local I_MAX_PLUS_ONE=`expr $3 + 1`
    #----------------------------------------------------------------------
    local S_SCRIPT_0="$S_ARRAY_VARIABLE_NAME=()"
    eval "$S_SCRIPT_0"
    local i_n=""
    S_SCRIPT_0="$S_ARRAY_VARIABLE_NAME+=(\$i_n)"
    for ((i_n=$I_MIN;i_n<$I_MAX_PLUS_ONE;i_n++))
    do
        eval "$S_SCRIPT_0"
    done
} # func_mmmv_ar_range_t1

# Test/demo code:
#     S_TMP="9"
#     func_mmmv_ar_range_t1 "AR_A_GLOBAL_VARIABLE" 4 $S_TMP
#     for s_iter in ${AR_A_GLOBAL_VARIABLE[@]}; do
#             echo "s_iter==[$s_iter]"
#     done
#--------------------------------------------------------------------------

func_mmmv_create_array_t1() {
    local ARRR=()
    #------- 
    ARRR+=("first value as string")
    ARRR+=("second value as string") 
    ARRR+=("third value as string")
    ARRR+=("fourth value as string")
    #------- 
    export ARRR_sz=`declare -p ARRR`
} # func_mmmv_create_array_t1

#--------------------------------------------------------------------------

func_mmmv_iterate_over_array_02n_t1() {
    local S_ARRAY_VARIABLE_NAME="$1" 
    local S_ARRAY_SERIALIZED="$2" # `declare -p VARIABLENAME` or an empty string
    local S_ITERATION_FUNCTION_NAME="$3" # that accepts "$s_iter" as a parameter
    #----------------------------------------------------------------------
    eval ${S_ARRAY_SERIALIZED}
    #-------
    local S_SCRIPT_0="local S_LEN=\${#$S_ARRAY_VARIABLE_NAME[@]}"
    eval ${S_SCRIPT_0}
    #echo "ARRR length: $S_LEN"
    local I_MAX=`expr $S_LEN + 0`
    #-------
    local i_n=42
    local s_iter=""
    local S_SCRIPT_LINE_1="for ((i_n=0;i_n<\$I_MAX;i_n++))"
    local S_SCRIPT_LINE_2="s_iter=\${$S_ARRAY_VARIABLE_NAME[\$i_n]}"
    local S_SCRIPT_LINE_3="$S_ITERATION_FUNCTION_NAME \"\$s_iter\""
    S_SCRIPT_0="$S_SCRIPT_LINE_1 "$'\n'"do"$'\n'"$S_SCRIPT_LINE_2 "$'\n'"$S_SCRIPT_LINE_3 "$'\n'"done"
    #echo "$S_SCRIPT_0"
    eval "$S_SCRIPT_0"
} # func_mmmv_iterate_over_array_02n_t1

# Test/demo code:
#     func_iter() {
#         local S_ITER="$1"
#         echo "Greetings from func_iter: $S_ITER"
#     } # func_iter
#     
#     func_mmmv_create_array_t1
#     func_mmmv_iterate_over_array_02n_t1 "ARRR" "$ARRR_sz" "func_iter"
#--------------------------------------------------------------------------

func_mmmv_sb_head_exists_t1() { # S_OUTPUT_VARIABLE_NAME, S_HEAD_REGEX , S_HAYSTACK
    local S_OUTPUT_VARIABLE_NAME="$1"
    local S_HEAD_REGEX="$2"
    local S_HAYSTACK="$3"
    #----------------------------------------------------------------------
    local S_SCRIPT_0="$S_OUTPUT_VARIABLE_NAME=\"f\""
    eval "$S_SCRIPT_0"
    local S_NUMBER_OF_MATCHING_CHARACTERS=`expr match "$S_HAYSTACK" "$S_HEAD_REGEX"`
    if [ "$S_NUMBER_OF_MATCHING_CHARACTERS" != "0" ]; then
        S_SCRIPT_0="$S_OUTPUT_VARIABLE_NAME=\"t\""
        eval "$S_SCRIPT_0"
    fi
} # func_mmmv_sb_head_exists_t1 

# Test/demo code:
#     S_RGX="/home/ts2/tmp"
#     S_FP="/home/ts2/tmp/uuuuu/eee"
#     
#     func_mmmv_sb_head_exists_t1 "S_CC" $S_RGX $S_FP
#     echo "S_CC: $S_CC"
#--------------------------------------------------------------------------

func_mmmv_include_bashfile_if_possible_t1(){ # S_FP_BASHFILE S_GUID_CANDIDATE SB_THROW_ON_ERROR
    local S_FP_BASHFILE="$1" # Full path to the file   
    local S_GUID_CANDIDATE="$2" 
    local SB_THROW_ON_ERROR="$3" # ~/.bashrc must not call the "exit" command.
                                 # If the SB_THROW_ON_ERROR=="t", the 
                                 # "exit" command can be called in case of error.
                                 # If the SB_THROW_ON_ERROR=="f", the 
                                 # "exit" command will not be called, 
                                 # only an error message is printed to console.
                                 # default: "f"
    #----------------------------------------------------------------------
    if [ "$SB_THROW_ON_ERROR" == "" ]; then
        SB_THROW_ON_ERROR="f" # the default value
    else
        if [ "$SB_THROW_ON_ERROR" != "t" ]; then
            if [ "$SB_THROW_ON_ERROR" != "f" ]; then
                echo ""
                echo "The SB_THROW_ON_ERROR(==$SB_THROW_ON_ERROR)"
                echo "has a wrong vaue. Only \"t\" and \"f\" are allowed."
                if [ "$S_GUID_CANDIDATE" != "" ]; then
                    echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
                fi 
                echo "GUID=='a187aa3b-3346-47a9-8416-7032619038e7'"
                echo ""
            fi
        fi
    fi
    #-----------------------------------------
    local SB_INCLUSION_POSSIBLE="t"
    if [ "$S_FP_BASHFILE" == "" ]; then
        SB_INCLUSION_POSSIBLE="f"
        echo ""
        echo "The S_FP_BASHFILE had a value of an empty string."
        if [ "$S_GUID_CANDIDATE" != "" ]; then
            echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        fi 
        echo "GUID=='efc2194f-f936-4204-9316-7032619038e7'"
        echo ""
        if [ "$SB_THROW_ON_ERROR" == "t" ]; then
            exit 1
        fi
    fi
    #-----------------------------------------
    if [ "$SB_INCLUSION_POSSIBLE" == "t" ]; then
        if [ ! -e "$S_FP_BASHFILE" ]; then
            SB_INCLUSION_POSSIBLE="f"
            echo ""
            echo "The "
            echo ""
            echo "    $S_FP_BASHFILE"
            echo ""
            echo "does not exist or it is a broken symlink."
            if [ "$S_GUID_CANDIDATE" != "" ]; then
                echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
            fi 
            echo "GUID=='2cf431f2-ba8d-413c-b516-7032619038e7'"
            echo ""
            if [ "$SB_THROW_ON_ERROR" == "t" ]; then
                exit 1
            fi
        fi
    fi
    #-----------------------------------------
    if [ "$SB_INCLUSION_POSSIBLE" == "t" ]; then
        if [ -d "$S_FP_BASHFILE" ]; then
            SB_INCLUSION_POSSIBLE="f"
            echo ""
            echo "The "
            echo ""
            echo "    $S_FP_BASHFILE"
            echo ""
            echo "references a folder, but it must reference a file."
            if [ "$S_GUID_CANDIDATE" != "" ]; then
                echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
            fi 
            echo "GUID=='6d22a02a-286d-4912-9316-7032619038e7'"
            echo ""
            if [ "$SB_THROW_ON_ERROR" == "t" ]; then
                exit 1
            fi
        fi
    fi
    #----------------------------------------------------------------------
    if [ "$SB_INCLUSION_POSSIBLE" == "t" ]; then
        source "$S_FP_BASHFILE"
    else
        if [ "$SB_INCLUSION_POSSIBLE" != "f" ]; then
            echo ""
            echo -e "\e[31mThe implementation of this function is flawed. \e[39m"
            echo "SB_INCLUSION_POSSIBLE==$SB_INCLUSION_POSSIBLE"
            if [ "$S_GUID_CANDIDATE" != "" ]; then
                echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
            fi 
            echo "GUID=='23d6de44-249f-405c-ac16-7032619038e7'"
            echo ""
            if [ "$SB_THROW_ON_ERROR" == "t" ]; then
                exit 1 
            fi
        fi
    fi
} # func_mmmv_include_bashfile_if_possible_t1

#--------------------------------------------------------------------------

func_mmmv_include_bashfile_if_possible_t2(){ # S_FP_BASHFILE S_GUID_CANDIDATE 
    local S_FP_BASHFILE="$1" # Full path to the file   
    local S_GUID_CANDIDATE="$2" 
    #----------------------------------------------------------------------
    # ~/.bashrc must not call the "exit" command.
    #-----------------------------------------
    local SB_INCLUSION_POSSIBLE="t"
    if [ "$S_FP_BASHFILE" == "" ]; then
        SB_INCLUSION_POSSIBLE="f"
        echo ""
        echo "The S_FP_BASHFILE had a value of an empty string."
        if [ "$S_GUID_CANDIDATE" != "" ]; then
            echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        fi 
        echo "GUID=='0113e439-8cd0-4cb3-9116-7032619038e7'"
        echo ""
    fi
    #-----------------------------------------
    if [ "$SB_INCLUSION_POSSIBLE" == "t" ]; then
        if [ ! -e "$S_FP_BASHFILE" ]; then
            SB_INCLUSION_POSSIBLE="f"
            echo ""
            echo "The "
            echo ""
            echo "    $S_FP_BASHFILE"
            echo ""
            echo "does not exist or it is a broken symlink."
            if [ "$S_GUID_CANDIDATE" != "" ]; then
                echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
            fi 
            echo "GUID=='f262715d-950b-47f8-8506-7032619038e7'"
            echo ""
        fi
    fi
    #-----------------------------------------
    if [ "$SB_INCLUSION_POSSIBLE" == "t" ]; then
        if [ -d "$S_FP_BASHFILE" ]; then
            SB_INCLUSION_POSSIBLE="f"
            echo ""
            echo "The "
            echo ""
            echo "    $S_FP_BASHFILE"
            echo ""
            echo "references a folder, but it must reference a file."
            if [ "$S_GUID_CANDIDATE" != "" ]; then
                echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
            fi 
            echo "GUID=='b3592750-4e67-4c4a-a106-7032619038e7'"
            echo ""
        fi
    fi
    #----------------------------------------------------------------------
    if [ "$SB_INCLUSION_POSSIBLE" == "t" ]; then
        source "$S_FP_BASHFILE"
        func_mmmv_wait_and_sync_t1
        S_FP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" # to restore its value
    else
        if [ "$SB_INCLUSION_POSSIBLE" != "f" ]; then
            echo ""
            echo -e "\e[31mThe implementation of this function is flawed. \e[39m"
            echo "SB_INCLUSION_POSSIBLE==$SB_INCLUSION_POSSIBLE"
            if [ "$S_GUID_CANDIDATE" != "" ]; then
                echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
            fi 
            echo "GUID=='550a3d62-b93a-4d47-b306-7032619038e7'"
            echo ""
        fi
    fi
} # func_mmmv_include_bashfile_if_possible_t2

#--------------------------------------------------------------------------

func_mmmv_assert_exists_on_path_t1() {
    local S_NAME_OF_THE_EXECUTABLE="$1" # first function argument
    #----------------------------------------------------------------------
    func_mmmv_exc_verify_S_FP_ORIG_t2
    local S_TMP_0="\`which $S_NAME_OF_THE_EXECUTABLE 2>/dev/null\`"
    local S_TMP_1=""
    local S_TMP_2="S_TMP_1=$S_TMP_0"
    eval ${S_TMP_2}
    if [ "$S_TMP_1" == "" ]; then
        S_TMP_0="This bash script requires the \""
        S_TMP_1="\" to be on the PATH."
        S_TMP_2="$S_TMP_0$S_NAME_OF_THE_EXECUTABLE$S_TMP_1"
        #--------
        echo ""
        echo "$S_TMP_2"
        echo "GUID=='e8ba812c-2993-42b1-8306-7032619038e7'"
        echo ""
        cd "$S_FP_ORIG"
        exit 1 # exit with an error
    fi
} # func_mmmv_assert_exists_on_path_t1

# Test/demo code:
#     func_mmmv_assert_exists_on_path_t1 "ruby"
#     func_mmmv_assert_exists_on_path_t1 "rubyy"
#--------------------------------------------------------------------------

func_mmmv_ln_create_or_overwrite_symlink_t1() { # S_FP_TARGET  S_FP_LINK
    local S_FP_TARGET="$1"
    local S_FP_LINK="$2"
    #----------------------------------------------------------------------
    local S_CMD_LN="ln -s $S_FP_TARGET $S_FP_LINK"
    if [ -e "$S_FP_LINK" ]; then
        local S_FP_OLDTARGET="`readlink $S_FP_LINK`"
        if [ "$S_FP_OLDTARGET" != "$S_FP_TARGET" ]; then
            rm -f $S_FP_LINK
            $S_CMD_LN
        fi
    else
        $S_CMD_LN
    fi
    if [ ! -e "$S_FP_LINK" ]; then
        echo ""
        echo ""
        echo -e "\e[31mBash function execution failed.  \e[39m"
        echo "Could not execute the command:"
        echo "$S_CMD_LN"
        echo ""
        echo "PWD==`pwd`"
        echo "GUID=='37c9d635-1d2e-4d66-b306-7032619038e7'"
        echo ""
        echo ""
        exit 1 # exit with an error
    fi
} # func_mmmv_ln_create_or_overwrite_symlink_t1

#--------------------------------------------------------------------------

func_mmmv_operatingsystem_is_Linux() { # S_OUTPUT_VARIABLE_NAME
    local S_OUTPUT_VARIABLE_NAME="$1"
    #----------------------------------------------------------------------
    local S_OUT="f"
    local S_X="`uname -a | grep -l Linux `"
    if [ "$S_X" == "(standard input)" ]; then
        S_OUT="t"
    fi
    local S_SCRIPT_0="$S_OUTPUT_VARIABLE_NAME=\"$S_OUT\""
    eval ${S_SCRIPT_0}
    # echo "ANSWER: $S_OUT"
} # func_mmmv_operatingsystem_is_Linux

#--------------------------------------------------------------------------

func_mmmv_operatingsystem_is_FreeBSD() { # S_SB_ANSWER
    local S_OUTPUT_VARIABLE_NAME="$1"
    #----------------------------------------------------------------------
    local S_OUT="f"
    local S_X="`uname -a | grep -l FreeBSD`"
    if [ "$S_X" == "(standard input)" ]; then
        S_OUT="t"
    fi
    local S_SCRIPT_0="$S_OUTPUT_VARIABLE_NAME=\"$S_OUT\""
    eval ${S_SCRIPT_0}
    # echo "ANSWER: $S_OUT"
} # func_mmmv_operatingsystem_is_FreeBSD

#--------------------------------------------------------------------------

func_mmmv_determine_operatingsystem_t1() {
    local SB_TMP_0_orig="$SB_TMP_0"
        func_mmmv_operatingsystem_is_Linux "SB_TMP_0"
        if [ "$SB_TMP_0" == "t" ]; then
            export S_MMMV_OPERATING_SYSTEM="linux"
        fi
        func_mmmv_operatingsystem_is_FreeBSD "SB_TMP_0"
        if [ "$SB_TMP_0" == "t" ]; then
            export S_MMMV_OPERATING_SYSTEM="freebsd"
        fi
    export SB_TMP_0="$SB_TMP_0_orig"
} # func_mmmv_determine_operatingsystem_t1

# Test/demo code:
#     func_mmmv_operatingsystem_is_Linux "S_OUTPUT_VARIABLE_NAME"
#     func_mmmv_operatingsystem_is_FreeBSD "S_SB_ANSWER"
#     func_mmmv_determine_operatingsystem_t1
#--------------------------------------------------------------------------

func_mmmv_exit_if_environment_variable_not_set_t1() { # S_ENVIRONMENT_VARIABLE_NAME
    local S_ENVIRONMENT_VARIABLE_NAME="$1"
    local S_ENVIRONMENT_VARIABLE_DOCSTRING="$2" # will be appended to failure-message
    #----------------------------------------------------------------------
    local S_ENVIR_VALUE=""
    local S_SCRIPT_0="S_ENVIR_VALUE=\"\`echo \$$S_ENVIRONMENT_VARIABLE_NAME\`\""
    eval "$S_SCRIPT_0"
    if [ "$S_ENVIR_VALUE" == "" ]; then
        echo ""
        echo "The environment variable $S_ENVIRONMENT_VARIABLE_NAME is not set, but "
        echo "it must be set or this script will not run (properly)."
        if [ "$S_ENVIRONMENT_VARIABLE_DOCSTRING" != "" ]; then
            echo ""
            echo "$S_ENVIRONMENT_VARIABLE_DOCSTRING"
        fi
        echo ""
        exit 1;
    #else 
         # echo "S_ENVIR_VALUE==\"$S_ENVIR_VALUE\""
    fi
} # func_mmmv_exit_if_environment_variable_not_set_t1

# Test/demo code:
#     func_mmmv_exit_if_environment_variable_not_set_t1 "CFLAGS" 

#--------------------------------------------------------------------------
#::the::::end::of::2021_06_10_version_of_a_set_of_throwing_bash_functions::
#==========================================================================

func_mmmv_assert_Linux_or_BSD_t1(){
    local S_GUID_CANDIDATE="$1"
    #----------------------------------------------------------------------
    func_mmmv_exc_verify_S_FP_ORIG_t2
    if [ "$S_GUID_CANDIDATE" == "" ]; then
        echo ""
        echo -e "\e[31mS_GUID_CANDIDATE==\"\", but it is expected to be a GUID. \e[39m"
        echo "GUID=='2621b241-35f1-4efb-83a5-7032619038e7'"
        echo ""
        # if [ "$S_FP_ORIG" != "" ]; then
        #     func_mmmv_exc_verify_S_FP_ORIG_t1
        #     cd "$S_FP_ORIG"
        # fi
        #--------
        cd "$S_FP_ORIG"
        exit 1 # exit with an error
    fi 
    #--------------------
    #S_TMP_0="`uname -a | grep -E \"([Ll][Ii][Nn][Uu][Xx]|[Bb][Ss][Dd]|[Cc][Yy][Gg][Ww][Ii][Nn])\"`"
    S_TMP_0="`uname -a | grep -E \"([Ll][Ii][Nn][Uu][Xx]|[Bb][Ss][Dd])\"`"
    if [ "$S_TMP_0" == "" ]; then
        echo ""
        echo "The classical command line utilities at "
        echo "different operating systems, for example, Linux and BSD,"
        echo "differ. This script is designed to run only on Linux and BSD."
        echo "If You are willing to risk that some of Your data "
        echo "is deleted and/or Your operating system instance"
        echo "becomes permanently flawed, to the point that "
        echo "it will not even boot, then You may edit the Bash script that "
        echo "calls the function that displays this error message "
        echo "by uncommenting that function."
        echo ""
        echo "If You do decide to edit the Bash script, then "
        echo "a recommendation is to test Your modifications "
        echo "within a virtual appliance or, if virtual appliances are not"
        echo "an option, as some new operating system user that does not have "
        echo "any access to the vital data/files."
        echo ""
        echo "Aborting script without doing anything."
        echo ""
        echo "GUID=='613f8012-957e-43dd-84a5-7032619038e7'"
        echo ""
        # if [ "$S_FP_ORIG" != "" ]; then
        #     func_mmmv_exc_verify_S_FP_ORIG_t1
        #     cd "$S_FP_ORIG"
        # fi
        #--------
        cd "$S_FP_ORIG"
        exit 1 # exit with an error
    fi
} # func_mmmv_assert_Linux_or_BSD_t1

#--------------------------------------------------------------------------
#S_FP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [ "$S_FP_DIR" == "" ]; then
    echo ""
    echo "It is assumed that the environment variable S_FP_DIR"
    echo "is defined before this Bash script is included."
    echo -e "\e[31mExiting with an error. \e[39m"
    echo "GUID=='2b3c73b1-338f-47ec-b7a5-7032619038e7'"
    echo ""
    if [ "$S_FP_ORIG" != "" ]; then
        func_mmmv_exc_verify_S_FP_ORIG_t1
        cd "$S_FP_ORIG"
    fi
    exit 1
fi
#-------------------------------------------
if [ "$S_FP_ORIG" == "" ]; then
    echo ""
    echo "It is assumed that the environment variable S_FP_ORIG"
    echo "is defined before this Bash script is included."
    echo -e "\e[31mExiting with an error. \e[39m"
    echo "GUID=='5272b550-65c2-4724-a595-7032619038e7'"
    echo ""
    exit 1
else
    func_mmmv_exc_verify_S_FP_ORIG_t2
fi

#--------------------------------------------------------------------------
func_mmmv_assert_exists_on_path_t1 "fossil"

#--------------------------------------------------------------------------
if [ "$S_FP_MMMV_FOSSIL_WIKI_HTML" == "" ]; then
        func_mmmv_exc_exit_with_an_error_t2 "980fdf44-45bd-4107-94b6-7032619038e7" \
            "Environment variable S_FP_MMMV_FOSSIL_WIKI_HTML not set. \
it is expected to be a path of a temporary HTML file that can be edited with an IDE or \
a text editor."
else
    SB_OPTIONAL_BAN_SYMLINKS="t"
    if [ -e "$S_FP_MMMV_FOSSIL_WIKI_HTML" ]; then
        func_mmmv_assert_file_exists_t1 "$S_FP_MMMV_FOSSIL_WIKI_HTML" \
            "45ac22d5-f5dd-4ae7-91b6-7032619038e7" \
            "$SB_OPTIONAL_BAN_SYMLINKS"
    else
        S_FP_MMMV_FOSSIL_WIKI_HTML_PARENT_FOLDER="`dirname $S_FP_MMMV_FOSSIL_WIKI_HTML`"
        SB_OPTIONAL_BAN_SYMLINKS="f"
        func_mmmv_assert_folder_exists_t1 "$S_FP_MMMV_FOSSIL_WIKI_HTML_PARENT_FOLDER" \
            "55ddf419-3e21-458b-b2a6-7032619038e7" \
            "$SB_OPTIONAL_BAN_SYMLINKS"
    fi
fi

#--------------------------------------------------------------------------
S_ARGV_0="$1"
S_ARGV_1="$2"  
#--------------------------------------------------------------------------
func_export_from_wiki(){
    #----------------------------------------------------------------------
    local SB_OPTIONAL_BAN_SYMLINKS="t"
    if [ -e "$S_FP_MMMV_FOSSIL_WIKI_HTML" ]; then
        func_mmmv_assert_file_exists_t1 "$S_FP_MMMV_FOSSIL_WIKI_HTML" \
            "1cdc4d65-01d3-47f7-a4a6-7032619038e7" \
            "$SB_OPTIONAL_BAN_SYMLINKS"
        rm -f "$S_FP_MMMV_FOSSIL_WIKI_HTML"
        func_mmmv_assert_error_code_zero_t1 "$?" \
            "461f1c53-ec7a-4f91-82a6-7032619038e7"
        func_mmmv_wait_and_sync_t1 
    fi
    local S_CMD="nice -n 5 fossil wiki export '$S_ARGV_0' $S_FP_MMMV_FOSSIL_WIKI_HTML"
    eval ${S_CMD}
    func_mmmv_assert_error_code_zero_t1 "$?" "ebbe8e3f-9220-41fa-b2a6-7032619038e7"
    func_mmmv_wait_and_sync_t1 
} # func_export_from_wiki

#--------------------------------------------------------------------------
func_import_to_wiki(){
    #----------------------------------------------------------------------
    local SB_OPTIONAL_BAN_SYMLINKS="t"
    func_mmmv_assert_file_exists_t1 "$S_FP_MMMV_FOSSIL_WIKI_HTML" \
        "c0fe824e-f320-4f76-9596-7032619038e7" \
        "$SB_OPTIONAL_BAN_SYMLINKS"
    local S_CMD="nice -n 5 fossil wiki commit '$S_ARGV_0' $S_FP_MMMV_FOSSIL_WIKI_HTML"
    eval ${S_CMD}
    func_mmmv_assert_error_code_zero_t1 "$?" "6442db20-83b4-4778-b596-7032619038e7"
    func_mmmv_wait_and_sync_t1 
} # func_import_to_wiki

#--------------------------------------------------------------------------
func_display_help(){
    echo ""
    echo "COMMAND_LINE_ARGUMENTS ::= <wiki page name> (i|import)?"
    echo ""
    echo -e "    S_FP_MMMV_FOSSIL_WIKI_HTML==\"\e[32m$S_FP_MMMV_FOSSIL_WIKI_HTML\e[39m\""
    echo ""
    echo "The \$PWD must be the folder, where "
    echo ""
    echo "    fossil open <path to a fossilrepository file>"
    echo ""
    echo "was successfully run. With Fossil version 2.17 the "
    echo "list of wiki pages can be displayed by executing "
    echo ""
    echo "    fossil wiki ls "
    echo ""
} # func_display_help

#--------------------------------------------------------------------------
SB_DISPLAY_HELP="f" # domain=={"t","f"}
if [ "$S_ARGV_0" == "" ]; then
    func_display_help
    cd $S_FP_ORIG
    exit 1 # exit with an error
else
    #--------------------
    if [ "$S_ARGV_0" == "h" ]; then
        SB_DISPLAY_HELP="t"
    fi
    if [ "$S_ARGV_0" == "-h" ]; then
        SB_DISPLAY_HELP="t"
    fi
    if [ "$S_ARGV_0" == "?" ]; then
        SB_DISPLAY_HELP="t"
    fi
    if [ "$S_ARGV_0" == "-?" ]; then
        SB_DISPLAY_HELP="t"
    fi
    if [ "$S_ARGV_0" == "help" ]; then
        SB_DISPLAY_HELP="t"
    fi
    if [ "$S_ARGV_0" == "-help" ]; then
        SB_DISPLAY_HELP="t"
    fi
    if [ "$S_ARGV_0" == "--help" ]; then
        SB_DISPLAY_HELP="t"
    fi
    #--------------------
    if [ "$SB_DISPLAY_HELP" == "t" ]; then
        func_display_help
        cd $S_FP_ORIG
        exit 0 # no errors
    fi
    #--------------------
    if [ "$S_ARGV_0" == "ls" ]; then # 
        # Might collide with a wiki page named "ls", but the workaround 
        # to that is to use the fossil directly, without using this script at all.
        fossil wiki ls 
        func_mmmv_assert_error_code_zero_t1 "$?" "ba89db46-ef79-4d39-8596-7032619038e7"
        cd $S_FP_ORIG
        exit 0 # no errors
    fi
    #--------------------
fi
#--------------------------------------------------------------------------
SB_IMPORT="f" # domain=={"t","f"}
if [ "$S_ARGV_1" != "" ]; then
    #--------------------
    if [ "$S_ARGV_1" == "h" ]; then
        SB_DISPLAY_HELP="t"
    fi
    if [ "$S_ARGV_1" == "-h" ]; then
        SB_DISPLAY_HELP="t"
    fi
    if [ "$S_ARGV_1" == "?" ]; then
        SB_DISPLAY_HELP="t"
    fi
    if [ "$S_ARGV_1" == "-?" ]; then
        SB_DISPLAY_HELP="t"
    fi
    if [ "$S_ARGV_1" == "help" ]; then
        SB_DISPLAY_HELP="t"
    fi
    if [ "$S_ARGV_1" == "-help" ]; then
        SB_DISPLAY_HELP="t"
    fi
    if [ "$S_ARGV_1" == "--help" ]; then
        SB_DISPLAY_HELP="t"
    fi
    #--------------------
    if [ "$SB_DISPLAY_HELP" == "t" ]; then
        func_display_help
        cd $S_FP_ORIG
        exit 0 # no errors
    fi
    #--------------------
    if [ "$S_ARGV_1" == "i" ]; then
        SB_IMPORT="t"
    fi
    if [ "$S_ARGV_1" == "-i" ]; then
        SB_IMPORT="t"
    fi
    if [ "$S_ARGV_1" == "import" ]; then
        SB_IMPORT="t"
    fi
    if [ "$S_ARGV_1" == "--import" ]; then
        SB_IMPORT="t"
    fi
    if [ "$S_ARGV_1" == "im" ]; then
        SB_IMPORT="t"
    fi
    if [ "$S_ARGV_1" == "-im" ]; then
        SB_IMPORT="t"
    fi
    if [ "$S_ARGV_1" == "--im" ]; then
        SB_IMPORT="t"
    fi
    #--------------------
    if [ "$SB_IMPORT" == "f" ]; then
        func_mmmv_exc_exit_with_an_error_t2 "3b151225-4d37-4e39-a296-7032619038e7" \
            "Second console argument was \"$S_ARGV_1\", but \
it if it is present at all, then it should be \"i\" or \"import\"."
    fi
    #--------------------
fi
#--------------------------------------------------------------------------
if [ "$SB_IMPORT" == "t" ]; then
    func_import_to_wiki
else
    func_export_from_wiki
fi

#==========================================================================
# S_VERSION_OF_THIS_FILE="5f8eeb24-6ae4-4dc1-a396-7032619038e7"
#==========================================================================
