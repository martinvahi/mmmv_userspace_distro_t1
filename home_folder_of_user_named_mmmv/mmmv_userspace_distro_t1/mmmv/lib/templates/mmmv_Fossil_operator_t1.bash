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
# The 
S_VERSION_OF_THIS_SCRIPT="1e3dbb15-e935-422f-a459-32f0401095e7"
# is needed by other scripts that depend on this script.
# To allow the version to be used as sub-part of file names and 
# folder names, the version must not contain any spaces, line breaks
# and other characters that have a special meaning in Bash.
#--------------------------------------------------------------------------


func_echo_checkmark_t1(){
    # This singleliner
    echo "✓"
    # is wrapped to this function because it's difficult to 
    # find it with text search, when there is a wish 
    # to copy-paste it or to change it.
} # func_echo_checkmark_t1


func_exit_with_an_error_t1(){
    local S_GUID="$1" # first function argument
    if [ "$S_GUID" == "" ] ; then
        echo ""
        echo "This Bash script has at least 2 flaws."
        echo "One of the flaws is that the call to this function lacks a GUID."
        echo "Aborting the script that has a version of: $S_VERSION_OF_THIS_SCRIPT ."
        echo "GUID=='aae49722-211b-45cd-b259-32f0401095e7'"
        echo ""
        #----
        cd $S_FP_ORIG
        exit 1
    else
        echo ""
        echo "This bash script is flawed."
        echo "Aborting the script that has a version of: $S_VERSION_OF_THIS_SCRIPT ."
        echo "<GUID candidate>==$S_GUID"
        echo "GUID=='2a567051-2636-4792-9559-32f0401095e7'"
        echo ""
        #----
        cd $S_FP_ORIG
        exit 1 # exit with error
    fi
} # func_exit_with_an_error_t1


func_assert_exists_on_path_t2 () {
    local S_NAME_OF_THE_EXECUTABLE_1="$1" # first function argument
    local S_NAME_OF_THE_EXECUTABLE_2="$2" # optional argument
    local S_NAME_OF_THE_EXECUTABLE_3="$3" # optional argument
    local S_NAME_OF_THE_EXECUTABLE_4="$4" # optional argument
    #--------
    # Function calls like
    #
    #     func_assert_exists_on_path_t2  ""    ""  "ls"
    #     func_assert_exists_on_path_t2  "ls"  ""  "ps"
    #
    # are not allowed by the spec of this function, but it's OK to call
    #
    #     func_assert_exists_on_path_t2  "ls" "" 
    #     func_assert_exists_on_path_t2  "ls" "ps" ""
    #     func_assert_exists_on_path_t2  "ls" ""   "" ""
    #
    #
    local SB_THROW="f"
    if [ "$S_NAME_OF_THE_EXECUTABLE_1" == "" ] ; then
        SB_THROW="t"
    else
        if [ "$S_NAME_OF_THE_EXECUTABLE_2" == "" ] ; then
            if [ "$S_NAME_OF_THE_EXECUTABLE_3" != "" ] ; then
                SB_THROW="t"
            fi
            if [ "$S_NAME_OF_THE_EXECUTABLE_4" != "" ] ; then
                SB_THROW="t"
            fi
        else
            if [ "$S_NAME_OF_THE_EXECUTABLE_3" == "" ] ; then
                if [ "$S_NAME_OF_THE_EXECUTABLE_4" != "" ] ; then
                    SB_THROW="t"
                fi
            fi
        fi
    fi
    #----
    if [ "$SB_THROW" == "t" ] ; then
        echo ""
        echo "The Bash function "
        echo ""
        echo "    func_assert_exists_on_path_t2 "
        echo ""
        echo "is not designed to handle series of arguments, where "
        echo "empty strings preced non-empty strings."
        echo "GUID=='5eed8847-187b-4026-9159-32f0401095e7'"
        echo ""
        #----
        cd $S_FP_ORIG
        exit 1 # exit with error
    fi
    if [ "$5" != "" ] ; then
        echo ""
        echo "This Bash function is designed to work with at most 4 input arguments"
        echo "GUID=='546f0b34-7d8e-4c79-a359-32f0401095e7'"
        echo ""
        #----
        cd $S_FP_ORIG
        exit 1 # exit with error
    fi
    #--------
    # Function calls like
    #
    #     func_assert_exists_on_path_t2 " "
    #     func_assert_exists_on_path_t2 "ls ps" # contains a space
    #
    # are not allowed.
    SB_THROW="f" 
    local S_TMP_0=""
    local S_TMP_1=""
    local S_TMP_2=""
    #----
    if [ "$SB_THROW" == "f" ] ; then
        S_TMP_0="`printf \"$S_NAME_OF_THE_EXECUTABLE_1\" | gawk '{gsub(/\s/,"");printf "%s", $1 }'`"
        if [ "$S_NAME_OF_THE_EXECUTABLE_1" != "$S_TMP_0" ] ; then
            SB_THROW="t" 
            S_TMP_1="$S_NAME_OF_THE_EXECUTABLE_1"
            S_TMP_2="GUID=='23473253-624f-4ce2-9559-32f0401095e7'"
        fi
    fi
    #----
    if [ "$SB_THROW" == "f" ] ; then
        S_TMP_0="`printf \"$S_NAME_OF_THE_EXECUTABLE_2\" | gawk '{gsub(/\s/,"");printf "%s", $1 }'`"
        if [ "$S_NAME_OF_THE_EXECUTABLE_2" != "$S_TMP_0" ] ; then
            SB_THROW="t" 
            S_TMP_1="$S_NAME_OF_THE_EXECUTABLE_2"
            S_TMP_2="GUID=='3044e004-7e9f-4163-8559-32f0401095e7'"
        fi
    fi
    #----
    if [ "$SB_THROW" == "f" ] ; then
        S_TMP_0="`printf \"$S_NAME_OF_THE_EXECUTABLE_3\" | gawk '{gsub(/\s/,"");printf "%s", $1 }'`"
        if [ "$S_NAME_OF_THE_EXECUTABLE_3" != "$S_TMP_0" ] ; then
            SB_THROW="t" 
            S_TMP_1="$S_NAME_OF_THE_EXECUTABLE_3"
            S_TMP_2="GUID=='cb28f519-52d9-43d6-a159-32f0401095e7'"
        fi
    fi
    #----
    if [ "$SB_THROW" == "f" ] ; then
        S_TMP_0="`printf \"$S_NAME_OF_THE_EXECUTABLE_4\" | gawk '{gsub(/\s/,"");printf "%s", $1 }'`"
        if [ "$S_NAME_OF_THE_EXECUTABLE_4" != "$S_TMP_0" ] ; then
            SB_THROW="t" 
            S_TMP_1="$S_NAME_OF_THE_EXECUTABLE_4"
            S_TMP_2="GUID=='2838c8f4-647b-4bf4-8259-32f0401095e7'"
        fi
    fi
    #--------
    if [ "$SB_THROW" == "t" ] ; then
        echo ""
        echo "The Bash function "
        echo ""
        echo "    func_assert_exists_on_path_t2 "
        echo ""
        echo "is not designed to handle an argument value that contains "
        echo "spaces or tabulation characters."
        echo "The unaccepted value in parenthesis:($S_TMP_1)."
        echo "Branch $S_TMP_2."
        echo "GUID=='a8872859-c1b2-4fee-b359-32f0401095e7'"
        echo ""
        #----
        cd $S_FP_ORIG
        exit 1 # exit with error
    fi
    SB_THROW="f" # Just a reset, should I forget to reset it later.
    #---------------
    S_TMP_0="\`which $S_NAME_OF_THE_EXECUTABLE_1 2>/dev/null\`"
    local S_TMP_1=""
    local S_TMP_2="S_TMP_1=$S_TMP_0"
    eval ${S_TMP_2}
    #----
    if [ "$S_TMP_1" == "" ] ; then
        if [ "$S_NAME_OF_THE_EXECUTABLE_2" == "" ] ; then
        if [ "$S_NAME_OF_THE_EXECUTABLE_3" == "" ] ; then
        if [ "$S_NAME_OF_THE_EXECUTABLE_4" == "" ] ; then
            echo ""
            echo "This bash script requires the \"$S_NAME_OF_THE_EXECUTABLE_1\" to be on the PATH."
            echo "GUID=='58fb5817-08af-47ef-b359-32f0401095e7'"
            echo ""
            #----
            cd $S_FP_ORIG
            exit 1 # exit with error
        fi
        fi
        fi
    else
        return # at least one of the programs was available at the PATH
    fi
    #--------
    S_TMP_0="\`which $S_NAME_OF_THE_EXECUTABLE_2 2>/dev/null\`"
    S_TMP_1=""
    S_TMP_2="S_TMP_1=$S_TMP_0"
    eval ${S_TMP_2}
    #----
    if [ "$S_TMP_1" == "" ] ; then
        if [ "$S_NAME_OF_THE_EXECUTABLE_3" == "" ] ; then
        if [ "$S_NAME_OF_THE_EXECUTABLE_4" == "" ] ; then
            echo ""
            echo "This bash script requires that either \"$S_NAME_OF_THE_EXECUTABLE_1\" or "
            echo " \"$S_NAME_OF_THE_EXECUTABLE_2\" is available on the PATH."
            echo "GUID=='9a36d62d-6ecc-48c9-8359-32f0401095e7'"
            echo ""
            #----
            cd $S_FP_ORIG
            exit 1 # exit with error
        fi
        fi
    else
        return # at least one of the programs was available at the PATH
    fi
    #--------
    S_TMP_0="\`which $S_NAME_OF_THE_EXECUTABLE_3 2>/dev/null\`"
    S_TMP_1=""
    S_TMP_2="S_TMP_1=$S_TMP_0"
    eval ${S_TMP_2}
    #----
    if [ "$S_TMP_1" == "" ] ; then
        if [ "$S_NAME_OF_THE_EXECUTABLE_4" == "" ] ; then
            echo ""
            echo "This bash script requires that either \"$S_NAME_OF_THE_EXECUTABLE_1\" or "
            echo " \"$S_NAME_OF_THE_EXECUTABLE_2\" or \"$S_NAME_OF_THE_EXECUTABLE_3\" "
            echo "is available on the PATH."
            echo "GUID=='ddfc409b-4f47-431c-b559-32f0401095e7'"
            echo ""
            #----
            cd $S_FP_ORIG
            exit 1 # exit with error
        fi
    else
        return # at least one of the programs was available at the PATH
    fi
    #--------
    S_TMP_0="\`which $S_NAME_OF_THE_EXECUTABLE_4 2>/dev/null\`"
    S_TMP_1=""
    S_TMP_2="S_TMP_1=$S_TMP_0"
    eval ${S_TMP_2}
    #----
    if [ "$S_TMP_1" == "" ] ; then
        echo ""
        echo "This bash script requires that either \"$S_NAME_OF_THE_EXECUTABLE_1\" or "
        echo " \"$S_NAME_OF_THE_EXECUTABLE_2\" or \"$S_NAME_OF_THE_EXECUTABLE_3\" or "
        echo " \"$S_NAME_OF_THE_EXECUTABLE_4\" is available on the PATH."
        echo "GUID=='501e6daf-88ae-46a4-a159-32f0401095e7'"
        echo ""
        #----
        cd $S_FP_ORIG
        exit 1 # exit with error
    else
        return # at least one of the programs was available at the PATH
    fi
    #--------
} # func_assert_exists_on_path_t2


func_assert_exists_on_path_t2 "cat"
func_assert_exists_on_path_t2 "file"                 # for checking MIME types
func_assert_exists_on_path_t2 "find"                 # for recursing
func_assert_exists_on_path_t2 "fossil"               # tested with v1.34
func_assert_exists_on_path_t2 "gawk"
func_assert_exists_on_path_t2 "grep"
func_assert_exists_on_path_t2 "nice"
func_assert_exists_on_path_t2 "ruby"                 # anything over/equal v.2.1 will probably do
func_assert_exists_on_path_t2 "shred" "gshred" "rm"  # for shredding, if possible
func_assert_exists_on_path_t2 "uname"                # to check the OS type
func_assert_exists_on_path_t2 "uuidgen" "uuid"       # for generating tmp file names
func_assert_exists_on_path_t2 "xargs"                # find . -name '*' | xargs blabla
func_assert_exists_on_path_t2 "wc"  


#--------------------------------------------------------------------------

S_FUNC_MMMV_OPERATING_SYSTEM_TYPE_T1_RESULT=""
func_mmmv_operating_system_type_t1() {
    if [ "$S_FUNC_MMMV_OPERATING_SYSTEM_TYPE_T1_RESULT" == "" ]; then
        S_TMP_0="`uname -a | grep -E [Ll]inux`"
        if [ "$S_TMP_0" != "" ]; then
            S_FUNC_MMMV_OPERATING_SYSTEM_TYPE_T1_RESULT="Linux"
        else
            S_TMP_0="`uname -a | grep BSD `"
            if [ "$S_TMP_0" != "" ]; then
                S_FUNC_MMMV_OPERATING_SYSTEM_TYPE_T1_RESULT="BSD"
            else
                S_FUNC_MMMV_OPERATING_SYSTEM_TYPE_T1_RESULT="undetermined"
            fi
        fi
    fi
} # func_mmmv_operating_system_type_t1

func_mmmv_operating_system_type_t1

if [ "$S_FUNC_MMMV_OPERATING_SYSTEM_TYPE_T1_RESULT" != "Linux" ]; then
    if [ "$S_FUNC_MMMV_OPERATING_SYSTEM_TYPE_T1_RESULT" != "BSD" ]; then
        echo ""
        echo "  The classical command line utilities at "
        echo "  different operating systems, for example, Linux and BSD,"
        echo "  differ. This script is designed to run only on "
        echo "  Linux and some BSD variants."
        echo "  If You are willing to risk that some of Your data "
        echo "  is deleted and/or Your operating system instance"
        echo "  becomes permanently flawed, to the point that "
        echo "  it will not even boot, then You may edit the Bash script that "
        echo "  displays this error message by modifying the test that "
        echo "  checks for the operating system type."
        echo ""
        echo "  If You do decide to edit this Bash script, then "
        echo "  a recommendation is to test Your modifications "
        echo "  within a virtual machine or, if virtual machines are not"
        echo "  an option, as some new operating system user that does not have "
        echo "  any access to the vital data/files."
        echo "  GUID=='265c1fa5-1fe4-4a35-9559-32f0401095e7'"
        echo ""
        echo "  Aborting script without doing anything."
        echo ""
        exit 1 # exit with error
    fi
fi


#--------------------------------------------------------------------------

SB_EXISTS_ON_PATH_T1_RESULT="f"
func_sb_exists_on_path_t1 () {
    local S_NAME_OF_THE_EXECUTABLE_1="$1" # first function argument
    #--------
    # Function calls like
    #
    #     func_sb_exists_on_path_t1 ""
    #     func_sb_exists_on_path_t1 " "
    #     func_sb_exists_on_path_t1 "ls ps" # contains a space
    #
    # are not allowed.
    if [ "$S_NAME_OF_THE_EXECUTABLE_1" == "" ] ; then
        echo ""
        echo "The Bash function "
        echo ""
        echo "    func_sb_exists_on_path_t1 "
        echo ""
        echo "is not designed to handle an argument that "
        echo "equals with an empty string."
        echo "GUID=='56019365-dbe0-4e71-bd59-32f0401095e7'"
        echo ""
        #----
        cd $S_FP_ORIG
        exit 1 # exit with error
    fi
    local S_TMP_0="`printf \"$S_NAME_OF_THE_EXECUTABLE_1\" | gawk '{gsub(/\s/,"");printf "%s", $1 }'`"
    if [ "$S_NAME_OF_THE_EXECUTABLE_1" != "$S_TMP_0" ] ; then
        echo ""
        echo "The Bash function "
        echo ""
        echo "    func_sb_exists_on_path_t1 "
        echo ""
        echo "is not designed to handle an argument value that contains "
        echo "spaces or tabulation characters."
        echo "The received value in parenthesis:($S_NAME_OF_THE_EXECUTABLE_1)."
        echo "GUID=='5c704cf3-f16f-4069-b659-32f0401095e7'"
        echo ""
        #----
        cd $S_FP_ORIG
        exit 1 # exit with error
    fi
    #--------
    S_TMP_0="\`which $S_NAME_OF_THE_EXECUTABLE_1 2>/dev/null\`"
    local S_TMP_1=""
    local S_TMP_2="S_TMP_1=$S_TMP_0"
    eval ${S_TMP_2}
    #----
    if [ "$S_TMP_1" == "" ] ; then
        SB_EXISTS_ON_PATH_T1_RESULT="f"
    else
        SB_EXISTS_ON_PATH_T1_RESULT="t"
    fi
} # func_sb_exists_on_path_t1 


#--------------------------------------------------------------------------

S_FUNC_MMMV_GUID_T1_RESULT="not_yet_set"
S_FUNC_MMMV_GUID_T1_MODE="" # optim. to skip repeating console tool selection
func_mmmv_GUID_t1() {
    # Does not take any arguments.
    #--------
    #func_mmmv_exc_hash_function_input_verification_t1 "func_mmmv_GUID_t1" "$1"
    #--------------------
    local S_TMP_0="" # declaration
    local S_TMP_1="" # declaration
    # Mode selection:
    if [ "$S_FUNC_MMMV_GUID_T1_MODE" == "" ] ; then
        SB_EXISTS_ON_PATH_T1_RESULT="f"  # if-block init
        #----
        if [ "$SB_EXISTS_ON_PATH_T1_RESULT" == "f" ] ; then
            S_TMP_0="uuidgen" # Linux version
            func_sb_exists_on_path_t1 "$S_TMP_0" 
            if [ "$SB_EXISTS_ON_PATH_T1_RESULT" == "t" ] ; then
                 S_FUNC_MMMV_GUID_T1_MODE="$S_TMP_0"
            fi
        fi
        #----
        if [ "$SB_EXISTS_ON_PATH_T1_RESULT" == "f" ] ; then
            S_TMP_0="uuid"    # BSD version
            func_sb_exists_on_path_t1 "$S_TMP_0" 
            if [ "$SB_EXISTS_ON_PATH_T1_RESULT" == "t" ] ; then
                 S_FUNC_MMMV_GUID_T1_MODE="$S_TMP_0"
            fi
        fi
        #--------
        if [ "$S_FUNC_MMMV_GUID_T1_MODE" == "" ] ; then
            echo ""
            echo "All of the GUID generation implementations that this script " 
            echo "is capable of using (uuidgen, uuid) "
            echo "are missing from the PATH."
            echo "GUID=='3877c325-9d89-4552-b459-32f0401095e7'"
            echo ""
            #----
            cd $S_FP_ORIG
            exit 1 # exit with error
        fi
        #--------
        if [ "$?" != "0" ]; then
            func_exit_with_an_error_t1 "f3039748-6f67-4a74-8159-32f0401095e7"
        fi
        #--------
    fi
    #--------------------
    S_FUNC_MMMV_GUID_T1_RESULT=""
    #--------------------
    if [ "$S_FUNC_MMMV_GUID_T1_MODE" == "uuidgen" ]; then
        S_TMP_0="`uuidgen`"
        if [ "$?" != "0" ]; then
            echo ""
            echo "The console application \"uuidgen\" "
            echo "exited with an error."
            echo ""
            echo "----console--output--citation--start-----"
            echo "`uuidgen`" # stdout and stderr
            echo "----console--output--citation--end-------"
            echo ""
            echo "GUID=='58ee5cfd-095b-4ac8-8259-32f0401095e7'"
            echo ""
            #----
            cd $S_FP_ORIG
            exit 1 # exit with error
        fi
        #---- 
        S_FUNC_MMMV_GUID_T1_RESULT="$S_TMP_0"
    fi
    #--------------------
    if [ "$S_FUNC_MMMV_GUID_T1_MODE" == "uuid" ]; then
        S_TMP_0="`uuid`"
        if [ "$?" != "0" ]; then
            echo ""
            echo "The console application \"uuid\" "
            echo "exited with an error."
            echo ""
            echo "----console--output--citation--start-----"
            echo "`uuid`" # stdout and stderr
            echo "----console--output--citation--end-------"
            echo ""
            echo "GUID=='4a9f9b40-5052-4f45-8459-32f0401095e7'"
            echo ""
            #----
            cd $S_FP_ORIG
            exit 1 # exit with error
        fi
        #---- 
        S_FUNC_MMMV_GUID_T1_RESULT="$S_TMP_0"
    fi
    #--------------------
    S_TMP_0="`printf \"$S_FUNC_MMMV_GUID_T1_RESULT\" | wc -m | gawk '{gsub(/\s/,"");printf "%s", $1 }'`"
    S_TMP_1="36"
    if [ "$S_TMP_0" != "$S_TMP_1" ]; then
        echo ""
        echo "According to the GUID specification, IETF RFC 4122,  "
        echo "the lenght of the GUID is "
        echo "$S_TMP_1 characters, but the result of the "
        echo ""
        echo "    func_mmmv_GUID_t1"
        echo ""
        echo "is something else. The flawed GUID candidate in parenthesis:"
        echo "($S_FUNC_MMMV_GUID_T1_RESULT)"
        echo ""
        echo "The lenght candidate of the flawed GUID candidate in parenthesis:"
        echo "($S_TMP_0)."
        echo ""
        echo "GUID=='8967a215-6afb-48b4-8449-32f0401095e7'"
        echo ""
        #----
        cd $S_FP_ORIG
        exit 1 # exit with error
    fi
    #--------------------
} # func_mmmv_GUID_t1


#--------------------------------------------------------------------------

S_FUNC_MMMV_SHRED_T1_MODE="" # optim. to skip repeating console tool selection
func_mmmv_shred_t1() {
    local S_FP_IN="$1" # path to the file or folder to be shredded
    # The next input parameter is a shoddy compromise,
    # for the case, where shred/gshred is not installed:
    local SB_OK_TO_USE_RM_IF_SHREDDING_APPS_NOT_AVAILABLE="$2"  # domain: {"","f","t"}
    #--------------------
    if [ "$SB_OK_TO_USE_RM_IF_SHREDDING_APPS_NOT_AVAILABLE" != "" ] ; then
        if [ "$SB_OK_TO_USE_RM_IF_SHREDDING_APPS_NOT_AVAILABLE" != "t" ] ; then
            if [ "$SB_OK_TO_USE_RM_IF_SHREDDING_APPS_NOT_AVAILABLE" != "f" ] ; then
                echo ""
                echo "The second parameter of this function, the "
                echo ""
                echo "    SB_OK_TO_USE_RM_IF_SHREDDING_APPS_NOT_AVAILABLE(==$SB_OK_TO_USE_RM_IF_SHREDDING_APPS_NOT_AVAILABLE)"
                echo ""
                echo "is optional, but its range is {\"\",\"f\",\"t\"},"
                echo "without the quotation marks."
                echo "GUID=='6ba5b510-392c-4fbb-8349-32f0401095e7'"
                echo ""
                #----
                cd $S_FP_ORIG
                exit 1 # exit with error
            fi
        fi
    else # $SB_OK_TO_USE_RM_IF_SHREDDING_APPS_NOT_AVAILABLE == ""
        SB_OK_TO_USE_RM_IF_SHREDDING_APPS_NOT_AVAILABLE="f"
    fi
    #--------------------
    # Declarations:
    local SB_THROW=""
    local SB_USE_RUBY=""
    local S_CMD=""
    local S_GUID=""
    local S_TMP_0=""
    local S_TMP_1=""
    local S_TMP_2=""
    local SI_0="-9999"
    local SI_1="-9999"
    local S_SHREDDER_APPLICATION_NAME=""
    local S_FP_PWD_BEFORE_SHREDDING=""
    #--------------------
    # Mode selection:
    if [ "$S_FUNC_MMMV_SHRED_T1_MODE" == "" ] ; then
        SB_EXISTS_ON_PATH_T1_RESULT="f"  # if-block init
        #----
        if [ "$SB_EXISTS_ON_PATH_T1_RESULT" == "f" ] ; then
            S_TMP_0="shred" # Linux version
            func_sb_exists_on_path_t1 "$S_TMP_0" 
            if [ "$SB_EXISTS_ON_PATH_T1_RESULT" == "t" ] ; then
                 S_FUNC_MMMV_SHRED_T1_MODE="$S_TMP_0"
            fi
        fi
        #----
        if [ "$SB_EXISTS_ON_PATH_T1_RESULT" == "f" ] ; then
            S_TMP_0="gshred" # BSD version
            func_sb_exists_on_path_t1 "$S_TMP_0" 
            if [ "$SB_EXISTS_ON_PATH_T1_RESULT" == "t" ] ; then
                 S_FUNC_MMMV_SHRED_T1_MODE="$S_TMP_0"
            fi
        fi
        #----
        if [ "$SB_EXISTS_ON_PATH_T1_RESULT" == "f" ] ; then
            if [ "$SB_OK_TO_USE_RM_IF_SHREDDING_APPS_NOT_AVAILABLE" == "t" ] ; then
                S_TMP_0="rm" # a shoddy compromise version for exeptional cases
                func_sb_exists_on_path_t1 "$S_TMP_0" 
                if [ "$SB_EXISTS_ON_PATH_T1_RESULT" == "t" ] ; then
                    func_mmmv_operating_system_type_t1
                    if [ "$S_FUNC_MMMV_OPERATING_SYSTEM_TYPE_T1_RESULT" != "BSD" ]; then
                         S_FUNC_MMMV_SHRED_T1_MODE="rm_BSD"
                    else # Linux and all the rest
                         S_FUNC_MMMV_SHRED_T1_MODE="rm_plain"
                    fi
                else
                    echo ""
                    echo "Something is wrong at the operating system "
                    echo "environment setup. All UNIX-like operating systems "
                    echo "and their emulators "
                    echo "are expected to have the \"rm\" command."
                    echo ""
                    echo "    \$(which rm)==\"`which rm`\""
                    echo ""
                    echo "    PATH=$PATH" # will be a huge string
                    echo ""
                    echo "GUID=='6c330e45-b39c-4e81-a249-32f0401095e7'"
                    echo ""
                    #----
                    cd $S_FP_ORIG
                    exit 1 # exit with error
                fi
            fi
        fi
        #--------
        if [ "$S_FUNC_MMMV_SHRED_T1_MODE" == "" ] ; then
            echo ""
            echo "All of the file shredding implementations that this script " 
            echo "is capable of using (shred, gshred) "
            echo "are missing from the PATH."
            echo "GUID=='11c34dad-a66a-462f-9549-32f0401095e7'"
            echo ""
            #----
            cd $S_FP_ORIG
            exit 1 # exit with error
        fi
        #--------
        if [ "$?" != "0" ]; then
            func_exit_with_an_error_t1 "54262355-45be-42b6-9159-32f0401095e7"
        fi
        #--------
    fi
    #--------------------
    S_TMP_0=$(echo $S_FP_IN | gawk '{gsub(/^[\/]/,""); printf "%s",$1 }')
    if [ "$S_TMP_0" == "$S_FP_IN" ]; then
        echo "" 
        echo "The path is expected to be an absolute path, "
        echo "but currently it is not."
        echo "    S_FP_IN==$S_FP_IN"
        echo "GUID=='9c2f1518-2536-48fc-b149-32f0401095e7'"
        echo ""
        #----
        cd $S_FP_ORIG
        exit 1 # exit with an error
    fi
    #--------
    if [ -h $S_FP_IN ]; then 
        # The control flow is in here regardless of
        # whether the symbolic link is broken or not.
        # If the path is to a non-existing file/link/folder,
        # then the control flow will not enter this branch.
        echo ""
        echo "The "
        echo "    S_FP_IN=$S_FP_IN"
        echo "is a symbolic link, but it is expected to "
        echo "be a file or a folder."
        echo "GUID=='229ef438-ad90-4350-b149-32f0401095e7'"
        echo ""
        #----
        cd $S_FP_ORIG
        exit 1 # exit with error
    fi
    if [ ! -e $S_FP_IN ]; then
        echo ""
        echo "The "
        echo "    S_FP_IN=$S_FP_IN"
        echo "does not exist."
        echo "GUID=='405f68d4-37d7-4406-9249-32f0401095e7'"
        echo ""
        #----
        cd $S_FP_ORIG
        exit 1 # exit with error
    fi
    #--------
    if [ -d $S_FP_IN ]; then
        #--------start--of--sub-path--check----
        # If the $S_FP_IN is a folder, then the `pwd` 
        # should not be a sub-path or a path of the 
        # folder that is being deleted.
        S_TMP_0="`cd $S_FP_IN;pwd`/"  
        S_TMP_1="`pwd`/"
        #----
        if [ "$S_TMP_0" == "$S_TMP_1" ]; then
            if [ ! -d $S_FP_IN ]; then
                echo ""
                echo "This Bash script is flawed. "
                echo "    S_FP_IN=$S_FP_IN"
                echo "GUID=='d0906c21-e07a-4705-8339-32f0401095e7'"
                echo ""
                #----
                cd $S_FP_ORIG
                exit 1
            fi
            #----
            echo ""
            echo "The working directory, "
            echo ""
            echo "    PWD=$PWD"
            echo ""
            echo "equals with the folder that is being deleted."
            echo ""
            echo "    S_TMP_0=$S_TMP_0"
            echo ""
            echo "    S_FP_IN=$S_FP_IN"
            echo ""
            echo "GUID=='eaae9544-921b-4b8c-8339-32f0401095e7'"
            echo ""
            #----
            cd $S_FP_ORIG
            exit 1 # exit with error
        fi
        #----
        # If the normalized $S_FP_IN is a folder and 
        # the "`pwd`/" is shorter than the normalized $S_FP_IN, then,
        # with the exceptions of some symbolic links, 
        # the "`pwd`/" can not be equal to the normalized $S_FP_IN, 
        # nor can the "`pwd`/" be a folder that is a sub-folder 
        # of the $S_FP_IN.
        # 
        # The paht lenght code is:
        # 
        #     SI_0="` echo \"$S_TMP_0\" | gawk '{i=length;printf "%s", i }' `" # S_FP_IN
        #     SI_1="` echo \"$S_TMP_1\" | gawk '{i=length;printf "%s", i }' `" # pwd
        #     if [ "$SI_0" -lt "$SI_1" ]; then  # $SI_0 < $SI_1
        #        #echo "$SI_0 < $SI_1"
        #        #
        #        # In here the length of the normalized form of the $S_FP_IN
        #        # is shorter than the "`pwd`/" and therefore the working directory
        #        # has a greater probability to be at a sub-path of the $S_FP_IN.
        #        
        #        <
        #         A lot of Ruby code, because 
        #         the gawk code will have trouble with folders that 
        #         contain spaces and other special characters
        #         >
        #    fi
        #
        # but unfortunately the Ruby code that uses 
        # temporary files and the String.index would be 
        # unstable due to the 
        #
        #     https://bugs.ruby-lang.org/issues/12710
        #     https://archive.is/AJpgL
        # 
        # Add to that the fact that this Bash function
        # would be much more appealing, if it did not launch
        # any 40BiB sized interpreters like the Ruby interpreter (in 2016)
        # and the temptation to just skip testing, whether the 
        # working directory (`pwd`) resides at a directory that
        # is a sub-path of the $S_FP_IN, grows even higher.
        # So, for the time being that check is omitted from here. 
        #
        # TODO: If the year is at least 2020, then try to find out, 
        #       whether there's some elegant way to implement that check.
        #
        # A code fragment for later consideration:
        #     S_TMP_2="`echo \"$S_TMP_0\" | gawk '{gsub(/\s/,\"NotASpace\");printf \"%s\", \$1 }' `"
        #     if [ "$S_TMP_2" != "$S_TMP_0" ]; then
        #         # S_TMP_0 contains strings
        #         SB_USE_RUBY="t"
        #     fi
        #--------end--of--sub-path--check----
    fi
    #--------------------
    S_FP_PWD_BEFORE_SHREDDING="`pwd`"
    S_CMD="" # to be sure
    #--------------------
    S_TMP_0="cd $S_FP_IN ; nice -n 10 find . -name '*' | nice -n 10 xargs "
    # The space after the "cd $S_FP_IN" and before the ";" is compulsory.
    #----
    # The "2>/dev/null" after the shredding/deletion command
    # is to hide the file permissions related error messages.
    # The failure is detected by studying file existence.
    #--------------------
    if [ "$S_FUNC_MMMV_SHRED_T1_MODE" == "shred" ]; then
        S_SHREDDER_APPLICATION_NAME="shred"
        if [ -d $S_FP_IN ]; then
            S_CMD="$S_TMP_0 \
                   $S_SHREDDER_APPLICATION_NAME -f --remove 2>/dev/null "
        else
            S_CMD="nice -n 10 $S_SHREDDER_APPLICATION_NAME -f --remove $S_FP_IN 2>/dev/null "
        fi
    fi
    #----
    if [ "$S_FUNC_MMMV_SHRED_T1_MODE" == "gshred" ]; then
        S_SHREDDER_APPLICATION_NAME="gshred"
        if [ -d $S_FP_IN ]; then
            S_CMD="$S_TMP_0 \
                   $S_SHREDDER_APPLICATION_NAME --force --iterations=2 --remove -z 2>/dev/null "
        else
            S_CMD="nice -n 10 \
                   $S_SHREDDER_APPLICATION_NAME --force --iterations=2 --remove -z $S_FP_IN 2>/dev/null "
        fi
    fi
    #----
    # The "rm" on Linux and BSD differ, 
    # a bit like the "ps" # on Linux and BSD differ.
    # The "rm -f -P foo" overwrites the file with NON-random 
    # values before deleting.
    # The "rm -f    foo" works, whenever the "rm" is called by the file owner.
    # The "rm -f -P foo" requires write permissions even, 
    # if the "rm" is called by the file owner.
    if [ "$S_FUNC_MMMV_SHRED_T1_MODE" == "rm_BSD" ]; then
        S_SHREDDER_APPLICATION_NAME="rm"
        if [ -d $S_FP_IN ]; then
            S_CMD="$S_TMP_0 \
            $S_SHREDDER_APPLICATION_NAME -f -P $S_FP_IN 2>/dev/null "
        else
            S_CMD="nice -n 10 $S_SHREDDER_APPLICATION_NAME -f -P $S_FP_IN 2>/dev/null "
        fi
    fi
    if [ "$S_FUNC_MMMV_SHRED_T1_MODE" == "rm_plain" ]; then
        # The "rm -f    foo" seems to be universally available
        # at all UNIX-like environments.
        S_SHREDDER_APPLICATION_NAME="rm"
        if [ -d $S_FP_IN ]; then
            S_CMD="$S_TMP_0 \
            $S_SHREDDER_APPLICATION_NAME -f $S_FP_IN 2>/dev/null "
        else
            S_CMD="nice -n 10 $S_SHREDDER_APPLICATION_NAME -f $S_FP_IN 2>/dev/null "
        fi
    fi
    #--------------------
    eval "$S_CMD" # the "eval" is required due to the command "find"
    cd $S_FP_PWD_BEFORE_SHREDDING # required if the $S_FP_IN  was a folder
    if [ -e $S_FP_IN ]; then 
        # If the control flow is here, then the $S_FP_IN was 
        # a folder or the deletion failed or both.
        chmod -f -R 0700 $S_FP_IN  # chmod 0777 would introduce s security flaw
        eval "$S_CMD" # the "eval" is required due to the command "find"
        cd $S_FP_PWD_BEFORE_SHREDDING
        #----
        SB_THROW="f"
        if [ -d $S_FP_IN ]; then 
            S_TMP_0="`cd $S_FP_IN; pwd`" # "./home///foo" -> "/home/foo"
            # Checks are intentionally missing to 
            # allow this Bash function to be universal, without exceptions.
            #----
            cd $S_TMP_0
            S_TMP_1="`find . -name '*' | \
                      xargs file --mime-type | \
                      grep -v directory | grep -v folder `"
                    # The   file --mime-type foo
                    # works on both, Linux and BSD. 
            cd $S_FP_PWD_BEFORE_SHREDDING
            #----
            if [ "$S_TMP_1" == "" ]; then
                rm -fr $S_TMP_0
            else
                SB_THROW="t"
                S_GUID="'4040bb55-19cf-4991-ac39-32f0401095e7'"
            fi
        fi
        #----
        if [ "$SB_THROW" == "f" ]; then # to avoid overwriting the S_GUID
            if [ -e $S_FP_IN ]; then
                SB_THROW="t"
                S_GUID="'d315b239-a076-47f1-8239-32f0401095e7'"
            fi 
        fi 
        if [ "$SB_THROW" == "t" ]; then
            echo ""
            echo "The deletion failed even after the "
            echo ""
            echo "    chmod -f -R 0700 $S_FP_IN "
            echo ""
            echo "The "
            echo ""
            echo "    chmod 0777 "
            echo ""
            echo "is not done automatically in this "
            echo "Bash function, because "
            echo "it might introduce a security flaw."
            echo ""
            echo "    S_FUNC_MMMV_SHRED_T1_MODE=$S_FUNC_MMMV_SHRED_T1_MODE"
            echo ""
            echo "    S_CMD=$S_CMD"
            echo ""
            echo "GUID==$S_GUID"
            echo "GUID=='05a408f8-c2a3-42a5-a139-32f0401095e7'"
            echo ""
            #----
            cd $S_FP_ORIG
            exit 1 # exit with error
        fi
    fi
    S_GUID="'1f429303-abbe-4656-a939-32f0401095e7'" #counters S_GUID related flaws
    #--------------------
    if [ -e $S_FP_IN ]; then
        echo ""
        echo "The deletion of the "
        echo "    S_FP_IN=$S_FP_IN"
        echo "failed or the file or folder was re-created by "
        echo "some other process before this file existance check."
        echo "GUID=='49a74669-801d-4331-8139-32f0401095e7'"
        echo ""
        #----
        cd $S_FP_ORIG
        exit 1 # exit with error
    fi
    #--------------------
    cd $S_FP_PWD_BEFORE_SHREDDING
} # func_mmmv_shred_t1


#--------------------------------------------------------------------------
# The 
#
#     /tmp
#
# might be mounted to the same partition that contains the root folder, the "/",  
# but the root folder partition might be smaller than the data storage 
# partitions. To overcome that issue, this script should try 
# to use the same partition, where the Fossil repository file
# is stored, which is at the same folder where this script is stored. 
# The avoidance of the "/tmp", which is readable to everybody, is just
# a security bonus. 
#
# The SQLite within the Fossil uses a lot of temporary space 
# during cloning, after all of the artifacts have been downloaded.
# The default location for the temporary SQLite files is the "/tmp",
# but the folder path for the SQLite temporary files can be
# modified by setting the  SQLITE_TMPDIR environment variable.
# If the partition that contains the folder that stores the
# SQLite temporary files has less space than SQLite needs,
# the cloning fails. 


MMMV_FP_FOSSIL_OPERATOR_TMP="/tmp" # The default value.
if [ -e $S_FP_DIR/tmp_ ]; then 
    MMMV_FP_FOSSIL_OPERATOR_TMP="$S_FP_DIR/tmp_"
else
    if [ -e $S_FP_DIR/tmp ]; then 
        MMMV_FP_FOSSIL_OPERATOR_TMP="$S_FP_DIR/tmp"
    else
        if [ -e $HOME/tmp_ ]; then 
            MMMV_FP_FOSSIL_OPERATOR_TMP="$HOME/tmp_"
        else
            if [ -e $HOME/tmp ]; then 
                MMMV_FP_FOSSIL_OPERATOR_TMP="$HOME/tmp"
            fi
        fi
    fi
fi

# The SQLITE_TMPDIR must be set before the Fossil
# is executed.
export SQLITE_TMPDIR="$MMMV_FP_FOSSIL_OPERATOR_TMP"

# TODO: Add a check here that verifies that there's enough 
#       space available at the partition that is used by the 
#       SQLite. If there's insufficient amount of free space,
#       then this script should exit without executing the 
#       fossil console application. The error message should 
#       explain the possibility to set the SQLITE_TMPDIR and/or
#       the SQLITE_TMPDIR related circumstances. 

#--------------------------------------------------------------------------
S_TMP_0=""
S_ACTIVITY_OF_THIS_SCRIPT=$1
S_URL_REMOTE_REPOSITORY=""
SB_EXIT_WITH_ERROR="f"

# needed for scriptability
S_ARGNAME_ACTIVITY_SHRED_ARG_2="do_not_prompt_for_confirmation" 

fun_print_msg_t1() {
    echo ""
    echo "The second console argument "
    echo "is expected to be the URL of the remote repository."
} # fun_print_msg_t1


fun_exit_without_any_errors_t1() {
    local X_SKIP_MESSAGE="$1"
    if [ "$X_SKIP_MESSAGE" == "" ]; then
        echo ""
        echo "Aborting script without doing anything."
        echo ""
    fi 
    #----
    cd $S_FP_ORIG
    exit 0
} # fun_exit_without_any_errors_t1

#--------------------------------------------------------------------------

SB_FUNC_MMMV_ASSERT_FILE_PATHS_DIFFER_T1_ASSERTION_FAILED="f"
func_mmmv_assert_file_paths_differ_t1(){
    local S_FP_0="$1"
    local S_FP_1="$2"
    local S_GUID="$3"
    local SB_DO_NOT_TRHOW_ON_ASSERTION_FAILURE="$4" # domain: {"","f","t"}
    #--------
    if [ "$SB_DO_NOT_TRHOW_ON_ASSERTION_FAILURE" != "" ] ; then
        if [ "$SB_DO_NOT_TRHOW_ON_ASSERTION_FAILURE" != "t" ] ; then
            if [ "$SB_DO_NOT_TRHOW_ON_ASSERTION_FAILURE" != "f" ] ; then
                echo ""
                echo "The fourth parameter of this function, the "
                echo ""
                echo "    SB_DO_NOT_TRHOW_ON_ASSERTION_FAILURE(==$SB_DO_NOT_TRHOW_ON_ASSERTION_FAILURE)"
                echo ""
                echo "is optional, but its range is {\"\",\"f\",\"t\"},"
                echo "without the quotation marks."
                echo "GUID=='2b626a11-351b-4212-9239-32f0401095e7'"
                echo ""
                #----
                cd $S_FP_ORIG
                exit 1 # exit with error
            fi
        fi
    else # $SB_DO_NOT_TRHOW_ON_ASSERTION_FAILURE == ""
        SB_DO_NOT_TRHOW_ON_ASSERTION_FAILURE="f"
    fi
    SB_FUNC_MMMV_ASSERT_FILE_PATHS_DIFFER_T1_ASSERTION_FAILED="f" # global
    #--------
    # The block of if-else statements for comparing the 2 paths
    # is so error prone to write that this function is written 
    # according to a schematic that resides at:
    # http://longterm.softf1.com/documentation_fragments/2016_09_03_comparison_of_file_paths_t1/
    # https://archive.is/R4yw9
    #--------
    # Declarations:
    local S_GUID_CRAWL="S_GUID_CRAWL not set" # tree crawling at the schematic
    local S_GUID_CMP="S_GUID_CMP not set"     # comparison at tree leaf
                                              # Some leaves are equivalent.
    local S_COMPARISON_MODE="" 
    local SB_THROW="f" 
    local SB_ASSERTION_FAILED="f" 
    local SB_STR0="f" # whether S_FP_0 is compared purely as a string
    local SB_STR1="f" # whether S_FP_1 is compared purely as a string
    local S_FP_0_STR="$S_FP_0" 
    local S_FP_1_STR="$S_FP_1"
    local S_FP_X="" # a temporary variable for holding path value
    local S_RUBY_SRC_0=""
    #--------
    if [ "$S_FP_0" == "$S_FP_1" ]; then 
        # Covers also the case, where both are existing 
        # folders, but the paths to them contains "../".
        # By making the string comparison to be the first thing tried 
        # a few file system accesses might be saved.
        SB_ASSERTION_FAILED="t"
        S_GUID_CRAWL="2ca224eb-bb9b-4af9-9259-32f0401095e7"
        S_GUID_CMP="1e8fbb42-19d2-4f8b-b559-32f0401095e7"
    else # the rest of the 3 comparison modes
        #--------
        if [ -e $S_FP_0 ]; then 
            if [ -d $S_FP_0 ]; then 
                if [ -e $S_FP_1 ]; then 
                    if [ -d $S_FP_1 ]; then 
                        S_COMPARISON_MODE="cmode_cd0_cd1"
                    else 
                        S_COMPARISON_MODE="cmode_cd0_str1"
                        SB_STR1="t"
                    fi 
                else 
                    S_COMPARISON_MODE="cmode_cd0_str1"
                    SB_STR1="t"
                fi
            else 
                if [ -e $S_FP_1 ]; then 
                    if [ -d $S_FP_1 ]; then 
                        S_COMPARISON_MODE="cmode_str0_cd1"
                        SB_STR0="t"
                    else 
                        S_COMPARISON_MODE="cmode_str0_str1"
                        SB_STR0="t"
                        SB_STR1="t"
                    fi 
                else 
                    S_COMPARISON_MODE="cmode_str0_str1"
                    SB_STR0="t"
                    SB_STR1="t"
                fi
            fi
        else # $S_FP_0 is missing or it is a broken symbolic link
            if [ -e $S_FP_1 ]; then 
                if [ -d $S_FP_1 ]; then 
                    S_COMPARISON_MODE="cmode_str0_cd1"
                    SB_STR0="t"
                else 
                    S_COMPARISON_MODE="cmode_str0_str1"
                    SB_STR0="t"
                    SB_STR1="t"
                fi
            else 
                S_COMPARISON_MODE="cmode_str0_str1"
                SB_STR0="t"
                SB_STR1="t"
            fi
        fi
        #----------------        
        # The "cmode_str0_str1" was tried 
        # at the first if-clause of the block, but 
        # that does not catch equivalent cases like 
        #
        #     S_FP_0="`pwd`/././////a_nonexisting_file_or_folder"
        #     S_FP_1="`pwd`/a_nonexisting_file_or_folder"
        #
        #     S_FP_0="./a_nonexisting_file_or_folder"
        #     S_FP_1="././././././a_nonexisting_file_or_folder"
        #
        #     S_FP_0="/a_nonexisting_file_or_folder"
        #     S_FP_1="/////a_nonexisting_file_or_folder"
        #
        #     S_FP_0="/a_nonexisting_file_or_folder"
        #     S_FP_1="/..///../a_nonexisting_file_or_folder"
        #
        # String normalization is required whenever at least
        # one of the paths is used at comparison 
        # purely as a string.
        #
        #----start-of-Ruby-script-header--for-copy/pasting----
        #    #!/usr/bin/env ruby
        #    
        #    s_fp_0="./a_nonexisting_file_or_folder"
        #    s_fp_1="././..//../.././a_nonexisting_file_or_folder"
        #    
        #    # The path "/../foo" is equivalent to "/foo".
        #    s_fp_2="/././..//../.././a_nonexisting_file_or_folder"
        #    
        #    # This script does not cover the case, 
        #    # where "./aa/../bb" is equivalent to "./bb"
        #----end---of-Ruby-script-header-for-copy/pasting----
        S_RUBY_SRC_0="\
            s_0='';\
            s_1=ARGV[0].to_s;\
            rgx_0=/[\\/][.][\\/]/;\
            rgx_1=/^[.][\\/]/;\
            rgx_2=/^[\\/][.][.][\\/]/;\
            i_4safety=0;\
            while s_0!=s_1 do ;\
               s_0=s_1;\
               s_1=s_0.gsub(rgx_0,'/');\
               i_4safety=i_4safety+1;\
               if 10000<i_4safety then ;\
                  raise(Exception.new('boo'));\
               end;\
            end ;\
            s_0=s_1;\
            s_1=s_0.gsub(rgx_1,'');\
            s_0=s_1;\
            s_1=s_0.gsub(/[\\/]+/,'/');\
            ;\
            ;\
            i_4safety=0;\
            while s_0!=s_1 do ;\
               s_0=s_1;\
               s_1=s_0.gsub(rgx_2,'/');\
               i_4safety=i_4safety+1;\
               if 10000<i_4safety then ;\
                  raise(Exception.new('62a58245-ff69-43ad-a429-32f0401095e7'));\
               end;\
            end ;\
            s_0=s_1;\
            s_1=s_0.gsub(rgx_1,'');\
            s_0=s_1;\
            s_1=s_0.gsub(/[\\/]+/,'/');\
            ;\
            print s_1;\
            "
        #----
        if [ "$SB_STR0" == "t" ]; then 
            S_FP_0_STR="`ruby -e \"$S_RUBY_SRC_0\" $S_FP_0`"
        fi
        if [ "$SB_STR1" == "t" ]; then 
            S_FP_1_STR="`ruby -e \"$S_RUBY_SRC_0\" $S_FP_1`"
        fi
        #----------------        
        if [ "$S_COMPARISON_MODE" == "cmode_cd0_str1" ]; then 
            # 2 cases at the schematic
            S_FP_X="`cd $S_FP_0;pwd`"
            if [ "$S_FP_X" == "$S_FP_1_STR" ]; then 
                SB_ASSERTION_FAILED="t"
                S_GUID_CMP="140bc381-ed2c-4b3f-8759-32f0401095e7"
            fi
            if [ "$SB_ASSERTION_FAILED" != "t" ]; then 
                if [ "$S_FP_X" == "$S_FP_1" ]; then # just in case
                    SB_ASSERTION_FAILED="t"
                    S_GUID_CMP="17f2b621-a9b5-45a7-8159-32f0401095e7"
                fi
            fi
        else
            if [ "$S_COMPARISON_MODE" == "cmode_str0_cd1" ]; then 
                # 2 cases at the schematic
                S_FP_X="`cd $S_FP_1;pwd`"
                if [ "$S_FP_0_STR" == "$S_FP_X" ]; then 
                    SB_ASSERTION_FAILED="t"
                    S_GUID_CMP="5884fe9d-37d1-4432-8559-32f0401095e7"
                fi
                if [ "$SB_ASSERTION_FAILED" != "t" ]; then 
                    if [ "$S_FP_0" == "$S_FP_X" ]; then # just in case
                        SB_ASSERTION_FAILED="t"
                        S_GUID_CMP="a970be5f-c137-48b6-9259-32f0401095e7"
                    fi
                fi
            else
                if [ "$S_COMPARISON_MODE" == "cmode_cd0_cd1" ]; then 
                    if [ "`cd $S_FP_0;pwd`" == "`cd $S_FP_1;pwd`" ]; then 
                        SB_ASSERTION_FAILED="t"
                        S_GUID_CMP="402a9024-5606-4ff6-9259-32f0401095e7"
                    fi
                else 
                    if [ "$S_COMPARISON_MODE" == "cmode_str0_str1" ]; then 
                        if [ "$S_FP_0_STR" == "$S_FP_1_STR" ]; then 
                            SB_ASSERTION_FAILED="t"
                            S_GUID_CMP="27681234-aefa-465e-9159-32f0401095e7"
                        fi
                        # The if [ "$S_FP_0" == "$S_FP_1" ] ...
                        # has already been tried at the very start 
                        # of the huge if-block.
                    else
                        echo ""
                        echo "This script is flawed."
                        echo ""
                        echo "    S_FP_0=$S_FP_0"
                        echo "    S_FP_1=$S_FP_1"
                        echo "    S_GUID_CRAWL=$S_GUID_CRAWL"
                        echo "    S_GUID_CMP=$S_GUID_CMP"
                        echo "    S_COMPARISON_MODE=$S_COMPARISON_MODE"
                        echo ""
                        echo "GUID=='6ef6b753-4f47-4b54-9229-32f0401095e7'"
                        echo ""
                        #----
                        cd $S_FP_ORIG
                        exit 1 # exit with error
                    fi
                fi
            fi
        fi
    fi
    #--------
    SB_FUNC_MMMV_ASSERT_FILE_PATHS_DIFFER_T1_ASSERTION_FAILED="$SB_ASSERTION_FAILED" # global
    if [ "$SB_ASSERTION_FAILED" == "t" ]; then 
        if [ "$SB_DO_NOT_TRHOW_ON_ASSERTION_FAILURE" != "t" ]; then
            echo ""
            echo "The file paths "
            echo ""
            echo "    S_FP_0=$S_FP_0"
            echo ""
            echo "    S_FP_1=$S_FP_1"
            echo ""
            echo "are required to differ and "
            echo "they are required to differ also after normalization."
            echo ""
            echo "GUID=='51bface5-f664-46b8-a629-32f0401095e7'"
            echo "GUID=='$S_GUID_CMP'"   # comparison
            echo "GUID=='$S_GUID_CRAWL'" # tree crawling at the schematic
            if [ "$S_GUID" != "" ]; then 
                echo "GUID=='$S_GUID'"   # GUID as an input parameter
            fi
            echo ""
            #----
            cd $S_FP_ORIG
            exit 1 # exit with error
        fi
    fi
} # func_mmmv_assert_file_paths_differ_t1


#--------------------------------------------------------------------------
# Activity aliases for comfort.

if [ "$S_ACTIVITY_OF_THIS_SCRIPT" == "up" ]; then
    S_ACTIVITY_OF_THIS_SCRIPT="overwrite_remote_files_and_local_wiki"
fi
if [ "$S_ACTIVITY_OF_THIS_SCRIPT" == "upload" ]; then
    S_ACTIVITY_OF_THIS_SCRIPT="overwrite_remote_files_and_local_wiki"
fi
if [ "$S_ACTIVITY_OF_THIS_SCRIPT" == "ci" ]; then
    S_ACTIVITY_OF_THIS_SCRIPT="overwrite_remote_files_and_local_wiki"
fi
#--------
if [ "$S_ACTIVITY_OF_THIS_SCRIPT" == "down" ]; then
    S_ACTIVITY_OF_THIS_SCRIPT="overwrite_local_with_remote"
fi
if [ "$S_ACTIVITY_OF_THIS_SCRIPT" == "download" ]; then
    S_ACTIVITY_OF_THIS_SCRIPT="overwrite_local_with_remote"
fi
#--------
if [ "$S_ACTIVITY_OF_THIS_SCRIPT" == "co" ]; then
    S_ACTIVITY_OF_THIS_SCRIPT="clone_all"
fi
#--------
if [ "$S_ACTIVITY_OF_THIS_SCRIPT" == "?" ]; then
    S_ACTIVITY_OF_THIS_SCRIPT="help"
fi
if [ "$S_ACTIVITY_OF_THIS_SCRIPT" == "-?" ]; then
    S_ACTIVITY_OF_THIS_SCRIPT="help"
fi
if [ "$S_ACTIVITY_OF_THIS_SCRIPT" == "-h" ]; then
    S_ACTIVITY_OF_THIS_SCRIPT="help"
fi
if [ "$S_ACTIVITY_OF_THIS_SCRIPT" == "--help" ]; then
    S_ACTIVITY_OF_THIS_SCRIPT="help"
fi
if [ "$S_ACTIVITY_OF_THIS_SCRIPT" == "-help" ]; then
    S_ACTIVITY_OF_THIS_SCRIPT="help"
fi
#--------
if [ "$S_ACTIVITY_OF_THIS_SCRIPT" == "rm" ]; then
    S_ACTIVITY_OF_THIS_SCRIPT="delete_local_copy"
fi
if [ "$S_ACTIVITY_OF_THIS_SCRIPT" == "del" ]; then
    S_ACTIVITY_OF_THIS_SCRIPT="delete_local_copy"
fi
if [ "$S_ACTIVITY_OF_THIS_SCRIPT" == "delete" ]; then
    S_ACTIVITY_OF_THIS_SCRIPT="delete_local_copy"
fi
#--------
if [ "$S_ACTIVITY_OF_THIS_SCRIPT" == "info" ]; then
    S_ACTIVITY_OF_THIS_SCRIPT="about"
fi
if [ "$S_ACTIVITY_OF_THIS_SCRIPT" == "--info" ]; then
    S_ACTIVITY_OF_THIS_SCRIPT="about"
fi
if [ "$S_ACTIVITY_OF_THIS_SCRIPT" == "-info" ]; then
    S_ACTIVITY_OF_THIS_SCRIPT="about"
fi
if [ "$S_ACTIVITY_OF_THIS_SCRIPT" == "--about" ]; then
    S_ACTIVITY_OF_THIS_SCRIPT="about"
fi
if [ "$S_ACTIVITY_OF_THIS_SCRIPT" == "-about" ]; then
    S_ACTIVITY_OF_THIS_SCRIPT="about"
fi
#--------
if [ "$S_ACTIVITY_OF_THIS_SCRIPT" == "--print_script_version" ]; then
    S_ACTIVITY_OF_THIS_SCRIPT="print_script_version"
fi
if [ "$S_ACTIVITY_OF_THIS_SCRIPT" == "--script_version" ]; then
    S_ACTIVITY_OF_THIS_SCRIPT="print_script_version"
fi
if [ "$S_ACTIVITY_OF_THIS_SCRIPT" == "v" ]; then
    S_ACTIVITY_OF_THIS_SCRIPT="print_script_version"
fi
if [ "$S_ACTIVITY_OF_THIS_SCRIPT" == "-v" ]; then
    S_ACTIVITY_OF_THIS_SCRIPT="print_script_version"
fi
if [ "$S_ACTIVITY_OF_THIS_SCRIPT" == "version" ]; then
    S_ACTIVITY_OF_THIS_SCRIPT="print_script_version"
fi
if [ "$S_ACTIVITY_OF_THIS_SCRIPT" == "--version" ]; then
    S_ACTIVITY_OF_THIS_SCRIPT="print_script_version"
fi
#--------------------------------------------------------------------------
if [ "$S_ACTIVITY_OF_THIS_SCRIPT" == "about" ]; then
    echo ""
    echo "    The initial version of this script has been written by "
    echo "    Martin.Vahi@softf1.com         "
    echo "    in 2016_02. The initial version is in public domain."
    echo "    The command \"help\" offers more information. "
    echo ""
    echo "    Thank You for using this script :-)"
    echo ""
    echo ""
    fun_exit_without_any_errors_t1 "t"
fi 
#--------------------------------------------------------------------------
if [ "$S_ACTIVITY_OF_THIS_SCRIPT" == "exit" ]; then
    fun_exit_without_any_errors_t1
else
    if [ "$S_ACTIVITY_OF_THIS_SCRIPT" == "clone_all" ]; then
        if [ "$2" == "" ]; then
            fun_print_msg_t1
            S_ACTIVITY_OF_THIS_SCRIPT="help"
            SB_EXIT_WITH_ERROR="t"
        else
            S_URL_REMOTE_REPOSITORY="$2"
        fi
    else
        if [ "$S_ACTIVITY_OF_THIS_SCRIPT" == "clone_public" ]; then
            if [ "$2" == "" ]; then
                fun_print_msg_t1
                S_ACTIVITY_OF_THIS_SCRIPT="help"
                SB_EXIT_WITH_ERROR="t"
            else
                S_URL_REMOTE_REPOSITORY="$2"
            fi
        else
            if [ "$S_ACTIVITY_OF_THIS_SCRIPT" != "overwrite_local_with_remote" ]; then
                if [ "$S_ACTIVITY_OF_THIS_SCRIPT" == "overwrite_remote_files_and_local_wiki" ]; then
                    if [ "$2" != "" ]; then
                        if [ "$2" == "use_autogenerated_commit_message" ]; then
                            if [ "$3" != "" ]; then
                                echo ""
                                echo "If the first console argument is \"overwrite_remote_files_and_local_wiki\" and"
                                echo "the second console argument is \"use_autogenerated_commit_message\", "
                                echo "then there should not be a 3. console argument."
                                echo "GUID=='1b586401-d67b-4392-b429-32f0401095e7'"
                                S_ACTIVITY_OF_THIS_SCRIPT="help"
                                SB_EXIT_WITH_ERROR="t"
                            fi
                        else
                            if [ "$2" == "read_commit_message_from_file" ]; then
                                S_FP_MESSAGE_FILE_CANDIDATE="$3" # file path candidate
                                if [ "$S_FP_MESSAGE_FILE_CANDIDATE" == "" ]; then
                                    echo ""
                                    echo "If the first console argument is "
                                    echo "\"overwrite_remote_files_and_local_wiki\" and"
                                    echo "the second console argument is "
                                    echo "\"read_commit_message_from_file\", "
                                    echo "then there should be also a 3. console argument "
                                    echo "that is expected to be a file path to a text file."
                                    echo "GUID=='9366ff48-594f-43e5-b129-32f0401095e7'"
                                    S_ACTIVITY_OF_THIS_SCRIPT="help"
                                    SB_EXIT_WITH_ERROR="t"
                                fi
                                if [ "$SB_EXIT_WITH_ERROR" == "f" ]; then
                                    if [ "$4" != "" ]; then
                                        echo ""
                                        echo "If the first console argument is "
                                        echo "\"overwrite_remote_files_and_local_wiki\" and"
                                        echo "the second console argument is "
                                        echo "\"read_commit_message_from_file\", "
                                        echo "then there should be exactly 3. console arguments, "
                                        echo "not 4 or more. Unfortunately the 4. argument is currently "
                                        echo "---citation--start---"
                                        echo "$4"
                                        echo "---citation--end-----"
                                        echo "GUID=='2bfcad29-cf5a-407a-8429-32f0401095e7'"
                                        S_ACTIVITY_OF_THIS_SCRIPT="help"
                                        SB_EXIT_WITH_ERROR="t"
                                    fi
                                fi
                                if [ "$SB_EXIT_WITH_ERROR" == "f" ]; then
                                    if [ ! -e "$S_FP_MESSAGE_FILE_CANDIDATE" ]; then 
                                        echo ""
                                        echo "The commit message file path candidate "
                                        echo "references either a missing file or "
                                        echo "a broken symlink."
                                        echo "GUID=='8f3c4f20-8b76-4492-9529-32f0401095e7'"
                                        S_ACTIVITY_OF_THIS_SCRIPT="help"
                                        SB_EXIT_WITH_ERROR="t"
                                    fi
                                fi 
                                if [ "$SB_EXIT_WITH_ERROR" == "f" ]; then
                                    if [ -d "$S_FP_MESSAGE_FILE_CANDIDATE" ]; then 
                                        echo ""
                                        echo "The commit message file path candidate "
                                        echo "references a folder, but it should "
                                        echo "reference a text file."
                                        echo "GUID=='21bc46c1-3c7f-42df-a419-32f0401095e7'"
                                        S_ACTIVITY_OF_THIS_SCRIPT="help"
                                        SB_EXIT_WITH_ERROR="t"
                                    fi
                                fi
                                if [ "$SB_EXIT_WITH_ERROR" == "f" ]; then
                                    S_TMP_0="`filesize $S_FP_MESSAGE_FILE_CANDIDATE`"
                                    S_TMP_1="`ruby -e \"s_out='OK'; if (2000<$S_TMP_0) then s_out='too_big' end; print(s_out);\"`"
                                    if [ "$S_TMP_1" == "too_big" ]; then
                                        echo ""
                                        echo "The commit message file path "
                                        echo "references a file that has a size of $S_TMP_0 bytes."
                                        echo "The suspicion is that it is a wrong file. "
                                        echo "because a commit message is usually not that lengthy."
                                        echo "GUID=='7d74c721-0657-4cbe-8419-32f0401095e7'"
                                        S_ACTIVITY_OF_THIS_SCRIPT="help"
                                        SB_EXIT_WITH_ERROR="t"
                                    else
                                        if [ "$S_TMP_0" == "0" ]; then
                                            echo ""
                                            echo "The commit message file path "
                                            echo "references a file that has a size of 0 (zero) bytes."
                                            echo ""
                                            echo "The generation of commit message files "
                                            echo "can be avoided by using the option "
                                            echo ""
                                            echo "    \"use_autogenerated_commit_message\""
                                            echo ""
                                            echo "in stead of the option "
                                            echo ""
                                            echo "    \"read_commit_message_from_file\" ."
                                            echo ""
                                            echo "GUID=='1214c5b3-fc33-4502-ac19-32f0401095e7'"
                                            S_ACTIVITY_OF_THIS_SCRIPT="help"
                                            SB_EXIT_WITH_ERROR="t"
                                        fi
                                    fi
                                fi 
                                if [ "$SB_EXIT_WITH_ERROR" == "f" ]; then
                                    S_TMP_0="`file --mime-type $S_FP_MESSAGE_FILE_CANDIDATE | grep text `"
                                    if [ "$S_TMP_0" == "" ]; then
                                        echo ""
                                        echo "The commit message file path "
                                        echo "references a file that has a  MIME type of "
                                        echo ""
                                        echo "`file --mime-type $S_FP_MESSAGE_FILE_CANDIDATE`"
                                        echo ""
                                        echo "The commit message file must be a text file and "
                                        echo "text files have the string \"text\" in their MIME type name."
                                        echo "GUID=='a4c5b738-151f-4d18-8219-32f0401095e7'"
                                        S_ACTIVITY_OF_THIS_SCRIPT="help"
                                        SB_EXIT_WITH_ERROR="t"
                                    fi
                                fi 
                            fi # read_commit_message_from_file
                        fi
                    fi
                else
                    if [ "$S_ACTIVITY_OF_THIS_SCRIPT" == "delete_local_copy" ]; then
                        if [ "$2" != "" ]; then # the 2. arg is optional here
                            if [ "$2" != "$S_ARGNAME_ACTIVITY_SHRED_ARG_2" ]; then 
                                echo ""
                                echo "If the first console argument is \"delete_local_copy\", then"
                                echo "the second console argument is allowed to be only "
                                echo ""
                                echo "    \"$S_ARGNAME_ACTIVITY_SHRED_ARG_2\", without quotation marks."
                                echo "GUID=='150928eb-aeae-4391-8319-32f0401095e7'"
                                S_ACTIVITY_OF_THIS_SCRIPT="help"
                                SB_EXIT_WITH_ERROR="t"
                            fi
                        fi
                    else
                        if [ "$S_ACTIVITY_OF_THIS_SCRIPT" != "print_script_version" ]; then
                            if [ "$S_ACTIVITY_OF_THIS_SCRIPT" != "help" ]; then
                                echo ""
                                echo "The very first console argument "
                                echo "of this script is expected to be "
                                echo "a command that is specific to this script."
                                echo "GUID=='41fb3786-2ddb-40a0-9419-32f0401095e7'"
                                S_ACTIVITY_OF_THIS_SCRIPT="help"
                                SB_EXIT_WITH_ERROR="t"
                            fi
                        fi
                    fi
                fi
            fi
        fi
    fi
fi 

#--------------------------------------------------------------------------
if [ "$S_ACTIVITY_OF_THIS_SCRIPT" == "help" ]; then
    echo ""
    echo "Possible console argument sets are:"
    echo ""
    echo "    clone_all    <remote repository url>"
    echo "    clone_public <remote repository url>"
    echo ""
    echo "    overwrite_local_with_remote"
    echo ""
    echo "    overwrite_remote_files_and_local_wiki (use_autogenerated_commit_message)?"
    echo "    overwrite_remote_files_and_local_wiki read_commit_message_from_file <path to a text file>"
    echo ""
    echo "    delete_local_copy ($S_ARGNAME_ACTIVITY_SHRED_ARG_2)?"
    echo "    help"
    echo "    print_script_version"
    echo "    exit # just for testing"
    echo ""
    #----
    cd $S_FP_ORIG
    if [ "$SB_EXIT_WITH_ERROR" == "t" ]; then
        exit 1 # To let the parent script know that 
               # the parent script calls this script with 
               # flawed console argument values.    
    else
        exit 0
    fi
fi 

#--------------------------------------------------------------------------
if [ "$S_ACTIVITY_OF_THIS_SCRIPT" == "print_script_version" ]; then
    echo "The version of this script is: $S_VERSION_OF_THIS_SCRIPT"
    #----
    cd $S_FP_ORIG
    exit 0
fi 


#--------------------------------------------------------------------------
S_FP_SANDBOX_DIRECTORY_NAME="sandbox_of_the_Fossil_repository"
S_FP_SANDBOX="$S_FP_DIR/$S_FP_SANDBOX_DIRECTORY_NAME"
#----
S_FP_ARCHIVES_DIRECTORY_NAME="archival_copies_of_the_Fossil_repository_sandbox"
S_FP_ARCHIVES="$S_FP_DIR/$S_FP_ARCHIVES_DIRECTORY_NAME"
S_FP_ARCHIVES_TS="$S_FP_ARCHIVES/v$S_TIMESTAMP"
#----
S_FP_FOSSILFILE_NAME="repository_storage.fossil"
S_FP_FOSSILFILE="$S_FP_DIR/$S_FP_FOSSILFILE_NAME"

#--------
S_LC_NOT_DETERMINED="not determined"
SB_SANDBOX_DIR_EXISTS="$S_LC_NOT_DETERMINED"
fun_sandbox_folder_or_symlink_exists() {
    SB_SANDBOX_DIR_EXISTS="f"
    if [ ! -e $S_FP_SANDBOX ]; then
        # Does not exist or it is a broken symbolic link.
        SB_SANDBOX_DIR_EXISTS="f"
    else
        if [ -d $S_FP_SANDBOX ]; then
            SB_SANDBOX_DIR_EXISTS="t"
        fi
    fi
} # fun_sandbox_folder_or_symlink_exists

SB_FOSSILFILE_EXISTS="$S_LC_NOT_DETERMINED"
fun_fossil_repository_file_or_symlink_exists() {
    SB_FOSSILFILE_EXISTS="t"
    if [ ! -e $S_FP_FOSSILFILE ]; then
        # Does not exist or it is a broken symbolic link.
        SB_FOSSILFILE_EXISTS="f"
    else
        if [ -d $S_FP_FOSSILFILE ]; then
            SB_FOSSILFILE_EXISTS="f"
        fi
    fi
} # fun_fossil_repository_file_or_symlink_exists

S_LC_NOT_DETERMINED="not determined"
SB_ARCHIVE_DIR_EXISTS="$S_LC_NOT_DETERMINED"
fun_archives_folder_or_symlink_exists() {
    SB_ARCHIVE_DIR_EXISTS="f"
    if [ ! -e $S_FP_ARCHIVES ]; then
        # Does not exist or it is a broken symbolic link.
        SB_ARCHIVE_DIR_EXISTS="f"
    else
        if [ -d $S_FP_ARCHIVES ]; then
            SB_ARCHIVE_DIR_EXISTS="t"
        fi
    fi
} # fun_archives_folder_or_symlink_exists

#--------
fun_fossil_repository_file_or_symlink_exists
fun_sandbox_folder_or_symlink_exists
fun_archives_folder_or_symlink_exists

fun_assertion_t1() {
    local SB_CANDIDATE=$1
    local SB_THROW="t"
    #----
    if [ "$SB_CANDIDATE" == "t" ]; then
        SB_THROW="f"
    else
        if [ "$SB_CANDIDATE" == "f" ]; then
            SB_THROW="f"
        fi
    fi
    #----
    if [ "$SB_THROW" == "t" ]; then
        echo ""
        echo "This Bash script is flawed. "
        echo "fun_assertion_t1() assertion failed."
        echo "GUID=='89193412-6600-4028-a119-32f0401095e7'"
        echo ""
        #----
        cd $S_FP_ORIG
        exit 1
    fi
} # fun_assertion_t1

fun_assertion_t1 "$SB_FOSSILFILE_EXISTS"
fun_assertion_t1 "$SB_SANDBOX_DIR_EXISTS"
fun_assertion_t1 "$SB_ARCHIVE_DIR_EXISTS"

#--------------------------------------------------------------------------

fun_assert_repository_local_copy_existence() {
    fun_fossil_repository_file_or_symlink_exists
    if [ "$SB_FOSSILFILE_EXISTS" == "f" ]; then
        echo ""
        echo "The directory "
        echo "`pwd`"
        echo "does not contain a Fossil repository file named "
        echo ""
        echo "    $S_FP_FOSSILFILE_NAME"
        echo ""
        echo "Aborting script."
        echo "GUID=='ec687755-72ed-43bc-9319-32f0401095e7'"
        echo ""
        #----
        cd $S_FP_ORIG
        exit 1
    fi
    fun_sandbox_folder_or_symlink_exists
    if [ "$SB_SANDBOX_DIR_EXISTS" == "f" ]; then
        echo ""
        echo "The directory "
        echo "`pwd`"
        echo "does not contain a directory named "
        echo ""
        echo "    $S_FP_SANDBOX_DIRECTORY_NAME"
        echo ""
        echo "Aborting script."
        echo "GUID=='50868219-feee-45aa-b119-32f0401095e7'"
        echo ""
        #----
        cd $S_FP_ORIG
        exit 1
    fi
} # fun_assert_repository_local_copy_existence


fun_assert_the_lack_of_repository_local_copy_t1() {
    if [ "$SB_FOSSILFILE_EXISTS" == "t" ]; then
        echo ""
        echo "The directory "
        echo "`pwd`"
        echo "already contain a file named "
        echo ""
        echo "    $S_FP_FOSSILFILE_NAME"
        echo ""
        echo "To avoid overwriting an existing local copy, this script is aborted"
        echo "and nothing is downloaded/uploaded by this script."
        echo "GUID=='4d5bc347-0320-4643-a119-32f0401095e7'"
        echo ""
        #----
        cd $S_FP_ORIG
        exit 1
    fi
    if [ "$SB_SANDBOX_DIR_EXISTS" == "t" ]; then
        echo ""
        echo "The directory "
        echo "`pwd`"
        echo "already contains a directory named "
        echo ""
        echo "    $S_FP_SANDBOX_DIRECTORY_NAME"
        echo ""
        echo "To avoid overwriting an existing local copy, this script is aborted"
        echo "and nothing is downloaded/uploaded by this script."
        echo "GUID=='d1c19628-8e9d-4977-8409-32f0401095e7'"
        echo ""
        #----
        cd $S_FP_ORIG
        exit 1
    fi
} # fun_assert_the_lack_of_repository_local_copy_t1


fun_fossil_open_t1() {
    cd $S_FP_SANDBOX
    fossil open $S_FP_DIR/$S_FP_FOSSILFILE_NAME # full path for reliability 
    fossil settings autosync off ;
    fossil settings binary-glob on;
    fossil settings case-sensitive TRUE ;
    fossil settings dotfiles TRUE ;
} # fun_fossil_open_t1


fun_initialize_sandbox_t1() {
    mkdir -p $S_FP_SANDBOX
    sync;
    cd $S_FP_SANDBOX
    fossil close 2>/dev/null
    fun_fossil_open_t1
    fossil checkout --force --latest
    sync; # should something happen during the closing operation
    fossil close
    sync;
} # fun_initialize_sandbox_t1


#--------------------------------------------------------------------------
fun_last_minute_checks_t1() {
    # Last minute checks, just to be sure.
    local S_FP_FORBIDDEN_VALUE=$1
    #-------------------------
    # TODO: Replace the following if-clauses with some 
    #       proper regex based code. The downside will probably
    #       be speed, so some pooling/caching must be added to the 
    #       start of the function, something in the style of 
    #
    #       return if b_is_along_values_that_passed_the_test_previously($S_FP_FORBIDDEN_VALUE)
    #
    #-------------------------
    if [ "$S_FP_FORBIDDEN_VALUE" == "" ]; then
        func_exit_with_an_error_t1 "27eae767-511b-4311-8459-32f0401095e7"
    fi
    if [ "$S_FP_FORBIDDEN_VALUE" == " " ]; then
        func_exit_with_an_error_t1 "2690b842-631b-434f-8459-32f0401095e7"
    fi
    if [ "$S_FP_FORBIDDEN_VALUE" == "/" ]; then
        func_exit_with_an_error_t1 "5f3f8902-3e5d-448a-9859-32f0401095e7"
    fi
    if [ "$S_FP_FORBIDDEN_VALUE" == "//" ]; then
        func_exit_with_an_error_t1 "106df7cb-1a0d-4250-a259-32f0401095e7"
    fi
    if [ "$S_FP_FORBIDDEN_VALUE" == "$HOME" ]; then
        func_exit_with_an_error_t1 "3a56cf71-4f03-46a6-8459-32f0401095e7"
    fi
    if [ "$S_FP_FORBIDDEN_VALUE" == "$HOME/" ]; then
        func_exit_with_an_error_t1 "a0206c91-f46b-4fed-9859-32f0401095e7"
    fi
    if [ "$S_FP_FORBIDDEN_VALUE" == "$HOME//" ]; then
        func_exit_with_an_error_t1 "c3bb2855-ffab-4b76-9459-32f0401095e7"
    fi
    if [ "$S_FP_FORBIDDEN_VALUE" == "/home" ]; then
        func_exit_with_an_error_t1 "b98b4947-1ecd-4528-b449-32f0401095e7"
    fi
    if [ "$S_FP_FORBIDDEN_VALUE" == "/home/" ]; then
        func_exit_with_an_error_t1 "36999139-a237-4a69-a549-32f0401095e7"
    fi
    if [ "$S_FP_FORBIDDEN_VALUE" == "/root" ]; then
        func_exit_with_an_error_t1 "86fc8730-d19d-4e71-a549-32f0401095e7"
    fi
    if [ "$S_FP_FORBIDDEN_VALUE" == "/root/" ]; then
        func_exit_with_an_error_t1 "d380801b-9f07-485e-9449-32f0401095e7"
    fi
    if [ "$S_FP_FORBIDDEN_VALUE" == "/etc" ]; then
        func_exit_with_an_error_t1 "29db1192-335d-4030-9549-32f0401095e7"
    fi
    if [ "$S_FP_FORBIDDEN_VALUE" == "/var" ]; then
        func_exit_with_an_error_t1 "424f8126-c7e2-490f-a349-32f0401095e7"
    fi
    if [ "$S_FP_FORBIDDEN_VALUE" == "/tmp" ]; then
        func_exit_with_an_error_t1 "5e104a04-56e9-4b2c-8849-32f0401095e7"
    fi
    if [ "$S_FP_FORBIDDEN_VALUE" == "/proc" ]; then
        func_exit_with_an_error_t1 "4b2577a1-f8a1-4ac4-9839-32f0401095e7"
    fi
    if [ "$S_FP_FORBIDDEN_VALUE" == "/sbin" ]; then
        func_exit_with_an_error_t1 "41f4a158-65f8-4dda-9239-32f0401095e7"
    fi
    if [ "$S_FP_FORBIDDEN_VALUE" == "/usr" ]; then
        func_exit_with_an_error_t1 "2468e65c-63b5-4b0f-8139-32f0401095e7"
    fi
    if [ "$S_FP_FORBIDDEN_VALUE" == "/usr/local" ]; then
        func_exit_with_an_error_t1 "95326a85-5288-44ce-af39-32f0401095e7"
    fi
    if [ "$S_FP_FORBIDDEN_VALUE" == "/usr/lib" ]; then
        func_exit_with_an_error_t1 "b348a949-fbf9-438b-8139-32f0401095e7"
    fi
    if [ "$S_FP_FORBIDDEN_VALUE" == "/usr/bin" ]; then
        func_exit_with_an_error_t1 "bd2c4732-3481-4621-a439-32f0401095e7"
    fi
    if [ "$S_FP_FORBIDDEN_VALUE" == "/root" ]; then
        func_exit_with_an_error_t1 "0a32081e-7aa9-4407-a239-32f0401095e7"
    fi
    if [ "$S_FP_FORBIDDEN_VALUE" == "/dev" ]; then
        func_exit_with_an_error_t1 "8eedafb3-fb38-43ce-9a39-32f0401095e7"
    fi
    if [ "$S_FP_FORBIDDEN_VALUE" == "/lib" ]; then
        func_exit_with_an_error_t1 "23f65b57-b210-4404-8229-32f0401095e7"
    fi
} # fun_last_minute_checks_t1


#--------------------------------------------------------------------------
SB_FOLDER_IS_EMPTY="$S_LC_NOT_DETERMINED"
fun_folder_is_empty_t1() {
    local S_FP_FOLDER_TO_STUDY=$1
    local S_FP_ORIG_LOCAL="`pwd`"
    #--------
    SB_FOLDER_IS_EMPTY="t"
    local S_TMP_0="`cd $S_FP_FOLDER_TO_STUDY; ls -l | grep \"total 0\"`"
    if [ "$S_TMP_0" == "" ]; then
        SB_FOLDER_IS_EMPTY="f"
    fi
    #--------
    cd $S_FP_ORIG_LOCAL # just in case
} # fun_folder_is_empty_t1

fun_folder_is_empty_t1 "$S_FP_DIR"
fun_assertion_t1 "$SB_FOLDER_IS_EMPTY"
if [ "$SB_FOLDER_IS_EMPTY" == "t" ]; then
    echo ""
    echo "This Bash script is flawed. The "
    echo "$S_FP_DIR" 
    echo "can not possibly be empty, because it contains "
    echo "at least one file, which is "
    echo "this very same Bash script that outputs the current error message."
    echo "GUID=='e9f19c28-2a2b-41fb-a109-32f0401095e7'"
    echo ""
    #----
    cd $S_FP_ORIG
    exit 1
fi

#--------------------------------------------------------------------------

fun_activity_core_overwrite_local_with_remote() {
    fun_fossil_repository_file_or_symlink_exists
    if [ "$SB_FOSSILFILE_EXISTS" == "t" ]; then
        fun_sandbox_folder_or_symlink_exists
        if [ "$SB_SANDBOX_DIR_EXISTS" == "f" ]; then
            mkdir $S_FP_SANDBOX 
        else
            if [ "$SB_SANDBOX_DIR_EXISTS" != "t" ]; then
                func_exit_with_an_error_t1 "f1fa5cfe-045d-435a-a329-32f0401095e7"
            fi
        fi
    else
        if [ "$SB_FOSSILFILE_EXISTS" != "f" ]; then
            func_exit_with_an_error_t1 "62d3aec6-6003-4558-8829-32f0401095e7"
        fi
    fi
    fun_assert_repository_local_copy_existence
    #--------
    # The checks are party to cope with the `whoami`=="root" case.
    fun_last_minute_checks_t1 "$S_FP_SANDBOX"
    fun_last_minute_checks_t1 "$S_FP_ARCHIVES"
    fun_last_minute_checks_t1 "$S_FP_ARCHIVES_TS"
    #--------
    chmod -f -R u+rx $S_FP_SANDBOX
    fun_folder_is_empty_t1 "$S_FP_SANDBOX"
    if [ "$SB_FOLDER_IS_EMPTY" == "f" ]; then
        # This if-statement is needed because the 
        #      cp -f -R AnEmptyDirectory/* ToSomewhere/
        # gives an error.
        #----
        mkdir -p $S_FP_ARCHIVES_TS
        #----
        # The "chmod -f -R " is not used because it would
        # waste time on folders that are named by 
        # the older $S_FP_ARCHIVES_TS values.
        chmod -f 0700 $S_FP_ARCHIVES
        chmod -f 0700 $S_FP_ARCHIVES_TS 
        #------------
        # The old and slow version:
        #
        #   # The separate cp and rm of the sandbox
        #   # contents is to somewhat retain the original
        #   # file permissions of the sandbox contents.
        #   cp -f -R $S_FP_SANDBOX/* $S_FP_ARCHIVES_TS/
        #   fun_last_minute_checks_t1 "$S_FP_SANDBOX"
        #   chmod -f -R u+rwx $S_FP_SANDBOX
        #   rm -fr $S_FP_SANDBOX/*
        #
        # Faster version:
        mv $S_FP_SANDBOX/* $S_FP_ARCHIVES_TS/
        #------------
    fi
    #--------
    cd $S_FP_SANDBOX
    fun_fossil_open_t1
    fossil pull --private
    #fossil pull 
    fossil checkout --force --latest
    fossil close
} # fun_activity_core_overwrite_local_with_remote



if [ "$S_ACTIVITY_OF_THIS_SCRIPT" == "overwrite_local_with_remote" ]; then
    fun_activity_core_overwrite_local_with_remote
    #----
    cd $S_FP_ORIG
    exit 0
fi # overwrite_local_with_remote



#--------------------------------------------------------------------------

if [ "$S_ACTIVITY_OF_THIS_SCRIPT" == "clone_public" ]; then
    fun_assert_the_lack_of_repository_local_copy_t1
    cd $S_FP_DIR 
    fossil clone $S_URL_REMOTE_REPOSITORY ./$S_FP_FOSSILFILE_NAME
    sync
    fossil pull # a bit of an overkill, but it won't hurt either
    sync
    fun_initialize_sandbox_t1
    cd $S_FP_ORIG
    sync # to be sure
    #----
    exit 0
fi # clone_public


#--------------------------------------------------------------------------
if [ "$S_ACTIVITY_OF_THIS_SCRIPT" == "clone_all" ]; then
    fun_assert_the_lack_of_repository_local_copy_t1
    cd $S_FP_DIR 
    #--------
    S_USERNAME=""
    while [ "$S_USERNAME" == "" ]
    do
        echo ""
        echo "Please enter a username: "
        S_USERNAME="`ruby -e \"s=gets.gsub(/[\n\r\s]/,'');print(s)\"`" 
        S_URL="`export S_USERNAME=\"$S_USERNAME\"; S_URL=\"$S_URL_REMOTE_REPOSITORY\" ruby -e 's_0=ENV[\"S_URL\"].sub(/^http:[\\/]+/,\"http://\").sub(/^https:[\\/]+/,\"https://\").sub(\"://\",\"://\"+ENV[\"S_USERNAME\"].to_s+\":nonsensepassword@\");print(s_0)'`"
    done
    #--------
    fossil clone --private $S_URL ./$S_FP_FOSSILFILE_NAME
    sync
    fossil pull # a bit of an overkill, but it won't hurt either
    sync
    fun_initialize_sandbox_t1
    cd $S_FP_ORIG
    sync # to be sure
    #----
    exit 0
fi # clone_all


#--------------------------------------------------------------------------
if [ "$S_ACTIVITY_OF_THIS_SCRIPT" == "overwrite_remote_files_and_local_wiki" ]; then
    fun_assert_repository_local_copy_existence
    #--------
    # It's important that this script will not try 
    # to recursively copy/move the content of the "/" to 
    # a subfolder of the "/", the "/tmp". 
    # The other folders that are covered by the
    # test are a bit of an overkill here, may be even an
    # annoying and unjustified restrictions, but 
    # in most cases those restrictions do not hurt either.
    fun_last_minute_checks_t1 "$S_FP_SANDBOX"
    #----
    S_TMP_0="$MMMV_FP_FOSSIL_OPERATOR_TMP/tmp_mmmv_$S_VERSION_OF_THIS_SCRIPT"
    S_TMP_1="__"
    func_mmmv_GUID_t1
    S_FP_TMP_FOR_LOCAL="$S_TMP_0$S_TMP_1$S_FUNC_MMMV_GUID_T1_RESULT"
    mkdir -p $S_FP_TMP_FOR_LOCAL
    sync # to make sure that the newly created folder is present on the disk
    #----
    S_TMP_2="_commit_message_"
    func_mmmv_GUID_t1
    S_FP_TMP_FOR_COMMIT_MESSAGE="$S_TMP_0$S_TMP_1$S_TMP_2$S_FUNC_MMMV_GUID_T1_RESULT"
    #--------
    fun_last_minute_checks_t1 "$S_FP_SANDBOX" # should there be flaws elsewhere
    chmod -f -R u+rwx $S_FP_SANDBOX # to be able to delete the old content
    mv -f $S_FP_SANDBOX/* $S_FP_TMP_FOR_LOCAL/ # the -f is for empty sandbox
    cd $S_FP_SANDBOX
        fun_fossil_open_t1
        fossil pull --private
        fun_last_minute_checks_t1 "$S_FP_SANDBOX" # should there be flaws elsewhere
        if [ "`pwd`" != "$S_FP_SANDBOX" ]; then 
            func_exit_with_an_error_t1 "c1c43853-9f12-409e-8329-32f0401095e7"
        fi
        rm -fr $S_FP_SANDBOX/* # just in case, the sandbox should be empty anyway
        mv $S_FP_TMP_FOR_LOCAL/* $S_FP_SANDBOX/
        sync # to make sure that the sandbox files are present on the disk
        echo "Making an effort to mark the changes of the sandbox content ... "
        fossil addremove
        sync # to write repository file changes to disk
        echo "The effort to mark the sandbox changes is complete." 
        #func_echo_checkmark_t1
        if [ "`pwd`" != "$S_FP_SANDBOX" ]; then 
            func_exit_with_an_error_t1 "1041f833-c3a3-4d74-9329-32f0401095e7"
        fi
    cd $S_FP_DIR
    fun_last_minute_checks_t1 "$S_FP_TMP_FOR_LOCAL" 
    rm -fr $S_FP_TMP_FOR_LOCAL  # cleanup
    #-----------------------
    if [ "$2" == "" ]; then
        echo ""
        #echo "Please enter a one-liner commit message: "
        #S_TMP_0="`ruby -e \"s=gets.gsub(/[\n\r\s]/,'');print(s)\"`" 
        # TODO: improve this script so that it would not ask 
        # for a commit message, when nothing changed. It requires
        # some recursive analysis of files, which might be slow.
        # This script is not optimal for speed even now and that would
        # make it even slower. On the other hand, usually when 
        # the upload operation is initiated, there are some changes,
        # which means that the slow analysis would be useless in 
        # the most frequent cases. May be the analysis can be
        # sped up by querying some information from the fossil repository.
        read -p "Please enter a one-liner commit message: " S_TMP_0
        echo "$S_TMP_0" > $S_FP_TMP_FOR_COMMIT_MESSAGE
    else
        if [ "$2" == "use_autogenerated_commit_message" ]; then
            echo "Autogenerated commit message timestamp: $S_TIMESTAMP" > $S_FP_TMP_FOR_COMMIT_MESSAGE
        else
            if [ "$2" == "read_commit_message_from_file" ]; then
                S_FP_MESSAGE_FILE_CANDIDATE="$3" # file path candidate
                # Initial file existence and type checks for the 
                # $S_FP_MESSAGE_FILE_CANDIDATE 
                # were conducted at the start of the script.
                # but the $S_FP_MESSAGE_FILE_CANDIDATE  might have
                # referenced a file in the sandbox and 
                # that file might have been removed/deleted.
                if [ ! -e "$S_FP_MESSAGE_FILE_CANDIDATE" ]; then 
                    # missing or a broken symlink
                    echo ""
                    echo "The commit message file is missing or "
                    echo "references a broken symlink."
                    echo "The file or symlink to it was fine at "
                    echo "the start of this script, it passed the various tests, "
                    echo "but for some reason it got deleted or its target . "
                    echo "got deleted. If the commit message file or"
                    echo "the symlink target resided within the sandbox, then "
                    echo "a recommendation is to use a file that resides "
                    echo "outside of the sandbox."
                    echo "GUID=='7fa6501a-4cc3-4ab6-84c8-32f0401095e7'"
                    echo ""
                    #----
                    cd $S_FP_ORIG
                    exit 1
                fi
                if [ -d "$S_FP_MESSAGE_FILE_CANDIDATE" ]; then 
                    # folder or a symlink to a folder
                    echo ""
                    echo "The commit message file path does not reference "
                    echo "a file. It references a folder or a symlink to a folder."
                    echo "The file or symlink to it was fine at "
                    echo "the start of this script, it passed the various tests, "
                    echo "but for some reason there were changes. "
                    echo "GUID=='1302f594-4433-4a28-93c8-32f0401095e7'"
                    echo ""
                    #----
                    cd $S_FP_ORIG
                    exit 1
                fi
                cat $S_FP_MESSAGE_FILE_CANDIDATE > $S_FP_TMP_FOR_COMMIT_MESSAGE
            else
                # Due to the checks at the start of the script 
                # this else branch should never be reached.
                func_exit_with_an_error_t1 "e678013d-e87d-4c48-b129-32f0401095e7"
            fi
        fi
    fi
    #--------
    #printf "Uploading from the local repository file to the remote repository ... "
    echo "Uploading from the local repository file to the remote repository ... "
    cd $S_FP_SANDBOX
        fossil commit --message-file $S_FP_TMP_FOR_COMMIT_MESSAGE
        fossil push --private
        fossil push  # to be sure
        fossil pull --private
        fossil close
        sync # dump changes to disk
    cd $S_FP_DIR
    #func_echo_checkmark_t1
    echo ""
    echo "Upload complete."
    #--------
    fun_last_minute_checks_t1 "$S_FP_TMP_FOR_COMMIT_MESSAGE"
    rm -f $S_FP_TMP_FOR_COMMIT_MESSAGE
    sync
    #--------
    cd $S_FP_ORIG
    exit 0
fi # overwrite_remote_files_and_local_wiki


#--------------------------------------------------------------------------
if [ "$S_ACTIVITY_OF_THIS_SCRIPT" == "delete_local_copy" ]; then
    #--------
    SB_THERE_IS_SOMETHING_TO_DELETE="f"
    if [ "$SB_FOSSILFILE_EXISTS" == "t" ]; then
        SB_THERE_IS_SOMETHING_TO_DELETE="t"
    fi
    if [ "$SB_SANDBOX_DIR_EXISTS" == "t" ]; then
        SB_THERE_IS_SOMETHING_TO_DELETE="t"
    fi
    if [ "$SB_ARCHIVE_DIR_EXISTS" == "t" ]; then
        SB_THERE_IS_SOMETHING_TO_DELETE="t"
    fi
    #--------
    if [ "$SB_THERE_IS_SOMETHING_TO_DELETE" == "t" ]; then 
        if [ "$2" != "$S_ARGNAME_ACTIVITY_SHRED_ARG_2" ]; then 
            # Includes the $2=="" case
            # id est if the control flow is in here, then there 
            # is a need to prompt for confirmation.
            # The skipping of the prompt is necessary for
            # software that use this script as its sub-component.
            #--------
            echo ""
            echo "The command \"delete_local_copy\" deletes "
            echo "the repository file, the sandbox and "
            echo "the associated automatically created archives."
            echo ""
            read -p "Proceed with deletion?  (Yes/whatever_else)  " S_TMP_0
            S_TMP_1="`echo $S_TMP_0 | gawk '{print tolower($1)}'`"
            if [ "$S_TMP_1" == "yes" ]; then
                echo ""
                printf "Deleting ... "
            else
                fun_exit_without_any_errors_t1
            fi
       fi
    fi
    #--------
    cd $S_FP_ORIG # to make sure that we're not in the sandbox directory and 
                  # to make sure that we're not in the archive directory
    #----
    # The next 3 checks can bee seen to form a complete graph, 
    # in this case a triangle, with corner points  
    # S_FP_SANDBOX, S_FP_ARCHIVES, S_FP_FOSSILFILE connected
    # with lines of type "!=".
    S_GUID="0d51105b-7b1e-48f1-8229-32f0401095e7"
    func_mmmv_assert_file_paths_differ_t1 "$S_FP_FOSSILFILE" "$S_FP_SANDBOX" "$S_GUID"

    S_GUID="b1d37858-cc85-400e-a429-32f0401095e7"
    func_mmmv_assert_file_paths_differ_t1 "$S_FP_SANDBOX" "$S_FP_ARCHIVES" "$S_GUID"

    S_GUID="e067b8af-5fa7-4061-8219-32f0401095e7"
    func_mmmv_assert_file_paths_differ_t1 "$S_FP_ARCHIVES" "$S_FP_FOSSILFILE" "$S_GUID"
    #----
    # The next 3 checks turn the triangle to a tetrahedron, where  
    # the S_FP_ORIG is the "top of the pyramid".
    S_GUID="f70d1259-2cf8-4db8-b119-32f0401095e7"
    func_mmmv_assert_file_paths_differ_t1 "$S_FP_ORIG" "$S_FP_FOSSILFILE" "$S_GUID"
    
    S_GUID="3d868719-acf3-46cc-a319-32f0401095e7"
    func_mmmv_assert_file_paths_differ_t1 "$S_FP_ORIG" "$S_FP_ARCHIVES" "$S_GUID"

    S_GUID="c5114bdc-65b4-413f-8d19-32f0401095e7"
    func_mmmv_assert_file_paths_differ_t1 "$S_FP_ORIG" "$S_FP_SANDBOX" "$S_GUID"
    #--------
    cd $S_FP_ORIG # just in case
    SB_OK_TO_USE_RM_IN_STEAD_OF_SHRED="t" # shred is still used, if available
    if [ "$SB_FOSSILFILE_EXISTS" == "t" ]; then
        fun_last_minute_checks_t1 "`pwd`"
        func_mmmv_shred_t1 "$S_FP_FOSSILFILE" "$SB_OK_TO_USE_RM_IN_STEAD_OF_SHRED"
    fi
    if [ "$SB_SANDBOX_DIR_EXISTS" == "t" ]; then
        fun_last_minute_checks_t1 "`pwd`"
        func_mmmv_shred_t1 "$S_FP_SANDBOX" "$SB_OK_TO_USE_RM_IN_STEAD_OF_SHRED"
    fi
    if [ "$SB_ARCHIVE_DIR_EXISTS" == "t" ]; then
        fun_last_minute_checks_t1 "`pwd`"
        func_mmmv_shred_t1 "$S_FP_ARCHIVES" "$SB_OK_TO_USE_RM_IN_STEAD_OF_SHRED"
    fi
    #--------
    if [ "$SB_THERE_IS_SOMETHING_TO_DELETE" == "t" ]; then 
        if [ "$2" != "$S_ARGNAME_ACTIVITY_SHRED_ARG_2" ]; then 
            func_echo_checkmark_t1
            echo ""
        fi
    fi
    #--------
    cd $S_FP_ORIG
    exit 0
fi # delete_local_copy


#--------------------------------------------------------------------------
# All possible actions must have been described
# above this code block.
func_exit_with_an_error_t1 "57f52bb1-12b7-4275-8b19-32f0401095e7"
echo ""
echo "GUID=='bc075a11-1594-4fcf-a3c8-32f0401095e7'"
echo ""
exit 1 # just in case

#==========================================================================

