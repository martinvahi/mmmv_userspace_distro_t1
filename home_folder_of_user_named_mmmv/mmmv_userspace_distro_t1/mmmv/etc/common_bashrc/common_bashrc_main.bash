#!/usr/bin/env bash 
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
#
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#--------------------------------------------------------------------------
#
# Users that use the mmmv_userspace_distro_t1 are expected to 
# have the following line in an uncommented form at their ~/.bashrc
#
#     source /home/mmmv/mmmv_userspace_distro_t1/mmmv/etc/common_bashrc/common_bashrc_main.bash
#
# Supposedly 
#
#     https://www.shell-tips.com/bash/comments/
#     https://web.archive.org/web/20210823063955/https://www.shell-tips.com/bash/comments/
#     2. archival copy: https://archive.is/xelDR
#
# the Bash command line 
#
#     shopt -s interactive_comments
#
# might help to cope with some "#" related Bash errors.
#
#--------------------------------------------------------------------------
# The 
export MMMV_USERSPACE_DISTRO_T1_VERSION="82a5984e-b72e-4dfd-9e39-c040016168e7"
# does NOT duplicate the 
# S_VERSION_OF_THIS_FILE="361bb18d-a1c7-4579-9119-c040016168e7" 
# because S_VERSION_OF_THIS_FILE is a "mmmv-standard" way to 
# indicate source file versions and the S_VERSION_OF_THIS_FILE 
# is meant to be available for string processing scripts.
#--------------------------------------------------------------------------
if [ "$MMMV_USERSPACE_DISTRO_T1_SLEEP_DURATION_IN_SECONDS_01" == "" ]; then
    # The 
    export MMMV_USERSPACE_DISTRO_T1_SLEEP_DURATION_IN_SECONDS_01="0.05" # 1/20 of a second
    # is expected to be set at $HOME/.bashrc or some of its sub-parts 
    # other than this file here. The context is that the following line 
    #
    #     time sleep 0.05
    #
    # works on both, Linux and BSD and programs can do messaging 
    # portably by polling:
    # 
    #     #----Bash--demo--start-----
    #     #!/usr/bin/env bash
    #     #
    #     S_FP_FILE="/tmp/foo.txt"
    #     #if [ "$MMMV_USERSPACE_DISTRO_T1_SLEEP_DURATION_IN_SECONDS_01" == "" ]; then
    #         export MMMV_USERSPACE_DISTRO_T1_SLEEP_DURATION_IN_SECONDS_01="0.05"
    #     #fi
    #     bash -c "sleep 3.0 ; wait ; echo 'Hello' > $S_FP_FILE ; sync ; wait ; sleep 1 ; rm -f $S_FP_FILE " &
    #     while [ ! -e $S_FP_FILE ]; do
    #         sleep $MMMV_USERSPACE_DISTRO_T1_SLEEP_DURATION_IN_SECONDS_01
    #         printf '.'
    #     done
    #     #----Bash--demo--end------
fi
#--------------------------------------------------------------------------
S_FP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
S_FN_SCRIPTFILE="`basename ${BASH_SOURCE[0]}`"
MMMV_FP_COMMON_BASHRC_MAIN="$S_FP_DIR/$S_FN_SCRIPTFILE"
S_FP_ORIG="`pwd`"
S_TIMESTAMP="`date +%Y`_`date +%m`_`date +%d`_T_`date +%H`h_`date +%M`min_`date +%S`s"
#--------------------------------------------------------------------------
# Code for copy-pasting:
#--------------------
#--------------------------------------------------------------------------
if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "" ]; then
    # The  
    export SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT="t" # must be set to "f"
    #export SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT="f"
    # if the machine is accessible only over SSH, because 
    # SSH clients may interpret any stdout output during ~/.bashrc
    # execution as an error condition and automatically disconnect, id est
    # any stdout output during ~/.bashrc execution may cause a failure to
    # start a session. A workaround is to use some non-bash shell during
    # SSH login and then execute bash manually.
else
    if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" != "t" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" != "f" ]; then
            echo ""
            echo -e "\e[31mThe ~/.bashrc or some subpart of it is flawed. \e[39m"
            echo ""
            echo "    SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT==\"$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT\""
            echo ""
            echo "but the valid values are: \"\", \"t\", \"f\"."
            echo "default: \"\" -> \"t\""
            echo "GUID=='d9a9f553-f795-4c34-a339-c040016168e7'"
            echo ""
        fi
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
    printf "Running the ~/.bashrc sub-part common_bashrc_main.bash .. " # might take about 30s.
fi
#--------------------------------------------------------------------------
if [ "$MMMV_SB_DEBUG" == "" ]; then
    MMMV_SB_DEBUG="t" # the default
fi
if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
    if [ "$MMMV_SB_DEBUG" != "t" ]; then
        if [ "$MMMV_SB_DEBUG" != "f" ]; then
            echo ""
            echo -e "\e[31mThe ~/.bashrc or some subpart of it is flawed. \e[39m"
            echo ""
            echo "    MMMV_SB_DEBUG==\"$MMMV_SB_DEBUG\""
            echo ""
            echo "but the valid values are: \"\", \"t\", \"f\"."
            echo "default: \"\" -> \"t\""
            echo "GUID=='b8047d55-be4e-428f-9339-c040016168e7'"
            echo ""
        fi
    fi
fi
#--------------------------------------------------------------------------
if [ "$MMMV_SB_LOOK_FOR_DEVELOPMENT_TOOLS" == "" ]; then
    MMMV_SB_LOOK_FOR_DEVELOPMENT_TOOLS="t" # the default
fi
if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
    if [ "$MMMV_SB_LOOK_FOR_DEVELOPMENT_TOOLS" != "t" ]; then
        if [ "$MMMV_SB_LOOK_FOR_DEVELOPMENT_TOOLS" != "f" ]; then
            echo ""
            echo -e "\e[31mThe ~/.bashrc or some subpart of it is flawed. \e[39m"
            echo ""
            echo "    MMMV_SB_LOOK_FOR_DEVELOPMENT_TOOLS==\"$MMMV_SB_LOOK_FOR_DEVELOPMENT_TOOLS\""
            echo ""
            echo "but the valid values are: \"\", \"t\", \"f\"."
            echo "default: \"\" -> \"t\""
            echo "GUID=='7c58f211-4471-482d-b419-c040016168e7'"
            echo ""
        fi
    fi
fi
#--------------------------------------------------------------------------
SB_OPERATINGSYSTEM_BSD="f"                    # domain: {"f","t"}
SB_OPERATINGSYSTEM_BSD_FREEBSD="f"            # domain: {"f","t"}
SB_OPERATINGSYSTEM_LINUX="f"                  # domain: {"f","t"}
SB_OPERATINGSYSTEM_LINUX_WSL="f"              # domain: {"f","t"}
SB_OPERATINGSYSTEM_LINUX_ANDROID="f"          # domain: {"f","t"}
SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX="f"   # domain: {"f","t"}
#------------------------------------------
S_UNAME_A="`uname -a `"
S_TMP_0="`echo \"$S_UNAME_A\" | grep -i Linux`"
if [ "$S_TMP_0" != "" ]; then
    SB_OPERATINGSYSTEM_LINUX="t"
    S_TMP_1="`echo \"$S_UNAME_A\" | grep -i -E '(Microsoft|Windows)' `"
    if [ "$S_TMP_1" != "" ]; then
        SB_OPERATINGSYSTEM_LINUX_WSL="t"
    else
        S_TMP_0="`echo \"$S_UNAME_A\" | grep -i Android `"
        if [ "$S_TMP_0" != "" ]; then
            #--------------------
            SB_OPERATINGSYSTEM_LINUX_ANDROID="t"
            #--------------------
            # https://www.reddit.com/r/termux/comments/voultk/safe_way_to_detect_if_inside_termux/
            # archival copy: https://archive.ph/Twy3q
            if [ "$TERMUX_VERSION" != "" ]; then
                SB_PKG_EXISTS_ON_PATH="f"
                if [ "`which pkg 2> /dev/null`" != "" ]; then
                    SB_PKG_EXISTS_ON_PATH="t"
                    S_TMP_1="`echo \"$PREFIX\" | grep -i 'termux' `"
                    if [ "$S_TMP_1" != "" ]; then
                        SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX="t" # one hopes
                    fi
                fi
            fi
            #--------------------
        fi
    fi
else
    #----------------------------------------------------------------------
    S_TMP_0="`echo \"$S_UNAME_A\" | grep -i BSD `"
    if [ "$S_TMP_0" != "" ]; then
        SB_OPERATINGSYSTEM_BSD="t"
        S_TMP_1="`echo \"$S_UNAME_A\" | grep -i 'FreeBSD' `"
        if [ "$S_TMP_1" != "" ]; then
            SB_OPERATINGSYSTEM_BSD_FREEBSD="t"
        fi
    else
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo -e "\e[31mThe operating system is neither Linux, nor BSD. \e[39m"
            echo "The mmmv aliases are probably not tested "
            echo "with the current operating system."
            echo "GUID=='339bda5b-7d94-46a1-a119-c040016168e7'"
            echo ""
        fi
    fi
    #----------------------------------------------------------------------
fi
#--------------------------------------------------------------------------

func_mmmv_include_bashfile_if_possible_t2(){ 
    local S_FP_BASHFILE="$1" # Full path to the file   
    local S_GUID_CANDIDATE="$2" 
    local SB_OK_4_THE_BASHFILE_2_BE_MISSING_OPTIONAL="$3" # domain: {"","t","f"} 
                                                          # default: "" -> "f"
    #----------------------------------------------------------------------
    # ~/.bashrc must not call the "exit" command.
    #----------------------------------------------------------------------
    if [ "$SB_OK_4_THE_BASHFILE_2_BE_MISSING_OPTIONAL" == "" ]; then
        SB_OK_4_THE_BASHFILE_2_BE_MISSING_OPTIONAL="f" # the default value
    else
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            if [ "$SB_OK_4_THE_BASHFILE_2_BE_MISSING_OPTIONAL" != "t" ]; then
                if [ "$SB_OK_4_THE_BASHFILE_2_BE_MISSING_OPTIONAL" != "f" ]; then
                    echo ""
                    echo "The "
                    echo ""
                    echo "    SB_OK_4_THE_BASHFILE_2_BE_MISSING_OPTIONAL==$SB_OK_4_THE_BASHFILE_2_BE_MISSING_OPTIONAL"
                    echo ""
                    echo "but the valid values are: \"\", \"t\", \"f\"."
                    echo "Using the default value of \"f\"."
                    if [ "$S_GUID_CANDIDATE" != "" ]; then
                        echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
                    fi 
                    echo "GUID=='8899dc48-a97d-4d8c-b509-c040016168e7'"
                    echo ""
                    SB_OK_4_THE_BASHFILE_2_BE_MISSING_OPTIONAL="f" # the default value
                fi
            fi
        fi
    fi
    #----------------------------------------------------------------------
    local SB_INCLUSION_POSSIBLE="t"
    if [ "$S_FP_BASHFILE" == "" ]; then
        SB_INCLUSION_POSSIBLE="f"
        #-----------------------------
        # The SB_OK_4_THE_BASHFILE_2_BE_MISSING_OPTIONAL if-block
        # is not used here, because the current situation
        # indicates a flaw at the code that calls this function, 
        # not a situation, where the file is allowed to be absent.
        #-----------------------------
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo -e "\e[31mThe S_FP_BASHFILE had a value of an empty string.\e[39m"
            if [ "$S_GUID_CANDIDATE" != "" ]; then
                echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
            fi 
            echo "GUID=='4d3ff06f-4956-402b-a109-c040016168e7'"
            echo ""
        fi 
    fi
    #-----------------------------------------
    if [ "$SB_INCLUSION_POSSIBLE" == "t" ]; then
        if [ ! -e "$S_FP_BASHFILE" ]; then
            SB_INCLUSION_POSSIBLE="f"
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                if [ "$SB_OK_4_THE_BASHFILE_2_BE_MISSING_OPTIONAL" == "f" ]; then
                    echo ""
                    echo "The "
                    echo ""
                    echo "    $S_FP_BASHFILE"
                    echo ""
                    echo "does not exist or it is a broken symlink."
                    if [ "$S_GUID_CANDIDATE" != "" ]; then
                        echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
                    fi 
                    echo "GUID=='5c4a1f4c-d318-408b-a4f8-c040016168e7'"
                    echo ""
                fi
            fi
        fi
    fi
    #-----------------------------------------
    if [ "$SB_INCLUSION_POSSIBLE" == "t" ]; then
        if [ -d "$S_FP_BASHFILE" ]; then
            SB_INCLUSION_POSSIBLE="f"
            #-----------------------------
            # The SB_OK_4_THE_BASHFILE_2_BE_MISSING_OPTIONAL if-block
            # is not used here, because the current situation
            # differs from the situation, where the file is allowed to be absent.
            #-----------------------------
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                echo ""
                echo "The "
                echo ""
                echo "    $S_FP_BASHFILE"
                echo ""
                echo "references a folder, but it must reference a file."
                if [ "$S_GUID_CANDIDATE" != "" ]; then
                    echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
                fi 
                echo "GUID=='9c3256c4-7b02-4452-93f8-c040016168e7'"
                echo ""
            fi 
        fi
    fi
    #----------------------------------------------------------------------
    if [ "$SB_INCLUSION_POSSIBLE" == "t" ]; then
        source "$S_FP_BASHFILE"
        #---------dependency--elimination--inlining--start----
        # func_mmmv_wait_and_sync_t1(){
              wait # for background processes started by this Bash script to exit/finish
              sync # network drives, USB-sticks, etc.
              wait # for sync
        # } # func_mmmv_wait_and_sync_t1
        #---------dependency--elimination--inlining--end------
        S_FP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" # to restore its value
    else
        if [ "$SB_INCLUSION_POSSIBLE" != "f" ]; then
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                echo ""
                echo -e "\e[31mThe implementation of this function is flawed.\e[39m"
                echo "SB_INCLUSION_POSSIBLE==$SB_INCLUSION_POSSIBLE"
                if [ "$S_GUID_CANDIDATE" != "" ]; then
                    echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
                fi 
                echo "GUID=='14c56410-d81d-4fb5-91e8-c040016168e7'"
                echo ""
            fi 
        fi
    fi
} # func_mmmv_include_bashfile_if_possible_t2

func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1(){
    local S_FP_DECLARATION_BASH="$1"
    #--------
    MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1="mode_ok_to_load"
        func_mmmv_include_bashfile_if_possible_t2 "$S_FP_DECLARATION_BASH" \
            "b720c63b-bd54-4e6f-b319-c040016168e7"
    MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1="mode_loading_complete"
} # func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1
#--------------------------------------------------------------------------

func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1(){
    local S_CONSOLE_PROGRAM_NAME="$1" 
    local S_GUID_CANDIDATE="$2" 
    #--------------------
    if [ "$S_GUID_CANDIDATE" == "" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo -e "\e[31mThe value of the S_GUID_CANDIDATE is an empty string\e[39m,"
            echo "but it is expected to be a GUID."
            echo "GUID=='a40c0cfa-9b30-49b8-85e8-c040016168e7'"
            echo ""
        fi 
    fi 
    #--------------------
    if [ "$S_CONSOLE_PROGRAM_NAME" != "" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            SB_IS_PRESENT_IN_LIST="f"
            if [ "$SB_BASHRC_OPTIONAL_EXTRA_00_LOADED" == "t" ]; then
                func_mmmv_userspace_distro_t1_OK_for_the_program_to_be_missing "$S_CONSOLE_PROGRAM_NAME"
            fi
            if [ "$SB_IS_PRESENT_IN_LIST" == "f" ]; then
                echo ""
                echo -e "The console program \"\e[31m$S_CONSOLE_PROGRAM_NAME\e[39m\" is missing form PATH."
                if [ "$S_GUID_CANDIDATE" != "" ]; then
                    echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
                fi
                echo "GUID=='f8f98849-b9a4-4469-b2e8-c040016168e7'"
                echo "" 
            fi
        fi
    else
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo -e "\e[31mThe value of the S_CONSOLE_PROGRAM_NAME is an empty string\e[39m,"
            echo "but it is expected to be a console program name, which "
            echo "can not be an empty string."
            if [ "$S_GUID_CANDIDATE" != "" ]; then
                echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
            fi
            echo "GUID=='685ca6b9-71a6-414d-a3d8-c040016168e7'"
            echo "" 
        fi
    fi 
    wait  
    #--------------------
} # func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1
#--------------------------------------------------------------------------

# Declares an alias like 
# 
#     my_awesome_alias="cd /some/useful/folder "
#
# on a condition that the  /some/useful/folder 
# exists and is a folder or a symlink to a folder.
# If the folder does not exist, then it 
# does NOT create the folder.
func_mmmv_userspace_distro_t1_declare_alias_cd_t1(){
    local S_ALIAS_NAME="$1" 
    local S_FP_FOLDER_PATH_CANDIDATE="$2" # Full path to the folder.
    local S_GUID_CANDIDATE="$3" 
    local SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING="$4" # domain: {"","t","f"}
                                                   # default: "" -> "t"
                                                   # The default is "t" 
                                                   # for backwards
                                                   # compatibility.
    #----------------------------------------------------------------------
    # ~/.bashrc must not call the "exit" command.
    #----------------------------------------------------------------------
    local SB_OK2ATTEMPT="t" # domain: {"t","f"}
    local S_TMP_0=""
    local SB_ERROR="f" # tends to duplicate the SB_OK2ATTEMPT, but more specific
    local SB_VERIFICATION_FAILED_LOCAL="f"
    #----------------------------------------------------------------------
    if [ "$SB_OK2ATTEMPT" == "t" ]; then
        if [ "$SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING" == "" ]; then
            #--------------------------------------------------------------
            SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING="t"
            # That's not an error condition, because
            # the SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING is, 
            # as its name suggets, an optional parameter.
            #--------------------------------------------------------------
        else
            #--------------------------------------------------------------
            # The 
            #
            #     func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
            #         "$SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING" \
            #         "SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING" \
            #         "435fcb59-ca4f-4189-a119-c040016168e7"
            # 
            # can not be used here, because its error message 
            # claims that the domain is only {"t","f"}, but
            # in this case the "" is also part of the domain. 
            # 
            if [ "$SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING" != "t" ]; then
                if [ "$SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING" != "f" ]; then
                    if [ "$SB_VERIFICATION_FAILED" == "t" ]; then
                        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                            echo ""
                            echo -e "\e[31mSB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING==\"$SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING\"\e[39m"
                            echo "but its domain is: {\"\",\"t\",\"f\"}"
                            echo "GUID=='16b74bbf-cf7e-45ac-b4d8-c040016168e7'"
                            echo ""
                        fi
                        SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING="t"
                        SB_VERIFICATION_FAILED_LOCAL="t"
                        SB_OK2ATTEMPT="f"
                    fi
                fi
            fi
            #--------------------------------------------------------------
        fi
    fi
    #----------------------------------------------------------------------
    if [ "$SB_OK2ATTEMPT" == "t" ]; then
        if [ "$S_GUID_CANDIDATE" == "" ]; then
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                echo ""
                echo -e "\e[31mThe value of the S_GUID_CANDIDATE is an empty string\e[39m,"
                echo "but it is expected to be a GUID."
                echo "Leaving at least one alias undefined."
                echo "GUID=='4fb0b1ac-f094-4bde-b4c8-c040016168e7'"
                echo ""
            fi
            SB_VERIFICATION_FAILED_LOCAL="t"
            SB_OK2ATTEMPT="f"
        fi 
    fi #-------------------------------------------------------------------
    if [ "$SB_OK2ATTEMPT" == "t" ]; then
        if [ "$S_ALIAS_NAME" == "" ]; then
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                echo ""
                echo -e "\e[31mThe value of the S_ALIAS_NAME is an empty string\e[39m,"
                echo "but it is expected to be an alias name."
                echo "Leaving at least one alias undefined."
                echo "GUID=='213cbb4e-792d-4615-a3b8-c040016168e7'"
                echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
                echo ""
            fi
            SB_VERIFICATION_FAILED_LOCAL="t"
            SB_OK2ATTEMPT="f"
        fi 
    fi #-------------------------------------------------------------------
    if [ "$SB_OK2ATTEMPT" == "t" ]; then
        if [ "$S_FP_FOLDER_PATH_CANDIDATE" == "" ]; then
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                echo ""
                echo -e "\e[31mThe value of the S_FP_FOLDER_PATH_CANDIDATE is an empty string\e[39m,"
                echo "but it is expected to be a full path to a folder."
                echo "Leaving at least one alias undefined."
                echo "GUID=='d4fd2714-ce3c-46ab-9ca8-c040016168e7'"
                echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
                echo ""
            fi
            SB_VERIFICATION_FAILED_LOCAL="t"
            SB_OK2ATTEMPT="f"
        fi 
    fi #-------------------------------------------------------------------
    #::::::::start:::of:::the:::core:::code:::of:::this:::function:::::::::
    #----------------------------------------------------------------------
    if [ "$SB_OK2ATTEMPT" == "t" ]; then
        if [ "$SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING" == "t" ]; then
            #--------------------------------------------------------------
            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                "$S_FP_FOLDER_PATH_CANDIDATE" \
                "da622826-04ce-442f-9109-c040016168e7" \
                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
            if [ "$SB_VERIFICATION_FAILED" == "t" ]; then
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo "Leaving at least one alias undefined."
                    echo "GUID=='48ceacf2-a575-4944-b4a8-c040016168e7'"
                    if [ "$S_GUID_CANDIDATE" != "" ]; then
                        echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
                    fi
                    echo ""
                fi
                SB_VERIFICATION_FAILED_LOCAL="t"
                SB_OK2ATTEMPT="f"
            fi
            #--------------------------------------------------------------
        else
            #--------------------------------------------------------------
            if [ ! -e "$S_FP_FOLDER_PATH_CANDIDATE" ]; then
                SB_VERIFICATION_FAILED_LOCAL="t"
                SB_OK2ATTEMPT="f"
            else
                if [ ! -d "$S_FP_FOLDER_PATH_CANDIDATE" ]; then
                    SB_VERIFICATION_FAILED_LOCAL="t"
                    SB_OK2ATTEMPT="f"
                # else
                #     # It might be a folder or a symlink to a folder.
                #     # Both, a folder and a symlink to a folder, are OK here.
                fi
            fi
            #--------------------------------------------------------------
        fi
    fi
    #----------------------------------------------------------------------
    if [ "$SB_OK2ATTEMPT" == "t" ]; then
        SB_ERROR="f"
        if [ "`cd $S_FP_FOLDER_PATH_CANDIDATE; pwd`" != "$S_FP_FOLDER_PATH_CANDIDATE" ]; then
            SB_ERROR="t"
            SB_VERIFICATION_FAILED_LOCAL="t"
            SB_OK2ATTEMPT="f"
        fi
        if [ "$SB_ERROR" == "t" ]; then
            if [ "$SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING" == "t" ]; then
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo "The folder "
                    echo ""
                    echo "    $S_FP_FOLDER_PATH_CANDIDATE"
                    echo ""
                    echo "exists, but either it is not accessible to the current user"
                    echo "or the pwd-value in it differs from the path given to "
                    echo "this Bash function."
                    echo "Leaving at least one alias undefined."
                    echo "GUID=='9982b21e-32df-4f8d-8498-c040016168e7'"
                    if [ "$S_GUID_CANDIDATE" != "" ]; then
                        echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
                    fi
                    echo ""
                fi
            fi 
        fi 
    fi #-------------------------------------------------------------------
    if [ "$SB_OK2ATTEMPT" == "t" ]; then
        S_TMP_0="alias $S_ALIAS_NAME=\"cd $S_FP_FOLDER_PATH_CANDIDATE \""
        eval ${S_TMP_0}
    fi #-------------------------------------------------------------------
    func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
        "$SB_OK2ATTEMPT" "SB_OK2ATTEMPT" \
        "42dd16c4-95ac-40bf-9209-c040016168e7"
    #----------------------------------------------------------------------
    func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
        "$SB_VERIFICATION_FAILED_LOCAL" "SB_VERIFICATION_FAILED_LOCAL" \
        "95d45d82-147a-4160-b9f8-c040016168e7"
    if [ "$SB_VERIFICATION_FAILED" == "t" ]; then
        SB_VERIFICATION_FAILED_LOCAL="t"
    fi
    SB_VERIFICATION_FAILED="$SB_VERIFICATION_FAILED_LOCAL"
    #----------------------------------------------------------------------
} # func_mmmv_userspace_distro_t1_declare_alias_cd_t1
#
# The tests:
#func_mmmv_userspace_distro_t1_declare_alias_cd_t1 \
#    "mmmv_nonsense_01" \
#    "/root" \
#    "d65f7b65-32cf-4e87-b6f8-c040016168e7"
#
#func_mmmv_userspace_distro_t1_declare_alias_cd_t1 \
#    "mmmv_nonsense_02" \
#    "/tmp/olematu" \
#    "3725a021-5e07-45c3-84e8-c040016168e7"
#
#func_mmmv_userspace_distro_t1_declare_alias_cd_t1 \
#    "mmmv_nonsense_03" \
#    "$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/common_bashrc/common_bashrc_main.bash" \
#    "ccd5c63e-9916-40cf-b3e8-c040016168e7"
#
#--------------------------------------------------------------------------
S_FP_0="$S_FP_DIR/subparts/general/_bashrc_subpart_func_core_t3"
func_mmmv_include_bashfile_if_possible_t2 "$S_FP_0" "17a2aa23-6185-4e40-acd8-c040016168e7"
func_mmmv_report_missing_from_path_and_do_NOT_exit_t1 "grep"
#--------------------------------------------------------------------------
S_WHOAMI="`whoami`"
#--------------------------------------------------------------------------
# Please choose the editor of Your choice: 
    #S_TEXTFILE_EDITOR_COMMANDLINE_PROGRAM_NAME="mcedit" # for novice
    #S_TEXTFILE_EDITOR_COMMANDLINE_PROGRAM_NAME="joe" # legacy
    S_TEXTFILE_EDITOR_COMMANDLINE_PROGRAM_NAME="vim" # for more experienced text editor users

S_TMP_0="`which $S_TEXTFILE_EDITOR_COMMANDLINE_PROGRAM_NAME 2> /dev/null`"
if [ "$S_TMP_0" == "" ]; then
    func_mmmv_report_missing_from_path_and_do_NOT_exit_t1 \
        "$S_TEXTFILE_EDITOR_COMMANDLINE_PROGRAM_NAME"
    if [ "$EDITOR" == "" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo -e "\e[31mThe environment variable EDITOR has not been set\e[39m"
            echo "and its initialization to \"$S_TEXTFILE_EDITOR_COMMANDLINE_PROGRAM_NAME\" "
            echo "failed because the \"$S_TEXTFILE_EDITOR_COMMANDLINE_PROGRAM_NAME\""
            echo "is missing from PATH."
            echo "GUID=='05734c18-af38-41db-8498-c040016168e7'"
            echo ""
        fi
    fi
else
    export EDITOR="$S_TMP_0"
fi


if [ "$VISUAL" == "" ]; then
    # According to the
    #
    #     https://unix.stackexchange.com/questions/4859/visual-vs-editor-what-s-the-difference
    #     archival copies:
    #         https://archive.vn/gxCus
    #         https://web.archive.org/web/20200829113827/https://unix.stackexchange.com/questions/4859/visual-vs-editor-what-s-the-difference
    #
    # the idea behind the environment variable 
    export VISUAL="$EDITOR"
    # is that back in the teletype era text editors that
    # could move the cursor were difficult to use and 
    # supposedly scripts had a convention that if the
    # text editor that was determined by the value of the VISUAL
    # could not be used, then the scripts used the text editor that was
    # determined by the environment variable EDITOR.
    # In 2020 the difference might be that the VISUAL
    # references a graphical text editor and the EDITOR 
    # references a console text editor. It's OK to 
    # make them both to reference a console text editor.
fi
#--------------------------------------------------------------------------
# https://stackoverflow.com/questions/55673886/what-is-the-difference-between-c-utf-8-and-en-us-utf-8-locales/
# archival copy: https://archive.vn/ivNHa
# Summary: 
#     The "C" in the "C.UTF-8" stands for "computer" and supposedly the 
#     "C.UTF-8" switches in a more computer-readable text output mode than 
#     the "en_US.UTF-8".
export LC_TIME="C.UTF-8"
export LC_ALL="C.UTF-8" # useful on FreeBSD for making the tar work
export LANG="C.UTF-8"
#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_WSL" == "f" ]; then
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
        SB_UNICODE_START_EXISTS_ON_PATH="f"
        if [ "`which unicode_start 2> /dev/null`" != "" ]; then
            SB_UNICODE_START_EXISTS_ON_PATH="t"
            if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
                # https://linux.com/news/using-unicode-linux/
                # The opposite of the
                unicode_start 2>/dev/null
                # is the 
                # unicode_stop 2>/dev/null
            fi
        else
            func_mmmv_report_missing_from_path_and_do_NOT_exit_t1 "unicode_start"
        fi
    fi
fi
#--------------------------------------------------------------------------
# For some reason the "-mtune=native" fails on 
# Raspberry Pi 3, Raspbian. 
#     https://bugs.ruby-lang.org/issues/13509
#     (archival copy: https://archive.is/llUWb ) 

export MMMV_CFLAGS_COMMON=" -ftree-vectorize -O3 "

# Includes binary code for both, the current and for the older CPUs:
    #MMMV_CFLAGS_TEMPLATE=" -mtune=native $MMMV_CFLAGS_COMMON "  

# No backwards compatibility support, smaller binaries, current CPU only:
    MMMV_CFLAGS_TEMPLATE=" -march=native -mtune=native $MMMV_CFLAGS_COMMON "  

if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "t" ]; then
    # For some reason the " -march=native " triggers an error 
    # on Termux, if the classical configure script is run.
    # The error message is something along the lines that 
    # a compiler does not work.
    MMMV_CFLAGS_TEMPLATE=" -mtune=native $MMMV_CFLAGS_COMMON "  
fi
export CFLAGS="$MMMV_CFLAGS_TEMPLATE"
export CXXFLAGS="$MMMV_CFLAGS_TEMPLATE"
#--------------------------------------------------------------------------
# https://gcc.gnu.org/onlinedocs/gcc/C_002b_002b-Modules.html
# archival copy: https://archive.vn/JFNH3
export MMMV_CXXFLAGS_EXTRA_GCC=" -std=c++20 -fmodules-ts "

# https://clang.llvm.org/docs/Modules.html#problems-modules-do-not-solve
# archival copy: https://archive.vn/QYqMU
export MMMV_CXXFLAGS_EXTRA_LLVM=" -fmodules -fbuiltin-module-map -fmodules-decluse -fmodules-search-all "

#--------------------------------------------------------------------------
# The clang and clang++ seem to introduce 
# linking problems on Raspberry Pi 3, Raspbian.
# A general rule is that binaries produced by
# different C/C++ compilers can not be linked together.
if [ "$CC" == "" ]; then
    export CC="gcc"
    # export CC="clang"
fi
if [ "$CXX" == "" ]; then
    export CXX="g++"
    # export CXX="clang++"
fi


#--------------------------------------------------------------------------
export MMMV_PATH_00="$PATH"
Z_PATH="$PATH"
if [ -e "/usr/sbin" ]; then
    # The 
    func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
        "/usr/sbin" "45cb2fdd-149b-4a60-b1d8-c040016168e7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    # is for displaying an error message, if the "/usr/sbin" is not a folder.
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        Z_PATH="/usr/sbin:$Z_PATH"
    else
        if [ "$SB_VERIFICATION_FAILED" != "t" ]; then
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                echo ""
                echo -e "\e[31m The function \e[39m"
                echo -e "\e[31m func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1(...) \e[39m"
                echo -e "\e[31m is flawed. \e[39m"
                echo "GUID=='9eb4e94d-1b0a-4441-b298-c040016168e7'"
                echo ""
            fi
        fi
    fi
fi
#--------------------------------------------------------------------------
S_FP_0="$HOME/m_local/etc/_bashrc_optional_extra_00.bash"
SB_BASHRC_OPTIONAL_EXTRA_00_LOADED="f"
if [ -e "$S_FP_0" ]; then
    if [ ! -d "$S_FP_0" ]; then
        source "$S_FP_0"
        SB_BASHRC_OPTIONAL_EXTRA_00_LOADED="t"
    else
        # The
        func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
            "$S_FP_0" "5b271358-0d93-448c-85d8-c040016168e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        # is here for outputting an error message.
    fi
fi
#--------------------------------------------------------------------------
MMMV_USERSPACE_DISTRO_T1_HOME_USERDECLARED="$MMMV_USERSPACE_DISTRO_T1_HOME"
# Usually the
#export MMMV_USERSPACE_DISTRO_T1_HOME="/home/mmmv/mmmv_userspace_distro_t1"
# would do, but there are use cases, where user "mmmv" is not used 
# and for that reason the path is derived:
S_TMP_0="`cd $S_FP_DIR/../../../ ; pwd`"
func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
    "$S_TMP_0" "4a991d44-8eeb-4711-8fb8-c040016168e7" \
    "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
if [ "$SB_VERIFICATION_FAILED" == "t" ]; then
    if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
        echo ""
        echo -e "\e[31mFailed to derive a value for the MMMV_USERSPACE_DISTRO_T1_HOME .\e[39m"
        echo "Assigning "
        export MMMV_USERSPACE_DISTRO_T1_HOME="/home/mmmv/mmmv_userspace_distro_t1"
        echo ""
        echo "    MMMV_USERSPACE_DISTRO_T1_HOME:=$MMMV_USERSPACE_DISTRO_T1_HOME"
        echo ""
        echo "GUID=='4ee54747-8add-45ea-b588-c040016168e7'"
        echo ""
    fi
else
    if [ "$SB_VERIFICATION_FAILED" != "f" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo -e "\e[31mThe code of this Bash file is flawed.\e[39m"
            echo ""
            echo "     SB_VERIFICATION_FAILED==\"$SB_VERIFICATION_FAILED\" "
            echo ""
            echo "GUID=='045ec816-1464-4651-b188-c040016168e7'"
            echo ""
        fi
    fi
    export MMMV_USERSPACE_DISTRO_T1_HOME="$S_TMP_0"
    S_TMP_1="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin"
    func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
        "$S_TMP_1" "59f76d71-ebbb-40e5-84b8-c040016168e7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        Z_PATH="$S_TMP_1:$Z_PATH"
    fi
fi
if [ "$MMMV_USERSPACE_DISTRO_T1_HOME_USERDECLARED" != "" ]; then
    if [ "$MMMV_USERSPACE_DISTRO_T1_HOME_USERDECLARED" != "$MMMV_USERSPACE_DISTRO_T1_HOME" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo ""
            echo -e "\e[31mUserdeclared version\e[39m of the MMMV_USERSPACE_DISTRO_T1_HOME "
            echo ""
            echo "    $MMMV_USERSPACE_DISTRO_T1_HOME_USERDECLARED"
            echo ""
            echo -e "and the\e[31m derived version\e[39m of the MMMV_USERSPACE_DISTRO_T1_HOME"
            echo ""
            echo "    $MMMV_USERSPACE_DISTRO_T1_HOME"
            echo ""
            echo -e "\e[31mdiffer\e[39m. Using the derived version."
            echo "GUID=='74b0214e-f410-4912-a578-c040016168e7'"
            echo ""
        fi
        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
            "$MMMV_USERSPACE_DISTRO_T1_HOME_USERDECLARED" \
            "a774af34-fd09-4e42-94a8-c040016168e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    fi
fi
#--------------------------------------------------------------------------
MMMV_USERSPACE_DISTRO_T1_USER_TMP="/tmp"
S_TMP_1="$HOME/tmp_"
if [ -e "$S_TMP_1" ]; then
    if [ -d "$S_TMP_1" ]; then
        MMMV_USERSPACE_DISTRO_T1_USER_TMP="$S_TMP_1"
    fi
fi
if [ "$MMMV_USERSPACE_DISTRO_T1_USER_TMP" == "/tmp" ]; then
    S_TMP_1="$HOME/tmp"
    if [ -e "$S_TMP_1" ]; then
        if [ -d "$S_TMP_1" ]; then
            MMMV_USERSPACE_DISTRO_T1_USER_TMP="$S_TMP_1"
        fi
    fi
fi
if [ "$MMMV_USERSPACE_DISTRO_T1_USER_TMP" == "/tmp" ]; then
    if [ "$SB_CONSOLE_OUTPUT_IS_ALLOWED" == "t" ]; then
        # Probably the SB_CONSOLE_OUTPUT_IS_ALLOWED=="", but
        # it might have been set to "t" at the ~/.bashrc , if
        # the code at the ~/.bashrc has determined that 
        # the session is a local session, not an SSH session.
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo ""
            echo "You may want to use the alias "
            echo -e "\e[33m    mmmv_admin_create_home_tmp_t1 \e[39m"
            echo "for creating a symlink "
            S_TMP_0="_tmp_"
            echo "    /home/$S_WHOAMI/tmp_  -->  /tmp/$S_WHOAMI$S_TMP_0 "
            echo "GUID=='25236d45-6657-4c18-8278-c040016168e7'"
            echo ""
        fi
    fi
fi
#--------------------------------------------------------------------------
MANPATH="$MANPATH"
MMMV_C_INCLUDE_PATH=""
MMMV_CPLUS_INCLUDE_PATH=""
#--------------------------------------------------------------------------
# The newline trick 
S_NEWLINE=$'\n'
# originates from the answer of Gordon Davisson:
# https://stackoverflow.com/questions/17821277/how-to-separate-multiple-commands-passed-to-eval-in-bash
# archival copy: https://archive.fo/7XI3a 
#--------------------------------------------------------------------------
SB_FIND_EXISTS_ON_PATH="f"
if [ "`which find 2> /dev/null`" != "" ]; then
    SB_FIND_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "find" "d79f8833-e2e7-4e73-a2a8-c040016168e7"
fi

SB_CAT_EXISTS_ON_PATH="f"
if [ "`which cat 2> /dev/null`" != "" ]; then
    SB_CAT_EXISTS_ON_PATH="t"
fi

SB_WC_EXISTS_ON_PATH="f"
if [ "`which wc 2> /dev/null`" != "" ]; then
    SB_WC_EXISTS_ON_PATH="t"
fi

SB_GREP_EXISTS_ON_PATH="f"
if [ "`which grep 2> /dev/null`" != "" ]; then
    SB_GREP_EXISTS_ON_PATH="t"
    alias grep='grep --color=auto '
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "grep" "103ea2b4-627b-48c7-a198-c040016168e7"
fi

SB_RG_EXISTS_ON_PATH="f" # rg is installed by "cargo install ripgrep"
if [ "`which rg 2> /dev/null`" != "" ]; then
    SB_RG_EXISTS_ON_PATH="t"
    alias rg0="nice -n 5 rg --max-depth 0 "
    alias rg1="nice -n 5 rg --max-depth 1 "
    alias rg2="nice -n 5 rg --max-depth 2 "
    alias rg3="nice -n 5 rg --max-depth 3 "
    alias rg4="nice -n 5 rg --max-depth 4 "
    alias rg5="nice -n 5 rg --max-depth 5 "
    alias rg6="nice -n 5 rg --max-depth 6 "
    alias rg7="nice -n 5 rg --max-depth 7 "
    alias rg8="nice -n 5 rg --max-depth 8 "
    alias rg9="nice -n 5 rg --max-depth 9 "
    alias rg10="nice -n 5 rg --max-depth 10 "
    alias rg11="nice -n 5 rg --max-depth 11 "
    alias rg12="nice -n 5 rg --max-depth 12 "
    alias rg13="nice -n 5 rg --max-depth 13 "
    alias rg14="nice -n 5 rg --max-depth 14 "
    alias rg15="nice -n 5 rg --max-depth 15 "
    alias rg16="nice -n 5 rg --max-depth 16 "
    alias rg17="nice -n 5 rg --max-depth 17 "
    alias rg18="nice -n 5 rg --max-depth 18 "
    alias rg19="nice -n 5 rg --max-depth 19 "
    alias rg20="nice -n 5 rg --max-depth 20 "
    alias rg21="nice -n 5 rg --max-depth 21 "
    alias rg22="nice -n 5 rg --max-depth 22 "
    alias rg23="nice -n 5 rg --max-depth 23 "
    alias rg24="nice -n 5 rg --max-depth 24 "
    # Deeper recursion can be used by not setting
    # any recursion depth limits: "nice -n 5 rg SearchString" . 
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "rg/ripgrep" "c943f63f-d61e-41d9-a398-c040016168e7"
fi

SB_HTOP_EXISTS_ON_PATH="f"
if [ "`which htop 2> /dev/null`" != "" ]; then
    SB_HTOP_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "htop" "2aa06a54-e7a0-457d-9588-c040016168e7"
fi
#----------------------------------------
SB_NCDU_EXISTS_ON_PATH="f"
if [ "`which ncdu 2> /dev/null`" != "" ]; then
    SB_NCDU_EXISTS_ON_PATH="t"
    #----------------------------------------
    # I(Martin.Vahi@softf1.com) first learned about the 
    # ncdu (NCurses Disk Usage),
    #     https://dev.yorhel.nl/ncdu
    # on 2023_10_14 from
    #     https://askubuntu.com/questions/1224/how-do-i-determine-the-total-size-of-a-directory-folder-from-the-command-line
    #     archival copy: https://archive.ph/TBQVm
    #----------------------------------------
    # The "nice -n 2 " at the following 2 lines is to mitigate filesystem scanning related hangup.
    #alias ncdu="nice -n 2 ncdu --disable-delete --disable-shell " # for safety
    alias ncdu="nice -n 2 ncdu --disable-delete " # for safety, while 
                                                  # keeping the original default 
                                                  # settings as much as possible.
                                                  # The "--disable-delete" option
                                                  # does not exist at some older
                                                  # versions of ncdu.

    # The "--slow-ui-updates" at the 
    S_TMP_0="nice -n 2 ncdu --disable-delete --disable-shell --no-si --apparent-size --show-hidden --show-itemcount --sort=apparent-size-desc --color=dark --slow-ui-updates "
    # is to avoid slowing down the scanning during
    # scans, where there are a lot of files and/or folders to scan.
    alias mmmv_run_ncdu="$S_TMP_0 "
    alias mmmv_ncdu="$S_TMP_0 "
    #----------------------------------------
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "ncdu" "88e91233-3ccd-477c-b388-c040016168e7"
fi
#----------------------------------------
if [ "$SB_PKG_EXISTS_ON_PATH" == "" ]; then
    SB_PKG_EXISTS_ON_PATH="f"
    if [ "`which pkg 2> /dev/null`" != "" ]; then
        SB_PKG_EXISTS_ON_PATH="t"
    fi
# else
#     # The SB_PKG_EXISTS_ON_PATH has been 
#     # assigned earlier in this Bash file.
fi

SB_TEST_EXISTS_ON_PATH="f"
if [ "`which test 2> /dev/null`" != "" ]; then
    SB_TEST_EXISTS_ON_PATH="t"
    # The next if-clause has been copy-pasted from some
    # Linux distribution standard /etc/bash.bashrc and then slightly edited.
    if [ -x /usr/bin/dircolors ]; then
        # color support of ls and also add handy aliases
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
        alias ls='ls --color=auto'
        #alias dir='dir --color=auto'
        #alias vdir='vdir --color=auto'
    fi
fi

SB_WGET_EXISTS_ON_PATH="f"
if [ "`which wget 2> /dev/null`" != "" ]; then
    SB_WGET_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "wget" "aa823a29-c707-40b0-a388-c040016168e7"
fi

SB_CURL_EXISTS_ON_PATH="f"
if [ "`which curl 2> /dev/null`" != "" ]; then
    SB_CURL_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "curl" "c52c0048-2d9b-4cef-8378-c040016168e7"
fi

# aria2 is often times available from distribution package collection.
# https://github.com/aria2
SB_ARIA2C_EXISTS_ON_PATH="f"
if [ "`which aria2c 2> /dev/null`" != "" ]; then
    SB_ARIA2C_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "aria2c" "8f6dd924-d70d-45a2-8378-c040016168e7"
fi

SB_READLINK_EXISTS_ON_PATH="f"
if [ "`which readlink 2> /dev/null`" != "" ]; then
    SB_READLINK_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "readlink" "e4043a4e-3b60-40dd-8268-c040016168e7"
fi

SB_XARGS_EXISTS_ON_PATH="f"
if [ "`which xargs 2> /dev/null`" != "" ]; then
    SB_XARGS_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "xargs" "bf3ad869-b137-49b4-8568-c040016168e7"
fi
#--------------------
SB_DIFF_EXISTS_ON_PATH="f"
if [ "`which diff 2> /dev/null`" != "" ]; then
    SB_DIFF_EXISTS_ON_PATH="t"
    # On Linux it is the GNU Diffutils
    #     https://www.gnu.org/software/diffutils/
    #     archival copy: https://archive.is/wip/cnehD
    # but on BSD the program "diff" is BSD specific.
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "diff" "ea79418e-084d-4b44-8368-c040016168e7"
fi
#--------------------
SB_GDIFF_EXISTS_ON_PATH="f"
if [ "`which gdiff 2> /dev/null`" != "" ]; then
    SB_GDIFF_EXISTS_ON_PATH="t"
else
    if [ "$SB_OPERATINGSYSTEM_LINUX" == "f" ]; then
        # "gdiff" is the name of the GNU diff on BSD, but
        # on Linux the "diff" is the GNU diff.
        # As of 2024 the macOS tends to use BSD versions of
        # command line utilities.
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "gdiff" "48e1b138-6c5b-43b6-b358-c040016168e7"
    else
        if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "t" ]; then
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "gdiff" "3571e4d5-989b-45d3-a758-c040016168e7"
        fi
    fi
fi
#--------------------
SB_DIFF_OR_GDIFF_EXISTS_ON_PATH="f"
if [ "$SB_DIFF_EXISTS_ON_PATH" == "t" ]; then
    SB_DIFF_OR_GDIFF_EXISTS_ON_PATH="t"
else
    if [ "$SB_GDIFF_EXISTS_ON_PATH" == "t" ]; then
        SB_DIFF_OR_GDIFF_EXISTS_ON_PATH="t"
    fi
fi
#--------------------
if [ "$SB_DIFF_OR_GDIFF_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_GDIFF_EXISTS_ON_PATH" == "t" ]; then
        S_CMD_GNU_DIFF="`which gdiff`" # on BSD
    else
        if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
            S_CMD_GNU_DIFF="`which diff`"  # on Linux, including the WSL
        fi
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    SB_XPROP_EXISTS_ON_PATH="f"
    if [ "`which xprop 2> /dev/null`" != "" ]; then
        SB_XPROP_EXISTS_ON_PATH="t"
    fi
    
    SB_XAUTH_EXISTS_ON_PATH="f"
    if [ "`which xauth 2> /dev/null`" != "" ]; then
        SB_XAUTH_EXISTS_ON_PATH="t"
    fi
    
    SB_HDDTEMP_EXISTS_ON_PATH="f"
    if [ "`which hddtemp 2> /dev/null`" != "" ]; then
        SB_HDDTEMP_EXISTS_ON_PATH="t"
    fi

    #SB_ULIMIT_EXISTS_ON_PATH="t"
    # The ulimit is not a separate program.
    # It is a Bash built in command and 
    # therefore always available on PATH.
    #
    # According to the 2024_03_01 statement 
    # of the Microsoft Bing chat-bot, 
    # it is also available as a  built in 
    # command in Zsh, Ksh, Dash and
    # its behaviour can differ between 
    # different shells.
fi

SB_DF_EXISTS_ON_PATH="f"
if [ "`which df 2> /dev/null`" != "" ]; then
    SB_DF_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "df" "6068432f-bb21-4cf4-b348-c040016168e7"
fi

SB_SYSCTL_EXISTS_ON_PATH="f"
if [ "`which sysctl 2> /dev/null`" != "" ]; then
    SB_SYSCTL_EXISTS_ON_PATH="t"
fi

if [ "$MMMV_SB_LOOK_FOR_DEVELOPMENT_TOOLS" == "t" ]; then
    #----------------------------------------------------------------------
    SB_XMLLINT_EXISTS_ON_PATH="f"
    if [ "`which xmllint 2> /dev/null`" != "" ]; then
        SB_XMLLINT_EXISTS_ON_PATH="t"
    fi
    #----------------------------------------------------------------------
fi

SB_GPG_EXISTS_ON_PATH="f"
if [ "`which gpg 2> /dev/null`" != "" ]; then
    SB_GPG_EXISTS_ON_PATH="t"
fi

SB_NETSTAT_EXISTS_ON_PATH="f"
if [ "`which netstat 2> /dev/null`" != "" ]; then
    SB_NETSTAT_EXISTS_ON_PATH="t"
fi

SB_FFMPEG_EXISTS_ON_PATH="f"
if [ "`which ffmpeg 2> /dev/null`" != "" ]; then
    SB_FFMPEG_EXISTS_ON_PATH="t"
fi

SB_TORSOCKS_EXISTS_ON_PATH="f"
if [ "`which torsocks 2> /dev/null`" != "" ]; then
    SB_TORSOCKS_EXISTS_ON_PATH="t"
fi

#--------------------------------------------------------------------------
#::::::::::::::::::::::::::::image::viewers::::::::::::::::::::::::::::::::
#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    SB_XLOADIMAGE_EXISTS_ON_PATH="f"
    if [ "`which xloadimage 2> /dev/null`" != "" ]; then
        SB_XLOADIMAGE_EXISTS_ON_PATH="t"
    fi
    
    SB_XVIEW_EXISTS_ON_PATH="f"
    if [ "`which xview 2> /dev/null`" != "" ]; then
        SB_XVIEW_EXISTS_ON_PATH="t"
    #else
    #    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
    #        "xview" "18292b2c-eca1-4722-8348-c040016168e7"
    fi
    
    SB_XVIEWER_EXISTS_ON_PATH="f"
    if [ "`which xviewer 2> /dev/null`" != "" ]; then
        SB_XVIEWER_EXISTS_ON_PATH="t"
    #else
    #    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
    #        "xviewer" "5d583a5e-6223-4f4c-b448-c040016168e7"
    fi
    
    SB_FEH_EXISTS_ON_PATH="f"
    if [ "`which feh 2> /dev/null`" != "" ]; then
        SB_FEH_EXISTS_ON_PATH="t"
    fi
    
    SB_MIRAGE_EXISTS_ON_PATH="f"
    if [ "`which mirage 2> /dev/null`" != "" ]; then
        SB_MIRAGE_EXISTS_ON_PATH="t"
    fi
    
    SB_VIEWNIOR_EXISTS_ON_PATH="f"
    if [ "`which viewnior 2> /dev/null`" != "" ]; then
        SB_VIEWNIOR_EXISTS_ON_PATH="t"
    else
        if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "viewnior" "aadfb546-532f-4e8b-8538-c040016168e7"
        fi
    fi
    
    SB_GEEQIE_EXISTS_ON_PATH="f"
    if [ "`which geeqie 2> /dev/null`" != "" ]; then
        SB_GEEQIE_EXISTS_ON_PATH="t"
    fi
    
    SB_EOG_EXISTS_ON_PATH="f"
    if [ "`which eog 2> /dev/null`" != "" ]; then
        SB_EOG_EXISTS_ON_PATH="t"
    fi
    
    SB_GWENVIEW_EXISTS_ON_PATH="f"
    if [ "`which gwenview 2> /dev/null`" != "" ]; then
        SB_GWENVIEW_EXISTS_ON_PATH="t"
    fi
    
    SB_NOMACS_EXISTS_ON_PATH="f"
    if [ "`which nomacs 2> /dev/null`" != "" ]; then
        SB_NOMACS_EXISTS_ON_PATH="t"
    fi
    
    SB_SXIV_EXISTS_ON_PATH="f"
    if [ "`which sxiv 2> /dev/null`" != "" ]; then
        SB_SXIV_EXISTS_ON_PATH="t"
    fi
    
    SB_RISTRETTO_EXISTS_ON_PATH="f"
    if [ "`which ristretto 2> /dev/null`" != "" ]; then
        SB_RISTRETTO_EXISTS_ON_PATH="t"
    fi
    
    SB_EOM_EXISTS_ON_PATH="f"
    if [ "`which eom 2> /dev/null`" != "" ]; then
        SB_EOM_EXISTS_ON_PATH="t"
    fi
    
    SB_GPICVIEW_EXISTS_ON_PATH="f"
    if [ "`which gpicview 2> /dev/null`" != "" ]; then
        SB_GPICVIEW_EXISTS_ON_PATH="t"
    fi
    
    SB_MCOMIX_EXISTS_ON_PATH="f"
    if [ "`which mcomix 2> /dev/null`" != "" ]; then
        SB_MCOMIX_EXISTS_ON_PATH="t"
    fi
fi

SB_CHAFA_EXISTS_ON_PATH="f"
if [ "`which chafa 2> /dev/null`" != "" ]; then
    SB_CHAFA_EXISTS_ON_PATH="t"
    alias mmmv_image_viewer_for_terminal_chafa_80x80="nice -n 3 chafa -O 9 --size 80x80 -c full "
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "chafa" "50015b2e-822c-42df-a138-c040016168e7"
fi

SB_CATIMG_EXISTS_ON_PATH="f"
if [ "`which catimg 2> /dev/null`" != "" ]; then
    SB_CATIMG_EXISTS_ON_PATH="t"
    alias mmmv_image_viewer_for_terminal_catimg="nice -n 3 catimg "
    alias mmmv_image_viewer_for_terminal_catimg_w150="nice -n 3 catimg -w 150 "
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "catimg" "f9212329-202b-47a4-9328-c040016168e7"
fi

SB_IMG2SIXEL_EXISTS_ON_PATH="f"
if [ "`which img2sixel 2> /dev/null`" != "" ]; then
    # https://github.com/saitoha/libsixel.git
    # img2sixel works with xterm, provided that the xterm has been
    # compiled to support sixels.
    SB_IMG2SIXEL_EXISTS_ON_PATH="t"
    alias mmmv_image_viewer_for_terminal_img2sixel="nice -n 3 img2sixel"
# else
#     func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
#         "img2sixel" "e7594043-74d3-4c4e-b428-c040016168e7"
fi

SB_MPV_EXISTS_ON_PATH="f"
if [ "`which mpv 2> /dev/null`" != "" ]; then
    SB_MPV_EXISTS_ON_PATH="t"
    alias mmmv_image_viewer_for_terminal_mpv_t1="nice -n 3 mpv --quiet --vo=tct "
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "mpv" "938e5e27-eb2e-48df-9328-c040016168e7"
fi

SB_IMG2TXT_EXISTS_ON_PATH="f"
if [ "`which img2txt 2> /dev/null`" != "" ]; then
    SB_IMG2TXT_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "img2txt" "10e9da4b-57bb-4d0c-a218-c040016168e7"
fi

SB_IMG2PDF_EXISTS_ON_PATH="f"
if [ "`which img2pdf 2> /dev/null`" != "" ]; then
    SB_IMG2PDF_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "img2pdf" "c66b1c48-0d0e-4f6d-8518-c040016168e7"
fi

SB_CONVERT_EXISTS_ON_PATH="f"
if [ "`which convert 2> /dev/null`" != "" ]; then
    SB_CONVERT_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "convert" "fcd40935-eb7b-424f-8408-c040016168e7"
fi
#--------------------------------------------------------------------------
#::::::::::::::::::::::::::clock::applications:::::::::::::::::::::::::::::
#--------------------------------------------------------------------------


#--------------------------------------------------------------------------
#::::::::::::::::::::::::::system::tools:::::::::::::::::::::::::::::::::::
#--------------------------------------------------------------------------
# Filesystem permissions might make some system tools unavailable 
# to non-root users.

SB_ATACONTROL_EXISTS_ON_PATH="f"
if [ "`which atacontrol 2> /dev/null`" != "" ]; then
    SB_ATACONTROL_EXISTS_ON_PATH="t"
fi

SB_COL_EXISTS_ON_PATH="f"
if [ "`which col 2> /dev/null`" != "" ]; then
    SB_COL_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "col" "72a3d85a-e8ca-4552-a508-c040016168e7"
fi

SB_DMESG_EXISTS_ON_PATH="f"
if [ "`which dmesg 2> /dev/null`" != "" ]; then
    SB_DMESG_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "dmesg" "78795e1f-3fa4-47ec-8308-c040016168e7"
fi

SB_FSTYP_EXISTS_ON_PATH="f"
if [ "`which fstyp 2> /dev/null`" != "" ]; then
    SB_FSTYP_EXISTS_ON_PATH="t"
fi

SB_GLABEL_EXISTS_ON_PATH="f"
if [ "`which glabel 2> /dev/null`" != "" ]; then
    SB_GLABEL_EXISTS_ON_PATH="t"
fi

if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    SB_GPART_EXISTS_ON_PATH="f"
    if [ "`which gpart 2> /dev/null`" != "" ]; then
        SB_GPART_EXISTS_ON_PATH="t"
    fi
fi

SB_MOUNT_EXISTS_ON_PATH="f"
if [ "`which mount 2> /dev/null`" != "" ]; then
    SB_MOUNT_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "mount" "7e73ac14-a18c-4f1f-a2f7-c040016168e7"
fi

SB_PSTAT_EXISTS_ON_PATH="f"
if [ "`which pstat 2> /dev/null`" != "" ]; then
    SB_PSTAT_EXISTS_ON_PATH="t"
fi

SB_SH_EXISTS_ON_PATH="f"
if [ "`which sh 2> /dev/null`" != "" ]; then
    SB_SH_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "sh" "2e776b4a-eafc-4414-a2f7-c040016168e7"
fi

SB_TCSH_EXISTS_ON_PATH="f"
if [ "`which tcsh 2> /dev/null`" != "" ]; then
    SB_TCSH_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "tcsh" "3e735447-5dbe-4174-a4f7-c040016168e7"
fi

SB_SERVICE_EXISTS_ON_PATH="f"
if [ "`which service 2> /dev/null`" != "" ]; then
    # TODO: for some reason the control flow never reaches this line.
    #       Try to fix that some day.
    SB_SERVICE_EXISTS_ON_PATH="t"
fi

SB_SWAPINFO_EXISTS_ON_PATH="f"
if [ "`which swapinfo 2> /dev/null`" != "" ]; then
    SB_SWAPINFO_EXISTS_ON_PATH="t"
fi

SB_SYSCTL_EXISTS_ON_PATH="f"
if [ "`which sysctl 2> /dev/null`" != "" ]; then
    SB_SYSCTL_EXISTS_ON_PATH="t"
fi

#--------------------------------------------------------------------------
#:::::::::compilers::and::other::translators::and::interpreters::::::::::::
#--------------------------------------------------------------------------
SB_RUBY_EXISTS_ON_PATH="f"
if [ "`which ruby 2> /dev/null`" != "" ]; then
    # The Ruby version might be wrong, but at least 
    # something called "ruby" is on PATH.
    SB_RUBY_EXISTS_ON_PATH="t" 
fi
#--------------------
SB_JAVA_EXISTS_ON_PATH="f"
SB_JAVAC_EXISTS_ON_PATH="f"
#--------------------
# SB_PYTHON_EXISTS_ON_PATH="f"
# if [ "`which python 2> /dev/null`" != "" ]; then
#     SB_PYTHON_EXISTS_ON_PATH="t"
# fi
# #--------------------
# SB_PYTHON3_EXISTS_ON_PATH="f"
# if [ "`which python3 2> /dev/null`" != "" ]; then
#     SB_PYTHON3_EXISTS_ON_PATH="t"
# fi
# #--------------------
# SB_PERL_EXISTS_ON_PATH="f"
# if [ "`which perl 2> /dev/null`" != "" ]; then
#     SB_PERL_EXISTS_ON_PATH="t"
# fi
#--------------------
if [ "$MMMV_SB_LOOK_FOR_DEVELOPMENT_TOOLS" == "t" ]; then
    #----------------------------------------------------------------------
    S_TMP_0="`which gcc 2> /dev/null`"
    SB_GCC_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_GCC_EXISTS_ON_PATH="t"
        if [ "$CC" == "" ]; then
            export CC="$S_TMP_0"
        fi
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "gcc" "ee581d38-fb60-4e07-a5e7-c040016168e7"
    fi
    #--------------------
    S_TMP_0="`which g++ 2> /dev/null`"
    SB_GCCpp_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_GCCpp_EXISTS_ON_PATH="t"
        if [ "$CXX" == "" ]; then
            export CXX="$S_TMP_0"
        fi
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "g++" "13fec883-f616-4629-a5e7-c040016168e7"
    fi
    #--------------------
    S_TMP_0="`which clang 2> /dev/null`"
    SB_CLANG_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_CLANG_EXISTS_ON_PATH="t"
        if [ "$CC" == "" ]; then
            export CC="$S_TMP_0"
        fi
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "clang" "4dc29d28-b3ee-4c1f-a3d7-c040016168e7"
    fi
    #--------------------
    S_TMP_0="`which clang++ 2> /dev/null`"
    SB_CLANGpp_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_CLANGpp_EXISTS_ON_PATH="t"
        if [ "$CXX" == "" ]; then
            export CXX="$S_TMP_0"
        fi
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "clang++" "9bdd6629-7c3c-48eb-b5d7-c040016168e7"
    fi
    #----------------------------------------------------------------------
fi
#--------------------------------------------------------------------------
#:::::::::::::::text::editors::and::other::text::editing::tools::::::::::::
#--------------------------------------------------------------------------
SB_AWK_EXISTS_ON_PATH="f"
if [ "`which awk 2> /dev/null`" != "" ]; then
    SB_AWK_EXISTS_ON_PATH="t"
    # On Linux the "awk" is the GNU awk
    #     https://www.gnu.org/software/gawk/
    #     archival copy: https://archive.is/z6TRz
    # but on BSD the "awk" is a BSD specific program 
    # that has similar functionality to the GNU awk.
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "awk" "17b5e94a-da5e-4014-84c7-c040016168e7"
fi
#--------------------
SB_GAWK_EXISTS_ON_PATH="f"
if [ "`which gawk 2> /dev/null`" != "" ]; then
    SB_GAWK_EXISTS_ON_PATH="t"
else
    # The "gawk" can be present on both, Linux and BSD.
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "gawk" "ce220239-476c-4180-b1c7-c040016168e7"
fi
#--------------------
SB_AWK_OR_GAWK_EXISTS_ON_PATH="f"
if [ "$SB_AWK_EXISTS_ON_PATH" == "t" ]; then
    SB_AWK_OR_GAWK_EXISTS_ON_PATH="t"
else
    if [ "$SB_GAWK_EXISTS_ON_PATH" == "t" ]; then
        SB_AWK_OR_GAWK_EXISTS_ON_PATH="t"
    fi
fi
#--------------------
if [ "$SB_AWK_OR_GAWK_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_GAWK_EXISTS_ON_PATH" == "t" ]; then
        S_CMD_GNU_AWK="`which gawk`" # on BSD
    else
        if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
            S_CMD_GNU_AWK="`which awk`"  # on Linux, including the WSL
        fi
    fi
fi
#--------------------
SB_EMACS_EXISTS_ON_PATH="f"
if [ "`which emacs 2> /dev/null`" != "" ]; then
    SB_EMACS_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "emacs" "00955033-3e71-4a77-a1b7-c040016168e7"
fi
#--------------------
SB_HEAD_EXISTS_ON_PATH="f"
if [ "`which head 2> /dev/null`" != "" ]; then
    SB_HEAD_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "head" "40f05503-453a-4ad7-adb7-c040016168e7"
fi
#--------------------
SB_JOE_EXISTS_ON_PATH="f"
if [ "`which joe 2> /dev/null`" != "" ]; then
    SB_JOE_EXISTS_ON_PATH="t"
fi
#--------------------
SB_JQ_EXISTS_ON_PATH="f"
if [ "`which jq 2> /dev/null`" != "" ]; then
    SB_JQ_EXISTS_ON_PATH="t"
    # jq is a JSON text processor. A sample line 
    #     curl "https://koodivaramu.eesti.ee/api/v4/projects?per_page=100" | jq '.[].ssh_url_to_repo'
    # by Raivo Laanemets (infdot.com, "inf" like "infinity")
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "jq" "5391923f-3aa3-4872-a3b7-c040016168e7"
fi
#--------------------
SB_MCEDIT_EXISTS_ON_PATH="f"
if [ "`which mcedit 2> /dev/null`" != "" ]; then
    # mcedit is part of the 
    # Midnight Commander File manager, the mc .
    SB_MCEDIT_EXISTS_ON_PATH="t"
fi
#--------------------
SB_PRINTF_EXISTS_ON_PATH="f"
if [ "`which printf 2> /dev/null`" != "" ]; then
    SB_PRINTF_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "printf" "530270e5-ec57-4ea9-a2a7-c040016168e7"
fi
#--------------------
SB_RLWRAP_EXISTS_ON_PATH="f"
if [ "`which rlwrap 2> /dev/null`" != "" ]; then
    #----------------------------------------------------------------------
    SB_RLWRAP_EXISTS_ON_PATH="t"
    # https://github.com/hanslub42/rlwrap
    # https://linux.die.net/man/1/rlwrap
    # lrwrap wraps a console application and allows GNU Readline (libreadline)
    # based command line input editing with arrow keys.
    # Another wording might be that it adds text cursor functionality to 
    # some console programs that do not have it on their own.
    #
    # ------sample--Bash--program--citation--start--------
    # #!/usr/bin/env bash
    # echo ""
    # #  B      I   M    --> IBM Watson   year 2011
    # # abcdefghijklmno
    # # A      H   L     --> HAL 9000     year 1968;1992
    # read -p "How may I greet You?" S_NAME
    # echo "Hello $S_NAME!"
    # echo ""
    # ------sample--Bash--program--citation--end----------
    #
    # A demovideo MIGHT be avalable at 
    # $MMMV_USERSPACE_DISTRO_T1_HOME/attic/demovideos/2023_03_22_rlwrap_demo_t1
    #
    #----------------------------------------------------------------------
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "rlwrap" "3c58f892-c479-4710-83a7-c040016168e7"
fi
#--------------------
SB_SED_EXISTS_ON_PATH="f"
if [ "`which sed 2> /dev/null`" != "" ]; then
    SB_SED_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "sed" "17e6cd31-dd2d-491f-b397-c040016168e7"
fi
#--------------------
SB_GSED_EXISTS_ON_PATH="f"
if [ "`which gsed 2> /dev/null`" != "" ]; then
    SB_GSED_EXISTS_ON_PATH="t"
    # On FreeBSD the BSD sed has the name "sed" and 
    # the GNU sed has the name "gsed". 
    # On Linux the GNU sed has the name "sed".
else
    if [ "$SB_OPERATINGSYSTEM_LINUX" == "f" ]; then
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "gsed" "4235365d-5b68-41ae-8397-c040016168e7"
    else 
        if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "t" ]; then
            # The Termux Linux uses the BSD flavor of the common command line tools.
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "gsed" "da17e742-d598-45cf-b197-c040016168e7"
        fi
    fi
fi
#--------------------
SB_SED_OR_GSED_EXISTS_ON_PATH="f"
if [ "$SB_SED_EXISTS_ON_PATH" == "t" ]; then
    SB_SED_OR_GSED_EXISTS_ON_PATH="t"
else
    if [ "$SB_GSED_EXISTS_ON_PATH" == "t" ]; then
        SB_SED_OR_GSED_EXISTS_ON_PATH="t"
    fi
fi
#--------------------
if [ "$SB_SED_OR_GSED_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_GSED_EXISTS_ON_PATH" == "t" ]; then
        S_CMD_GNU_SED="`which gsed`" # on BSD
    else
        if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
            S_CMD_GNU_SED="`which sed`"  # on Linux, including the WSL
        fi
    fi
    if [ "$SB_PRINTF_EXISTS_ON_PATH" == "t" ]; then # to avoid false advertisements :-)
        # Example Bash line for removing Bash singleliner comments and 
        # empty lines. it works with both, the GNU sed (on BSD: gsed) and 
        # the BSD sed:
        #
        #     cat textfile.bash | sed -e 's/[\#].*//g' | sed -e 's/ //g' | sed -e "s/$(printf '\t')//g" | sed -e '/^$/d'
        #
        #     printf ' aaaa\nbbbb # commentB\n\n\ncccc\ndddddd # comment DD\n# comment EE\nfffff45' | sed -e 's/[\#].*//g' | sed -e 's/ //g' | sed -e "s/$(printf '\t')//g" | sed -e '/^$/d' 
        #
        alias mmmv_ls_doc_sed_remove_singleliner_comments_and_empty_lines_t1=" echo \"\" ; echo \"The following works with the GNU sed and with the BSD sed:\" ;  echo -e \"\\\\e[36m    printf ' aaaa\\\\\\\\nbbbb # commentB\\\\\\\\n\\\\\\\\n\\\\\\\\ncccc\\\\\\\\ndddddd # comment DD\\\\\\\\n# comment EE\\\\\\\\nfffff45' | sed -e 's/[\\\\#].*//g' | sed -e 's/ //g' | sed -e \\\"s/\\\$(printf '\\\\t')//g\\\" | sed -e '/^\\\$/d' \\\\e[39m \" ; echo \"\" "
        #
        # The following sed demo code adds a space after each character and
        # it works with both, the GNU sed (on BSD: gsed) and the BSD sed:
        #
        #     printf 'ABC123\n45' |  sed -e 's/\([[:alnum:]]\)/\1 /g'
        #
        alias mmmv_ls_doc_sed_space_after_each_char_t1=" echo \"\" ; echo \"The following works with the GNU sed and with the BSD sed:\" ;  printf \"printf 'ABC123\\\\\\\\n45' | \" ; echo -e \"\\e[33m sed -e 's/\\([[:alnum:]]\\)/\\1 /g' \\e[39m\" ; echo \"\" ; wait ; printf 'ABC123\\n45' | sed -e 's/\\([[:alnum:]]\\)/\\1 /g' "
    fi
fi
#--------------------
if [ "$MMMV_SB_LOOK_FOR_DEVELOPMENT_TOOLS" == "t" ]; then
    SB_MAKE_EXISTS_ON_PATH="f"
    if [ "`which make 2> /dev/null`" != "" ]; then
        SB_MAKE_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "make" "4803deb6-1905-44ed-b387-c040016168e7"
    fi
    #--------------------
    SB_GMAKE_EXISTS_ON_PATH="f"
    if [ "`which gmake 2> /dev/null`" != "" ]; then
        SB_GMAKE_EXISTS_ON_PATH="t"
        # On FreeBSD the BSD make has the name "make" and 
        # the GNU make has the name "gmake". 
        # On Linux the GNU make has the name "make".
    else
        if [ "$SB_OPERATINGSYSTEM_LINUX" == "f" ]; then
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "gmake" "1fd0a82d-bb85-43bf-b187-c040016168e7"
        else 
            if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "t" ]; then
                # The Termux Linux uses the BSD flavor of the common command line tools.
                func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                    "gmake" "40ec8742-c1f1-4e67-8477-c040016168e7"
            fi
        fi
    fi
    #--------------------
    SB_MAKE_OR_GMAKE_EXISTS_ON_PATH="f"
    if [ "$SB_MAKE_EXISTS_ON_PATH" == "t" ]; then
        SB_MAKE_OR_GMAKE_EXISTS_ON_PATH="t"
    else
        if [ "$SB_GMAKE_EXISTS_ON_PATH" == "t" ]; then
            SB_MAKE_OR_GMAKE_EXISTS_ON_PATH="t"
        fi
    fi
    #--------------------
    if [ "$SB_MAKE_OR_GMAKE_EXISTS_ON_PATH" == "t" ]; then
        if [ "$SB_GMAKE_EXISTS_ON_PATH" == "t" ]; then
            S_CMD_GNU_MAKE="`which gmake`" # on BSD
        else
            if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
                S_CMD_GNU_MAKE="`which make`"  # on Linux, including the WSL
            fi
        fi
    fi
    if [ "$S_CMD_GNU_MAKE" != "" ]; then
        # Some build scripts work properly only with 
        # the GNU make, not the BSD make, and some of such 
        # build scripts read the environment variable MAKE.
        export MAKE="$S_CMD_GNU_MAKE"
    fi
    #--------------------
fi
#--------------------
SB_SORT_EXISTS_ON_PATH="f"
if [ "`which sort 2> /dev/null`" != "" ]; then
    SB_SORT_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "sort" "715cfa4c-58ef-4e7d-a577-c040016168e7"
fi
#--------------------
SB_STRINGS_EXISTS_ON_PATH="f"
if [ "`which strings 2> /dev/null`" != "" ]; then
    SB_STRINGS_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "strings" "50aa9e02-a170-4edd-8b77-c040016168e7"
fi
#--------------------
SB_TR_EXISTS_ON_PATH="f"
if [ "`which tr 2> /dev/null`" != "" ]; then
    SB_TR_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "tr" "ed0e3712-0053-400a-b467-c040016168e7"
fi
#--------------------
SB_REV_EXISTS_ON_PATH="f"
if [ "`which rev 2> /dev/null`" != "" ]; then
    SB_REV_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "rev" "85346af4-dc00-4876-8767-c040016168e7"
fi
#--------------------
SB_VIM_EXISTS_ON_PATH="f"
MMMV_USERSPACE_DISTRO_T1_FP_VIMWIKI_INSTALLATION_SCRIPT="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/lib/templates/vimwiki/2022_11_21_installation_package_by_3rd_party/try_to_install.bash"
if [ "`which vim 2> /dev/null`" != "" ]; then
    #--------------------
    SB_VIM_EXISTS_ON_PATH="t"
    func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
        "$MMMV_USERSPACE_DISTRO_T1_FP_VIMWIKI_INSTALLATION_SCRIPT" \
        "f3ac0346-83f0-4515-b257-c040016168e7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        alias mmmv_admin_install_vimwiki="$MMMV_USERSPACE_DISTRO_T1_FP_VIMWIKI_INSTALLATION_SCRIPT"
    else
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo "Vim exists, but the file "
            echo "$MMMV_USERSPACE_DISTRO_T1_FP_VIMWIKI_INSTALLATION_SCRIPT"
            echo -e "\e[31mis missing\e[39m. Leaving at least one alias undefined."
            echo "GUID=='50df2447-4406-46cc-8378-c040016168e7'"
            echo ""
        fi
    fi
    #--------------------
    S_TMP_0=".txt"
    # The username is part of the textfile name at
    S_TMP_1="$MMMV_USERSPACE_DISTRO_T1_USER_TMP/overwriteable_by_$S_WHOAMI$S_TMP_0"
    # to cope with the situation, where 
    # MMMV_USERSPACE_DISTRO_T1_USER_TMP=="/tmp" 
    # and the S_TMP_1 of different users end up being
    # all in the same folder like 
    # /tmp/overwriteable_by_`whoami`.txt
    #--------------------
    if [ ! -e "$S_TMP_1" ]; then
        if [ ! -h "$S_TMP_1" ]; then # check that it's not a broken symlink
            echo "This textfile is useful with alias mmmv_vim_open_overwriteable_txt ." > $S_TMP_1
            func_mmmv_wait_and_sync_t1
            if [ -e "$S_TMP_1" ]; then
                chmod -f -R 0700 "$S_TMP_1"
                func_mmmv_wait_and_sync_t1
            fi
        fi
    fi
    SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE="$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
        "$S_TMP_1" "4cf1d172-2e18-40b2-9a57-c040016168e7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        alias mmmv_vim_open_overwriteable_txt="nice -n 2 vim $S_TMP_1"
    fi
    #--------------------
fi
#--------------------------------------------------------------------------
#::::::::::::::::::::::::::::::web::browsers:::::::::::::::::::::::::::::::
#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    #--------------------
    S_CMD_NICE_WEBBROWSER="nice -n 5 "
    #--------------------
    S_TMP_0="`which uzbl 2> /dev/null`"
    SB_UZBL_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_UZBL_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_uzbl="$S_CMD_NICE_WEBBROWSER $S_TMP_0 "
        # https://www.uzbl.org/
        # https://github.com/uzbl/
    fi
    #--------------------
    S_TMP_0="`which dillo 2> /dev/null`"
    SB_DILLO_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_DILLO_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_dillo="$S_CMD_NICE_WEBBROWSER $S_TMP_0 "
        #--------------------
        S_FP_DILLORC_TEMPLATE="/home/mmmv/mmmv_userspace_distro_t1/mmmv/lib/templates/2023_06_02_archive_org_copy_of_dillo_org_dillorc.txt"
        # The alias singleliner has been divided between the 
        S_TMP_1="S_FP_TEMPLATE=\"$S_FP_DILLORC_TEMPLATE\" ; if [ -e \"\$S_FP_TEMPLATE\" ]; then if [ -d \"\$S_FP_TEMPLATE\" ]; then echo \"\" ; echo \"The template \" ; echo \"\" ; echo \" \$S_FP_TEMPLATE\" ; echo \"\" ; if [ -h \"\$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mis a symlink to a folder\\e[39m.\" ; else echo -e \"\\e[31mis a folder\\e[39m.\" ; fi ; echo \"but a file is expected.\" ; echo \"GUID=='d327d42d-fd27-43e5-8468-c040016168e7'\" ; echo \"\" ; else S_FP_DILLO_HOME=\"\$HOME/.dillo\" ; S_FP_DILLORC=\"\$S_FP_DILLO_HOME/dillorc\" ; if [ ! -e \"\$S_FP_DILLO_HOME\" ]; then if [ -h \"\$S_FP_DILLO_HOME\" ]; then echo \"\" ; echo \"The \" ; echo \"\" ; echo \" \$S_FP_DILLO_HOME \" ; echo \"\" ; echo -e \"\\e[31mis a broken symlink\\e[39m.\" ; echo \"Failed to create Dillo configuration file.\" ; echo \"GUID=='c7972941-0e5e-4ecb-b168-c040016168e7'\" ; echo \"\" ; else mkdir \"\$S_FP_DILLO_HOME\" ; wait ; sync ; wait ; fi ; fi ; "
        S_TMP_2="if [ -e \"\$S_FP_DILLO_HOME\" ]; then if [ -d \"\$S_FP_DILLO_HOME\" ]; then if [ -e \"\$S_FP_DILLORC\" ]; then echo \"\" ; echo \"The \" ; echo \"\" ; echo \" \$S_FP_DILLORC\" ; echo \"\" ; if [ -d \"\$S_FP_DILLORC\" ]; then echo -e \"\\e[31malready exists\\e[39m and\" ; if [ -h \"\$S_FP_DILLORC\" ]; then echo -e \"\\e[31mit is a symlink to a folder\\e[39m despite \" ; else echo -e \"\\e[31mit is a folder\\e[39m despite \" ; fi ; echo \"the fact that a file is expected.\" ; else echo -e \"\\e[31malready exists\\e[39m.\" ; fi ; echo \"Not overwriting it.\" ; echo \"GUID=='b7f92fa7-f66e-41aa-9458-c040016168e7'\" ; echo \"\" ; else if [ -h \"\$S_FP_DILLORC\" ]; then echo \"\" ; echo \"The \" ; echo \"\" ; echo \" \$S_FP_DILLORC\" ; echo \"\" ; echo -e \"\\e[31mis a broken symlink\\e[39m.\" ; echo \"Not overwriting it.\" ; echo \"GUID=='49c75b23-e1f1-439d-ab58-c040016168e7'\" ; echo \"\" ; else cp \"\$S_FP_TEMPLATE\" \"\$S_FP_DILLORC\" ; wait ; sync ; wait ; if [ ! -e \"\$S_FP_DILLORC\" ]; then echo \"\" ; echo -e \"\\e[31mFailed to create\\e[39m the \" ; echo \"\" ; echo \" \$S_FP_DILLORC\" ; echo \"\" ; echo \"GUID=='e70f5510-91e0-41ff-8158-c040016168e7'\" ; echo \"\" ; else chmod -f -R 0700 \"\$S_FP_DILLO_HOME\" ; wait ; sync ; wait ; echo \"\" ; echo -e \"\\e[32mCreated\\e[39m \$S_FP_DILLORC\" ; echo \"\" ; fi ; fi ; fi ; else echo \"\" ; echo \"The \" ; echo \"\" ; echo \" \$S_FP_DILLO_HOME \" ; echo \"\" ; echo \"exists, but it is neither a folder \" ; echo \"nor a symlink to a folder.\" ; echo \"GUID=='459d3a1a-7856-4517-a448-c040016168e7'\" ; echo \"\" ; fi ; else echo \"\" ; echo -e \"\\e[31mFailed to create folder \\e[39m\" ; echo \"\" ; echo \" \$S_FP_DILLO_HOME \" ; echo \"\" ; echo \"GUID=='55422d3b-0310-4219-b348-c040016168e7'\" ; echo \"\" ; fi ; fi ; else echo \"\" ; echo \"The template \" ; echo \"\" ; echo \" \$S_FP_TEMPLATE\" ; echo \"\" ; echo -e \"\\e[31mdoes not exist\\e[39m.\" ; echo \"GUID=='bfb3e936-661a-4b17-a138-c040016168e7'\" ; echo \"\" ; fi ; "
        # cope with a Vim flaw/bug that crashes the Vim. The 
        #
        #     $HOME/.dillo/dillorc 
        #
        # template has been downloaded on 2023_09_02 from
        #
        #     https://web.archive.org/web/20220515221251/https://dillo.org/dillorc
        #
        func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
            "$S_FP_DILLORC_TEMPLATE" "b6b67228-bab1-4434-b157-c040016168e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
            alias mmmv_admin_create_dillorc_t1="$S_TMP_1$S_TMP_2"
        fi
        # The following is the testing code for the alias mmmv_cre_dillorc:
        #--------------------
        # 
        # #!/usr/bin/env bash
        # 
        # S_FP_TEMPLATE="/home/mmmv/mmmv_userspace_distro_t1/mmmv/lib/templates/2023_06_02_archive_org_copy_of_dillo_org_dillorc.txt" ;
        # if [ -e "$S_FP_TEMPLATE" ]; then
        #     if [ -d "$S_FP_TEMPLATE" ]; then
        #         echo "" ; 
        #         echo "The template " ; 
        #         echo "" ; 
        #         echo "    $S_FP_TEMPLATE" ; 
        #         echo "" ; 
        #         if [ -h "$S_FP_TEMPLATE" ]; then
        #             echo -e "\e[31mis a symlink to a folder\e[39m." ; 
        #         else
        #             echo -e "\e[31mis a folder\e[39m." ; 
        #         fi ;
        #         echo "but a file is expected." ; 
        #         echo "GUID=='07094e2b-0c85-454c-b338-c040016168e7'" ;
        #         echo "" ; 
        #     else
        #         S_FP_DILLO_HOME="$HOME/.dillo" ;
        #         S_FP_DILLORC="$S_FP_DILLO_HOME/dillorc" ;
        #         if [ ! -e "$S_FP_DILLO_HOME" ]; then
        #             if [ -h "$S_FP_DILLO_HOME" ]; then
        #                 echo "" ; 
        #                 echo "The " ; 
        #                 echo "" ; 
        #                 echo "    $S_FP_DILLO_HOME " ; 
        #                 echo "" ; 
        #                 echo -e "\e[31mis a broken symlink\e[39m." ;
        #                 echo "Failed to create Dillo configuration file." ; 
        #                 echo "GUID=='46036d58-a991-44ea-9538-c040016168e7'" ;
        #                 echo "" ; 
        #             else
        #                 mkdir "$S_FP_DILLO_HOME" ; wait ; sync ; wait ;
        #             fi ;
        #         fi ;
        #         if [ -e "$S_FP_DILLO_HOME" ]; then
        #             if [ -d "$S_FP_DILLO_HOME" ]; then
        #                 if [ -e "$S_FP_DILLORC" ]; then
        #                     echo "" ; 
        #                     echo "The " ; 
        #                     echo "" ; 
        #                     echo "    $S_FP_DILLORC" ; 
        #                     echo "" ; 
        #                     if [ -d "$S_FP_DILLORC" ]; then
        #                         echo -e "\e[31malready exists\e[39m and" ; 
        #                         if [ -h "$S_FP_DILLORC" ]; then
        #                             echo -e "\e[31mit is a symlink to a folder\e[39m despite " ; 
        #                         else
        #                             echo -e "\e[31mit is a folder\e[39m despite " ; 
        #                         fi ;
        #                         echo "the fact that a file is expected." ; 
        #                     else
        #                         echo -e "\e[31malready exists\e[39m." ; 
        #                     fi ;
        #                     echo "Not overwriting it." ; 
        #                     echo "GUID=='755aee1c-fc7c-4373-8328-c040016168e7'" ;
        #                     echo "" ; 
        #                 else
        #                     if [ -h "$S_FP_DILLORC" ]; then
        #                         echo "" ; 
        #                         echo "The " ; 
        #                         echo "" ; 
        #                         echo "    $S_FP_DILLORC" ; 
        #                         echo "" ; 
        #                         echo -e "\e[31mis a broken symlink\e[39m." ; 
        #                         echo "Not overwriting it." ; 
        #                         echo "GUID=='9358133d-a2e0-480b-8528-c040016168e7'" ;
        #                         echo "" ; 
        #                     else
        #                         cp "$S_FP_TEMPLATE"  "$S_FP_DILLORC" ; wait ; sync ; wait ;
        #                         if [ ! -e "$S_FP_DILLORC" ]; then
        #                             echo "" ; 
        #                             echo -e "\e[31mFailed to create\e[39m the " ; 
        #                             echo "" ; 
        #                             echo "    $S_FP_DILLORC" ; 
        #                             echo "" ; 
        #                             echo "GUID=='628c2b42-9bb6-4d9f-b518-c040016168e7'" ;
        #                             echo "" ; 
        #                         else 
        #                             chmod -f -R 0700 "$S_FP_DILLO_HOME" ; wait ; sync ; wait ;
        #                             echo "" ; 
        #                             echo -e "\e[32mCreated\e[39m $S_FP_DILLORC" ; 
        #                             echo "" ; 
        #                         fi ;
        #                     fi ;
        #                 fi ;
        #             else
        #                 echo "" ; 
        #                 echo "The " ; 
        #                 echo "" ; 
        #                 echo "    $S_FP_DILLO_HOME " ; 
        #                 echo "" ; 
        #                 echo "exists, but it is neither a folder " ;
        #                 echo "nor a symlink to a folder." ; 
        #                 echo "GUID=='f3ddf7c6-0534-458c-a218-c040016168e7'" ;
        #                 echo "" ; 
        #             fi ;
        #         else
        #             echo "" ; 
        #             echo -e "\e[31mFailed to create folder \e[39m" ; 
        #             echo "" ; 
        #             echo "    $S_FP_DILLO_HOME " ; 
        #             echo "" ; 
        #             echo "GUID=='2b0d4054-e94e-47a8-9518-c040016168e7'" ;
        #             echo "" ; 
        #         fi ;
        #     fi ;
        # else
        #     echo "" ; 
        #     echo "The template " ; 
        #     echo "" ; 
        #     echo "    $S_FP_TEMPLATE" ; 
        #     echo "" ; 
        #     echo -e "\e[31mdoes not exist\e[39m." ; 
        #     echo "GUID=='89809e29-5cf4-4850-b408-c040016168e7'" ;
        #     echo "" ; 
        # fi ;
        # 
        #--------------------
    fi
    #--------------------
    S_TMP_0="`which chromium 2> /dev/null`"
    SB_CHROMIUM_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then 
        SB_CHROMIUM_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_chromium="$S_CMD_NICE_WEBBROWSER $S_TMP_0 "
        # Chromium is a noncorporate fork of the Google Chrome web browser.
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "chromium" "514a5c50-16ea-4fec-8147-c040016168e7"
    fi
    #--------------------
    S_TMP_0="`which links 2> /dev/null`"
    SB_LINKS_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_LINKS_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_links="$S_CMD_NICE_WEBBROWSER $S_TMP_0 "
        # links is a terminal based web browser.
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "links" "ab19d822-aabc-402b-a147-c040016168e7"
    fi
    #--------------------
    S_TMP_0="`which elinks 2> /dev/null`"
    SB_ELINKS_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_ELINKS_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_elinks="$S_CMD_NICE_WEBBROWSER $S_TMP_0 "
        # ELinks is a terminal based web browser.
        # http://elinks.cz/
    fi
    #--------------------
    S_TMP_0="`which lynx 2> /dev/null`"
    SB_LYNX_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_LYNX_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_lynx="$S_CMD_NICE_WEBBROWSER $S_TMP_0 "
        # lynx is a terminal based web browser.
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "lynx" "5071dc2e-7cf9-438b-9137-c040016168e7"
    fi
    #--------------------
    S_TMP_0="`which netrik 2> /dev/null`"
    SB_NETRIK_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_NETRIK_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_netrik="$S_CMD_NICE_WEBBROWSER $S_TMP_0 "
        # Netrik is a terminal based web browser.
        # https://netrik.sourceforge.net/
    fi
    #--------------------
    S_TMP_0="`which netsurf 2> /dev/null`"
    SB_NETSURF_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_NETSURF_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_netsurf="$S_CMD_NICE_WEBBROWSER $S_TMP_0 "
    fi
    #--------------------
    S_TMP_0="`which rekonq 2> /dev/null`"
    SB_REKONQ_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_REKONQ_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_rekonq="$S_CMD_NICE_WEBBROWSER $S_TMP_0 "
    fi
    #--------------------
    S_TMP_0="`which midori 2> /dev/null`"
    SB_MIDORI_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_MIDORI_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_midori="$S_CMD_NICE_WEBBROWSER $S_TMP_0 "
    fi
    #--------------------
    S_TMP_0="`which iceweasel 2> /dev/null`"
    SB_ICEWEASEL_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_ICEWEASEL_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_iceweasel="$S_CMD_NICE_WEBBROWSER $S_TMP_0 "
    fi
    #--------------------
    S_TMP_0="`which firefox 2> /dev/null`"
    SB_FIREFOX_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_FIREFOX_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_firefox="$S_CMD_NICE_WEBBROWSER $S_TMP_0 "
    fi
    #--------------------
    S_TMP_0="`which qutebrowser 2> /dev/null`"
    SB_QUTEBROWSER_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_QUTEBROWSER_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_qutebrowser="$S_CMD_NICE_WEBBROWSER $S_TMP_0 "
        #--------------------
        # https://github.com/qutebrowser/qutebrowser/discussions/6485
        # archival copy: https://archive.ph/zx3lF
        alias mmmv_qutebrowser_clear_cache_t1="sync ; wait ; killall qutebrowser ; wait ; sync ; rm -fr $HOME/.local/share/qutebrowser ; rm -fr $HOME/.local/share/qutebrowser/webengine ; rm -fr $HOME/.cache/qutebrowser ; wait ; sync ; wait ;"
        #--------------------
    fi
    #--------------------
    S_TMP_0="`which epiphany 2> /dev/null`"
    SB_EPIPHANY_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_EPIPHANY_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_epiphany="$S_CMD_NICE_WEBBROWSER $S_TMP_0 "
    fi
    #--------------------
    S_TMP_0="`which konqueror 2> /dev/null`"
    SB_KONQUEROR_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_KONQUEROR_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_konqueror="$S_CMD_NICE_WEBBROWSER $S_TMP_0 "
        alias mmmv_filemanager_konqueror="$S_CMD_NICE_WEBBROWSER $S_TMP_0 "
    fi
    #--------------------
    S_TMP_0="`which falkon 2> /dev/null`"
    SB_FALKON_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_FALKON_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_falkon="$S_CMD_NICE_WEBBROWSER $S_TMP_0 "
    fi
    #--------------------
    S_TMP_0="`which falcon 2> /dev/null`"
    SB_FALCON_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_FALCON_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_falcon="$S_CMD_NICE_WEBBROWSER $S_TMP_0 "
    fi
    #--------------------
    S_TMP_0="`which w3m 2> /dev/null`"
    SB_W3M_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_W3M_EXISTS_ON_PATH="t"
        alias mmmv_webbrowser_w3m="$S_CMD_NICE_WEBBROWSER $S_TMP_0 "
        # w3m is a terminal based web browser.
        # https://w3m.sourceforge.net/
    fi
    #--------------------
fi
#--------------------------------------------------------------------------
#:::::::::::::::::::::::::::::file::managers:::::::::::::::::::::::::::::::
#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    S_TMP_0="`which nautilus 2> /dev/null`"
    SB_NAUTILUS_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_NAUTILUS_EXISTS_ON_PATH="t"
        alias mmmv_filemanager_nautilus="nice -n 5 $S_TMP_0 "
    fi
fi
#--------------------
S_TMP_0="`which mc 2> /dev/null`"
SB_MC_EXISTS_ON_PATH="f"
if [ "$S_TMP_0" != "" ]; then
    SB_MC_EXISTS_ON_PATH="t"
    alias mmmv_filemanager_mc="nice -n 5 $S_TMP_0 "
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    S_TMP_0="`which dolphin 2> /dev/null`"
    SB_DOLPHIN_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_DOLPHIN_EXISTS_ON_PATH="t"
        alias mmmv_filemanager_dolphin="nice -n 5 $S_TMP_0 "
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    # The muCommander is a Java program with a horribly 
    # slow start-up, but it has very nice features.
    #     https://www.mucommander.com/
    #     https://github.com/mucommander
    S_TMP_0="`which mucommander 2> /dev/null`" 
    SB_MUCOMMANDER_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_MUCOMMANDER_EXISTS_ON_PATH="t"
        alias mmmv_filemanager_mucommander="nice -n 5 $S_TMP_0 "
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    # The lightweight, but occasionally unstable, Pascal based filemanager.
    S_TMP_0="`which pcmanfm 2> /dev/null`"
    SB_PCMANFM_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_PCMANFM_EXISTS_ON_PATH="t"
        alias mmmv_filemanager_pcmanfm="nice -n 5 $S_TMP_0 "
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    # Wii Backup File System Manager (QWBFS)
    S_TMP_0="`which qwbfsmanager 2> /dev/null`"
    SB_QWBFSMANAGER_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_QWBFSMANAGER_EXISTS_ON_PATH="t"
        alias mmmv_filemanager_qwbfsmanager="nice -n 5 $S_TMP_0 "
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    S_TMP_0="`which nemo 2> /dev/null`"
    SB_NEMO_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_NEMO_EXISTS_ON_PATH="t"
        alias mmmv_filemanager_nemo="nice -n 5 $S_TMP_0 "
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    S_TMP_0="`which thunar 2> /dev/null`"
    SB_THUNAR_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_THUNAR_EXISTS_ON_PATH="t"
        alias mmmv_filemanager_thunar="nice -n 5 $S_TMP_0 "
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    # https://krusader.org/
    S_TMP_0="`which krusader 2> /dev/null`"
    SB_KRUSADER_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_KRUSADER_EXISTS_ON_PATH="t"
        alias mmmv_filemanager_krusader="nice -n 5 $S_TMP_0 "
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    S_TMP_0="`which xfe 2> /dev/null`"
    SB_XFE_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_XFE_EXISTS_ON_PATH="t"
        alias mmmv_filemanager_xfe="nice -n 5 $S_TMP_0 "
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    S_TMP_0="`which 4pane 2> /dev/null`"
    SB_4PANE_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_4PANE_EXISTS_ON_PATH="t"
        alias mmmv_filemanager_4pane="nice -n 5 $S_TMP_0 "
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    S_TMP_0="`which spacefm 2> /dev/null`"
    SB_SPACEFM_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_SPACEFM_EXISTS_ON_PATH="t"
        alias mmmv_filemanager_spacefm="nice -n 5 $S_TMP_0 "
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    S_TMP_0="`which caja 2> /dev/null`"
    SB_CAJA_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_CAJA_EXISTS_ON_PATH="t"
        alias mmmv_filemanager_caja="nice -n 5 $S_TMP_0 "
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    S_TMP_0="`which ranger 2> /dev/null`"
    SB_RANGER_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_RANGER_EXISTS_ON_PATH="t"
        alias mmmv_filemanager_ranger="nice -n 5 $S_TMP_0 "
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    S_TMP_0="`which doublecmd 2> /dev/null`"
    SB_DOUBLECMD_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_DOUBLECMD_EXISTS_ON_PATH="t"
        alias mmmv_filemanager_doublecmd="nice -n 5 $S_TMP_0 "
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    S_TMP_0="`which vifm 2> /dev/null`"
    SB_VIFM_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_VIFM_EXISTS_ON_PATH="t"
        alias mmmv_filemanager_vifm="nice -n 5 $S_TMP_0 "
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    # http://www.boomerangsworld.de/cms/worker/
    S_TMP_0="`which worker 2> /dev/null`"
    SB_WORKER_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_WORKER_EXISTS_ON_PATH="t"
        alias mmmv_filemanager_worker="nice -n 5 $S_TMP_0 "
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    # https://github.com/jarun/nnn
    S_TMP_0="`which nnn 2> /dev/null`"
    SB_NNN_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_NNN_EXISTS_ON_PATH="t"
        alias mmmv_filemanager_nnn="nice -n 5 $S_TMP_0 "
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    S_TMP_0="`which gentoo 2> /dev/null`"
    SB_GENTOO_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_GENTOO_EXISTS_ON_PATH="t"
        alias mmmv_filemanager_gentoo="nice -n 5 $S_TMP_0 "
    fi
fi
#--------------------
# File managers to be tested/added_here in the future:
#     fman, sunflower, polo, deepin<something>
#--------------------------------------------------------------------------
#::::::::::::::::copying::tools::other::than::file::managers:::::::::::::::
#--------------------------------------------------------------------------
SB_LFTP_EXISTS_ON_PATH="f"
if [ "`which lftp 2> /dev/null`" != "" ]; then
    SB_LFTP_EXISTS_ON_PATH="t"
    #--------------------
    # https://stackoverflow.com/questions/6327800/lftp-timeout-not-working
    # arcival copy: https://archive.vn/qi0z0
    alias mmmv_lftp_t1="nice -n 5 lftp -e \"set net:timeout 5; set net:reconnect-interval-base 5; set net:max-retries 3;\" "
    # Supposedly by default the net:max-retries==1000 .
    #--------------------
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "lftp" "9060cf17-6468-4fb0-a337-c040016168e7"
fi
#--------------------
SB_PUTTY_EXISTS_ON_PATH="f"
if [ "`which putty 2> /dev/null`" != "" ]; then
    SB_PUTTY_EXISTS_ON_PATH="t"
fi
#--------------------
SB_RCLONE_EXISTS_ON_PATH="f"
if [ "`which rclone 2> /dev/null`" != "" ]; then
    # rclone is a command line client for WebDAV.
    # It somewhat resembles a command line FTP client.
    #
    #     https://rclone.org/
    #     http://www.webdav.org/
    #
    SB_RCLONE_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "rclone" "87949b3d-c9f7-4d55-8337-c040016168e7"
fi
#--------------------
SB_RSYNC_EXISTS_ON_PATH="f"
if [ "`which rsync 2> /dev/null`" != "" ]; then
    SB_RSYNC_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "rsync" "fe0bf912-628f-46be-9227-c040016168e7"
fi
#--------------------
SB_SSH_EXISTS_ON_PATH="f"
if [ "`which ssh 2> /dev/null`" != "" ]; then
    SB_SSH_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "ssh" "3da0e7e5-5ff4-4e04-af27-c040016168e7"
fi
#--------------------
SB_SCP_EXISTS_ON_PATH="f"
if [ "`which scp 2> /dev/null`" != "" ]; then
    SB_SCP_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "scp" "4540d982-16b0-4112-b917-c040016168e7"
fi
#--------------------
SB_UNISON_EXISTS_ON_PATH="f"
if [ "`which unison 2> /dev/null`" != "" ]; then
    SB_UNISON_EXISTS_ON_PATH="t"
fi
#--------------------------------------------------------------------------
#::::::::::::::repository::systems::id::est::revision::control:::::::::::::
#--------------------------------------------------------------------------
# https://en.wikipedia.org/wiki/List_of_version_control_software
if [ "$MMMV_SB_LOOK_FOR_DEVELOPMENT_TOOLS" == "t" ]; then
    #----------------------------------------------------------------------
    S_TMP_0="`which cvs 2> /dev/null`"
    SB_CVS_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_CVS_EXISTS_ON_PATH="t"
    fi
    #--------------------
    S_TMP_0="`which svn 2> /dev/null`"
    SB_SUBVERSION_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_SUBVERSION_EXISTS_ON_PATH="t"
    fi
    #--------------------
    # https://www.mercurial-scm.org/
    S_TMP_0="`which hg 2> /dev/null`"
    SB_MERCURIAL_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_MERCURIAL_EXISTS_ON_PATH="t"
    fi
    #--------------------
    S_TMP_0="`which git 2> /dev/null`"
    SB_GIT_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_GIT_EXISTS_ON_PATH="t"
        alias mmmv_git_gc_t1="nice -n 23 $S_TMP_0 gc --aggressive --prune=all "
        alias mmmv_git_ls_unstored="nice -n 19 $S_TMP_0 status -uall --ignored "
        alias mmmv_git_clone_recursive="nice -n 19 $S_TMP_0 clone --recursive "
        alias mmmv_git_ignore_https_certificate="GIT_SSL_NO_VERIFY=true nice -n 19 $S_TMP_0 "
        alias mmmv_git_init_config_global_FooBar_t1="git config --global init.defaultBranch main ; git config --global user.email \"Foo@Bar.com\" ; git config --global user.name \"Foo Bar\" ; wait ; sync ; wait ; "
    fi
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
        S_TMP_0="`which gitg 2> /dev/null`"
        SB_GITG_EXISTS_ON_PATH="f"
        if [ "$S_TMP_0" != "" ]; then
            SB_GITG_EXISTS_ON_PATH="t"
            if [ "$SB_GIT_EXISTS_ON_PATH" == "t" ]; then
                alias mmmv_gitg="nice -n 19 $S_TMP_0 "
            else
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo -e "\e[31mgitg exists on PATH while the git is missing.\e[39m"
                    echo "GUID=='0bc89117-b537-4ee2-a508-c040016168e7'"
                    echo ""
                fi
            fi
        fi
        S_TMP_0="`which gitk 2> /dev/null`"
        SB_GITK_EXISTS_ON_PATH="f"
        if [ "$S_TMP_0" != "" ]; then
            SB_GITK_EXISTS_ON_PATH="t"
            if [ "$SB_GIT_EXISTS_ON_PATH" == "t" ]; then
                alias mmmv_gitk="nice -n 19 $S_TMP_0 "
            else
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo -e "\e[31mgitk exists on PATH while the git is missing.\e[39m"
                    echo "GUID=='23ee5742-16c2-4ef4-a4f7-c040016168e7'"
                    echo ""
                fi
            fi
            if [ "$SB_GITG_EXISTS_ON_PATH" == "f" ]; then
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo -e "\e[31mgitk exists on PATH while the gitg is missing.\e[39m"
                    # As of 2021 the gitk has an optionally available 
                    # menu option that depends on the gitg.
                    echo "GUID=='2cadf216-f6ce-4fd4-92f7-c040016168e7'"
                    echo ""
                fi
            fi
        fi
    fi
    #--------------------
    S_TMP_0="`which bzr 2> /dev/null`"
    SB_BAZAAR_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_BAZAAR_EXISTS_ON_PATH="t"
    fi
    #--------------------
    # https://www.gnu.org/software/gnu-arch/
    S_TMP_0="`which tla 2> /dev/null`"
    SB_GNU_ARCH_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_GNU_ARCH_EXISTS_ON_PATH="t"
    fi
    #--------------------
    # http://darcs.net/
    #
    # Installation as of 2021_08:
    #
    #     cabal install darcs
    #     # or
    #     stack install darcs
    #
    S_TMP_0="`which darcs 2> /dev/null`"
    SB_DARCH_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_DARCH_EXISTS_ON_PATH="t"
    fi
    #--------------------
    # TODO: add Vesta here
    #     http://vesta.sourceforge.net/
    #     https://risicato.org/
    #
    #     # As of 2021_08_31 the
    #     http://www.vestasys.org/
    #     # is offline.
    #
    #--------------------
    # TODO: Add the following systems:
    #     ArX  http://www.nongnu.org/arx/
    #     monotone https://www.monotone.ca/
    #----------------------------------------------------------------------
fi
#--------------------------------------------------------------------------
#:::::::::::::::::::::::::::::::printing:::::::::::::::::::::::::::::::::::
#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    S_TMP_0="`which lpstat 2> /dev/null`"
    SB_LPSTAT_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_LPSTAT_EXISTS_ON_PATH="t"
        alias mmmv_ls_printers="$S_TMP_0 -p -d " # shows printers from CUPS setup
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    S_TMP_0="`which lp 2> /dev/null`"
    SB_LP_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_LP_EXISTS_ON_PATH="t"
    fi
fi
#--------------------------------------------------------------------------
#:::::::::::::::::::::::::::code::formatters:::::::::::::::::::::::::::::::
#--------------------------------------------------------------------------
if [ "$MMMV_SB_LOOK_FOR_DEVELOPMENT_TOOLS" == "t" ]; then
    #----------------------------------------------------------------------
    S_TMP_0="`which astyle 2> /dev/null`"
    SB_ASTYLE_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_ASTYLE_EXISTS_ON_PATH="t"
        alias mmmv_astyle_t1="nice -n 4 $S_TMP_0 --style=java --indent=spaces=4 "
    fi
    #----------------------------------------------------------------------
fi
#--------------------------------------------------------------------------
#:::::::::::::::::::::::::::code::generators:::::::::::::::::::::::::::::::
#--------------------------------------------------------------------------
if [ "$MMMV_SB_LOOK_FOR_DEVELOPMENT_TOOLS" == "t" ]; then
    #----------------------------------------------------------------------
    S_TMP_0="`which bison 2> /dev/null`"
    SB_BISON_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_BISON_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "bison" "4c02a536-66e0-4870-8217-c040016168e7"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="`which re2c 2> /dev/null`"
    SB_RE2C_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        #-----------------------------------------
        # http://re2c.org/
        # -------citation--start------------------ 
        # re2c is a free and open-source 
        # lexer generator for C/C++, Go and Rust 
        # with a focus on generating fast code. 
        # It compiles regular expression 
        # specifications to deterministic 
        # finite automata and encodes them 
        # in the form of conditional jumps 
        # in the target language. 
        # -------citation--end--------------------
        SB_RE2C_EXISTS_ON_PATH="t"
        #-----------------------------------------
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "re2c" "d27df115-ff34-4435-9107-c040016168e7"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="`which yacc 2> /dev/null`"
    SB_YACC_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_YACC_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "yacc" "16a9119b-6d54-4449-b507-c040016168e7"
    fi
    #----------------------------------------------------------------------
fi
#--------------------------------------------------------------------------
#:::::::::::::::::::::::::compression::software::::::::::::::::::::::::::::
#--------------------------------------------------------------------------
SB_ATOOL_EXISTS_ON_PATH="f"
if [ "`which atool 2> /dev/null`" != "" ]; then
    SB_ATOOL_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "atool" "891b0e74-8c8f-4edc-a9f6-c040016168e7"
fi
#--------------------
SB_ARCHIVEMOUNT_EXISTS_ON_PATH="f"
if [ "`which archivemount 2> /dev/null`" != "" ]; then
    SB_ARCHIVEMOUNT_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "archivemount" "df628511-729c-406f-94f6-c040016168e7"
fi
#--------------------
SB_TAR_EXISTS_ON_PATH="f"
if [ "`which tar 2> /dev/null`" != "" ]; then
    SB_TAR_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "tar" "52f52904-d134-4253-b7f6-c040016168e7"
fi
#--------------------
SB_GZIP_EXISTS_ON_PATH="f"
if [ "`which gzip 2> /dev/null`" != "" ]; then
    SB_GZIP_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "gzip" "0b761e3a-cd77-4252-a2e6-c040016168e7"
fi
#--------------------
SB_GUNZIP_EXISTS_ON_PATH="f"
if [ "`which gunzip 2> /dev/null`" != "" ]; then
    SB_GUNZIP_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "gunzip" "76f25053-9ddf-4b92-91e6-c040016168e7"
fi
#--------------------
SB_PIGZ_EXISTS_ON_PATH="f"
if [ "`which pigz 2> /dev/null`" != "" ]; then
    # The pigz allows to crate gz-files by using multiple hardware threads.
    SB_PIGZ_EXISTS_ON_PATH="t"
    # A command example:
    #
    #     tar cf - /pat/to/compressable/folder | pigz -9 -p 4 > archive.tar.gz
    #
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "pigz" "123223b1-05c4-44f4-88e6-c040016168e7"
fi
#--------------------
SB_PLZIP_EXISTS_ON_PATH="f"
if [ "`which plzip 2> /dev/null`" != "" ]; then
    #--------------------
    SB_PLZIP_EXISTS_ON_PATH="t"
    #--------------------
    S_TMP_0="nice -n 17 plzip --threads=1 --decompress  "
    alias mmmv_unpack_lz_t1="$S_TMP_0"
    S_TMP_0="nice -n 17 plzip --threads=1 -9 --dictionary-size=16MiB "
    alias mmmv_pack_lz_t1="$S_TMP_0"
    # TODO: declare the 
    #     alias mmmv_pack_lz_t1="$S_TMP_0"
    #     alias mmmv_unpack_lz_t1="$S_TMP_0"
    # accoding to the available hardware threads.
    #--------------------
    # Test-lines:
    #
    #     S_FP="./fff" ; S_CMD_NICE="nice -n 17 " ; $S_CMD_NICE tar -cf "$S_FP.tar" "$S_FP" ; if [ "$?" == "0" ]; then  sync ; wait ; $S_CMD_NICE plzip --threads=1 -9 --dictionary-size=16MiB "$S_FP.tar" ; sync ; wait ; fi
    #
    #     S_CMD_NICE="nice -n 17 " ; S_FP="./fff" ; $S_CMD_NICE tar -cf "$S_FP.tar" "$S_FP" ; if [ "$?" == "0" ]; then  sync ; wait ; $S_CMD_NICE plzip --threads=1 -9 --dictionary-size=16MiB "$S_FP.tar" ; sync ; wait ; fi
    #
    #     mmmv_polish_ABC_2_ACB_exec_t1 "S_CMD_NICE=\"nice -n 17 \" ; S_FP=\"" '" ; $S_CMD_NICE tar -cf "$S_FP.tar" "$S_FP" ; if [ "$?" == "0" ]; then  sync ; wait ; $S_CMD_NICE plzip --threads=1 -9 --dictionary-size=16MiB "$S_FP.tar" ; sync ; wait ; fi ' ./fff
    #
    #--------------------
    if [ "$SB_TAR_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_cre_tar_lz_t1="mmmv_polish_ABC_2_ACB_exec_t1 \"S_CMD_NICE=\\\"nice -n 17 \\\" ; S_FP=\\\"\" '\" ; \$S_CMD_NICE tar -cf \"\$S_FP.tar\" \"\$S_FP\" ; if [ \"\$?\" == \"0\" ]; then  sync ; wait ; \$S_CMD_NICE plzip --threads=1 -9 --dictionary-size=16MiB \"\$S_FP.tar\" ; sync ; wait ; fi ' "
    fi
    #--------------------
    #TODO: Create some soft of a  reverse of the alias mmmv_cre_tar_lz_t1.
    #      To avoid cryptic code, the reverse might be 
    #      some Bash script, NOT an alias. Supposedly the lzip/plzip 
    #      includes some integrity checksum, but for security reasons
    #      the Silktorrent idea that an integrity checksum should be
    #      encoded into a file name, might be proctical in many cases,
    #      so some form of lz-file crator script or alias should be
    #      created that encodes SHA256 or some other secure
    #      hash to a file name. Meanwhile a compromise solution
    #      might be to use the Silktorrent packager script, which
    #      creates files that have a name syntax that lacks
    #      freeform parts of the file and where the leftmost 
    #      part of the file name is reserved for a secure hash
    #      to help the various indices that list the stblob-s to 
    #      find the searched stblob-file name faster.
    #     
    # Some semi-random test-lines for future copy-pasting:
    #
    #     echo "Fo.tar.lz.o.tar.lz" | $S_CMD_GNU_SED -e 's/[.]\(\(tlz\)\|\(tar[.]lz\)\)$//'
    #
    #     if [ "$S_CMD_GNU_SED" == "" ]; then S_CMD_GNU_SED="`which gsed 2> /dev/null `" ;  wait ; fi ; if [ "$S_CMD_GNU_SED" == "" ]; then S_CMD_GNU_SED="`which sed 2> /dev/null `" ;  wait ; fi ; if [ "$S_CMD_GNU_SED" == "" ]; then echo -e "\e[31mGNU sed not found\e[39m." ; fi
    #
    #--------------------
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "plzip" "7ad5ba56-9c81-440e-a2d6-c040016168e7"
fi
#--------------------
SB_TARLZ_EXISTS_ON_PATH="f"
if [ "`which tarlz 2> /dev/null`" != "" ]; then
    SB_TARLZ_EXISTS_ON_PATH="t"
    #----------------------------------------
    # https://www.nongnu.org/lzip/lzip.html
    # ----------citation----start-------------
    # For creation and manipulation of
    # compressed tar archives tarlz can be
    # more efficient than using tar and plzip
    # because tarlz is able to keep the
    # alignment between tar members and lzip
    # members.
    # ----------citation----end---------------
    # archival copy: https://archive.ph/Qe2Qo
    #----------------------------------------
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "tarlz" "48d11f57-d124-4bc9-94d6-c040016168e7"
fi
#--------------------
SB_XZ_EXISTS_ON_PATH="f"
if [ "`which xz 2> /dev/null`" != "" ]; then
    SB_XZ_EXISTS_ON_PATH="t"
    S_TMP_0="64MiB"
    if [ "`echo '$S_UNAME_A' | grep -i 'Raspberry'`" == "" ]; then
        S_TMP_0="400MiB"
    fi
    export XZ_DEFAULTS="--memlimit=$S_TMP_0"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "xz" "2c5469b2-7c6f-44c6-91c6-c040016168e7"
fi
#--------------------
SB_UNXZ_EXISTS_ON_PATH="f"
if [ "`which unxz 2> /dev/null`" != "" ]; then
    SB_UNXZ_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "unxz" "d74eec2f-5860-4c8c-9b46-c040016168e7"
fi
#--------------------
SB_RAR_EXISTS_ON_PATH="f"
if [ "`which rar 2> /dev/null`" != "" ]; then
    SB_RAR_EXISTS_ON_PATH="t"
else
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "rar" "51e6a322-760b-4dde-a136-c040016168e7"
    fi
fi
#--------------------
SB_UNRAR_EXISTS_ON_PATH="f"
if [ "`which unrar 2> /dev/null`" != "" ]; then
    SB_UNRAR_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "unrar" "5d9d2021-df32-44e1-8236-c040016168e7"
fi
#--------------------
SB_ARJ_EXISTS_ON_PATH="f"
if [ "`which arj 2> /dev/null`" != "" ]; then
    SB_ARJ_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "arj" "ed608dc3-e3a8-4bed-9326-c040016168e7"
fi
#--------------------
SB_XAR_EXISTS_ON_PATH="f"
if [ "`which xar 2> /dev/null`" != "" ]; then
    SB_XAR_EXISTS_ON_PATH="t"
#else
#    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
#        "xar" "321c88f6-dd6c-49fd-b316-c040016168e7"
fi
if [ "$SB_XZ_EXISTS_ON_PATH" != "" ]; then
    #----------------------------------------
    if [ "$SB_XZ_EXISTS_ON_PATH" == "t" ]; then
        if [ "$SB_XAR_EXISTS_ON_PATH" == "t" ]; then
            if [ "$XZ_DEFAULTS" != "" ]; then
                alias mmmv_xar="XZ_DEFAULTS=\"$XZ_DEFAULTS\" nice -n 17 xar --toc-cksum=sha256 --compression=xz  --compression-args=9 --coalesce-heap --keep-existing "
            else
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo -e "\e[31mThe code of this Bash file is flawed.\e[39m"
                    echo ""
                    echo "     XZ_DEFAULTS==\"$XZ_DEFAULTS\" "
                    echo ""
                    echo "GUID=='75867411-d92e-4d22-b2f7-c040016168e7'"
                    echo ""
                fi
            fi
        fi
    else
        if [ "$SB_XZ_EXISTS_ON_PATH" != "f" ]; then
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                echo ""
                echo -e "\e[31mThe code of this Bash file is flawed.\e[39m"
                echo ""
                echo "     SB_XZ_EXISTS_ON_PATH==\"$SB_XZ_EXISTS_ON_PATH\" "
                echo ""
                echo "GUID=='27283b01-915d-42a6-a2e7-c040016168e7'"
                echo ""
            fi
        fi
    fi
    #----------------------------------------
else
    if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
        echo ""
        echo -e "\e[31mThe code of this Bash file is flawed.\e[39m"
        echo ""
        echo "     SB_XZ_EXISTS_ON_PATH==\"$SB_XZ_EXISTS_ON_PATH\" "
        echo ""
        echo "GUID=='39277eb5-7f2f-4fd0-94e7-c040016168e7'"
        echo ""
    fi
fi
#--------------------------------------------------------------------------
#::::::::::::::::::::::::HTML::to::PDF::converters:::::::::::::::::::::::::
#--------------------------------------------------------------------------
S_TMP_0="`which wkhtmltopdf 2> /dev/null`"
SB_WKHTMLTOPDF_EXISTS_ON_PATH="f"
if [ "$S_TMP_0" != "" ]; then
    SB_WKHTMLTOPDF_EXISTS_ON_PATH="t"
    alias mmmv_HTML2PDF_wkhtmltopdf="nice -n 19 wkhtmltopdf "
fi
# TODO: A technology that should be wrapped to be used
# as a console application like the wkhtmltopdf is the 
# https://developers.google.com/web/tools/puppeteer/
# Thank You, Raivo Laanemets @ https://infdot.com/, for 
# the Puppeteer reference.
#
#--------------------------------------------------------------------------
#:::::::::::::::::::::::::PDF::to::X::converters:::::::::::::::::::::::::::
#--------------------------------------------------------------------------
# Sometimes it is difficult to remmber, that 
# Foo2Bar is spelled as FootoBar. Hence the aliases.
#--------------------
SB_PDFTOCAIRO_EXISTS_ON_PATH="f"
if [ "`which pdftocairo 2> /dev/null`" != "" ]; then
    SB_PDFTOCAIRO_EXISTS_ON_PATH="t"
    alias pdf2cairo="nice -n 2 pdftocairo "
#else
    #func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
    #    "pdftocairo" "bad8a857-cf75-4063-91f5-c040016168e7"
fi
#--------------------
SB_PDFTOHTMl_EXISTS_ON_PATH="f"
if [ "`which pdftohtml 2> /dev/null`" != "" ]; then
    SB_PDFTOHTMl_EXISTS_ON_PATH="t"
    alias pdf2html="nice -n 2 pdftohtml "
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "pdftohtml" "298e8ac2-da01-4fc1-bef5-c040016168e7"
fi
#--------------------
SB_PDFTOPPM_EXISTS_ON_PATH="f"
if [ "`which pdftoppm 2> /dev/null`" != "" ]; then
    SB_PDFTOPPM_EXISTS_ON_PATH="t"
    alias pdf2ppm="nice -n 2 pdftoppm "
#else
    #func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
    #    "pdftoppm" "5ff3bee1-a428-4baa-86e5-c040016168e7"
fi
#--------------------
SB_PDFTOPS_EXISTS_ON_PATH="f"
if [ "`which pdftops 2> /dev/null`" != "" ]; then
    SB_PDFTOPS_EXISTS_ON_PATH="t"
    alias pdf2ps="nice -n 2 pdftops "
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "pdftops" "19665e94-ef4b-4a26-91d5-c040016168e7"
fi
#--------------------
SB_PDFTOSRC_EXISTS_ON_PATH="f"
if [ "`which pdftosrc 2> /dev/null`" != "" ]; then
    SB_PDFTOSRC_EXISTS_ON_PATH="t"
    alias pdf2src="nice -n 2 pdftosrc "
#else
    #func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
    #    "pdftosrc" "40c38211-d344-4e20-85c5-c040016168e7"
fi
#--------------------
SB_PDFTOTEXT_EXISTS_ON_PATH="f"
if [ "`which pdftotext 2> /dev/null`" != "" ]; then
    SB_PDFTOTEXT_EXISTS_ON_PATH="t"
    alias pdf2text="nice -n 2 pdftotext "
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "pdftotext" "4d65c1a3-41bc-407e-86b5-c040016168e7"
fi
#--------------------------------------------------------------------------
#::::::::::::::::::::::::desktopo::environment:::::::::::::::::::::::::::::
#--------------------------------------------------------------------------
SB_GNOMETYPINGMONITOR_EXISTS_ON_PATH="t"
if [ "`which gnome-typing-monitor 2> /dev/null`" != "" ]; then
    SB_GNOMETYPINGMONITOR_EXISTS_ON_PATH="t"
    alias mmmv_ui_kill_gnometypingmonitor_t1="nice -n 2 killall gnome-typing-monitor "
    if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
        if [ "`ps -A | grep gnome-typing-monitor 2> /dev/null`" != "" ]; then
            echo ""
            echo -e "You may want to\e[33m run the alias mmmv_ui_kill_gnometypingmonitor_t1\e[39m"
            echo "or switch the gnome-typing-monitor off some other way,"
            echo "because that bully-ware is running right now."
            echo "GUID=='9061b919-3e67-4595-b4e7-c040016168e7'"
            echo ""
        fi
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    #--------------------
    SB_XDOTOOL_EXISTS_ON_PATH="f"
    if [ "`which xdotool 2> /dev/null`" != "" ]; then
        SB_XDOTOOL_EXISTS_ON_PATH="t"
        #--------
        # https://askubuntu.com/questions/4876/can-i-minimize-a-window-from-the-command-line
        # archival copy: https://archive.vn/sNxpI
        alias mmmv_ui_minimize_active_window_t1="nice -n 3 xdotool windowminimize \$(xdotool getactivewindow) "
        #--------
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "xdotool" "b58a2a26-f648-4824-95a5-c040016168e7"
    fi
    #--------------------
    SB_WMCTRL_EXISTS_ON_PATH="f"
    if [ "`which wmctrl 2> /dev/null`" != "" ]; then
        SB_WMCTRL_EXISTS_ON_PATH="t"
        alias mmmv_ui_switch_to_desktop_t1="nice -n 2 wmctrl -s " # desktop number is the argument
        #--------
        if [ "$SB_XDOTOOL_EXISTS_ON_PATH" == "t" ]; then
            # https://gist.github.com/platan/e63b465c2fcfe3d0cccd
            # archival copy:https://archive.ph/PZhM8 
            alias mmmv_ui_maximize_active_window_t1="nice -n 3 wmctrl -i -r \"\`xdotool getactivewindow\`\" -b add,maximized_vert,maximized_horz "
        fi
        #--------
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "wmctrl" "57220145-b5c4-47aa-a5a5-c040016168e7"
    fi
    #--------------------
    if [ "$SB_GSETTINGS_WORKS_T1" != "" ]; then
        func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
            "$SB_GSETTINGS_WORKS_T1" "SB_GSETTINGS_WORKS_T1" \
            "b8e91f2c-8443-48ca-b195-c040016168e7"
        if [ "$SB_VERIFICATION_FAILED" == "t" ]; then
            SB_GSETTINGS_WORKS_T1="f" # to allow code at future locations 
                                      # of the control flow to work
        fi
    else
        SB_GSETTINGS_WORKS_T1="f" # exists to avoid some tests at sub-sessions
    fi
    #--------
    SB_GSETTINGS_EXISTS_ON_PATH="f"
    if [ "`which gsettings 2> /dev/null`" != "" ]; then
        SB_GSETTINGS_EXISTS_ON_PATH="t"
        #--------
        # https://askubuntu.com/questions/209597/how-do-i-change-keyboards-from-the-command-line
        # archival copy: https://archive.ph/Lh4L7
        #
        #     gsettings set org.gnome.desktop.input-sources sources "[('xkb','us'),('xkb','ee'),('xkb','ru')]"
        #     gsettings list-recursively org.gnome.desktop.input-sources
        #
        #--------
        if [ "$SB_GSETTINGS_WORKS_T1" != "t" ]; then
            S_TMP_0="`gsettings list-recursively org.gnome.desktop.input-sources 1> /dev/null; printf \"\$?\"`"
            if [ "$S_TMP_0" == "0" ]; then
                if [ "`gsettings list-recursively org.gnome.desktop.input-sources 2> /dev/null`" != "" ]; then
                    SB_GSETTINGS_WORKS_T1="t"
                fi
            fi
        fi
        if [ "$SB_GSETTINGS_WORKS_T1" == "t" ]; then
            alias mmmv_admin_gnome_declare_keyboard_layouts_us_ee_ru_t1="gsettings set org.gnome.desktop.input-sources sources \"[('xkb','us'),('xkb','ee'),('xkb','ru')]\" ; "
            alias mmmv_admin_gnome_declare_keyboard_layouts_us_ee_t1="gsettings set org.gnome.desktop.input-sources sources \"[('xkb','us'),('xkb','ee')]\" ; "
            alias mmmv_admin_gnome_declare_keyboard_layouts_us_t1="gsettings set org.gnome.desktop.input-sources sources \"[('xkb','us')]\" ; "
            alias mmmv_admin_gnome_declare_keyboard_layouts_ee_t1="gsettings set org.gnome.desktop.input-sources sources \"[('xkb','ee')]\" ; "
        fi
        #--------
     else
        if [ "$SB_GSETTINGS_WORKS_T1" == "t" ]; then
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                echo ""
                echo "A mmmv_userspace_distro_t1 related "
                echo -e "\e[31msubpart of the ~/.bashrc is probably flawed\e[39m."
                echo "The values of the "
                echo "    SB_GSETTINGS_WORKS_T1==\"$SB_GSETTINGS_WORKS_T1\""
                echo "    SB_GSETTINGS_EXISTS_ON_PATH==\"$SB_GSETTINGS_EXISTS_ON_PATH\""
                echo "are in conflict with each other."
                echo "GUID=='b57e7746-44eb-4df4-a1d7-c040016168e7'"
                echo ""
            fi
        fi
    #     func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
    #         "gsettings" "a17c293b-5531-43d5-b185-c040016168e7"
    fi
    #--------------------
    SB_IMPORT_EXISTS_ON_PATH="f"
    if [ "`which import 2> /dev/null`" != "" ]; then
        SB_IMPORT_EXISTS_ON_PATH="t"
        # https://www.linuxquestions.org/questions/showthread.php?postid=671450
        # archival copy: https://archive.ph/MITPW
        #
        # Testing command:
        #
        #     bash -c "S_FP_PREFIX=\"`pwd`\" ; sleep 3; import -window root \$S_FP_PREFIX/\`date +%Y\`_\`date +%m\`_\`date +%d\`_X.jpeg "
        #
        #
        alias mmmv_cre_screenshot_3s_delay_t1="bash -c \"S_FP_PREFIX=\\\"\`pwd\`\\\" ; sleep 3; import -window root \\\$S_FP_PREFIX/\\\`date +%Y\\\`_\\\`date +%m\\\`_\\\`date +%d\\\`_X.jpeg \" "
        alias mmmv_cre_screenshot_6s_delay_t1="bash -c \"S_FP_PREFIX=\\\"\`pwd\`\\\" ; sleep 6; import -window root \\\$S_FP_PREFIX/\\\`date +%Y\\\`_\\\`date +%m\\\`_\\\`date +%d\\\`_X.jpeg \" "
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "import" "35de8241-bfa1-437c-9475-c040016168e7"
    fi
    #--------------------
    SB_GNOMECHARACTERS_EXISTS_ON_PATH="f"
    if [ "`which gnome-characters 2> /dev/null`" != "" ]; then
        SB_GNOMECHARACTERS_EXISTS_ON_PATH="t"
        alias mmmv_charmap_t1="nice -n 4 gnome-characters "
    # else
    #     func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
    #         "gnome-characters" "2c59ed48-d4e3-4e36-b575-c040016168e7"
    fi
    #--------------------
fi
#--------------------------------------------------------------------------
#::::::::::::::::::::::::::::::various:::::::::::::::::::::::::::::::::::::
#--------------------------------------------------------------------------
if [ "$MMMV_SB_LOOK_FOR_DEVELOPMENT_TOOLS" == "t" ]; then
    #----------------------------------------------------------------------
    SB_AUTOCONF_EXISTS_ON_PATH="f"
    if [ "`which autoconf 2> /dev/null`" != "" ]; then
        SB_AUTOCONF_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "autoconf" "71898f50-419c-4e68-8265-c040016168e7"
    fi
    #----------------------------------------------------------------------
fi
#--------------------
SB_BASE64_EXISTS_ON_PATH="f"
if [ "`which base64 2> /dev/null`" != "" ]; then
    SB_BASE64_EXISTS_ON_PATH="t"
fi
#--------------------
SB_STAT_EXISTS_ON_PATH="f"
if [ "`which stat 2> /dev/null`" != "" ]; then
    SB_STAT_EXISTS_ON_PATH="t"
    # Supposedly on Linux the "stat" is part of the GNU coreutils.
    # "stat" on FreeBSD is a separate program with a 
    # different interface.
fi
#--------------------
SB_BC_EXISTS_ON_PATH="f"
if [ "`which bc 2> /dev/null`" != "" ]; then
    SB_BC_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "bc" "e6eac429-df84-45f5-9455-c040016168e7"
fi
#--------------------
SB_PMAP_EXISTS_ON_PATH="f"
if [ "`which pmap 2> /dev/null`" != "" ]; then
    SB_PMAP_EXISTS_ON_PATH="t"
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_WSL" == "f" ]; then
    #----------------------------------------------------------------------
    # https://stackoverflow.com/questions/749544/pipe-to-from-the-clipboard-in-a-bash-script
    # The Linux clipboard use:
    #     Clipboard to file:
    #         xclip -out > ./x.txt
    #     File to clipboard: 
    #         xclip -selection c -in < ./x.txt
    #         # or another option
    #         cat ./x.txt | xclip -selection c -in 
    SB_XCLIP_EXISTS_ON_PATH="f"
    if [ "`which xclip 2> /dev/null`" != "" ]; then
        SB_XCLIP_EXISTS_ON_PATH="t"
        # Supposedly some binary with the name of "xclip"
        # is also available on FreeBSD
        # https://man.freebsd.org/cgi/man.cgi?query=xclip&sektion=1&manpath=FreeBSD+13.2-RELEASE+and+Ports
        # archival copy: https://archive.ph/pA9Gw
        # 
        # TODO: test, whether the BSD xclip matches with the
        #       Linux xclip or it is just named the same like
        #       the BSD sed has the same name as the sed on Linux
        #       despite the fact that the BSD sed is a 
        #       totally different program with different features.
        #
        # Supposedly Termux supports xclip:
        # https://sachachua.com/blog/2019/07/tweaking-emacs-on-android-via-termux-xclip-xdg-open-syncthing-conflicts/
        # archival copy: https://archive.is/Q7Nnr 
        #
        alias mmmv_ui_file2clipboard_t1="xclip -selection c -in " # file_name_comes_here
        # Sometimes the command looks like: "DISPLAY=":0" xclip -selection c -in Foo.txt
        alias mmmv_ui_clipboard2file_t1="xclip -out " # file_name_comes_here
    else
       func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
           "xclip" "52d86124-327a-4f79-b945-c040016168e7"
    fi
    #----------------------------------------------------------------------
fi
#--------------------
if [ "$MMMV_SB_LOOK_FOR_DEVELOPMENT_TOOLS" == "t" ]; then
    #----------------------------------------------------------------------
    SB_CHECKBASHISMS_EXISTS_ON_PATH="f"
    if [ "`which checkbashisms 2> /dev/null`" != "" ]; then
        SB_CHECKBASHISMS_EXISTS_ON_PATH="t"
    fi
    #--------------------
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
        SB_DEBTREE_EXISTS_ON_PATH="f"
        if [ "`which debtree 2> /dev/null`" != "" ]; then
            SB_DEBTREE_EXISTS_ON_PATH="t"
            # A command example:
            #
            #     debtree vim | dot -Tjpeg  > ./image.jpeg ; wait; sync; wait; viewnior ./image.jpeg
            #
        else
            # Please comment out the next 2 lines on distributions that are not based on Debian.
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "debtree" "f00ab315-4e8f-47e4-8145-c040016168e7"
            # Thank You.
        fi
    fi
    #--------------------
    SB_LIBTOOL_EXISTS_ON_PATH="f"
    if [ "`which libtool 2> /dev/null`" != "" ]; then
        # The GNU libtool is required for 
        # building at least some versions of the GCC.
        SB_LIBTOOL_EXISTS_ON_PATH="t"
    # The 
    #else
    #    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
    #        "libtool" "57c2dd22-c740-40dc-9335-c040016168e7"
    # can not be here, because the libtool might be 
    # added to PATH from applications folder later at this Bash script.
    fi
    #--------------------
    S_TMP_0="`which m4 2> /dev/null`"
    SB_M4_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_M4_EXISTS_ON_PATH="t"
        if [ "$M4" == "" ]; then
            # Some build scripts require that the environment variable 
            # M4 is set even, if the m4 is available on PATH.
            export M4="$S_TMP_0"
        fi
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "m4" "145fb1a3-8372-4558-8925-c040016168e7"
    fi
    #----------------------------------------------------------------------
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    S_TMP_0="`which pactl 2> /dev/null`"
    SB_PACTL_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_LPSTAT_EXISTS_ON_PATH="t"
        # Idea origin:
        # https://scarygliders.net/2012/04/06/get-audio-with-your-xrdpx11rdp-connections-lan-or-remote/
        # $MMMV_USERSPACE_DISTRO_T1_HOME/attic/documentation/
        #     third_party_documentation/Linux_and_BSD_administration/PulseAudio/
        #     2012_04_06_PulseAudio_TCP_module_setup_for_RDP_sound_t1.pdf
        alias mmmv_admin_pulseaudio_loadmodule_tcp_127_0_0_1="pactl load-module module-native-protocol-tcp auth-ip-acl=\"127.0.0.1\"; wait; sync; pactl list-modules | grep \"module-native-protocol-tcp\" "
        #--------------------
        if [ "$SB_AWK_EXISTS_ON_PATH" == "t" ]; then
            # TODO: Find out, how this awk/gawk part here works out on BSD.
            #       On linux the command "awk" is actually the GNU awk, which
            #       differs from the "awk" implementation on BSD.
            if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
                # Currently tested only on Linux.
                alias mmmv_ui_mic2speakers_on="pactl load-module module-loopback latency_msec=1 ;"
                alias mmmv_ui_mic2speakers_off="pactl unload-module \$(pactl list short modules | awk '\$2 ==\"module-loopback\" { print \$1 }' - )"
            fi
        fi
    fi
fi
#--------------------
SB_LOCALECTL_EXISTS_ON_PATH="f"
if [ "`which localectl 2> /dev/null`" != "" ]; then
    SB_LOCALECTL_EXISTS_ON_PATH="t"
    #----------------------------------------------------------------------
    # According to 
    #     https://man.freebsd.org/cgi/man.cgi?query=localectl&sektion=1&manpath=Debian+8.1.0
    #     archival copy: https://archive.ph/p7aCa
    # Some program with the name of "localectl" does seem to 
    # exist on FreeBSD and it does seem to have
    # command-line options "list-x11-keymap-models", "list-x11-keymap-layouts",
    # "list-x11-keymap-variants", "list-x11-keymap-options".
    #
    # A related reference:
    #     https://web.archive.org/web/20230614124516/https://unix.stackexchange.com/questions/43976/list-all-valid-kbd-layouts-variants-and-toggle-options-to-use-with-setxkbmap
    #     another archival copy: https://archive.ph/QnvYZ
    #     ---------slightly--modified---semicitation----start--------------
    #         localectl list-x11-keymap-layouts
    #             gives layouts (~100 on modern systems)
    # 
    #         localectl list-x11-keymap-variants de 
    #             gives variants for this layout (or all 
    #             variants if no layout specified, 
    #             ~300 on modern systems)
    # 
    #         localectl list-x11-keymap-options | grep grp
    #             gives all layout switching options
    #     ---------slightly--modified---semicitation----end----------------
    #----------------------------------------------------------------------
    if [ "$SB_TR_EXISTS_ON_PATH" == "t" ]; then
        if [ "$SB_PRINTF_EXISTS_ON_PATH" == "t" ]; then
            #--------------------
            alias mmmv_ui_display_keyboard_layouts_t1="printf \"\\n \`localectl list-x11-keymap-layouts | tr '\\n\\r' ' ' \` \n\n\""
            #--------------------
        fi
    fi
    #----------------------------------------------------------------------
fi
#--------------------
SB_SETXKBMAP_EXISTS_ON_PATH="f"
if [ "`which setxkbmap 2> /dev/null`" != "" ]; then
    SB_SETXKBMAP_EXISTS_ON_PATH="t"
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    SB_RESIZE_EXISTS_ON_PATH="f"
    if [ "`which resize 2> /dev/null`" != "" ]; then
        SB_RESIZE_EXISTS_ON_PATH="t"
        alias mmmv_ui_display_active_terminal_dimensions_in_characters_t1="nice -n 5 resize "
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "resize" "74220118-30e5-4c72-b115-c040016168e7"
    fi
fi
#--------------------
SB_SHRED_EXISTS_ON_PATH="f"
if [ "`which shred 2> /dev/null`" != "" ]; then
    SB_SHRED_EXISTS_ON_PATH="t"
    alias mmmv_fs_secure_erase_shred_1="nice -n 5 shred --iterations=1 --remove=wipe "
    alias mmmv_fs_secure_erase_shred_3="nice -n 5 shred --iterations=3 --remove=wipe "
    alias mmmv_fs_secure_erase_shred_5="nice -n 5 shred --iterations=5 --remove=wipe "
    alias mmmv_shred_t1="mmmv_polish_ABC_2_A_C_B_exec_t1 \"nice -n 2 shred --iterations=1 --remove=wipe \" \" ; wait ; sync \" " 
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "shred" "4c5ca471-4c68-4b47-9315-c040016168e7"
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    SB_SNAP_EXISTS_ON_PATH="f"
    if [ "`which snap 2> /dev/null`" != "" ]; then
        SB_SNAP_EXISTS_ON_PATH="t"
    # else
    #     # func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
    #     #     "snap" "1c31d605-2c78-46af-9405-c040016168e7"
    #     if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
    #         echo "As of 2023 the snap is a Ubuntu parent company censored package collection tool."
    #         echo -e "\e[33mOn Debian the snap might be installed by \e[39m"
    #         echo -e "\e[33m    apt-get install snapd \e[39m# yes, not the "snap", but "snapd"."
    #         echo ""
    #     fi
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    SB_SYSTEMCTL_EXISTS_ON_PATH="f"
    if [ "`which systemctl 2> /dev/null`" != "" ]; then
        SB_SYSTEMCTL_EXISTS_ON_PATH="t"
    fi
fi
#--------------------
SB_UUENCODE_EXISTS_ON_PATH="f"
if [ "`which uuencode 2> /dev/null`" != "" ]; then
    SB_UUENCODE_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "uuencode" "c043f729-240a-4c3d-93f4-c040016168e7"
    #if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo -e "The \"\e[33muuencode\e[39m\""
            echo -e "MIGHT be part of the package \"\e[33msharutils\e[39m\". "
            echo "GUID=='9a941ee6-6c24-409b-a1c7-c040016168e7'"
            echo ""
        fi
    #fi
fi
#--------------------
SB_UUDECODE_EXISTS_ON_PATH="f"
if [ "`which uudecode 2> /dev/null`" != "" ]; then
    SB_UUDECODE_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "uudecode" "2a941dd9-74ed-456e-93f4-c040016168e7"
    #if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo -e "The \"\e[33muudecode\e[39m\""
            echo -e "MIGHT be part of the package \"\e[33msharutils\e[39m\". "
            echo "GUID=='d5b75327-366c-4ff3-93c7-c040016168e7'"
            echo ""
        fi
    #fi
fi
#--------------------
SB_UUID_EXISTS_ON_PATH="f"
if [ "`which uuid 2> /dev/null`" != "" ]; then
    SB_UUID_EXISTS_ON_PATH="t"
else
   func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
       "uuid" "7f50341b-08fd-4e9e-83f4-c040016168e7"
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            # https://superuser.com/questions/621297/how-do-i-install-uuidgen
            # archival copy: https://archive.ph/S56pQ
            echo "On Debian based systems the \"uuid\" MIGHT be installed "
            echo -e "by installing a package named \"\e[33muuid-runtime\e[39m\"."
            echo "GUID=='1e56d76d-39e9-446e-a2c7-c040016168e7'"
            echo ""
        fi
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
    if [ "$SB_GREP_EXISTS_ON_PATH" == "t" ]; then
        if [ "$SB_GAWK_EXISTS_ON_PATH" == "t" ]; then
            if [ "$SB_PMAP_EXISTS_ON_PATH" == "t" ]; then
                alias mmmv_ui_ls_RAM_consumption_of_a_process_by_PID_t1="func_alias_f1(){ local S_0=\"\$1\" ; ps -A | grep \"\$S_0\" ; pmap \`ps -A  | grep --max-count=1 \"\$S_0\" | gawk '{printf \"%s\", \$1}'\` | grep writable ; } ; func_alias_f1 "
            fi
        fi
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    SB_FCCACHE_EXISTS_ON_PATH="f"
    if [ "`which fc-cache 2> /dev/null`" != "" ]; then
        SB_FCCACHE_EXISTS_ON_PATH="t"
        if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
            #--------
            # https://www.techrepublic.com/blog/linux-and-open-source/how-do-i-install-and-use-fonts-in-linux/
            # archival copy: https://archive.vn/UgphK
            alias mmmv_admin_refresh_fonts_cache_t1="nice -n 18 fc-cache -f -v "
            # should probably also make the 
            #
            #     ~/.fonts
            #
            # contents available to various applications.
            #--------
            # TODO: test it out on BSD so that 
            #       the alias could be defined on BSD.
            #       There's another reference to this alias in this 
            #       Bash file and the code region, where it resides,
            #       should also be updated after this alias has been
            #       made available on BSD.
            #--------
        fi
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "fc-cache" "d5985500-2d26-4175-98e4-c040016168e7"
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    SB_IPTABLES_EXISTS_ON_PATH="f"
    if [ "`which iptables 2> /dev/null`" != "" ]; then
        SB_IPTABLES_EXISTS_ON_PATH="t"
    # else
    #     func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
    #         "iptables" "3d7ba612-187d-4c9d-b4e4-c040016168e7"
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    SB_UFW_EXISTS_ON_PATH="f"
    if [ "$SB_IPTABLES_EXISTS_ON_PATH" == "t" ]; then
        # https://launchpad.net/ufw
        # ufw is an iptables wrapper.
        # There MIGHT be some further documentation aobut the UFW at
        #     $MMMV_USERSPACE_DISTRO_T1_HOME/attic/documentation/
        #     third_party_documentation/Linux_and_BSD_administration/Linux_firewalls/UFW
        if [ "`which ufw 2> /dev/null`" != "" ]; then
            SB_UFW_EXISTS_ON_PATH="t"
        # else
        #     func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        #         "ufw" "335d5588-9e28-41ae-92d4-c040016168e7"
        fi
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    SB_GUFW_EXISTS_ON_PATH="f"
    if [ "$SB_UFW_EXISTS_ON_PATH" == "t" ]; then
        # gufw is an ufw wrapping GUI.
        if [ "`which gufw 2> /dev/null`" != "" ]; then
            SB_GUFW_EXISTS_ON_PATH="t"
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "gufw" "369e30a1-bd83-48c8-b7d4-c040016168e7"
        fi
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    SB_AUTHBIND_EXISTS_ON_PATH="f"
    if [ "`which authbind 2> /dev/null`" != "" ]; then
        # As root:
        #     echo "WhatEver" >> /etc/authbind/byport/80
        #     chown FooUser      /etc/authbind/byport/80
        #     chmod 0700         /etc/authbind/byport/80
        #
        # As FooUser:
        #     authbind --deep /pat/to/web_server_startu_scirpt 
        #     # and the web server's own configuration the binding port is 80.
        #     # The web server will run at FooUser privileges.
        #
        # The authbind MIGHT be available from Linux/BSD 
        # distribution standard package collection.
        SB_AUTHBIND_EXISTS_ON_PATH="t"
    # else
    #     func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
    #         "iptables" "177c1ac3-6c84-4a74-b3c4-c040016168e7"
    fi
fi
#--------------------------------------------------------------------------
#alias mmmv_visudo="visudo -f /etc/sudoers.d/mmmv_sudoers_seadistus "
#--------------------------------------------------------------------------
SB_USERNAME_IS_root="f"  # domain: {"t","f"}
SB_USERNAME_IS_mmmv="f"  # domain: {"t","f"}

if [ "$S_WHOAMI" == "root" ]; then
    SB_USERNAME_IS_root="t"
else
    #----------------------------------------------------------------------
    if [ "$S_WHOAMI" == "mmmv" ]; then
        #------------------------------------------------------------------
        SB_USERNAME_IS_mmmv="t"
        #------------------------------------------------------------------
        if [ "$SB_CHECKBASHISMS_EXISTS_ON_PATH" == "t" ]; then
            alias mmmv_devel_checkbashisms_common_bashrc_main_bash="checkbashisms --posix $S_FP_DIR/common_bashrc_main.bash "
        fi
        #------------------------------------------------------------------
        Z_PATH="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin_user_specific/mmmv:$Z_PATH"
        #------------------------------------------------------------------
    fi
    #----------------------------------------------------------------------
fi
#--------------------------------------------------------------------------
if [ "$SQLITE_LIMIT_LENGTH" == "" ]; then
    # According to the 
    #     https://www.sqlite.org/c3ref/c_limit_attached.html#sqlitelimitlength
    # the 
    export SQLITE_LIMIT_LENGTH="4294967295" # number of bytes
    #export SQLITE_LIMIT_LENGTH="104294967295" # number of bytes
    # is, a citation: "The maximum size of any string or 
    # BLOB or table row, in bytes."
fi

#--------------------------------------------------------------------------
export MMMV_DEVEL_TOOLS_HOME="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/lib/mmmv_devel_tools/2015_01_22_mmmv_devel_tools_without_JumpGUID_and_IDE_integration_v_02_with_UpGUID_bugfix"
S_FP_0="$MMMV_DEVEL_TOOLS_HOME/src/api/mmmv_devel_tools_bashrc_extension.bash"
func_mmmv_include_bashfile_if_possible_t2 "$S_FP_0" "31b7817a-f596-459d-bfc4-c040016168e7"
Z_PATH="$Z_PATH:$PATH" # TODO: get rid of this hacky line after the 
                       # mmmv_devel_tools has been upgraded.
                       # The idea behind the hakcy line is that 
                       # the old mmmv_devel_tools modifies PATH, not Z_PATH,
                       # but at the end of this script the PATH="$Z_PATH".

#--------------------------------------------------------------------------
func_add_rust_applications_2_PATH(){
    # The tool for installing Rust:
    #
    #     https://rustup.rs/  
    #     https://github.com/rust-lang/rustup
    #
    # As of 2022_08_10 the rustup can be installed by executing:
    #
    #     curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    #
    S_FP_0="$HOME/.cargo" # the folder for the Rust package system
    if [ -e "$S_FP_0" ]; then
        if [ -d "$S_FP_0" ]; then
            func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
                "$S_FP_0" \
                "3a8d1841-f78d-4afc-93c4-c040016168e7" 
        fi
    else
        if [ -h "$S_FP_0" ]; then # broken symlink
            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                "$S_FP_0" "fd442b1e-2496-4318-92b4-c040016168e7" \
                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        fi
    fi
} # func_add_rust_applications_2_PATH
# The 
func_add_rust_applications_2_PATH
# must be called before the /mmmv/applications/declare_applications.bash
# is executed, because otherwise it is not possible to override
# some of the rust/cargo programs like the exa.
#
#     https://github.com/ogham/exa/archive/refs/tags/v0.10.1.tar.gz
#
# The Rust/cargo upstream solution was to add 
#
#     ". $HOME/.cargo/env"
#
# without the quotation marks, to the ~/.bashrc.
# That would be equivalent to 
#
#     source "$HOME/.cargo/env"
#
#--------------------------------------------------------------------------
# To save operating system userspace distribution creators
# from studying this huge ./common_bashrc_main.bash , 
# the userspace distribution specific parts 
# are placed to a separate, dedicated, file:
S_FP_0="$S_FP_DIR/subparts/mmmv_userspace_distro_t1_specific/appliance_instance_specific_Bash_code/appliance_instance_specific_main.bash"
func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_FP_0"
# which optionally includes the 
#
#     /home/mmmv/applications/declare_applications.bash
#
S_FP_APPLIANCE_INSTANCE_SPECIFIC_MAIN_BASH="$S_FP_0" # optionally used later at an error message.

# The 
S_FP_0="$S_FP_DIR/subparts/mmmv_userspace_distro_t1_specific/common_bashrc_ruby_related.bash"
func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_FP_0"
# has to be included only after the application delcaration 
# Bash scripts have been included.

S_FP_0="$S_FP_DIR/subparts/mmmv_userspace_distro_t1_specific/common_bashrc_python_related.bash"
func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_FP_0"


S_FP_0="$S_FP_DIR/subparts/mmmv_userspace_distro_t1_specific/common_bashrc_alias_mmmv_image_viewer.bash"
func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_FP_0"

#--------------------------------------------------------------------------
S_FP_0="$HOME/mmff_$S_WHOAMI"
if [ -e "$S_FP_0" ]; then
    if [ -d "$S_FP_0" ]; then
        alias mmmv_go_mmff="cd $S_FP_0"
    fi
fi
S_FP_1="$S_FP_0/m_local"
if [ -e $S_FP_1/bin ]; then
    if [ -d $S_FP_1/bin ]; then
        Z_PATH="$S_FP_1/bin:$Z_PATH"
    fi
fi
#--------
S_FP_0="$HOME/mmff/m_local"
if [ -e $S_FP_0/bin ]; then
    if [ -d $S_FP_0/bin ]; then
        Z_PATH="$S_FP_0/bin:$Z_PATH"
    fi
fi
S_FP_0="$HOME/m_local"
if [ -e $S_FP_0/bin ]; then
    if [ -d $S_FP_0/bin ]; then
        Z_PATH="$S_FP_0/bin:$Z_PATH"
    fi
fi
#--------------------------------------------------------------------------
FP_MMMV="$HOME/.mmmv"
FP_MMMV_BASHRC="$FP_MMMV/mmmv_bashrc"
FP_MMMV_USERSPECIFIC_SUBPART_OF_VIMRC="$FP_MMMV/_vimrc_userspecific_subpart_that_will_be_overwritten_automatically.vim"
FP_MMMV_USERSPECIFIC_SUBPART_OF_VIMRC_TEMPLATE="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/lib/templates/_vimrc_userspecific_subpart_that_will_be_overwritten_automatically_template.vim"
FP_MMMV_BASHRC_DYNAMIC_SYMLINKS_ON_PATH="$FP_MMMV_BASHRC/dynamic_symlinks_on_PATH"
SB_MMMV_BASHRC_DYNAMIC_SYMLINKS_ON_PATH_EXISTS="f"
#--------------------------------------------------------------------------
if [ ! -e "$FP_MMMV" ]; then
    mkdir -p $FP_MMMV
    func_mmmv_wait_and_sync_t1
    func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
        "$FP_MMMV" "248e1e4f-6c6d-46bf-a3b4-c040016168e7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
fi
#--------------------------------------------------------------------------
if [ ! -e "$FP_MMMV_BASHRC" ]; then
    mkdir -p $FP_MMMV_BASHRC 
    func_mmmv_wait_and_sync_t1
    func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
        "$FP_MMMV_BASHRC" "0c20ea15-1d6e-41cc-82b4-c040016168e7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
fi
#--------------------------------------------------------------------------
if [ -e "$FP_MMMV" ]; then
    if [ -d "$FP_MMMV" ]; then
        #------------------------------------------------------------------
        if [ ! -e "$FP_MMMV_USERSPECIFIC_SUBPART_OF_VIMRC" ]; then
            cp "$FP_MMMV_USERSPECIFIC_SUBPART_OF_VIMRC_TEMPLATE" \
                "$FP_MMMV_USERSPECIFIC_SUBPART_OF_VIMRC"
            func_mmmv_wait_and_sync_t1
            chmod 0700 "$FP_MMMV_USERSPECIFIC_SUBPART_OF_VIMRC"
            func_mmmv_wait_and_sync_t1
        fi
        func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
            "$FP_MMMV_USERSPECIFIC_SUBPART_OF_VIMRC" \
            "c7c07d54-8505-4dad-b1b4-c040016168e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        #------------------------------------------------------------------
        if [ -e "$FP_MMMV_BASHRC" ]; then
            if [ -d "$FP_MMMV_BASHRC" ]; then
                #----------------------------------------------------------
                if [ ! -e "$FP_MMMV_BASHRC_DYNAMIC_SYMLINKS_ON_PATH" ]; then
                    mkdir -p $FP_MMMV_BASHRC_DYNAMIC_SYMLINKS_ON_PATH 
                    func_mmmv_wait_and_sync_t1
                fi
                func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                    "$FP_MMMV_BASHRC_DYNAMIC_SYMLINKS_ON_PATH" \
                    "ef3a2734-5bec-4e35-b2a4-c040016168e7" \
                    "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
                if [ -e "$FP_MMMV_BASHRC_DYNAMIC_SYMLINKS_ON_PATH" ]; then
                    if [ -d "$FP_MMMV_BASHRC_DYNAMIC_SYMLINKS_ON_PATH" ]; then
                        SB_MMMV_BASHRC_DYNAMIC_SYMLINKS_ON_PATH_EXISTS="t"
                    fi
                fi
                #----------------------------------------------------------
            fi
        fi
        #------------------------------------------------------------------
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_MMMV_BASHRC_DYNAMIC_SYMLINKS_ON_PATH_EXISTS" == "t" ]; then
    Z_PATH="$FP_MMMV_BASHRC_DYNAMIC_SYMLINKS_ON_PATH:$Z_PATH"
fi
#--------------------------------------------------------------------------

func_mmmv_userspace_distro_t1_create_link_2_central_rc_file_if_local_rc_missing_t1(){
    local S_FP_LOCAL="$1"
    local S_FP_CENTRAL="$2"
    #-------------------
    local SB_OK_TO_CREATE_LINK="t"
    #-------------------
    # S_FP_CENTRAL file system checks
    if [ -h "$S_FP_CENTRAL" ]; then
        #echo "symbolic link, regardless of whether it is broken or not"
        if [ ! -e "$S_FP_CENTRAL" ]; then
            SB_OK_TO_CREATE_LINK="f"
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                echo ""
                echo "The "
                echo ""
                echo "    $S_FP_CENTRAL "
                echo ""
                echo "is a broken symlink."
                echo "GUID=='81fd2535-444f-42b7-a1b7-c040016168e7'"
                echo ""
            fi
        else
            if [ -d "$S_FP_CENTRAL" ]; then
                SB_OK_TO_CREATE_LINK="f"
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo "The "
                    echo ""
                    echo "    $S_FP_CENTRAL "
                    echo ""
                    echo "is a symlink to a folder, but "
                    echo "it must be a file or a symlink to a file."
                    echo "GUID=='569ab03f-3160-41d0-94b7-c040016168e7'"
                    echo ""
                fi
            fi
        fi
    else
        if [ ! -e "$S_FP_CENTRAL" ]; then
            SB_OK_TO_CREATE_LINK="f"
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                echo ""
                echo "The "
                echo ""
                echo "    $S_FP_CENTRAL "
                echo ""
                echo "is missing."
                echo "GUID=='c0ef4914-8bad-4ea3-a2a7-c040016168e7'"
                echo ""
            fi
        else
            if [ -d "$S_FP_CENTRAL" ]; then
                SB_OK_TO_CREATE_LINK="f"
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo "The "
                    echo ""
                    echo "    $S_FP_CENTRAL "
                    echo ""
                    echo "is a folder, but it must be a file or a symlink to a file."
                    echo "GUID=='8e209f47-c0fa-458e-94a7-c040016168e7'"
                    echo ""
                fi
            fi
        fi
    fi
    #-------------------
    # S_FP_LOCAL file system checks
    if [ "$SB_OK_TO_CREATE_LINK" == "t" ]; then
        if [ -h "$S_FP_LOCAL" ]; then
            if [ ! -e "$S_FP_LOCAL" ]; then
                rm -f $S_FP_LOCAL # deletes a broken symlink
            else
                # The symlink is not broken.
                SB_OK_TO_CREATE_LINK="f"
                if [ -d "$S_FP_LOCAL" ]; then
                    if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                        echo ""
                        echo "The "
                        echo ""
                        echo "    $S_FP_LOCAL "
                        echo ""
                        echo "is a symlink to a folder, but "
                        echo "it must be a file or a symlink to a file."
                        echo "GUID=='c57e0728-523a-401b-9297-c040016168e7'"
                        echo ""
                    fi
                fi
            fi # symlink_is_not_broken(S_FP_LOCAL)
        else # file or folder, not a symlink
            if [ -e "$S_FP_LOCAL" ]; then
                SB_OK_TO_CREATE_LINK="f"
                if [ -d "$S_FP_LOCAL" ]; then
                    if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                        echo ""
                        echo "The "
                        echo ""
                        echo "    $S_FP_LOCAL "
                        echo ""
                        echo "is a folder, but it must be "
                        echo "a file or a symlink to a file."
                        echo "GUID=='5592142e-62a8-40b4-9397-c040016168e7'"
                        echo ""
                    fi
                fi
            fi # exists(S_FP_LOCAL)
        fi # is_symlink(S_FP_LOCAL)
    fi # SB_OK_TO_CREATE_LINK === "t"
    #-------------------
    if [ "$SB_OK_TO_CREATE_LINK" == "t" ]; then
        ln -s $S_FP_CENTRAL $S_FP_LOCAL 
        func_mmmv_wait_and_sync_t1 
        if [ -h $S_FP_LOCAL ]; then
            if [ ! -e $S_FP_LOCAL ]; then
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo "The "
                    echo ""
                    echo "    $S_FP_LOCAL "
                    echo ""
                    echo "is a broken symlink to the "
                    echo ""
                    echo "    $S_FP_CENTRAL "
                    echo ""
                    echo "GUID=='b413c1b7-5834-4e1c-b497-c040016168e7'"
                    echo ""
                fi
            fi
        else
            if [ ! -e $S_FP_LOCAL ]; then
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo "The "
                    echo ""
                    echo "    $S_FP_LOCAL "
                    echo ""
                    echo "is missing."
                    echo "GUID=='b680bb2b-8b43-42f7-8587-c040016168e7'"
                    echo ""
                fi
            fi
        fi
    fi # SB_OK_TO_CREATE_LINK === "t"
} # func_mmmv_userspace_distro_t1_create_link_2_central_rc_file_if_local_rc_missing_t1

#--------------------------------------------------------------------------

func_mmmv_userspace_distro_t1_create_link_2_central_rc_folder_if_local_rc_missing_t1(){
    local S_FP_LOCAL="$1"
    local S_FP_CENTRAL="$2"
    #-------------------
    local SB_OK_TO_CREATE_LINK="t"
    #-------------------
    # S_FP_CENTRAL file system checks
    if [ -h "$S_FP_CENTRAL" ]; then
        #echo "symbolic link, regardless of whether it is broken or not"
        if [ ! -e "$S_FP_CENTRAL" ]; then
            SB_OK_TO_CREATE_LINK="f"
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                echo ""
                echo "The "
                echo ""
                echo "    $S_FP_CENTRAL "
                echo ""
                echo "is a broken symlink."
                echo "GUID=='a5bcf04a-354c-4b0b-b887-c040016168e7'"
                echo ""
            fi
        else
            if [ ! -d "$S_FP_CENTRAL" ]; then
                SB_OK_TO_CREATE_LINK="f"
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo "The "
                    echo ""
                    echo "    $S_FP_CENTRAL "
                    echo ""
                    echo "is a symlink to a file, but "
                    echo "it must be a folder or a symlink to a folder."
                    echo "GUID=='b78ea01c-8c39-4939-9587-c040016168e7'"
                    echo ""
                fi
            fi
        fi
    else
        if [ ! -e "$S_FP_CENTRAL" ]; then
            SB_OK_TO_CREATE_LINK="f"
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                echo ""
                echo "The "
                echo ""
                echo "    $S_FP_CENTRAL "
                echo ""
                echo "is missing."
                echo "GUID=='c80d7b27-29a0-4322-b177-c040016168e7'"
                echo ""
            fi
        else
            if [ ! -d "$S_FP_CENTRAL" ]; then
                SB_OK_TO_CREATE_LINK="f"
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo "The "
                    echo ""
                    echo "    $S_FP_CENTRAL "
                    echo ""
                    echo "is a file, but it must be a folder or a symlink to a folder."
                    echo "GUID=='b402280a-fefb-426f-9477-c040016168e7'"
                    echo ""
                fi
            fi
        fi
    fi
    #-------------------
    # S_FP_LOCAL file system checks
    if [ "$SB_OK_TO_CREATE_LINK" == "t" ]; then
        if [ -h "$S_FP_LOCAL" ]; then
            if [ ! -e "$S_FP_LOCAL" ]; then
                rm -f $S_FP_LOCAL # deletes a broken symlink
            else
                # The symlink is not broken.
                SB_OK_TO_CREATE_LINK="f"
                if [ ! -d "$S_FP_LOCAL" ]; then
                    if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                        echo ""
                        echo "The "
                        echo ""
                        echo "    $S_FP_LOCAL "
                        echo ""
                        echo "is a symlink to a file, but "
                        echo "it must be a folder or a symlink to a folder."
                        echo "GUID=='87a517a2-715c-4497-ad67-c040016168e7'"
                        echo ""
                    fi
                fi
            fi # symlink_is_not_broken(S_FP_LOCAL)
        else # file or folder, not a symlink
            if [ -e "$S_FP_LOCAL" ]; then
                SB_OK_TO_CREATE_LINK="f"
                if [ ! -d "$S_FP_LOCAL" ]; then
                    if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                        echo ""
                        echo "The "
                        echo ""
                        echo "    $S_FP_LOCAL "
                        echo ""
                        echo "is a file, but it must be "
                        echo "a folder or a symlink to a folder."
                        echo "GUID=='be0ff959-c25e-47b1-b467-c040016168e7'"
                        echo ""
                    fi
                fi
            fi # exists(S_FP_LOCAL)
        fi # is_symlink(S_FP_LOCAL)
    fi # SB_OK_TO_CREATE_LINK === "t"
    #-------------------
    if [ "$SB_OK_TO_CREATE_LINK" == "t" ]; then
        ln -s $S_FP_CENTRAL $S_FP_LOCAL 
        func_mmmv_wait_and_sync_t1 
        if [ -h $S_FP_LOCAL ]; then
            if [ ! -e $S_FP_LOCAL ]; then
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo "The "
                    echo ""
                    echo "    $S_FP_LOCAL "
                    echo ""
                    echo "is a broken symlink to the "
                    echo ""
                    echo "    $S_FP_CENTRAL "
                    echo ""
                    echo "GUID=='c4c4d229-825d-4fe7-9457-c040016168e7'"
                    echo ""
                fi
            fi
        else
            if [ ! -e $S_FP_LOCAL ]; then
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo "The "
                    echo ""
                    echo "    $S_FP_LOCAL "
                    echo ""
                    echo "is missing."
                    echo "GUID=='3960e3ae-0779-4174-a257-c040016168e7'"
                    echo ""
                fi
            fi
        fi
    fi # SB_OK_TO_CREATE_LINK === "t"
} # func_mmmv_userspace_distro_t1_create_link_2_central_rc_folder_if_local_rc_missing_t1

#--------------------------------------------------------------------------
S_FP_RCFILE_USERSPECIFIC="$HOME/.vimrc"
S_FP_RCFILE_SHARED="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/_vimrc"
func_mmmv_userspace_distro_t1_create_link_2_central_rc_file_if_local_rc_missing_t1 \
  "$S_FP_RCFILE_USERSPECIFIC" \
  "$S_FP_RCFILE_SHARED" 

S_FP_RCFILE_USERSPECIFIC="$HOME/.octaverc"
S_FP_RCFILE_SHARED="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/_octaverc"
func_mmmv_userspace_distro_t1_create_link_2_central_rc_file_if_local_rc_missing_t1 \
  "$S_FP_RCFILE_USERSPECIFIC" \
  "$S_FP_RCFILE_SHARED" 

S_FP_RCFILE_USERSPECIFIC="$HOME/.Xdefaults"
S_FP_RCFILE_SHARED="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/_Xdefaults"
func_mmmv_userspace_distro_t1_create_link_2_central_rc_file_if_local_rc_missing_t1 \
  "$S_FP_RCFILE_USERSPECIFIC" \
  "$S_FP_RCFILE_SHARED" 
#--------------------------------------------------------------------------
S_FP_FONTS_HOME="$HOME/.fonts"
S_FP_FONTS_CENTRAL="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/_fonts"
#--------
SB_S_FP_FONTS_HOME_EXISTS_BEFORE_SYMLINK_CREATION_ATTEMPT="f"
if [ -e "$S_FP_FONTS_HOME" ]; then
    if [ -d "$S_FP_FONTS_HOME" ]; then
        SB_S_FP_FONTS_HOME_EXISTS_BEFORE_SYMLINK_CREATION_ATTEMPT="t"
    else
        # Outputs an error message.
        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
            "$S_FP_FONTS_HOME" "42319bd8-8808-4a68-9aa4-c040016168e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    fi
fi
#--------
func_mmmv_userspace_distro_t1_create_link_2_central_rc_folder_if_local_rc_missing_t1 \
  "$S_FP_FONTS_HOME" \
  "$S_FP_FONTS_CENTRAL" 
#--------
if [ "$SB_S_FP_FONTS_HOME_EXISTS_BEFORE_SYMLINK_CREATION_ATTEMPT" == "f" ]; then
    if [ -e "$S_FP_FONTS_HOME" ]; then
        if [ -d "$S_FP_FONTS_HOME" ]; then
            if [ "$SB_FCCACHE_EXISTS_ON_PATH" == "t" ]; then
                if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
                    # https://www.techrepublic.com/blog/linux-and-open-source/how-do-i-install-and-use-fonts-in-linux/
                    # archival copy: https://archive.vn/UgphK
                    nice -n 15 fc-cache -f -v 
                    # Related Bash alias: mmmv_admin_refresh_fonts_cache_t1
                fi
            fi
        else
            # Outputs an error message.
            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                "$S_FP_FONTS_HOME" "147b8fd1-2e05-4175-85a4-c040016168e7" \
                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        fi
    fi
fi
#--------------------------------------------------------------------------
FP_DOT_VIM_MANUALLY_INSTALLED_PLUGINS="$HOME/.vim/manually_installed_plugins"
if [ ! -e "$FP_DOT_VIM_MANUALLY_INSTALLED_PLUGINS" ]; then
    if [ -h "$FP_DOT_VIM_MANUALLY_INSTALLED_PLUGINS" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo "The"
            echo "    $FP_DOT_VIM_MANUALLY_INSTALLED_PLUGINS"
            echo ""
            echo "is a broken symlink."
            echo "GUID=='5a2ae483-27c2-4f31-9257-c040016168e7'"
            echo ""
        fi
    else
        mkdir -p $FP_DOT_VIM_MANUALLY_INSTALLED_PLUGINS
        func_mmmv_wait_and_sync_t1
        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
            "$FP_DOT_VIM_MANUALLY_INSTALLED_PLUGINS" \
            "3a8373a3-556b-41d7-b5a4-c040016168e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    fi
else
    # The next line gives an error message, if it is a file.
    func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
        "$FP_DOT_VIM_MANUALLY_INSTALLED_PLUGINS" \
        "90e4eb4c-cbfa-4c34-a494-c040016168e7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
fi

#--------------------------------------------------------------------------
# For security reasons each operating system user installs 
# its own set of Ruby gems, python packages, etc. To avoid
# re-downloading everything and to mitigate the effect of network outages,
# the Ruby gems, python packages, NodeJS packages, etc.
# should be installed through a local proxy server that caches
# the downloaded files.
#
#--------------------------------------------------------------------------
S_TMP_LIST_OF_GEMS_00=" rake rdoc sqlite3 rspec \
    net dbf json hdf5 net-ssh rdf mail \
    graphviz gnuplot bundler test-unit "

S_TMP_LIST_OF_GEMS_01=" rethinkdb couchdb "

S_TMP_LIST_OF_GEMS_02=" micro_kanren "
    # miniKanren is a form of logic programming.
    # http://minikanren.org/

S_TMP_LIST_OF_GEMS_03=" bitmessage "

S_TMP_LIST_OF_GEMS_04=" solargraph "
    # The solagraph.org is about a Ruby "lanuage server".
    # The idea is that some basic support for a programming
    # language can be added to multiple IDEs at once by
    # having those IDEs communicate with a "language server"
    # by using a standardized "language server protocol". 
    #
    #     https://microsoft.github.io/language-server-protocol/
    #
    # The "language servers" handle the project specific source indexing 
    # and delegate as much as possible to the original compiler/interpreter 
    # of the programming language. List of "language server" implementations:
    #
    #     https://langserver.org/
    #     https://microsoft.github.io/language-server-protocol/implementors/servers/
    #
    # The phrase "language server" is in quotation marks here because
    # a more appropriate name for those software components is project_analysis_server.
    # As of 2020 a Vim plugin that can use the various project analysis servers is
    #
    #     https://github.com/autozimu/LanguageClient-neovim/blob/next/INSTALL.md
    #     https://github.com/autozimu/LanguageClient-neovim/
    #
    # As of 2020 the use of that Vim plugin assumes that the ~/.vimrc 
    # contains code that is similar to the following code:
    #::::::::citation:::start:::::::::::::::::::::::::
    # :"------------------------------------------------------------------------ 
    # :set runtimepath+=~/.vim/k2sitsi_paigaldatud_pluginad/LanguageClient-neovim
    # :
    # :" https://medium.com/usevim/vim-101-set-hidden-f78800142855
    # :set hidden
    # :let g:LanguageClient_serverCommands = {
    #     \ 'ruby': ['/home/ts2/m_local/bin_p/Ruby/paigaldatult/v_x_x_x_kasutuses/gem_home/bin/solargraph', 'stdio'],
    #     \ }
    # :nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
    # :nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
    # :nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
    # 
    # :" Language servers to study later:
    # :"    \ 'python': ['/usr/local/bin/pyls'],
    # :"    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    # :"   \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    # :"------------------------------------------------------------------------ 
    #::::::::citation:::end:::::::::::::::::::::::::::
    #
   
S_TMP_0="nice -n 5 gem install "
alias mmmv_admin_install_Ruby_gem_set_00_basic_tools="$S_TMP_0 $S_TMP_LIST_OF_GEMS_00"
alias mmmv_admin_install_Ruby_gem_set_01_additional_database_engines="$S_TMP_0 $S_TMP_LIST_OF_GEMS_01"
alias mmmv_admin_install_Ruby_gem_set_02_scientific_computing="$S_TMP_0 $S_TMP_LIST_OF_GEMS_02"
alias mmmv_admin_install_Ruby_gem_set_03_communication_applications="$S_TMP_0 $S_TMP_LIST_OF_GEMS_03"
alias mmmv_admin_install_Ruby_gem_set_04_development_tools="$S_TMP_0 $S_TMP_LIST_OF_GEMS_04"
alias mmmv_admin_install_Ruby_gem_all_mmmv_gem_sets=" \
    $S_TMP_0 $S_TMP_LIST_OF_GEMS_00 \
    $S_TMP_0 $S_TMP_LIST_OF_GEMS_01 \
    $S_TMP_0 $S_TMP_LIST_OF_GEMS_02 \
    $S_TMP_0 $S_TMP_LIST_OF_GEMS_03 \
    $S_TMP_0 $S_TMP_LIST_OF_GEMS_04 "

#--------------------------------------------------------------------------
# The Squid web cache server 
#
#     http://www.squid-cache.org/
#
# is usually installed from the standard package collection, because
# it is a legacy software that requires root privileges to run.
# The historic excuse for the root privilege requirement had 
# something to do with attaching to network interfaces, etc., but
# in practice the custom compiled version that is run by an ordinary
# user also works. By default the cached files might be stored at 
#
#     /var/spool/squid3
#
# A sample line from   /etc/squid3/squid.conf
# or <Squid installation home>/etc/squid.conf
#
#     #--------sample--config--excerpt--start--------------------
#     # Squid proxy home page: http://www.squid-cache.org/
#     # The command
#     #  
#     #     squid -k parse  
#     #  
#     # checks the syntax of this configuration file.  
#     # A custom-compiled squid process can be started by
#     #
#     #     cd <squid installation home>/sbin
#     #     # squid -z # mandatory at first run
#     #                # creates cache folder structure.
#     #     nice -n 13 squid
#     #
#     # The Linux system package collection version 
#     # of the Squid proxy server can be started/restarted by
#     #  
#     #     service squid3 restart  
#     #
#     # Just a useful Linux command: service --status-all
#     #
#     # The file path must not be a symlink. Format:
#     # http://www.squid-cache.org/Doc/config/cache_dir/
#     #
#     #     cache_dir diskd <folder path> <storage size in MB>  
#     #                     <# of subfolders at level 1> 
#     #                     <# of subfolders at level 2>
#     #
#     #cache_dir ufs /root/large_files/squid_salvestuspiirkond 100 16 256
#     cache_dir diskd /opt/hdd_01_for_large_files/large_files/some_username/squid_salvestuspiirkond  3000 32 256
#     #
#     # http://www.squid-cache.org/Doc/config/dns_v4_first/
#     # dns_v4_first off
#     dns_v4_first on
#     
#     maximum_object_size 200 MB
#     
#     #--------sample--config--excerpt--end---------------------
#
#--------------------------------------------------------------------------

export MMMV_PROXY_HOST="127.0.0.1" # localhost
# Squid defalt port: 3128
#export MMMV_PROXY_PORT="8500" # local tinyproxy
export MMMV_PROXY_PORT="8502" # local squid

S_TMP_0="http://$MMMV_PROXY_HOST" # space not allowed at the end
S_TMP_1=":$MMMV_PROXY_PORT"       # space not allowed at the end
S_TMP_2="/"
export MMMV_PROXY_URL="$S_TMP_0$S_TMP_1$S_TMP_2"

MMMV_SB_PROXY_SERVER_RUNS="f" # "t" for "true", "f" for "false"
#if [ "`ps -A | grep squid3 `" != "" ]; then
#if [ "`ps -A | grep tinyproxy `" != "" ]; then
if [ "`ps -A | grep squid `" != "" ]; then
    MMMV_SB_PROXY_SERVER_RUNS="t"
fi

#--------------------------------------------------------------------------

if [ "$MMMV_SB_PROXY_SERVER_RUNS" == "t" ]; then
    #--------
    S_TMP_0="wget -e use_proxy=yes "
    S_TMP_1=" -e http_proxy=$MMMV_PROXY_HOST" # space not allowed at the end
    S_TMP_2=":$MMMV_PROXY_PORT -e https_proxy=$MMMV_PROXY_HOST" # space not allowed at the end
    S_TMP_3=":$MMMV_PROXY_PORT -e ftp_proxy=$MMMV_PROXY_HOST" # space not allowed at the end
    S_TMP_4=":$MMMV_PROXY_PORT "
    MMMV_WGET_THROUGH_PROXY="$S_TMP_0$S_TMP_1$S_TMP_2$S_TMP_3$S_TMP_4 "
    alias mmmv_wget_proxy="nice -n 12 $MMMV_WGET_THROUGH_PROXY "
    #--------
    S_TMP_0="nice -n 5 gem install --http-proxy $MMMV_PROXY_URL "
    alias mmmv_admin_install_Ruby_gem_proxy="$S_TMP_0"
    alias mmmv_admin_install_Ruby_gem_set_00_basic_tools_proxy="$S_TMP_0 $S_TMP_LIST_OF_GEMS_00"
    alias mmmv_admin_install_Ruby_gem_set_01_additional_database_engines_proxy="$S_TMP_0 $S_TMP_LIST_OF_GEMS_01"
    alias mmmv_admin_install_Ruby_gem_set_02_scientific_computing_proxy="$S_TMP_0 $S_TMP_LIST_OF_GEMS_02"
    alias mmmv_admin_install_Ruby_gem_set_03_communication_applications_proxy="$S_TMP_0 $S_TMP_LIST_OF_GEMS_03"
    alias mmmv_admin_install_Ruby_gem_set_04_development_tools_proxy="$S_TMP_0 $S_TMP_LIST_OF_GEMS_04"
    alias mmmv_admin_install_Ruby_gem_all_mmmv_gem_sets_proxy="$S_TMP_0 \
        $S_TMP_0 $S_TMP_LIST_OF_GEMS_00 \
        $S_TMP_0 $S_TMP_LIST_OF_GEMS_01 \
        $S_TMP_0 $S_TMP_LIST_OF_GEMS_02 \
        $S_TMP_0 $S_TMP_LIST_OF_GEMS_03 \
        $S_TMP_0 $S_TMP_LIST_OF_GEMS_04 "
    #--------
    # The Python pip and pip3 installation commands 
    # are implemented as bash scripts at 
    # $MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin
    #--------
fi

#--------------------------------------------------------------------------
if [ "$SB_WGET_EXISTS_ON_PATH" == "t" ]; then
    S_FP_0="$S_FP_DIR/subparts/general/_bashrc_subpart_wget_t1"
    func_mmmv_include_bashfile_if_possible_t2 "$S_FP_0" "ed8a201b-2588-486d-9494-c040016168e7"
fi

S_FP_0="$S_FP_DIR/subparts/general/_bashrc_subpart_create_redirection_HTML_t1"
func_mmmv_include_bashfile_if_possible_t2 "$S_FP_0" "dbbe8b44-7c19-4210-8194-c040016168e7"

if [ "$SB_FIND_EXISTS_ON_PATH" == "t" ]; then
    S_FP_0="$S_FP_DIR/subparts/general/_bashrc_subpart_find_t1"
    func_mmmv_include_bashfile_if_possible_t2 "$S_FP_0" "566fb874-f35d-49bb-a594-c040016168e7"
fi
#--------------------------------------------------------------------------
S_TMP_0="`echo $LANG | grep UTF-8 `"
if [ "$S_TMP_0" == "" ]; then
    if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
        echo ""
        echo "The environment variable "
        echo ""
        echo "    LANG==\"$LANG\""
        echo ""
        echo "does not have a value with the required suffix of \"UTF-8\"."
        echo "Some of the possible accepted values are:"
        echo "\"en_GB.UTF-8\", \"en_US.UTF-8\", \"C.UTF-8\"."
        echo "GUID=='25ba24d5-57ac-4076-8447-c040016168e7'"
        echo ""
        # The UTF-8 locale is required by the Mosh .
        # https://mosh.org/
    fi
fi

#--------------------------------------------------------------------------
if [ "`which sshfs 2> /dev/null`" != "" ]; then
    export S_MMMV_HINT_SSHFS_T1="SSH connection failure does guarantee auto-unmounting. 
For reliability the unmount command must be always run before the mount command 

Unmount command for non-root users:
    fusermount -u <full path to the mounting point at the ssh client side>

Mount command for non-root users:
    nice -n 2 sshfs -oport=<ssh server port> username@domain.com:<full path to the mounting point folder at the ssh server side> <full path to the mounting point folder at the local machine>"
    #----
else
    S_TMP_0="The sshfs was not at PATH "
    S_TMP_1="at the start of this console session. "
    S_TMP_2="GUID=='1f61fa3d-2ce6-40c5-b347-c040016168e7'"
    export S_MMMV_HINT_SSHFS_T1="$S_TMP_0$S_NEWLINE$S_TMP_1$S_NEWLINE$S_TMP_2"
fi
if [ "`which fusermount 2> /dev/null`" == "" ]; then
    # The fusermount is for unmounting data carriers 
    # that are mounted with the sshfs.
    S_TMP_0="The fusermount was not at PATH "
    S_TMP_1="at the start of this console session. "
    S_TMP_2="GUID=='1b90bb50-dbec-4413-a147-c040016168e7'"
    export S_MMMV_HINT_SSHFS_T1="$S_TMP_0$S_NEWLINE$S_TMP_1$S_NEWLINE$S_TMP_2"
fi
alias mmmv_hint_sshfs_t1="echo \"\"; \\
    echo \"\$S_MMMV_HINT_SSHFS_T1\"; \\
    echo \"\" ;"

if [ -e "$HOME/.ssh" ]; then
    # The idea is that sometimes it is comfortable to just do 
    # "chmod 0755 /home/mmmv", but that may introduce a security flaw 
    # in terms of the readability of the ~/.ssh . The 
    nice -n 19 chmod       0700 "$HOME/.ssh"
    nice -n 19 chmod -f -R 0600 "$HOME/.ssh/*"
    func_mmmv_wait_and_sync_t1 
    # tries to mitigate that.
fi

#--------------------------------------------------------------------------

#if [ "$MMMV_SB_PROXY_SERVER_RUNS" == "t" ]; then

#fi

#--------------------------------------------------------------------------

func_general_Linux_userspace_specific_declarations(){
    alias mmmv_ls_K="nice -n 2 ls -l --block-size=K "
    alias mmmv_ls_M="nice -n 2 ls -l --block-size=M "
    alias mmmv_ls_G="nice -n 2 ls -l --block-size=G "
    alias mmmv_lssize_recursive_t1_Linux="nice -n 5 du  --human-readable --summarize ./ "
    alias mmmv_pid2username_t1="nice -n 5 ps -o user= -p " # PID id est operating system process ID, comes here
    alias mmmv_cp_cow_t1="nice -n 7 cp --reflink=auto "
    #----------------------------------------------------------------------
    if [ "$SB_NETSTAT_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_ls_ports_Linux_t1="nice -n 17 netstat -ltnp "
    fi
    #----------------------------------------------------------------------
    if [ "$SB_SERVICE_EXISTS_ON_PATH" == "t" ]; then
        # According to 
        #
        #     https://linuxhint.com/disable_unnecessary_services_debian_linux/
        #     archival copy: 
        #
        # the way to disable a service on Debian Linux is:
        #
        #     systemctl disable daemonname
        #
        # TODO: for some reason the control flow never reaches this line.
        #       Try to fix that some day.
        alias mmmv_ls_daemons_Linux_service_t1="nice -n 4 service --status-all  "
    fi
    #--------------------
    if [ "$SB_SYSTEMCTL_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_ls_daemons_Linux_systemctl_t2="nice -n 4 systemctl list-units --type=service "
    fi
    #----------------------------------------------------------------------
    if [ "$SB_GREP_EXISTS_ON_PATH" == "t" ]; then
        if [ "$SB_FIND_EXISTS_ON_PATH" == "t" ]; then
            if [ "$SB_WC_EXISTS_ON_PATH" == "t" ]; then
                alias mmmv_ls_filecount_t1="find . -type f | wc -l "
                alias mmmv_ls_dircount_t1="find . -type d | grep -E ^\.\/ | wc -l "
            fi
            if [ "$SB_XARGS_EXISTS_ON_PATH" == "t" ]; then
                alias mmmv_ls_K_recursive="nice -n 17 find . -name '*' -print0 |\
                    xargs -0 ls -l --block-size=K -d | grep -E ^[-] "
                alias mmmv_ls_M_recursive="nice -n 17 find . -name '*' -print0 |\
                    xargs -0 ls -l --block-size=M -d | grep -E ^[-] "
                alias mmmv_ls_G_recursive="nice -n 17 find . -name '*' -print0 |\
                    xargs -0 ls -l --block-size=G -d | grep -E ^[-] "
            fi
        fi
        if [ "$SB_USERNAME_IS_root" == "t" ]; then
            if [ "$SB_HDDTEMP_EXISTS_ON_PATH" == "t" ]; then
                if [ "$SB_DF_EXISTS_ON_PATH" == "t" ]; then
                    if [ "`df | grep mmcblk0p1`" != "" ]; then
                        alias mmmv_hddtemp_mmcblk0p1="hddtemp /dev/mmcblk0p1"
                    fi
                    #--------
                    if [ "`df | grep sda1`" != "" ]; then
                        alias mmmv_hddtemp_sda1="hddtemp /dev/sda1"
                    fi
                    if [ "`df | grep sda2`" != "" ]; then
                        alias mmmv_hddtemp_sda2="hddtemp /dev/sda2"
                    fi
                    if [ "`df | grep sda3`" != "" ]; then
                        alias mmmv_hddtemp_sda3="hddtemp /dev/sda3"
                    fi
                    #--------
                    if [ "`df | grep sdb1`" != "" ]; then
                        alias mmmv_hddtemp_sdb1="hddtemp /dev/sdb1"
                    fi
                    if [ "`df | grep sdb2`" != "" ]; then
                        alias mmmv_hddtemp_sdb2="hddtemp /dev/sdb2"
                    fi
                    if [ "`df | grep sdb3`" != "" ]; then
                        alias mmmv_hddtemp_sdb3="hddtemp /dev/sdb3"
                    fi
                    #--------
                    if [ "`df | grep sdc1`" != "" ]; then
                        alias mmmv_hddtemp_sdc1="hddtemp /dev/sdc1"
                    fi
                    if [ "`df | grep sdc2`" != "" ]; then
                        alias mmmv_hddtemp_sdc2="hddtemp /dev/sdc2"
                    fi
                    if [ "`df | grep sdc3`" != "" ]; then
                        alias mmmv_hddtemp_sdc3="hddtemp /dev/sdc3"
                    fi
                    #--------
                    if [ "`df | grep sdd1`" != "" ]; then
                        alias mmmv_hddtemp_sdd1="hddtemp /dev/sdd1"
                    fi
                    if [ "`df | grep sdd2`" != "" ]; then
                        alias mmmv_hddtemp_sdd2="hddtemp /dev/sdd2"
                    fi
                    if [ "`df | grep sdd3`" != "" ]; then
                        alias mmmv_hddtemp_sdd3="hddtemp /dev/sdd3"
                    fi
                    #--------
                    if [ "`df | grep sde1`" != "" ]; then
                        alias mmmv_hddtemp_sde1="hddtemp /dev/sde1"
                    fi
                    if [ "`df | grep sde2`" != "" ]; then
                        alias mmmv_hddtemp_sde2="hddtemp /dev/sde2"
                    fi
                    if [ "`df | grep sde3`" != "" ]; then
                        alias mmmv_hddtemp_sde3="hddtemp /dev/sde3"
                    fi
                    #--------
                fi
            fi
        else
            func_mmmv_verify_sb_t_f_but_do_not_exit_t1 \
                "$SB_USERNAME_IS_root" \
                "a40aee92-e74a-4714-a284-c040016168e7"
        fi # whoami === root
    fi
    #----------------------------------------------------------------------
    S_TMP_2="/snap"
    if [ -e $S_TMP_2 ]; then
        if [ -d $S_TMP_2 ]; then
            func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
                "$S_TMP_2" "610bc456-3f88-43f5-b184-c040016168e7" 
            # The "snaps" are Ubuntu/Canonical version of 
            # "universal" Linux packages
            #
            #     https:/$S_TMP_2craft.io/
            #
            # that can be installed as root like
            #
            #     snap install --classic anbox-installer ; sync ; wait ; anbox-installer
            #
        else
            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                "$S_TMP_2" "805ad54b-c400-4454-a484-c040016168e7" \
                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        fi
    fi
    #----------------------------------------------------------------------
} # func_general_Linux_userspace_specific_declarations

#--------------------------------------------------------------------------

func_general_BSD_userspace_specific_declarations(){
    #---------
    alias mmmv_ls_BKMG="nice -n 2 ls -lh "
    alias mmmv_lssize_recursive_t1_BSD="nice -n 5 du -sh ./ "
    #---------
    if [ "$SB_FIND_EXISTS_ON_PATH" == "t" ]; then
        if [ "$SB_GREP_EXISTS_ON_PATH" == "t" ]; then
            if [ "$SB_WC_EXISTS_ON_PATH" == "t" ]; then
                alias mmmv_ls_filecount_t1="find . -type f | wc -l "
                alias mmmv_ls_dircount_t1="find . -type d | grep -E ^\.\/ | wc -l "
            fi
            if [ "$SB_XARGS_EXISTS_ON_PATH" == "t" ]; then
                alias mmmv_ls_BKMG_recursive="nice -n 17 find . -name '*' \
                    -print0 | xargs -0 ls -lhd | grep -E ^[-] "
            fi
        fi
    fi
    #---------
    if [ "$SB_SYSCTL_EXISTS_ON_PATH" == "t" ]; then
        S_TMP_2="sysctl hw.model hw.machine hw.ncpu"
        alias mmmv_cpuinfo_BSD_t1="$S_TMP_2"
        # The 
        alias mmmv_CPU_info_BSD_t1="$S_TMP_2" 
        # is a duplicate to have something, wehre 
        # the CPU is written with capital letters.
    fi
    #---------
} # func_general_BSD_userspace_specific_declarations

#--------------------------------------------------------------------------

func_Windows_Subsystem_for_Linux_WSL_userspace_specific_declarations(){
    #----------------------------------------------------------------------
    SB_POWERSHELL_EXE_EXISTS_ON_PATH="f"
    if [ "`which powershell.exe 2> /dev/null`" != "" ]; then
        SB_POWERSHELL_EXE_EXISTS_ON_PATH="t"
        alias mmmv_ui_clipboard2file_t1="powershell.exe -c Get-Clipboard " # file_name_comes_here
    else
       func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
           "powershell.exe" "48f29796-1837-4ba1-8484-c040016168e7"
    fi
    #--------------------
    SB_CLIP_EXE_EXISTS_ON_PATH="f"
    if [ "`which clip.exe 2> /dev/null`" != "" ]; then
        SB_CLIP_EXE_EXISTS_ON_PATH="t"
        alias mmmv_ui_file2clipboard_t1="clip.exe " # file_name_comes_here
    # else
    #    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
    #        "clip.exe" "9f10462f-07e8-461f-a474-c040016168e7"
    fi
    #----------------------------------------------------------------------
    S_FP_TASKLIST_EXE="/mnt/c/Windows/System32/tasklist.exe"
    func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
        "$S_FP_TASKLIST_EXE" "0d36db10-26c7-46f3-8174-c040016168e7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        S_TMP_0="vcxsrv.exe"
        S_TMP_1="`$S_FP_TASKLIST_EXE | grep \"$S_TMP_0\" `"
        if [ "$S_TMP_1" == "" ]; then
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                echo ""
                if [ "$USER" != "mmmv" ]; then
                    echo "It might be that currently there are no X11 "
                    echo "implementations running, because the list of "
                    echo "Windows processes does not seem to include the"
                    echo ""
                    echo "    $S_TMP_0"
                    echo ""
                    echo "which is related to VcXsrv, which  "
                    echo "MIGHT be downloadable from "
                    echo ""
                    echo "    https://sourceforge.net/projects/vcxsrv/"
                    echo ""
                    echo "GUID=='271aa3f2-fe39-4ac1-8137-c040016168e7'"
                else
                    echo ""
                    echo "X11 not available." # as probabilistically expected, so 
                    # no long distracting texts needed.
                    echo "GUID=='ea4efd41-669b-4356-9237-c040016168e7'"
                fi
                echo ""
            fi
        fi
        #------------------------------------------------------------------
        # One way, how it MIGHT be possible to run X11 applications on the 
        # WSL (Windows Subsystem for Linux) Debian distribution is:
        #
        #     # On the Windows side install and start the VcXsrv 
        #     # that MIGHT be downloadable from 
        #     #     https://sourceforge.net/projects/vcxsrv/
        #     # or it MIGHT be found from somewhere at 
        #     # /home/mmmv/mmmv_userspace_distro_t1/attic
        #
        #     # On the Linux side as root user:
        #     apt-get install x11-apps
        #     apt-get install xeyes
        #
        #     # On the Linux side as plain user:
        #     # Restart a Linux Bash session that declares 
        #     #
        #     #     export DISPLAY=:0 
        #     #
        #     # somewhere at the ~/.bashrc or its sub-parts 
        #     # and then execute 
        #     xeyes # for testing, whether X11 applications can be run.
        #
        #------------------------------------------------------------------
    fi
    #----------------------------------------------------------------------
    local S_FP_BASHFILE="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/common_bashrc/subparts/mmmv_userspace_distro_t1_specific/appliance_instance_specific_Bash_code/autogenerated_by_adduser_cmd/Windows_10_WSL_Debian_v_4_4_0_autogenerated_bashrc.bash"
    local SB_OK_4_THE_BASHFILE_2_BE_MISSING_OPTIONAL="f" # domain: {"","t","f"}
    func_mmmv_include_bashfile_if_possible_t2 "$S_FP_BASHFILE" \
        "3a725723-79da-4c29-9374-c040016168e7" "$SB_OK_4_THE_BASHFILE_2_BE_MISSING_OPTIONAL"
    alias dmesg="sudo /bin/dmesg "
    #alias hddtemp="sudo /usr/sbin/hddtemp "
    #----------------------------------------------------------------------
    if [ "$SB_USERNAME_IS_root" == "t" ]; then
        # WSL specific way to mount the DVD/CDRW drive.
        alias mmmv_admin_mount_DVD_t1="mount -t drvfs D: /mnt/d "
    else
        func_mmmv_verify_sb_t_f_but_do_not_exit_t1 \
            "$SB_USERNAME_IS_root" \
            "d0120b5b-8aa4-42ea-a364-c040016168e7"
    fi
    #----------------------------------------------------------------------
} # func_Windows_Subsystem_for_Linux_WSL_userspace_specific_declarations

#--------------------------------------------------------------------------

func_FreeBSD_userspace_specific_declarations(){
    #----------------------------------------------------------------------
    local SB_ABSENCE_DETECTED="f" # domain: {"f","t"}
    #--------------------
    if [ "$SB_ATACONTROL_EXISTS_ON_PATH" != "t" ]; then
        SB_ABSENCE_DETECTED="t"
    fi
    if [ "$SB_AWK_EXISTS_ON_PATH" != "t" ]; then
        SB_ABSENCE_DETECTED="t"
    fi
    if [ "$SB_DMESG_EXISTS_ON_PATH" != "t" ]; then
        SB_ABSENCE_DETECTED="t"
    fi
    if [ "$SB_FSTYP_EXISTS_ON_PATH" != "t" ]; then
        SB_ABSENCE_DETECTED="t"
    fi
    if [ "$SB_GLABEL_EXISTS_ON_PATH" != "t" ]; then
        SB_ABSENCE_DETECTED="t"
    fi
    if [ "$SB_GPART_EXISTS_ON_PATH" != "t" ]; then
        SB_ABSENCE_DETECTED="t"
    fi
    if [ "$SB_GREP_EXISTS_ON_PATH" != "t" ]; then
        SB_ABSENCE_DETECTED="t"
    fi
    if [ "$SB_HEAD_EXISTS_ON_PATH" != "t" ]; then
        SB_ABSENCE_DETECTED="t"
    fi
    if [ "$SB_MOUNT_EXISTS_ON_PATH" != "t" ]; then
        SB_ABSENCE_DETECTED="t"
    fi
    if [ "$SB_PRINTF_EXISTS_ON_PATH" != "t" ]; then
        SB_ABSENCE_DETECTED="t"
    fi
    if [ "$SB_SH_EXISTS_ON_PATH" != "t" ]; then
        SB_ABSENCE_DETECTED="t"
    fi
    if [ "$SB_SORT_EXISTS_ON_PATH" != "t" ]; then
        SB_ABSENCE_DETECTED="t"
    fi
    if [ "$SB_STRINGS_EXISTS_ON_PATH" != "t" ]; then
        SB_ABSENCE_DETECTED="t"
    fi
    if [ "$SB_SWAPINFO_EXISTS_ON_PATH" != "t" ]; then
        SB_ABSENCE_DETECTED="t"
    fi
    if [ "$SB_SYSCTL_EXISTS_ON_PATH" != "t" ]; then
        SB_ABSENCE_DETECTED="t"
    fi
    if [ "$SB_TR_EXISTS_ON_PATH" != "t" ]; then
        SB_ABSENCE_DETECTED="t"
    fi
    #----------------------------------------------------------------------
    if [ "$SB_ABSENCE_DETECTED" == "f" ]; then
        local S_FP_LSBLK_V2021_07_11_HOME="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/operating_system_specific/FreeBSD/lsblk_for_FreeBSD/lsblk_for_FreeBSD_by_Slawomir_Wojciech_Wojtczak_and_minor_contributors/2021_07_11_downloaded"
        func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
            "$S_FP_LSBLK_V2021_07_11_HOME" \
            "71011536-0e84-4e18-8264-c040016168e7" 
    else
        if [ "$SB_ABSENCE_DETECTED" != "t" ]; then
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                echo ""
                echo -e "\e[31mThe code in this function is flawed.\e[39m"
                echo "SB_ABSENCE_DETECTED==\"$SB_ABSENCE_DETECTED\"."
                echo "GUID=='5225dd1c-3d46-4623-b527-c040016168e7'"
                echo ""
            fi
        fi
    fi
    #----------------------------------------------------------------------
} # func_FreeBSD_userspace_specific_declarations
#--------------------------------------------------------------------------
func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
    "$SB_OPERATINGSYSTEM_LINUX" "SB_OPERATINGSYSTEM_LINUX" \
    "851f4541-0d1f-46c9-a464-c040016168e7"
#------------------------------------------
func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
    "$SB_OPERATINGSYSTEM_LINUX_WSL" "SB_OPERATINGSYSTEM_LINUX_WSL" \
    "3598b014-11ed-4a21-9364-c040016168e7"
#------------------------------------------
func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
    "$SB_OPERATINGSYSTEM_LINUX_ANDROID" "SB_OPERATINGSYSTEM_LINUX_ANDROID" \
    "60037338-cbfa-4950-9264-c040016168e7"
#------------------------------------------
func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
    "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" "SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" \
    "36a4b430-a745-4c93-9354-c040016168e7"
#------------------------------------------
func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
    "$SB_OPERATINGSYSTEM_BSD" "SB_OPERATINGSYSTEM_BSD" \
    "6f4f5d12-0156-4fa1-8454-c040016168e7"
#------------------------------------------
func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
    "$SB_OPERATINGSYSTEM_BSD_FREEBSD" "SB_OPERATINGSYSTEM_BSD_FREEBSD" \
    "e5498f43-87cc-4d9c-a254-c040016168e7"
#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_LINUX" == "f" ]; then
    if [ "$SB_OPERATINGSYSTEM_LINUX_WSL" == "t" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo -e "\e[31mThe code of this Bash file is flawed.\e[39m"
            echo "GUID=='c08a5535-b703-414c-a227-c040016168e7'"
            echo ""
        fi
    fi
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID" == "t" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo -e "\e[31mThe code of this Bash file is flawed.\e[39m"
            echo "GUID=='a0d33536-221c-4859-a317-c040016168e7'"
            echo ""
        fi
    fi
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "t" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo -e "\e[31mThe code of this Bash file is flawed.\e[39m"
            echo "GUID=='683acd29-bc75-4d3d-9117-c040016168e7'"
            echo ""
        fi
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID" == "f" ]; then
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "t" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo -e "\e[31mThe code of this Bash file is flawed.\e[39m"
            echo "GUID=='6ca53c1f-9326-4641-a117-c040016168e7'"
            echo ""
        fi
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_BSD_FREEBSD" == "t" ]; then
    if [ "$SB_OPERATINGSYSTEM_BSD" == "f" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo -e "\e[31mThe code of this Bash file is flawed.\e[39m"
            echo "GUID=='519e0b4d-e225-4368-b207-c040016168e7'"
            echo ""
        fi
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
    #----------------------------------------------------------------------
    func_general_Linux_userspace_specific_declarations
    #----------------------------------------------------------------------
    if [ "$SB_OPERATINGSYSTEM_LINUX_WSL" == "t" ]; then
        func_Windows_Subsystem_for_Linux_WSL_userspace_specific_declarations
    else
        if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID" == "f" ]; then
            # The formatted version of the 
            alias mmmv_admin_create_symlink_to_cupspdf_t1="S_FP_LINK=\"\$HOME/CUPS_PDF\" ; S_FP_CUPSPDF_OUTPUT_DIR_0=\"/var/spool/cups-pdf/ANONYMOUS\" ; S_FP_CUPSPDF_OUTPUT_DIR_X=\"\$S_FP_CUPSPDF_OUTPUT_DIR_0\" ; S_FP_CUPSPDF_OUTPUT_DIR_1=\"/var/spool/cups-pdf/\`whoami\`\" ; if [ -e \"\$S_FP_CUPSPDF_OUTPUT_DIR_1\" ]; then S_FP_CUPSPDF_OUTPUT_DIR_X=\"\$S_FP_CUPSPDF_OUTPUT_DIR_1\" ; fi ; if [ -e \"\$S_FP_CUPSPDF_OUTPUT_DIR_X\" ]; then if [ -d \"\$S_FP_CUPSPDF_OUTPUT_DIR_X\" ]; then if [ -e \"\$S_FP_LINK\" ]; then echo \"\" ; echo \"Something with the path of \" ; echo \"    \$S_FP_LINK\" ; echo -e \"\e[31malready exists.\e[39m Doing nothing.\" ; echo \"GUID=='1dd2f983-06c5-45e3-b107-c040016168e7'\" ; echo \"\" ; else if [ -h \"\$S_FP_LINK\" ]; then echo \"\" ; echo \"A broken symlink with the path of \" ; echo \"    \$S_FP_LINK\" ; echo -e \"\e[31malready exists.\e[39m Doing nothing.\" ; echo \"GUID=='a28448fe-73f7-4b38-b9f6-c040016168e7'\" ; echo \"\" ; else ln -s \"\$S_FP_CUPSPDF_OUTPUT_DIR_X\" \"\$S_FP_LINK\" ; sync; wait; sync ;  if [ ! -e \"\$S_FP_LINK\" ]; then echo \"\" ; echo -e \"\e[31mFailed to create symlink \e[39m\" ; echo \"    \$S_FP_LINK\" ; echo \"    -->\" ; echo \"    \$S_FP_CUPSPDF_OUTPUT_DIR_X\" ; echo \"GUID=='32a48d83-112d-4ce6-81f6-c040016168e7'\" ; echo \"\" ; fi ; fi ; fi ; else echo \"\" ; echo \"The \" ; echo \"    \$S_FP_CUPSPDF_OUTPUT_DIR_X\" ; if [ -h \"\$S_FP_CUPSPDF_OUTPUT_DIR_X\" ]; then echo \"is a symlink to a file, but a folder is expected.\" ; else echo \"is a file, but a folder is expected.\" ; fi ; echo \"GUID=='b1195945-dc0c-42bc-a5e6-c040016168e7'\" ; echo \"\" ; fi ; else echo \"\" ; echo -e \"\e[31mFolder is missing. \e[39m\" ; echo \"    \$S_FP_CUPSPDF_OUTPUT_DIR_X\" ; echo \"It MIGHT be that the cups-pdf has not been installed.\" ; echo \"GUID=='2c10edc1-2d98-4080-84e6-c040016168e7'\" ; echo \"\" ; fi ;"
            # except the GUIDs, is:
            #     S_FP_LINK="$HOME/CUPS_PDF" ;
            #     S_FP_CUPSPDF_OUTPUT_DIR_0="/var/spool/cups-pdf/ANONYMOUS" ;
            #     S_FP_CUPSPDF_OUTPUT_DIR_X="$S_FP_CUPSPDF_OUTPUT_DIR_0" ;
            #     S_FP_CUPSPDF_OUTPUT_DIR_1="/var/spool/cups-pdf/`whoami`" ;
            #     if [ -e "$S_FP_CUPSPDF_OUTPUT_DIR_1" ]; then 
            #         S_FP_CUPSPDF_OUTPUT_DIR_X="$S_FP_CUPSPDF_OUTPUT_DIR_1" ;
            #     fi ;
            #     if [ -e "$S_FP_CUPSPDF_OUTPUT_DIR_X" ]; then 
            #         if [ -d "$S_FP_CUPSPDF_OUTPUT_DIR_X" ]; then 
            #             if [ -e "$S_FP_LINK" ]; then
            #                 echo "" ;
            #                 echo "Something with the path of " ;
            #                 echo "    $S_FP_LINK" ;
            #                 echo -e "\e[31malready exists.\e[39m Doing nothing." ;
            #                 echo "GUID=='1e1e9c35-1b65-49ef-93e6-c040016168e7'" ;
            #                 echo "" ;
            #             else
            #                 if [ -h "$S_FP_LINK" ]; then
            #                     echo "" ;
            #                     echo "A broken symlink with the path of " ;
            #                     echo "    $S_FP_LINK" ;
            #                     echo -e "\e[31malready exists.\e[39m Doing nothing." ;
            #                     echo "GUID=='26a95bd5-dab9-43ea-8ad6-c040016168e7'" ;
            #                     echo "" ;
            #                 else
            #                     ln -s "$S_FP_CUPSPDF_OUTPUT_DIR_X" "$S_FP_LINK" ;
            #                     sync; wait; sync ;  
            #                     if [ ! -e "$S_FP_LINK" ]; then 
            #                         echo "" ;
            #                         echo -e "\e[31mFailed to create symlink \e[39m" ;
            #                         echo "    $S_FP_LINK" ;
            #                         echo "    -->" ;
            #                         echo "    $S_FP_CUPSPDF_OUTPUT_DIR_X" ;
            #                         echo "GUID=='24d065f2-5bbb-4cdb-b2d6-c040016168e7'" ;
            #                         echo "" ;
            #                     fi ;
            #                 fi ;
            #             fi ;
            #         else 
            #             echo "" ;
            #             echo "The " ;
            #             echo "    $S_FP_CUPSPDF_OUTPUT_DIR_X" ;
            #             if [ -h "$S_FP_CUPSPDF_OUTPUT_DIR_X" ]; then 
            #                 echo "is a symlink to a file, but a folder is expected." ;
            #             else 
            #                 echo "is a file, but a folder is expected." ;
            #             fi ;
            #             echo "GUID=='3d453542-be54-4668-b3d6-c040016168e7'" ;
            #             echo "" ;
            #         fi ;
            #     else 
            #         echo "" ;
            #         echo -e "\e[31mFolder is missing. \e[39m" ;
            #         echo "    $S_FP_CUPSPDF_OUTPUT_DIR_X" ;
            #         echo "It MIGHT be that the cups-pdf has not been installed." ;
            #         echo "GUID=='31ae4884-eff8-44fa-b7c6-c040016168e7'" ;
            #         echo "" ;
            #     fi ;
        fi
    fi
    #----------------------------------------------------------------------
else
    #----------------------------------------------------------------------
    if [ "$SB_OPERATINGSYSTEM_BSD" == "t" ]; then
        func_general_BSD_userspace_specific_declarations
        if [ "$SB_OPERATINGSYSTEM_BSD_FREEBSD" == "t" ]; then
            func_FreeBSD_userspace_specific_declarations
        fi
    else
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo -e "\e[31mThe code of this Bash file is flawed.\e[39m"
            echo "GUID=='450f63f3-7e2c-40b8-b346-c040016168e7'"
            echo ""
        fi
    fi
    #----------------------------------------------------------------------
fi
#--------------------------------------------------------------------------
MMMV_USERSPACE_DISTRO_T1_TEMPLATES="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/lib/templates"
func_mmmv_declare_template_creation_alias_t1(){ 
    local S_ALIAS_NAME="$1" 
    local S_FN_TEMPLATE="$2"             # Only the file name.
    local S_FN_NEW="$3"                  # Only the file name.
    local S_GUID_CANDIDATE_OPTIONAL="$4" 
    local SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL="$5" # domain: {"","t","f"}
                                                     # default: "" -> "t"
    local S_FP_DESTINATION_FOLDER_OPTIONAL="$6" # default: "" -> "`pwd`"
    #----------------------------------------------------------------------
    local SB_OK2ATTEMPT="t"
    local S_FP_TEMPLATE="$MMMV_USERSPACE_DISTRO_T1_TEMPLATES/$S_FN_TEMPLATE"
    #----------------------------------------------------------------------
    local S_TMP_0=""
    local S_FP_NEW=""
    if [ "$S_FP_DESTINATION_FOLDER_OPTIONAL" == "" ]; then
        S_FP_NEW="\$PWD/$S_FN_NEW"
    else
        if [ ! -e "$S_FP_DESTINATION_FOLDER_OPTIONAL" ]; then 
            SB_OK2ATTEMPT="f"
        else
            if [ ! -d "$S_FP_DESTINATION_FOLDER_OPTIONAL" ]; then 
                SB_OK2ATTEMPT="f"
            fi
        fi
        if [ "$SB_OK2ATTEMPT" == "t" ]; then
            S_TMP_0="`cd $S_FP_DESTINATION_FOLDER_OPTIONAL ; pwd`"
            S_FP_NEW="$S_TMP_0/$S_FN_NEW"
        else
            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                "$S_FP_DESTINATION_FOLDER_OPTIONAL" \
                "e3e14d01-73b5-4d02-9354-c040016168e7" \
                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        fi
    fi
    #----------------------------------------------------------------------
    if [ "$SB_OK2ATTEMPT" == "t" ]; then
        #------------------------------------------------------------------
        local S_ERR_MSG_SUBPART_01=""
        if [ "$S_GUID_CANDIDATE_OPTIONAL" == "" ]; then
            S_GUID_CANDIDATE_OPTIONAL="c10b6955-4816-47a6-8554-c040016168e7"
        else
            #S_ERR_MSG_SUBPART_01="echo \"S_GUID_CANDIDATE=='$S_GUID_CANDIDATE_OPTIONAL'\" ; "
            S_ERR_MSG_SUBPART_01="S_GUID_CANDIDATE=='$S_GUID_CANDIDATE_OPTIONAL'"
        fi
        #--------------------
        if [ "$SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL" == "" ]; then
            SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL="t"
        else
            if [ "$SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL" != "t" ]; then
                if [ "$SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL" != "f" ]; then
                    SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL="t"
                    if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                        echo ""
                        echo "A mmmv_userspace_distro_t1 related "
                        echo -e "\e[31msubpart of the ~/.bashrc is flawed\e[39m."
                        echo "    SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL==\"$SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL\""
                        echo "GUID=='4d486f41-c941-4549-b136-c040016168e7'"
                        echo ""
                    fi
                fi
            fi
        fi
        #------------------------------------------------------------------
        func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
            "$S_FP_TEMPLATE" "$S_GUID_CANDIDATE_OPTIONAL" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
            #--------------------
            # The following Bash code segment 
            # #------------------------------
            #local S_ALIAS_BASH_CODE=" \
            #    SB_USE_UPGUID_ON_COPIED_FILE=\"$SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL\"; \
            #    if [ -e \"$S_FP_TEMPLATE\" ]; then \
            #        if [ ! -d \"$S_FP_TEMPLATE\" ]; then \
            #            if [ ! -e \"$S_FP_NEW\" ]; then \
            #                cp $S_FP_TEMPLATE $S_FP_NEW ; \
            #                if [ \"\$?\" == \"0\" ]; then \
            #                    sync; wait; sync; \
            #                    echo \"\"; \
            #                    echo \"Created a new file with the path of \"; \
            #                    echo \"\"; \
            #                    echo -e \"\\e[32m    $S_FP_NEW \\e[39m\"; \
            #                    echo \"\"; \
            #                    if [ \"\$SB_USE_UPGUID_ON_COPIED_FILE\" == \"t\" ]; then \
            #                        if [ \"\`which upguid 2> /dev/null \`\" != \"\" ]; then \
            #                            upguid -f  $S_FP_NEW; sync; wait; sync; \
            #                            chmod 0700 $S_FP_NEW; sync; wait; sync; \
            #                        else \
            #                            echo -e \"Could not find \\e[31mupguid\\e[39m from the PATH.\"; \
            #                            echo \"\"; \
            #                        fi \
            #                    fi \
            #                else \
            #                    echo -e \"\\e[31mFailed to create file \\e[39m \"; \
            #                    echo \"\"; \
            #                    echo \"    $S_FP_NEW \"; \
            #                    echo \"\"; \
            #                    echo \"GUID=='2358d093-5ddc-4733-b526-c040016168e7'\"; \
            #                    if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then \
            #                        echo \"$S_ERR_MSG_SUBPART_01\"; \
            #                    fi;\
            #                    echo \"\"; \
            #                fi; \
            #            else \
            #                echo \"\"; \
            #                if [ -d \"$S_FP_NEW\" ]; then \
            #                    echo \"A folder with the path of \"; \
            #                else \
            #                    echo \"A file with the path of \"; \
            #                fi; \
            #                echo \"\"; \
            #                echo \"    $S_FP_NEW\"; \
            #                echo \"\"; \
            #                echo -e \"\\e[31malready exists\\e[39m. Not overwriting.\"; \
            #                echo \"GUID=='10679644-9d00-44c7-a526-c040016168e7'\"; \
            #                if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then \
            #                    echo \"$S_ERR_MSG_SUBPART_01\"; \
            #                fi;\
            #                echo \"\"; \
            #            fi; \
            #        else \
            #            echo \"\"; \
            #            echo \"The template \"; \
            #            echo \"\"; \
            #            echo \"    $S_FP_TEMPLATE\"; \
            #            echo \"\"; \
            #            if [ -h \"$S_FP_TEMPLATE\" ]; then \
            #                echo -e \"\\e[31mis a symlink to a folder,\\e[39m\"; \
            #            else \
            #                echo -e \"\\e[31mis a folder,\\e[39m\"; \
            #            fi; \
            #            echo -e \"\\e[31mbut a file is expected.\\e[39m\"; \
            #            echo \"Not copying anything.\"; \
            #            echo \"GUID=='21ff8755-a656-4c98-9316-c040016168e7'\"; \
            #            if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then \
            #                echo \"$S_ERR_MSG_SUBPART_01\"; \
            #            fi;\
            #            echo \"\"; \
            #        fi; \
            #    else \
            #        echo \"\"; \
            #        echo \"The template \"; \
            #        echo \"\"; \
            #        echo \"    $S_FP_TEMPLATE\"; \
            #        echo \"\"; \
            #        if [ -h \"$S_FP_TEMPLATE\" ]; then \
            #            echo -e \"\\e[31mis a broken symlink,\\e[39m\"; \
            #        else \
            #            echo -e \"\\e[31mis missing,\\e[39m\"; \
            #        fi; \
            #        echo -e \"\\e[31mbut a file is expected.\\e[39m\"; \
            #        echo \"Not copying anything.\"; \
            #        echo \"GUID=='99220a5f-4294-4e3c-94f5-c040016168e7'\"; \
            #        if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then \
            #            echo \"$S_ERR_MSG_SUBPART_01\"; \
            #        fi;\
            #        echo \"\"; \
            #    fi; \
            #    "
            # #------------------------------
            # is meant to be processed with Vim macros for assembling the 
            alias $S_ALIAS_NAME=" SB_USE_UPGUID_ON_COPIED_FILE=\"$SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL\"; if [ -e \"$S_FP_TEMPLATE\" ]; then if [ ! -d \"$S_FP_TEMPLATE\" ]; then if [ ! -e \"$S_FP_NEW\" ]; then cp $S_FP_TEMPLATE $S_FP_NEW ; if [ \"\$?\" == \"0\" ]; then sync; wait; sync; echo \"\"; echo \"Created a new file with the path of \"; echo \"\"; echo -e \"\\e[32m    $S_FP_NEW \\e[39m\"; echo \"\"; if [ \"\$SB_USE_UPGUID_ON_COPIED_FILE\" == \"t\" ]; then if [ \"\`which upguid 2> /dev/null \`\" != \"\" ]; then upguid -f  $S_FP_NEW; sync; wait; sync; chmod 0700 $S_FP_NEW; sync; wait; sync; else echo -e \"Could not find \\e[31mupguid\\e[39m from the PATH.\"; echo \"\"; fi fi else echo -e \"\\e[31mFailed to create file \\e[39m \"; echo \"\"; echo \"    $S_FP_NEW \"; echo \"\"; echo \"GUID=='8524b94d-20e2-4ea8-85e5-c040016168e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; if [ -d \"$S_FP_NEW\" ]; then echo \"A folder with the path of \"; else echo \"A file with the path of \"; fi; echo \"\"; echo \"    $S_FP_NEW\"; echo \"\"; echo -e \"\\e[31malready exists\\e[39m. Not overwriting.\"; echo \"GUID=='ec06754b-3152-4672-83d5-c040016168e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; echo \"The template \"; echo \"\"; echo \"    $S_FP_TEMPLATE\"; echo \"\"; if [ -h \"$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mis a symlink to a folder,\\e[39m\"; else echo -e \"\\e[31mis a folder,\\e[39m\"; fi; echo -e \"\\e[31mbut a file is expected.\\e[39m\"; echo \"Not copying anything.\"; echo \"GUID=='54ac4d54-f437-45c5-a2c5-c040016168e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; echo \"The template \"; echo \"\"; echo \"    $S_FP_TEMPLATE\"; echo \"\"; if [ -h \"$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mis a broken symlink,\\e[39m\"; else echo -e \"\\e[31mis missing,\\e[39m\"; fi; echo -e \"\\e[31mbut a file is expected.\\e[39m\"; echo \"Not copying anything.\"; echo \"GUID=='91a72003-ccac-4794-bec5-c040016168e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; "
            #--------------------
            # The following versions are older versions that have been tested to work.
            # alias $S_ALIAS_NAME=" SB_USE_UPGUID_ON_COPIED_FILE=\"$SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL\"; if [ -e \"$S_FP_TEMPLATE\" ]; then if [ ! -d \"$S_FP_TEMPLATE\" ]; then if [ ! -e \"$S_FP_NEW\" ]; then cp $S_FP_TEMPLATE $S_FP_NEW ; if [ \"\$?\" == \"0\" ]; then sync; wait; sync; echo \"\"; echo \"Created a new file with the path of \"; echo \"\"; echo \"    $S_FP_NEW \"; echo \"\"; if [ \"\$SB_USE_UPGUID_ON_COPIED_FILE\" == \"t\" ]; then if [ \"\`which upguid 2> /dev/null \`\" != \"\" ]; then upguid -f  $S_FP_NEW; sync; wait; sync; chmod 0700 $S_FP_NEW; sync; wait; sync; else echo -e \"Could not find \\e[31mupguid\\e[39m from the PATH.\"; echo \"\"; fi fi else echo -e \"\\e[31mFailed to create file \\e[39m \"; echo \"\"; echo \"    $S_FP_NEW \"; echo \"\"; echo \"GUID=='2ed82560-2d0b-43ab-94b5-c040016168e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; if [ -d \"$S_FP_NEW\" ]; then echo \"A folder with the path of \"; else echo \"A file with the path of \"; fi; echo \"\"; echo \"    $S_FP_NEW\"; echo \"\"; echo -e \"\\e[31malready exists\\e[39m. Not overwriting.\"; echo \"GUID=='e70dea32-aa5d-4a72-93a5-c040016168e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; echo \"The template \"; echo \"\"; echo \"    $S_FP_TEMPLATE\"; echo \"\"; if [ -h \"$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mis a symlink to a folder,\\e[39m\"; else echo -e \"\\e[31mis a folder,\\e[39m\"; fi; echo -e \"\\e[31mbut a file is expected.\\e[39m\"; echo \"Not copying anything.\"; echo \"GUID=='1ddcc7f1-7b95-4606-b495-c040016168e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; echo \"The template \"; echo \"\"; echo \"    $S_FP_TEMPLATE\"; echo \"\"; if [ -h \"$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mis a broken symlink,\\e[39m\"; else echo -e \"\\e[31mis missing,\\e[39m\"; fi; echo -e \"\\e[31mbut a file is expected.\\e[39m\"; echo \"Not copying anything.\"; echo \"GUID=='fdce3944-7788-4d4d-b485-c040016168e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; "
            #--------------------
        fi
        #------------------------------------------------------------------
    fi
    #----------------------------------------------------------------------
} # func_mmmv_declare_template_creation_alias_t1

#--------------------------------------------------------------------------

# For template creation alias declarations, where
# the original template file name matches with the template copy file name.
func_mmmv_declare_template_creation_alias_t2(){
    local S_ALIAS_NAME="$1" 
    local S_FN_TEMPLATE="$2"             # Only the file name.
    local S_GUID_CANDIDATE_OPTIONAL="$3" 
    #----------------------------------------------------------------------
    func_mmmv_declare_template_creation_alias_t1 \
        "$S_ALIAS_NAME" "$S_FN_TEMPLATE" "$S_FN_TEMPLATE" \
        "$S_GUID_CANDIDATE_OPTIONAL" 
    #----------------------------------------------------------------------
} # func_mmmv_declare_template_creation_alias_t2

#--------------------------------------------------------------------------
func_mmmv_declare_template_creation_alias_tar_gz_t1(){
    local S_ALIAS_NAME="$1" 
    local S_FN_TEMPLATE="$2"             # Only the file name.
    local S_FN_NEW="$3"                  # Only the file name.
    local S_GUID_CANDIDATE_OPTIONAL="$4" 
    #----------------------------------------------------------------------
    local S_FP_TEMPLATE="$MMMV_USERSPACE_DISTRO_T1_TEMPLATES/$S_FN_TEMPLATE"
    local S_FP_NEW="\$PWD/$S_FN_NEW"
    #--------------------
    local S_ERR_MSG_SUBPART_01=""
    if [ "$S_GUID_CANDIDATE_OPTIONAL" == "" ]; then
        S_GUID_CANDIDATE_OPTIONAL="a97dd491-dcf4-4599-9444-c040016168e7"
    else
        #S_ERR_MSG_SUBPART_01="echo \"S_GUID_CANDIDATE=='$S_GUID_CANDIDATE_OPTIONAL'\" ; "
        S_ERR_MSG_SUBPART_01="S_GUID_CANDIDATE=='$S_GUID_CANDIDATE_OPTIONAL'"
    fi
    #----------------------------------------------------------------------
    func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
        "$S_FP_TEMPLATE" "$S_GUID_CANDIDATE_OPTIONAL" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        #--------------------
        # Sample:
        # alias mmmv_cre_image_length_limiter_t1="nice -n 10 tar -xzf $MMMV_USERSPACE_DISTRO_T1_TEMPLATES/image_edge_length_limiter_t1.tar.gz ./ "
        # The following Bash code segment 
        # #------------------------------
        #local S_FOO="\
        #    if [ -e \"$S_FP_TEMPLATE\" ]; then \
        #        if [ ! -d \"$S_FP_TEMPLATE\" ]; then \
        #            if [ ! -e \"$S_FP_NEW\" ]; then \
        #                nice -n 10 tar -xzf $S_FP_TEMPLATE ./ ; \
        #                if [ \"\$?\" == \"0\" ]; then \
        #                    sync; wait; \
        #                    echo \"\"; \
        #                    if [ -d \"$S_FP_NEW\" ]; then \
        #                        if [ -h \"$S_FP_NEW\" ]; then \
        #                            echo \"Created a new symlink to a folder with the path of \"; \
        #                        else \
        #                            echo \"Created a new folder with the path of \"; \
        #                        fi; \
        #                    else \
        #                        if [ -h \"$S_FP_NEW\" ]; then \
        #                            echo \"Created a new symlink to a file with the path of \"; \
        #                        else \
        #                            echo \"Created a new file with the path of \"; \
        #                        fi; \
        #                    fi; \
        #                    echo \"\"; \
        #                    echo \"    $S_FP_NEW \"; \
        #                    echo \"\"; \
        #                else \
        #                    echo -e \"\\e[31mFailed to create \\e[39m \"; \
        #                    echo \"\"; \
        #                    echo \"    $S_FP_NEW \"; \
        #                    echo \"\"; \
        #                    echo \"GUID=='bbb69d32-9987-4c00-8385-c040016168e7'\"; \
        #                    if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then \
        #                        echo \"$S_ERR_MSG_SUBPART_01\"; \
        #                    fi;\
        #                    echo \"\"; \
        #                fi; \
        #            else \
        #                echo \"\"; \
        #                if [ -d \"$S_FP_NEW\" ]; then \
        #                    echo \"A folder with the path of \"; \
        #                else \
        #                    echo \"A file with the path of \"; \
        #                fi; \
        #                echo \"\"; \
        #                echo \"    $S_FP_NEW\"; \
        #                echo \"\"; \
        #                echo -e \"\\e[31malready exists\\e[39m. Not overwriting.\"; \
        #                echo \"GUID=='20e15928-3061-4806-8575-c040016168e7'\"; \
        #                if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then \
        #                    echo \"$S_ERR_MSG_SUBPART_01\"; \
        #                fi;\
        #                echo \"\"; \
        #            fi; \
        #        else \
        #            echo \"\"; \
        #            echo \"The template \"; \
        #            echo \"\"; \
        #            echo \"    $S_FP_TEMPLATE\"; \
        #            echo \"\"; \
        #            if [ -h \"$S_FP_TEMPLATE\" ]; then \
        #                echo -e \"\\e[31mis a symlink to a folder,\\e[39m\"; \
        #            else \
        #                echo -e \"\\e[31mis a folder,\\e[39m\"; \
        #            fi; \
        #            echo -e \"\\e[31mbut a file is expected.\\e[39m\"; \
        #            echo \"Not copying anything.\"; \
        #            echo \"GUID=='dbf0bb65-901d-461b-b265-c040016168e7'\"; \
        #            if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then \
        #                echo \"$S_ERR_MSG_SUBPART_01\"; \
        #            fi;\
        #            echo \"\"; \
        #        fi; \
        #    else \
        #        echo \"\"; \
        #        echo \"The template \"; \
        #        echo \"\"; \
        #        echo \"    $S_FP_TEMPLATE\"; \
        #        echo \"\"; \
        #        if [ -h \"$S_FP_TEMPLATE\" ]; then \
        #            echo -e \"\\e[31mis a broken symlink,\\e[39m\"; \
        #        else \
        #            echo -e \"\\e[31mis missing,\\e[39m\"; \
        #        fi; \
        #        echo -e \"\\e[31mbut a file is expected.\\e[39m\"; \
        #        echo \"Not copying anything.\"; \
        #        echo \"GUID=='933fbb5e-147f-4d39-a355-c040016168e7'\"; \
        #        if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then \
        #            echo \"$S_ERR_MSG_SUBPART_01\"; \
        #        fi;\
        #        echo \"\"; \
        #    fi; \
        #    "
        # #------------------------------
        # is meant to be processed with Vim macros for assembling the 
        alias $S_ALIAS_NAME="if [ -e \"$S_FP_TEMPLATE\" ]; then if [ ! -d \"$S_FP_TEMPLATE\" ]; then if [ ! -e \"$S_FP_NEW\" ]; then nice -n 10 tar -xzf $S_FP_TEMPLATE ./ ; if [ \"\$?\" == \"0\" ]; then sync; wait; echo \"\"; if [ -d \"$S_FP_NEW\" ]; then if [ -h \"$S_FP_NEW\" ]; then echo \"Created a new symlink to a folder with the path of \"; else echo \"Created a new folder with the path of \"; fi; else if [ -h \"$S_FP_NEW\" ]; then echo \"Created a new symlink to a file with the path of \"; else echo \"Created a new file with the path of \"; fi; fi; echo \"\"; echo \"    $S_FP_NEW \"; echo \"\"; else echo -e \"\\e[31mFailed to create \\e[39m \"; echo \"\"; echo \"    $S_FP_NEW \"; echo \"\"; echo \"GUID=='b52a8b2b-dece-4f2b-b555-c040016168e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; if [ -d \"$S_FP_NEW\" ]; then echo \"A folder with the path of \"; else echo \"A file with the path of \"; fi; echo \"\"; echo \"    $S_FP_NEW\"; echo \"\"; echo -e \"\\e[31malready exists\\e[39m. Not overwriting.\"; echo \"GUID=='61c98111-a885-4ffb-8545-c040016168e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; echo \"The template \"; echo \"\"; echo \"    $S_FP_TEMPLATE\"; echo \"\"; if [ -h \"$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mis a symlink to a folder,\\e[39m\"; else echo -e \"\\e[31mis a folder,\\e[39m\"; fi; echo -e \"\\e[31mbut a file is expected.\\e[39m\"; echo \"Not copying anything.\"; echo \"GUID=='fafd6b22-a6f5-4800-a135-c040016168e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; echo \"The template \"; echo \"\"; echo \"    $S_FP_TEMPLATE\"; echo \"\"; if [ -h \"$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mis a broken symlink,\\e[39m\"; else echo -e \"\\e[31mis missing,\\e[39m\"; fi; echo -e \"\\e[31mbut a file is expected.\\e[39m\"; echo \"Not copying anything.\"; echo \"GUID=='f703e82c-7c3c-4b98-b435-c040016168e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; "
        #--------------------
    fi
    #----------------------------------------------------------------------
} # func_mmmv_declare_template_creation_alias_tar_gz_t1

#--------------------------------------------------------------------------
S_TMP_CMD_CRE_GIT_CLONE=" if [ ! -e \"./pull_new_version_from_git_repository.bash\" ]; then cp $MMMV_USERSPACE_DISTRO_T1_TEMPLATES/pull_new_version_from_git_repository.bash ./ ; sync; wait; sync; chmod 0700 ./pull_new_version_from_git_repository.bash ; sync; wait; sync; fi ; if [ ! -e \"./the_repository_clones\" ]; then mkdir -p ./the_repository_clones ; sync; wait; sync; chmod -f -R 0700 ./the_repository_clones ; sync; wait; sync; fi ; " 
alias mmmv_cre_git_clone="$S_TMP_CMD_CRE_GIT_CLONE"

# The next line
S_TMP_FP_0="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin/mmmv_github_repos_2_clonescript_bash_t1.rb"
# uses a full path, because at this line the 
#    $MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin
# is only on the Z_PATH, not yet on PATH.

func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
    "$S_TMP_FP_0" "38bed314-6781-4bbb-8744-c040016168e7" \
    "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
    if [ "$SB_RUBY_EXISTS_ON_PATH" == "t" ]; then
        S_TMP_0="mkdir -p ./src_from_GitHub ; sync ; wait ; cd ./src_from_GitHub ; $S_TMP_CMD_CRE_GIT_CLONE cd ./the_repository_clones ; wait ; echo \"\" ; echo \"The working directory shifted to\" ; echo \"\" ; echo \"    ./src_from_GitHub/the_repository_clones\" ; "
        alias mmmv_cre_git_clone_collection_from_GitHub_t1="$S_TMP_0 ruby -e 's_username=ARGV[0]; s_cmd=\"$S_TMP_FP_0 https://github.com/\"+s_username ; exec(s_cmd) ' "
        alias mmmv_cre_git_clone_collection_from_GitHub_t2="$S_TMP_0 $S_TMP_FP_0 "
    fi
fi
#--------------------------------------------------------------------------

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_bashrc_minimalistic_template_01" \
    "_bashrc_minimalistic_template_01" \
    "5e63c519-cdad-47d8-b244-c040016168e7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_disassembly_and_reassembly_script_t1" \
    "disassembly_and_reassembly_t1.bash" \
    "ef206e5d-567a-4643-ba44-c040016168e7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_download_files_with_wget_template_01" \
    "download_files_with_wget_template_01.bash" \
    "ad3c4d5e-5e23-4dd0-a434-c040016168e7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_Fossil_wiki_page_HTML_expimp_template_01" \
    "download_and_upload_Fossil_wiki_HTML.bash" \
    "436731ae-5f77-4f0f-9134-c040016168e7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_fossil_clone" \
    "mmmv_Fossil_operator_t1.bash" \
    "13df0430-edb0-4ebf-b534-c040016168e7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_ruby_console_application_t2" \
    "ruby_console_application_template_t2.rb" \
    "44a5e648-d950-4600-b334-c040016168e7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_SQL_dump_script" \
    "create_backup_from_MySQL_db.bash" \
    "aef79315-fb3c-4959-b434-c040016168e7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_SSH_config_template" \
    "_ssh_config_template.txt" \
    "25459724-dd90-4876-b724-c040016168e7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_SSH_tunnel_creation_script_template_t1" \
    "ssh_tunnel_t1.bash" \
    "78565f29-5180-49da-9324-c040016168e7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_WARC_Tools" \
    "2016_12_xx_WARC_tools.tar.xz" \
    "12ca7a73-1425-4a0f-b324-c040016168e7"

#------------
if [ "$SB_TAR_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_GUNZIP_EXISTS_ON_PATH" == "t" ]; then
        S_TMP_0="nice -n 10 tar -xzf $MMMV_USERSPACE_DISTRO_T1_TEMPLATES/rsync_based_backups_creator.tar.gz ./ "
        if [ "$SB_RSYNC_EXISTS_ON_PATH" == "t" ]; then
            alias mmmv_cre_rsync_based_backups_creator="$S_TMP_0"
        else
            if [ "$SB_RSYNC_EXISTS_ON_PATH" != "f" ]; then
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo -e "\e[31mThe ~/.bashrc or some subpart of it is flawed.\e[39m"
                    echo "GUID=='dfb5764a-adaf-481c-b325-c040016168e7'"
                fi
            fi
            alias mmmv_cre_rsync_based_backups_creator="echo \"\" ; echo \"The \\\"rsync\\\" is not on PATH.\" ; echo \"GUID=='318345d5-d097-4d54-a515-c040016168e7'\" ; echo \"\" ; $S_TMP_0"
        fi
  fi
fi
#------------
if [ "$SB_TAR_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_GUNZIP_EXISTS_ON_PATH" == "t" ]; then
        #----
        func_mmmv_declare_template_creation_alias_tar_gz_t1 \
            "mmmv_cre_bash_boilerplate_t5_copy" \
            "2023_12_24_mmmv_bash_boilerplate_t5.tar.gz" \
            "2023_12_24_mmmv_bash_boilerplate_t5" \
            "1a685674-8260-4841-a324-c040016168e7"
        #----
        func_mmmv_declare_template_creation_alias_tar_gz_t1 \
            "mmmv_cre_image_length_limiter_t1" \
            "image_edge_length_limiter_t1.tar.gz" \
            "image_edge_length_limiter_t1" \
            "44806411-603d-44a1-a324-c040016168e7"
        #----
        func_mmmv_declare_template_creation_alias_tar_gz_t1 \
            "mmmv_cre_installed_programs_checklist_t1" \
            "2021_02_xx_mmmv_installed_programs_checklist_t1_template.tar.gz" \
            "installed_programs_checklist_t1_template" \
            "b86b9d54-9e2f-4eeb-a514-c040016168e7"
        #----
        func_mmmv_declare_template_creation_alias_tar_gz_t1 \
            "mmmv_cre_ruby_boilerplate_t6" \
            "2024_01_27_mmmv_ruby_boilerplate_t6.tar.gz" \
            "2024_01_27_mmmv_ruby_boilerplate_t6" \
            "2e36745b-e608-42b9-a114-c040016168e7"
        #----
        func_mmmv_declare_template_creation_alias_tar_gz_t1 \
            "mmmv_cre_ZeroNet_Rev3703_from_mmmv_repackaging" \
            "2018_11_08_ZeroNet_Rev3703_mmmv_repackaging_t2.tar.gz" \
            "2018_11_08_ZeroNet_Rev3703_mmmv_repackaging_t2" \
            "315c117c-9938-4eeb-a314-c040016168e7"
        #----
        func_mmmv_declare_template_creation_alias_tar_gz_t1 \
            "mmmv_cre_vimwiki_project_wiki_t1" \
            "project_wiki_t1.tar.gz" \
            "project_wiki" \
            "2aa52f52-49bb-4840-a514-c040016168e7"
        #----
    fi
fi
#------------
func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_COMMENTS_txt_t1" \
    "COMMENTS_txt_template_t1.txt" \
    "COMMENTS.txt" \
    "e4d54612-8a23-46ef-8b14-c040016168e7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_COMMENTS_txt_t2" \
    "COMMENTS_txt_template_t2.txt" \
    "COMMENTS.txt" \
    "64a15412-b70e-4cc1-a504-c040016168e7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_CVS_clonescript_t1" \
    "CVS_clonescript_template_01.bash" \
    "CVS_clonescript.bash" \
    "aa690d13-8486-4c6b-a904-c040016168e7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_x_txt_git_pack_Bash_script_t1" \
    "mmmv_git_pack_template_t1.bash" \
    "x.txt" \
    "11af0382-cbd4-4b92-9204-c040016168e7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_Rakefile_template_t1" \
    "2022_10_06_Rakefile_template_t1.rb" \
    "Rakefile" \
    "1b2a8053-5d0c-47c3-a504-c040016168e7" 

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_bash_switch_to_next_keyboard_layout_t1" \
    "mmmv_ui_switch_to_next_keyboard_layout_t1_template.bash" \
    "mmmv_ui_switch_to_next_keyboard_layout_t1.bash" \
    "2cdc8b4c-bb74-44dc-84f3-c040016168e7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_bash_download_t1" \
    "2023_12_20_download_template_t1.bash" \
    "download.bash" \
    "2e6ab6b5-442d-44c1-b7f3-c040016168e7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_git_runscript_that_uses_SSH_key_based_authentication" \
    "2024_03_02_run_git_with_SSH_URL_by_authenticating_with_an_SSH_key_t1_template.bash" \
    "run_git_by_authenticating_with_an_SSH_key.bash" \
    "e627ce2f-fc09-4905-b1f3-c040016168e7"

#------------
SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL="t"
func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_admin_cre_HOME_dot_cargo_config_toml" \
    "HOME_dot_cargo_config.toml.template" \
    "config.toml" \
    "2236cbe3-c92e-4200-a1f3-c040016168e7" \
    "$SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL" \
    "$HOME/.cargo"

#------------
S_TMP_0="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/lib/mmmv_utilities"
FP_MMMV_PROCESS_EDITOR_BASH="$S_TMP_0/mmmv_process_editor/src/mmmv_process_editor.bash "
if [ "$SB_RUBY_EXISTS_ON_PATH" == "t" ]; then
    alias mmmv_text_processing_lstop_t1="nice -n 6 ruby $MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/lib/mmmv_text_processing_lstop_t1/mmmv_text_processing_lstop_t1.rb "
    alias mmmv_process_editor="nice -n 6 bash $FP_MMMV_PROCESS_EDITOR_BASH "
fi
#--------------------------------------------------------------------------
func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_bash_try_to_compile_X_template_t5" \
    "try_to_compile_X_template_t5.bash" \
    "try_to_compile_X.bash" \
    "c2bb624d-f425-4336-b3e3-c040016168e7" 

#--------------------------------------------------------------------------
if [ "$MMMV_BASHRC_CONST_NONFIRST_SESSION_IN_TERMINAL" != "t" ]; then
    if [ -e "$HOME/tmp" ]; then
        if [ -d "$HOME/tmp" ]; then
            cd "$HOME/tmp"
        fi
    else
        if [ -e "$HOME/tmp_" ]; then
            if [ -d "$HOME/tmp_" ]; then
                cd "$HOME/tmp_"
            fi
        fi
    fi
    export MMMV_BASHRC_CONST_NONFIRST_SESSION_IN_TERMINAL="t"
fi    
#--------------------------------------------------------------------------
alias mmmv_vim_common_bashrc_main_bash="nice -n 2 vim $MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/common_bashrc/common_bashrc_main.bash "

# https://unix.stackexchange.com/questions/196098/copy-paste-in-xfce4-terminal-adds-0-and-1
alias mmmv_terminal_fix_copypaste_t1="printf \"\e[?2004l\""
#-----------------------------
if [ "$SB_XMLLINT_EXISTS_ON_PATH" == "t" ]; then
    alias mmmv_format_xml_t1="nice -n 10 xmllint --format "
fi
if [ "$SB_GPG_EXISTS_ON_PATH" == "t" ]; then
    # The 
    #alias mmmv_gpg_rot13_encrypt="nice -n 17 gpg --symmetric  --force-mdc  --cipher-algo=IDEA --compress-level=0 --pinentry-mode=loopback " # ./letter.txt
    # has been constructed by modifying a command line that was copy-pasted from
    #     https://askubuntu.com/questions/1080204/gpg-problem-with-the-agent-permission-denied
    #     archival copy: https://archive.vn/WnXKX
    # On some Linux systems the "--pinentry-mode=loopback" 
    # gives an error message: "gpg: invalid option "--pinentry-mode=loopback"
    # so the 
    alias mmmv_gpg_rot13_encrypt="nice -n 17 gpg --symmetric  --force-mdc  --cipher-algo=TWOFISH --compress-level=0 " # ./letter.txt
    # is without the "--pinentry-mode=loopback". The same with the 
    #alias mmmv_gpg_rot13_decrypt_2_console="nice -n 17 gpg --decrypt --pinentry-mode=loopback " # ./letter.txt.gpg > ./letter.txt
    # versus 
    alias mmmv_gpg_rot13_decrypt_2_console="nice -n 17 gpg --decrypt " # ./letter.txt.gpg > ./letter.txt
    # Supported algorithm names for the "--cipher-algo=...": IDEA, TWOFISH, ...
    # can be listed on console by executing 
    #
    #     gpg --version | grep -i algorithms -A 6
    #
    # If letter.txt.gpg is viewed with Vim, then in some circumstances 
    # its decrypted version is shown.
    #--------
    mkdir -p ~/.gnupg
    func_mmmv_wait_and_sync_t1
    if [ -e "~/.gnupg" ]; then
        nice -n 18 chmod -f -R 0700 ~/.gnupg &
    fi
fi
#-----------------------------
if [ "$SB_USERNAME_IS_mmmv" == "t" ]; then

    func_mmmv_userspace_distro_t1_declare_alias_cd_t1 \
        "mmmv_go_common_bashrc_subparts_userspace_distro_specific" \
        "$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/common_bashrc/subparts/mmmv_userspace_distro_t1_specific" \
        "473a4ae9-0856-4302-b3e3-c040016168e7"

    func_mmmv_userspace_distro_t1_declare_alias_cd_t1 \
        "mmmv_go_common_bashrc_subparts_general" \
        "$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/common_bashrc/subparts/general" \
        "b247a335-cf72-4711-93e3-c040016168e7"
else
    func_mmmv_verify_sb_t_f_but_do_not_exit_t1 \
        "$SB_USERNAME_IS_mmmv" \
        "1d93d321-1b16-4719-afd3-c040016168e7"
fi
#--------------------------------------------------------------------------
func_mmmv_userspace_distro_t1_declare_alias_cd_t1 \
    "mmmv_go_mmmv_userspace_distro_t1_mmmv" \
    "$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv" \
    "b457d270-475d-4227-9bd3-c040016168e7"
#--------------------------------------------------------------------------
if [ "$SB_FFMPEG_EXISTS_ON_PATH" == "t" ]; then
    alias mmmv_ffmpeg_t1="nice -n 20 ffmpeg -i "
fi
#--------------------------------------------------------------------------
if [ "$SB_XPROP_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_GREP_EXISTS_ON_PATH" == "t" ]; then
        if [ "$SB_SED_EXISTS_ON_PATH" == "t" ]; then
            alias mmmv_admin_show_window_PID_t1="echo \"\"; echo \"Please click on the window to find out its process ID, PID?\"; echo \"\" ; wait; ps -A | grep \$(xprop | grep _NET_WM_PID | $S_CMD_GNU_SED 's/^.\\+= //g')"
        fi
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_RUBY_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_XAUTH_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_admin_xauthority_add_32_hexdigits_t1="S_TMP_32_HEXDIGITS=\"\`ruby -e \\\"s=''; 32.times{s<<(rand(16).to_s(16))}; printf(s)\\\"\`\" ; xauth -f \"$HOME/.Xauthority\" add \"\$DISPLAY\" . \"\$S_TMP_32_HEXDIGITS\""
    fi
fi
#--------------------------------------------------------------------------
# The execution of the 
#
#     source "$MMMV_FP_COMMON_BASHRC_MAIN"
#
# can take about 15s, depending on the machine that executes it. 
# Any console output that is necessary for feedback is likely to 
# interfere with the operation of the scp/sftp, because 
# at least some SSH/scp/sftp file copying tools consider
# any ~/.bashrc created stdout output as a server-side error and 
# fail to work, if ~/.bashrc prints to stdout. 
#
#     https://serverfault.com/questions/485487/use-bashrc-without-breaking-sftp
#     archival copy: https://archive.vn/pxmm1
#     https://web.archive.org/web/20201029162511/https://serverfault.com/questions/485487/use-bashrc-without-breaking-sftp
#
# A workaround to both of those problems is 
# to switch on the mmmv environment manually by executing 
alias mmmv_environment="nice -n 2 bash --rcfile \"$MMMV_FP_COMMON_BASHRC_MAIN\" "
#
# Reformatted citation from the ssh man page and the following page:
# https://unix.stackexchange.com/questions/120080/what-are-ssh-tty-and-ssh-connection
# archival copy: https://archive.vn/2y2EF
#
#     SSH_TTY    This is set to the name of the tty (path to the device) 
#                associated with the current shell or command.  
#                If the current session has no tty, this variable is not set.
#
#     SSH_CONNECTION    Identifies the client and server ends of the connection.
#                       The variable contains four space-separated values: 
#                       client IP address, client port number, server IP address, 
#                       and server port number.
#
SB_LOGGED_IN_OVER_SSH="f" # domain: {"t","f"}
if [ "$SSH_CONNECTION" != "" ]; then # SSH session exists
    SB_LOGGED_IN_OVER_SSH="t" 
    #if [ "$SSH_TTY" == "" ]; then # the SSH session is not a terminal session.
    #fi
fi
#--------------------------------------------------------------------------
# That test pattern is useful for testing console fonts.
# As of 2021_06_xx my(Martin Vahi) subjective preference
# for a console font is that the fonti is some monospace font, 
# characters are easy to recognize and easily distinguishable from eachother.
alias mmmv_ls_character_testpatterns_t1="echo \"\" ; echo \"adad bdbd ftft lIlI oaoa ococ oqoq aeae ecec qgqg 3535 3737 1717 4747 4141 8686 rnrn hnhn yvyv uvuv yuyu pgpg jiji IiIi l|l| I|I| QOQO 0Q0Q 0o0o OoOo O0O0 OCOC 0C0C 8080 lJlJ IJIJ jJjJ RKRK GCGC G6G6 !|!| ß8ß8 ß8ß8 1234567890 abcdefghijklmnoprstuvwxyzõäöüžš ABCDEFGHIJKLMNOPRSTUVWXYZÕÄÖÜŽŠ .:,; _- ?! ^~ [](){} $€ |/\\\\ \\\"'\\\`\" ; echo \"\""
#--------------------
# Fonts for terminals:
#     Perfect or nearly perfect:
#         JetBrains Mono
#             https://www.jetbrains.com/lp/mono/
#             https://github.com/JetBrains/JetBrainsMono
#         Monospace
#         Liberation Mono
#     Good:
#         Lucida Console
#     Compromise versions:
#         Fira Mono
#         DEC Terminal
#         PT Mono
#         DejaVu Sans Mono
#         Efont Fixed
#         Courier_New/Cousine
alias mmmv_ls_doc_fonts_for_terminals_t1='echo ""; echo " Fonts for terminals:"; echo "     Perfect or nearly perfect:"; echo "         JetBrains Mono " ; echo "             https://www.jetbrains.com/lp/mono/ " ; echo "             https://github.com/JetBrains/JetBrainsMono " ; echo "         Monospace"; echo "         Liberation Mono"; echo "     Good:"; echo "         Lucida Console"; echo "     Compromise versions:"; echo "         Fira Mono"; echo "         DEC Terminal"; echo "         PT Mono"; echo "         DejaVu Sans Mono"; echo "         Efont Fixed"; echo "         Courier_New/Cousine " ; echo "";'
#--------------------------------------------------------------------------
if [ "$DISPLAY" == "" ]; then
    # If the Windows Linux layer, the Windows Subsystem for Linux (WSL), 
    # is used with the VcXsrv
    #
    #     https://sourceforge.net/p/vcxsrv/
    #
    # then in the case of WSL 1.x the 
    if [ "$SB_OPERATINGSYSTEM_LINUX_WSL" == "t" ]; then
        export DISPLAY=":0"
    else
        export DISPLAY="localhost:0" # for openSUSE Linux
    fi
    # is needed. In the case of WSL 2.x the IP-address is needed, like 
    #
    #     export DISPLAY="<here comes the IP-address>:0"
    #
    # As of 2020 the alternatives for the VcXsrv might be
    #
    #     https://sourceforge.net/projects/xming/
    #     https://x.cygwin.com/
    #
    # As of 2020_11 one of the requirements for using GUI applicatons
    # on the WSL Debian distribution is 
    #
    #     apt-get install x11-apps
    #
    # The testing might be done by executing
    #
    #     xeyes 
    #
    # which, if properly executing, should be listed at the Windows task-bar.
    # On Debian Linux systems 
    #
    #     xauth list
    #
    # might sometimes give some ideas, what to use as a value 
    # for the DISPLAY environment variable.
fi

# According to the
# https://unix.stackexchange.com/questions/203844/how-to-find-out-the-current-active-xserver-display-number
# achival copy: https://archive.vn/0Bpdr
# The way to find out, which display number the current session uses, is 
#
#     loginctl list-sessions
#     # and after obtaining the session IDs from there, run 
#     loginctl show-session -p Display -p Active <session ID>
#
#--------------------------------------------------------------------------
if [ "$MMMV_USERSPACE_DISTRO_T1_HOSTNAME_SPECIFIC_INITIALISATIONS_TIMESTAMP" != "$S_TIMESTAMP" ]; then
    if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
        echo ""
        echo -e "\e[31mHost \"$HOSTNAME\" specific initializations were skipped.\e[39m"
        echo "Probably the problem is that the "
        echo ""
        echo "    $S_FP_APPLIANCE_INSTANCE_SPECIFIC_MAIN_BASH"
        echo ""
        echo "has not yet been customised for this host."
        echo "GUID=='85513cc0-2cf5-43b4-9af4-c040016168e7'"
        echo ""
    fi
fi
#--------------------------------------------------------------------------
export MMMV_USERSPACE_DISTRO_T1_LINUX_ANDROID_TERMUX="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/operating_system_specific/Linux_Android_Termux"
func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
    "$MMMV_USERSPACE_DISTRO_T1_LINUX_ANDROID_TERMUX" \
    "2f400553-e637-4600-bdd3-c040016168e7" \
    "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "t" ]; then
    #--------------------
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        export MMMV_USERSPACE_DISTRO_T1_LINUX_ANDROID_TERMUX_BIN="$MMMV_USERSPACE_DISTRO_T1_LINUX_ANDROID_TERMUX/bin"
        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
            "$MMMV_USERSPACE_DISTRO_T1_LINUX_ANDROID_TERMUX_BIN" \
            "1b4292f9-c740-4790-83d3-c040016168e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
            Z_PATH="$MMMV_USERSPACE_DISTRO_T1_LINUX_ANDROID_TERMUX_BIN:$Z_PATH"
        fi
    fi
    #--------------------
    # https://wiki.termux.com/wiki/Termux-setup-storage
    # archival copy: https://archive.ph/4wbWF
    # local copy: $MMMV_USERSPACE_DISTRO_T1_HOME/attic/documentation/
    #                 third_party_documentation/Linux_and_BSD_administration/
    #                 Linux_distribution_specific_documentation/
    #                 Termux/PDFs/2022_08_31_Termux-setup-storage_t1.pdf
    SB_TERMUXSETUPSTORAGE_EXISTS_ON_PATH="f"
    if [ "`which termux-setup-storage 2> /dev/null`" != "" ]; then
        SB_TERMUXSETUPSTORAGE_EXISTS_ON_PATH="t"
        # The 
        alias mmmv_admin_Termux_setup_storage="nice -n 2 termux-setup-storage "
        # creates $HOME/storage
    fi
    #--------------------
    S_TMP_0="/sdcard"
    # It might be that the Android device 
    # does not have an sdcard installed in it or
    # for some reason the "/sdcard" 
    # is a file or a symlink to a file.
    SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING="f"
    func_mmmv_userspace_distro_t1_declare_alias_cd_t1 \
        "mmmv_go_sdcard" "$S_TMP_0" \
        "b3becb26-3c00-4023-b3d3-c040016168e7" \
        "$SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        S_TMP_0="/sdcard/Download"
        func_mmmv_userspace_distro_t1_declare_alias_cd_t1 \
            "mmmv_go_Download" "$S_TMP_0" \
            "aa46a41f-f35e-4031-91c3-c040016168e7" \
            "$SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING"
        S_TMP_0="/sdcard/download"
        func_mmmv_userspace_distro_t1_declare_alias_cd_t1 \
            "mmmv_go_download" "$S_TMP_0" \
            "550e2775-9b77-42aa-b2c3-c040016168e7" \
            "$SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING"
    fi
    #--------------------
fi
#--------------------------------------------------------------------------
S_FP_0="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/lib/templates"
S_FP_1a="$S_FP_0/_bashrc_optional_extra_00.bash.template"
S_FP_1b="$HOME/m_local/etc/_bashrc_optional_extra_00.bash"
S_FP_2a="$S_FP_0/_bashrc_optional_extra_00_bash_subpart_01.rb.template"
S_FP_2b="$HOME/m_local/etc/_bashrc_optional_extra_00_bash_subpart_01.rb"
func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
    "$S_FP_1a" "ddcbc43f-00dd-4e24-a2c3-c040016168e7" \
    "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
    func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
        "$S_FP_2a" "3819fe80-18fd-4d21-83c3-c040016168e7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        alias mmmv_admin_cre_bashrc_optional_extra_00="if [ -e \"$S_FP_1b\" ]; then echo \"$S_FP_1b already exists\" ; else if [ -e \"$S_FP_2b\" ]; then echo \"$S_FP_2b already exists\" ; else cp $S_FP_1a $S_FP_1b ; cp $S_FP_2a $S_FP_2b ; sync ; wait ; fi fi "
    fi
fi
#--------------------------------------------------------------------------
export MMMV_USERSPACE_DISTRO_T1_LINUX_WSL="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/operating_system_specific/Linux_WSL"
func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
    "$MMMV_USERSPACE_DISTRO_T1_LINUX_WSL" \
    "c495b259-1295-46cd-b5c3-c040016168e7" \
    "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
if [ "$SB_OPERATINGSYSTEM_LINUX_WSL" == "t" ]; then
    #--------------------
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        export MMMV_USERSPACE_DISTRO_T1_LINUX_WSL_BIN="$MMMV_USERSPACE_DISTRO_T1_LINUX_WSL/bin"
        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
            "$MMMV_USERSPACE_DISTRO_T1_LINUX_WSL_BIN" \
            "43555541-03dd-42f4-a2b3-c040016168e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
            Z_PATH="$MMMV_USERSPACE_DISTRO_T1_LINUX_WSL_BIN:$Z_PATH"
        fi
    fi
    #--------------------
fi
#--------------------------------------------------------------------------
export MMMV_USERSPACE_DISTRO_T1_LINUX_GENERAL_ONLY="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/operating_system_specific/Linux_general_only"
func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
    "$MMMV_USERSPACE_DISTRO_T1_LINUX_GENERAL_ONLY" \
    "a5748d5d-37d4-42e4-93b3-c040016168e7" \
    "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
if [ "$SB_OPERATINGSYSTEM_BSD" == "f" ]; then
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
        if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
            #--------------------
            export MMMV_USERSPACE_DISTRO_T1_LINUX_GENERAL_ONLY_BIN="$MMMV_USERSPACE_DISTRO_T1_LINUX_GENERAL_ONLY/bin"
            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                "$MMMV_USERSPACE_DISTRO_T1_LINUX_GENERAL_ONLY_BIN" \
                "8b6d241f-f41b-4b5c-a5b3-c040016168e7" \
                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
            if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
                Z_PATH="$MMMV_USERSPACE_DISTRO_T1_LINUX_GENERAL_ONLY_BIN:$Z_PATH"
            fi
            #--------------------
        fi
    fi
fi
#--------------------------------------------------------------------------
func_mmmv_wait_and_sync_t1 # Just to be sure.
#--------------------------------------------------------------------------
# According to the 
#
#     https://vim.fandom.com/wiki/Using_vim_as_a_man-page_viewer_under_Unix
#     archival copies: 
#         https://archive.vn/DaYZK
#         https://web.archive.org/web/20210810075503/https://vim.fandom.com/wiki/Using_vim_as_a_man-page_viewer_under_Unix
#
# the
#
#     let $PAGER=''
#
# in the ~/.vimrc combined with the 
#
#     export PAGER="/bin/sh -c \"unset PAGER;col -b -x |  vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>'  -c 'map <SPACE> <C-D>' -c 'map b <C-U>'  -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""
#
# in the ~/.bashrc should make sure that 
# the Vim is used for displaying man pages.
#----------------------------------------
if [ "$SB_SH_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_COL_EXISTS_ON_PATH" == "t" ]; then
        if [ "$SB_VIM_EXISTS_ON_PATH" == "t" ]; then
            #export PAGER="/bin/sh -c \"unset PAGER;col -b -x |  vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>'  -c 'map <SPACE> <C-D>' -c 'map b <C-U>'  -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""
            export MMMV_USERSPACE_DISTRO_T1_BASHRC_MANPAGEREADER_VIM_T1="export PAGER=\"/bin/sh -c \\\"unset PAGER;col -b -x |  vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>'  -c 'map <SPACE> <C-D>' -c 'map b <C-U>'  -c 'nmap K :Man <C-R>=expand(\\\\\\\"<cword>\\\\\\\")<CR><CR>' -\\\"\""
            alias mmmv_ui_manpagereader_Vim_t1="$MMMV_USERSPACE_DISTRO_T1_BASHRC_MANPAGEREADER_VIM_T1"
        fi
    fi
fi
#----------------------------------------
# The idea for displaying man pages in Emacs 
# originates from 
#     https://stackoverflow.com/questions/10644163/how-to-view-man-pages-using-emacs-when-invoking-man-command-in-command-line
#     archival copy: https://archive.ph/oxghe
#
func_mmmv_userspace_distro_t1_display_man_page_with_emacs_t1(){
    local S_SEARCHSTRING="$1"
    #----------------------------------------------------------------------
    if [ "$SB_EMACS_EXISTS_ON_PATH" == "t" ]; then
        nice -n 5 emacs -eval "(woman \"$S_SEARCHSTRING\")";  
        func_mmmv_wait_and_sync_t1
    else
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo -e "\e[31mThe ~/.bashrc or some subpart of it is flawed.\e[39m"
            echo "This function should never be called if "
            echo "the Emacs is missing from PATH."
            echo "GUID=='3014d6c5-3270-4dfa-9bf4-c040016168e7'"
            echo ""
        fi
    fi
} # func_mmmv_userspace_distro_t1_display_man_page_with_emacs_t1

if [ "$SB_EMACS_EXISTS_ON_PATH" == "t" ]; then
    export MMMV_USERSPACE_DISTRO_T1_BASHRC_MANPAGEREADER_EMACS_T1="export PAGER=\"func_mmmv_userspace_distro_t1_display_man_page_with_emacs_t1 \""
    alias mmmv_ui_manpagereader_Emacs_t1="$MMMV_USERSPACE_DISTRO_T1_BASHRC_MANPAGEREADER_EMACS_T1"
fi
#--------------------------------------------------------------------------

export C_INCLUDE_PATH="$MMMV_C_INCLUDE_PATH:$C_INCLUDE_PATH"
export CPLUS_INCLUDE_PATH="$MMMV_CPLUS_INCLUDE_PATH:$CPLUS_INCLUDE_PATH"

if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
    # In some cases the 
    printf "\e[?2004l"
    # makes sure that text can be copy-pasted to terminal
    # without being surrounded by tildes like "~copypastedtext~".
    #     https://unix.stackexchange.com/questions/196098/copy-paste-in-xfce4-terminal-adds-0-and-1
    # archival copies:
    #     https://archive.is/xf6KZ
    #     https://web.archive.org/web/20161125181111/https://unix.stackexchange.com/questions/196098/copy-paste-in-xfce4-terminal-adds-0-and-1
fi

# As of 2020 the 
export  CONFIG_SHELL="`which bash`" 
# is compulsory for building projects like the GCC, because
# supposedly other shells have more flaws/bugs.
#--------------------------------------------------------------------------
SB_LIBTOOL_EXISTS_ON_PATH="f"
if [ "`which libtool 2> /dev/null`" != "" ]; then
    # The GNU libtool is required for 
    # building at least some versions of the GCC.
    SB_LIBTOOL_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "libtool" "2a7f8f81-84a6-4aba-a8b3-c040016168e7"
fi
#--------------------------------------------------------------------------
SB_FOSSIL_EXISTS_ON_PATH="f"
if [ "`which fossil 2> /dev/null`" != "" ]; then
    # https://www.fossil-scm.org
    SB_FOSSIL_EXISTS_ON_PATH="t"
    alias mmmv_run_Fossil_rebuild_t1="nice -n20 fossil rebuild --vacuum --compress --cluster --analyze "
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "fossil" "dbd97412-dece-4e18-82a3-c040016168e7"
fi
#--------------------------------------------------------------------------
if [ "$SB_GLIMPSE_EXISTS_ON_PATH" == "" ]; then
    SB_GLIMPSE_EXISTS_ON_PATH="f"
    if [ "`which glimpse 2> /dev/null`" != "" ]; then
        SB_GLIMPSE_EXISTS_ON_PATH="t"
    fi
fi
if [ "$SB_GLIMPSEINDEX_EXISTS_ON_PATH" == "" ]; then
    SB_GLIMPSEINDEX_EXISTS_ON_PATH="f"
    if [ "`which glimpseindex 2> /dev/null`" != "" ]; then
        SB_GLIMPSEINDEX_EXISTS_ON_PATH="t"
    fi
fi
if [ "$SB_AGREP_EXISTS_ON_PATH" == "" ]; then
    SB_AGREP_EXISTS_ON_PATH="f"
    if [ "`which agrep 2> /dev/null`" != "" ]; then
        SB_AGREP_EXISTS_ON_PATH="t"
    fi
fi
if [ "$SB_GLIMPSEINDEX_EXISTS_ON_PATH" == "t" ]; then
    # The 
    alias mmmv_se_glimpse_index_t1="SI_MAX_NUMBER_OF_MiB_DURING_INDEXING=\"20\" ; nice -n 5 glimpseindex -M \$SI_MAX_NUMBER_OF_MiB_DURING_INDEXING -n -B -b -f -s -H " # $FULL_PATH_TO_FOLDER_WITH_INDICES  $FULL_PATH_OF_THE_FOLDER_WITH_INDEXABLE_DOCUMENTS
    # creates index files that have a path of 
    # $FULL_PATH_TO_FOLDER_WITH_INDICES/.glimpse_Foo
    #
    # For scripts the following code might be useful:
    #
    #     rm $FULL_PATH_TO_FOLDER_WITH_INDICES/.glimpse_*
    #     wait
    #     SI_MAX_NUMBER_OF_MiB_DURING_INDEXING="20"
    #     glimpseindex -M $SI_MAX_NUMBER_OF_MiB_DURING_INDEXING \
    #         -n -B -b -f -s -H $FULL_PATH_TO_FOLDER_WITH_INDICES \
    #         $FULL_PATH_OF_THE_FOLDER_WITH_INDEXABLE_DOCUMENTS
    #
fi
if [ "$SB_GLIMPSE_EXISTS_ON_PATH" == "t" ]; then
    alias mmmv_se_glimpse_search_t1="nice -n 2 glimpse -y -H " # $FULL_PATH_TO_FOLDER_WITH_INDICES <the rest of the parameters> searchstrng
    # Examples:
    #
    #     # Case insensitive search from subparts of words:
    #     glimpse -y -H $FULL_PATH_TO_FOLDER_WITH_INDICES -i searchstring
    # 
    #     # Case insensitive search with a requirement that
    #     # the match must match a whole word.
    #     glimpse -y -H $FULL_PATH_TO_FOLDER_WITH_INDICES -i -w searchstring
    # 
    #     # The same as above, but at most 77 search results are displayed.
    #     glimpse -y -H $FULL_PATH_TO_FOLDER_WITH_INDICES -i -w -L 77 searchstring
    # 
    #     # Fuzzy search with a maximum number of mismaching characters of 2.
    #     # The "-i" and "-w" options do not work with fuzzy search.
    #     glimpse -y -H $FULL_PATH_TO_FOLDER_WITH_INDICES -2 searchstring
    #
fi
#--------------------------------------------------------------------------
# The SB_EXA_EXISTS_ON_PATH
# MIGHT have been declared at the 
# /home/mmmv/applications/declare_applications.bash
if [ "$SB_EXA_EXISTS_ON_PATH" != "t" ]; then
    SB_EXA_EXISTS_ON_PATH="f"
    if [ "`which exa 2> /dev/null`" != "" ]; then
        SB_EXA_EXISTS_ON_PATH="t"
        # The aliases ls0 and mmmv_ls0
        # are declared at a lower part of this file.
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "exa" "808c132a-24ba-4681-a5a3-c040016168e7"
    fi
fi
func_mmmv_userspace_distro_t1_lambda_01_declare_alias_sorted_ls1X(){
    local S_SUFFIX="$1" # is the sorting parameter of 
                        # the ls replacement called exa
    #----------------------------------------------------------------------
    if [ "$SB_FUNC_MMMV_USERSPACE_DISTRO_T1_LAMBDA_01_DECLARE_ALIAS_SORTED_LS1X_ENABLED" == "t" ]; then
        S_TMP_4="$S_TMP_0 $S_TMP_3$S_SUFFIX $S_TMP_1"
        alias ls1_$S_SUFFIX="$S_TMP_4"
        alias mmmv_ls1_$S_SUFFIX="$S_TMP_4"
    else
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo -e "\e[31mThe ~/.bashrc or some subpart of it is flawed. \e[39m"
            echo "The function that outputs this message "
            echo "is in a role of a lambda-function."
            echo "GUID=='8261723c-52ac-44eb-a5f4-c040016168e7'"
            echo ""
        fi
    fi
    #----------------------------------------------------------------------
} # func_mmmv_userspace_distro_t1_lambda_01_declare_alias_sorted_ls1X
if [ "$SB_EXA_EXISTS_ON_PATH" == "t" ]; then
    #----------------------------------------------------------------------
    # According to 2022_09_07 version of the
    #     https://github.com/ogham/exa/issues/1108
    # the "-b" at the 
    S_TMP_0="nice -n 2 exa "
    S_TMP_1=" -b -l -T -L "
    S_TMP_2="$S_TMP_0 $S_TMP_1"
    # changes the size display mode from decimal prefixes (kB,MB,GB,...)
    # to the binary, classical, prerixes (KiB,MiB,GiB,...). The 
    alias ls0="$S_TMP_2"
    alias mmmv_ls0="$S_TMP_2"
    # reside in this if-clause to make sure that they
    # get defined in a situation, where the exa 
    # is placed on PATH by the 
    #     /home/mmmv/applications/declare_applications.bash
    #----------------------------------------------------------------------
    S_TMP_3=" --sort="
    #--------------------
    #S_SUFFIX="name"
    #S_TMP_4="$S_TMP_0 $S_TMP_3$S_SUFFIX $S_TMP_1"
    SB_FUNC_MMMV_USERSPACE_DISTRO_T1_LAMBDA_01_DECLARE_ALIAS_SORTED_LS1X_ENABLED="t"
        func_mmmv_userspace_distro_t1_lambda_01_declare_alias_sorted_ls1X \
            "accessed"
        func_mmmv_userspace_distro_t1_lambda_01_declare_alias_sorted_ls1X \
            "created"
        func_mmmv_userspace_distro_t1_lambda_01_declare_alias_sorted_ls1X \
            "extension"
        func_mmmv_userspace_distro_t1_lambda_01_declare_alias_sorted_ls1X \
            "modified"
        func_mmmv_userspace_distro_t1_lambda_01_declare_alias_sorted_ls1X \
            "name"
        func_mmmv_userspace_distro_t1_lambda_01_declare_alias_sorted_ls1X \
            "size"
        func_mmmv_userspace_distro_t1_lambda_01_declare_alias_sorted_ls1X \
            "type"
    SB_FUNC_MMMV_USERSPACE_DISTRO_T1_LAMBDA_01_DECLARE_ALIAS_SORTED_LS1X_ENABLED="f"
    #----------------------------------------------------------------------
fi
#--------------------------------------------------------------------------
if [ "$SB_RUBY_EXISTS_ON_PATH" == "t" ]; then
    S_TMP_0="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin/mmmv_polish_ABC_2_B_C_A_exec_t1" # is written in Ruby
    func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
        "$S_TMP_0" "b5a3e42b-877a-446c-b3a3-c040016168e7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        # The space at the next line beofero the "; S_ERROR_CODE=..." is important.
        export MMMV_ALIAS_ERROR_CODE_CHECK_T1="mmmv_polish_ABC_2_B_C_A_exec_t1 ' ; S_ERR_CODE=\"\$?\" ; if [ \"\$S_ERR_CODE\" != \"0\" ]; then echo \"\" ; echo -e \"Program exited with \\\e[31merror code \$S_ERR_CODE\\\e[39m .\" ; echo \"GUID==\\\"785efa41-25b5-46ea-8a59-9053d0a0c6e7\\\"\" ; echo \"\" ; fi ' "
        alias mmmv_userspace_distro_t1_test_error_code_check_t1="$MMMV_ALIAS_ERROR_CODE_CHECK_T1 ls "
        alias mmmv_run_with_error_code_check_t1="$MMMV_ALIAS_ERROR_CODE_CHECK_T1 "
    fi
fi
#--------------------
# Some tested code fragments for developing this idea further:
#
#     # The space at the next line beofero the "; S_ERROR_CODE=..." is important.
#     S_ERROR_CODE_CHECK="mmmv_polish_ABC_2_B_C_A_exec_t1  ' ; S_ERR_CODE=\"\$?\" ; if [ \"\$S_ERR_CODE\" != \"0\" ]; then echo \"\" ; echo -e \"Program exited with \\\e[31merror code \$S_ERR_CODE\\\e[39m .\" ; echo \"GUID==\\\"\$S_GUID\\\"\" ; echo \"\" ; fi ' "
#     S_SUMMAARNE_PREFIKS="export S_GUID='ahoo' ; $S_ERROR_CODE_CHECK "
#     alias testalias_01="$S_SUMMAARNE_PREFIKS ls "
# 
# The solution here might be to create some heavily customised version of
# mmmv_polish_ABC_2_B_C_A_exec_t1. For example, the error checking suffix Bash
# might be part of that customised Ruby script.
#--------------------------------------------------------------------------
func_mmmv_userspace_distro_t1_alias_admin_create_home_tmp_t1(){
    #----------------------------------------------------------------------
    # /home might be at a parttition that uses the NilFS2 file system.
    # /tmp might reside at a partition that uses the ext4 file system. 
    # NilFS2 file system is optimised for safeguarding data to the point that
    # as of 2023_01 it lacks the fsck tool, because 
    # the NilFS2 does not need that tool. The space of
    # files that are deleted from a NilFS2 partition
    # is released by a nilfs-clean daemon. If the daemon is not running,
    # deleting files from a NilFS2 partition consumes extra space, because
    # the record that says, that a file is deleted, takes
    # extra space. From speed point of view it makes sense to keep
    # all temporary files at some non-NilFS2 partion. For example,
    # build folders should be at non-NilFS2 partitions and all valuable
    # data that must be retained, including installation folders,
    # should reside at a NilFS2 partiton.
    #----------------------------------------------------------------------
    local S_TMP_0="_tmp_"
    local S_FP_GLOBALTMP="/tmp/`whoami`$S_TMP_0"  # hopefully at a non-NilFS2 
                                          # partition, may be at an ext4 partition
    local S_FP_USERTMP="$HOME/tmp_"  # Assumption is that /home resides 
                                     #at a NilFS2 partition.
    #----------------------------------------------------------------------
    if [ ! -e "$S_FP_USERTMP" ]; then  # might be a broken symlink
        #------------------------------------------------------------------
        if [ ! -e "$S_FP_GLOBALTMP" ]; then
            if [ ! -h "$S_FP_GLOBALTMP" ]; then
                mkdir -p $S_FP_GLOBALTMP
                func_mmmv_wait_and_sync_t1
                if [ -e "$S_FP_GLOBALTMP" ]; then
                    chmod -f -R 0700 $S_FP_GLOBALTMP
                    func_mmmv_wait_and_sync_t1
                fi
                func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                    "$S_FP_GLOBALTMP" "18f12aa5-ae34-434f-b4a3-c040016168e7" \
                    "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
            else
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo -e "$S_FP_GLOBALTMP is a\e[31m broken symlink \e[39m."
                    echo "GUID=='2670ba1a-e539-41ff-82e4-c040016168e7'"
                    echo ""
                fi
            fi
        fi
        #----------------------------------------
        if [ ! -e "$S_FP_USERTMP" ]; then 
            #----------------------------------------
            # The S_FP_USERTMP might have referenced a 
            # broken symlink that might have become 
            # a non-broken symlink after the 
            #     mkdir -p $S_FP_GLOBALTMP"
            if [ -e "$S_FP_GLOBALTMP" ]; then
                if [ -d "$S_FP_GLOBALTMP" ]; then
                    #----------------------------------------
                    if [ ! -h "$S_FP_USERTMP" ]; then 
                        # At this line the $S_FP_USERTMP was actually missing.
                        ln -s "$S_FP_GLOBALTMP" "$S_FP_USERTMP"
                        func_mmmv_wait_and_sync_t1
                        if [ -e "$S_FP_USERTMP" ]; then 
                            chmod -f -R 0700 $S_FP_USERTMP
                            func_mmmv_wait_and_sync_t1
                        else
                            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                                echo ""
                                echo -e "\e[31m Failed to create a symlink \e[39m"
                                echo "    $S_FP_USERTMP"
                                echo "that would point to to "
                                echo "    $S_FP_GLOBALTMP"
                                echo "GUID=='1f65f5b5-5e58-460f-81e4-c040016168e7'"
                                echo ""
                            fi
                        fi
                    else
                        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                            echo ""
                            echo -e "$S_FP_USERTMP is a\e[31m broken symlink \e[39m."
                            echo "GUID=='21cd91f2-219a-48eb-91d4-c040016168e7'"
                            echo ""
                        fi
                    fi
                    #----------------------------------------
                fi
            fi
            #----------------------------------------
        fi
        #------------------------------------------------------------------
    fi
    #----------------------------------------------------------------------
} # func_mmmv_userspace_distro_t1_alias_admin_create_home_tmp_t1
# The code that implements the 
alias mmmv_admin_create_home_tmp_t1="func_mmmv_userspace_distro_t1_alias_admin_create_home_tmp_t1 ;"
# can NOT be called automatically at login, because
# it needs to output warning messages and that
# might terminate an SSH session. Sometimes
# SSH clients interperet any stdout output during the
# execution of the ~/.bashrc as a login related error condition.
#--------------------------------------------------------------------------
S_FP_0="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin_hostname_specific/`hostname`"
if [ -e "$S_FP_0" ]; then
    if [ -d "$S_FP_0" ]; then
        Z_PATH="$S_FP_0:$Z_PATH"
    else
        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
            "$S_FP_0" "3a0b17c2-8150-46e1-9f93-c040016168e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    fi
#else
#    # It's OK for that folder to be missing.
fi
#--------------------------------------------------------------------------
S_FP_0="$HOME/m_local/bin" # yet anohter place for host specific executables
if [ -e "$S_FP_0" ]; then
    if [ -d "$S_FP_0" ]; then
        Z_PATH="$S_FP_0:$Z_PATH"
    fi
#else
#    # It's OK for that folder to be missing.
fi
#----------------------------------------
S_FP_0="/home/mmmv/m_local/bin" # yet anohter place for host specific executables
if [ -e "$S_FP_0" ]; then
    if [ -d "$S_FP_0" ]; then
        Z_PATH="$S_FP_0:$Z_PATH"
    fi
#else
#    # It's OK for that folder to be missing.
fi
#--------------------------------------------------------------------------
# The 
S_FP_0="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin_installed_program_specific/_bashrc_subpart_that_contains_the_checks_and_declarations.bash"
# might add more programs to the PATH/Z_PATH.
func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_FP_0"
#--------------------------------------------------------------------------
S_FP_0="$HOME/m_local/etc/_bashrc_optional_extra_01"
if [ -e "$S_FP_0" ]; then
    if [ ! -d "$S_FP_0" ]; then
        source "$S_FP_0"
    else
        # The
        func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
            "$S_FP_0" "38212691-89c5-478a-9493-c040016168e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        # is here for outputting an error message.
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_MMMV_HARDWARETHREADCOUNT_T1_EXISTS_ON_PATH" == "" ]; then
    # The SB_MMMV_HARDWARETHREADCOUNT_T1_EXISTS_ON_PATH 
    # might have been set at the Bash file that puts the 
    # mmmv_hardwarethreadcount_t1 on PATH.
    SB_MMMV_HARDWARETHREADCOUNT_T1_EXISTS_ON_PATH="f"
    if [ "`which mmmv_hardwarethreadcount_t1 2> /dev/null`" != "" ]; then
        SB_MMMV_HARDWARETHREADCOUNT_T1_EXISTS_ON_PATH="t"
    fi
fi
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
func_initialise_if_needed_and_possible_MMMV_USERSPACE_DISTRO_T1_SI_N_OF_COMPILATION_THREADS_T1
#--------------------------------------------------------------------------
export PATH="$Z_PATH" # To at least somewhat accurately check 
                      # the availability of Python/pip/pip3 
                      # and other package collection based 
                      # installed programs. There's another line like that later.
#--------------------------------------------------------------------------
if [ "$SB_SH_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_CURL_EXISTS_ON_PATH" == "t" ]; then
        # SH_EXISTS_ON_PATH
        alias mmmv_admin_install_Rust_t1="nice -n 2 curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh "
    fi
fi
#--------------------
SB_TRAFILATURA_EXISTS_ON_PATH="f"
if [ "`which trafilatura 2> /dev/null`" != "" ]; then
    SB_TRAFILATURA_EXISTS_ON_PATH="t"
    # The trafilatura is a Python3 application 
    # that is meant to be installed by
    #
    #     pip3 install --no-cache-dir trafilatura 
    # 
#else
    # func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
    #     "trafilatura" "e56d6f35-0516-4ef1-a293-c040016168e7"
fi
#--------------------
SB_MMMV_CRE_TEMPORARY_FILE_T1_EXISTS_ON_PATH="f"
if [ "`which mmmv_cre_temporary_file_t1 2> /dev/null`" != "" ]; then
    SB_MMMV_CRE_TEMPORARY_FILE_T1_EXISTS_ON_PATH="t"
else
    if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
        echo ""
        echo ""
        echo -e "Command line utility \"\e[31mmmmv_cre_temporary_file_t1\e[39m\" \e[31mmissing from PATH\e[39m."
        echo -e "Recommended action in Bash:\e[36m"
        echo ""
        echo "  S_FP_FOLDER=\"$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin_hostname_specific/$HOSTNAME\" "
        echo "  mkdir \$S_FP_FOLDER ; wait ; sync ; wait ; "
        echo "  S_FP_FILE_DESTINATION=\"\$S_FP_FOLDER/mmmv_cre_temporary_file_t1\" "
        echo "  S_FP_FILE_ORIGIN=\"$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin/mmmv_cre_temporary_file_t1_host_independent\""
        echo "  cp \$S_FP_FILE_ORIGIN \$S_FP_FILE_DESTINATION ; wait ; sync ; wait ; "
        echo "   "
        echo "  # and then create a RAM-partition and after that update the  "
        echo "  # value of the variable S_FP_TMP_FOR_SMALL_FILES in file "
        echo "  # \$S_FP_FILE_DESTINATION, function "
        echo "  # func_initialize_configuration_by_initializing_global_variables "
        echo -e "\e[39m"
        echo "Thank You for reading this text."
        echo "GUID=='177caa22-cd80-4eda-b2d4-c040016168e7'"
        echo ""
    fi
fi
#--------------------------------------------------------------------------
func_mmmv_wait_and_sync_t1 # Just to be sure.
#--------------------------------------------------------------------------
S_FP_0="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin/mmmv_polish_ABC_2_A_C_B_exec_t1"
if [ -e "$S_FP_0" ]; then
    if [ ! -d "$S_FP_0" ]; then
        if [ "$SB_SED_OR_GSED_EXISTS_ON_PATH" == "t" ]; then
            #--------------------------------------------------------------
            if [ "$SB_REV_EXISTS_ON_PATH" == "t" ]; then
                if [ "$SB_TR_EXISTS_ON_PATH" == "t" ]; then
                    #------------------------------------------------------
                    # Sample Bash line:
                    #
                    #     cat ./text_with_linebreaks.txt | rev | sed -e 's/^/ /g' | rev | tr --delete '\n\r' 
                    #
                    #     mmmv_polish_ABC_2_A_C_B_exec_t1 \
                    #         " cat " \
                    #         " | rev | sed -e 's/^/ /g' | rev | tr --delete '\n\r' " \
                    #         ./text_with_linebreaks.txt
                    #
                    # The sed command at the above example makes sure that 
                    # a word at the end of one line is not concatenated
                    # to the word at the start of the next line. As the
                    # very last line in a textfile never has an ending linebreak,
                    # the sed command also makes sure that the very last 
                    # non-space character at the very last line of the textfile
                    # does not get deleted. 
                    #
                    alias mmmv_textfilter_f2c_remove_linebreaks_t1="$S_FP_0 \" cat \" \" | rev | $S_CMD_GNU_SED -e 's/^/ /g' | rev | tr --delete '\n\r' \" " 
                    #------------------------------------------------------
                fi
            fi
            #--------------------------------------------------------------
            if [ "$SB_TRAFILATURA_EXISTS_ON_PATH" == "t" ]; then
                if [ "$SB_JQ_EXISTS_ON_PATH" == "t" ]; then
                    if [ "$SB_RUBY_EXISTS_ON_PATH" == "t" ]; then
                        #--------------------------------------------------
                        # The "python2 -m json.tool" is a JSON source formatter.
                        # The trafilatura is a Python3 application.
                        #alias mmmv_HTML_body_2_txt_from_URL_t1="nice -n 2 mmmv_polish_ABC_2_A_C_B_exec_t1  \" trafilatura --precision --no-comments --json --URL \" \" | python2 -m json.tool | jq '.[\\\"raw_text\\\"]' | $S_CMD_GNU_SED -e 's/^\\\"//g' | $S_CMD_GNU_SED -e 's/\\\"\\$//g' \" "
                        alias mmmv_HTML_body_2_txt_from_URL_t1="nice -n 2 mmmv_polish_ABC_2_A_C_B_exec_t1  \" trafilatura --precision --no-comments --json --URL \" \" | jq '.[\\\"raw_text\\\"]' | $S_CMD_GNU_SED -e 's/^\\\"//g' | $S_CMD_GNU_SED -e 's/\\\"\\$//g' \" "
                        alias mmmv_HTML_body_2_txt_from_file_t1="nice -n 2 mmmv_polish_ABC_2_A_C_B_exec_t1  \" trafilatura --precision --no-comments --json --input-file \" \" | jq '.[\\\"raw_text\\\"]' | $S_CMD_GNU_SED -e 's/^\\\"//g' | $S_CMD_GNU_SED -e 's/\\\"\\$//g' \" "
                        #--------------------------------------------------
                    fi
                fi
            fi
            #--------------------------------------------------------------
        else
            #--------------------------------------------------------------
            func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
                "$S_FP_0" "4442c261-7fc7-40cf-8693-c040016168e7" \
                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
            #--------------------------------------------------------------
        fi
    fi
fi
#--------------------------------------------------------------------------
S_FP_0="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin/mmmv_polish_ABC_2_ACB_exec_t1"
if [ -e "$S_FP_0" ]; then
    if [ ! -d "$S_FP_0" ]; then
        if [ "$SB_RUBY_EXISTS_ON_PATH" == "t" ]; then # Halve-overkill here, but
                                                      # it alleviates the situation
                                                      # a bit at some corner cases.
            #--------------------------------------------------------------
            if [ "$SB_LOCALECTL_EXISTS_ON_PATH" == "t" ]; then
                if [ "$SB_TR_EXISTS_ON_PATH" == "t" ]; then
                    #------------------------------------------------------
                    S_TMP_1=""
                    if [ "$SB_SORT_EXISTS_ON_PATH" == "t" ]; then
                        # alias mmmv_ls_keyboard_layout_names_t1="localectl list-x11-keymap-layouts | sort | tr '\n\r' ' ' "
                        S_TMP_1="` localectl list-x11-keymap-layouts | sort | tr '\n\r' ' ' `"
                        alias mmmv_ls_keyboard_layout_names_t1="echo $S_TMP_1 "
                    else
                        #alias mmmv_ls_keyboard_layout_names_t2="localectl list-x11-keymap-layouts | tr '\n\r' ' ' "
                        S_TMP_1="` localectl list-x11-keymap-layouts | tr '\n\r' ' ' `"
                        alias mmmv_ls_keyboard_layout_names_t2="echo $S_TMP_1 "
                    fi
                    #------------------------------------------------------
                    if [ "$SB_GREP_EXISTS_ON_PATH" == "t" ]; then
                        if [ "$SB_PRINTF_EXISTS_ON_PATH" == "t" ]; then
                            #------------------------------------------------------
                            # Test-Bash-line:
                            #
                            #     S_KEYBOARD_LAYOUT='ru' ; printf "\n ` localectl list-x11-keymap-variants $S_KEYBOARD_LAYOUT | tr '\n\r' ' ' ` \n\n"
                            #
                            #alias mmmv_ui_display_keyboard_layout_variants_ru="S_KEYBOARD_LAYOUT='ru' ; printf \"\n \` localectl list-x11-keymap-variants \$S_KEYBOARD_LAYOUT | tr '\n\r' ' ' \` \n\n\" "
                            S_TMP_2=" printf \"\\\\n \` localectl list-x11-keymap-variants \\\$S_KEYBOARD_LAYOUT | tr '\\\\n\\\\r' ' ' \` \\\\n\\\\n\" "
                            # The following has been generated by using the list at 
                            #
                            #     https://unix.stackexchange.com/questions/43976/list-all-valid-kbd-layouts-variants-and-toggle-options-to-use-with-setxkbmap
                            #     archival_copy: https://archive.is/FB1gh
                            #
                            if [ "`printf \"$S_TMP_1\" | grep \"us\" `" != "" ]; then
                                #  us              English_USA
                                alias mmmv_ls_keyboard_layout_variants_English_USA_X11_keyboard_name_us="S_KEYBOARD_LAYOUT='us' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"ad\" `" != "" ]; then
                                #  ad              Andorra
                                alias mmmv_ls_keyboard_layout_variants_Andorra_X11_keyboard_name_ad="S_KEYBOARD_LAYOUT='ad' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"af\" `" != "" ]; then
                                #  af              Afghanistan
                                alias mmmv_ls_keyboard_layout_variants_Afghanistan_X11_keyboard_name_af="S_KEYBOARD_LAYOUT='af' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"ara\" `" != "" ]; then
                                #  ara             Arabic
                                alias mmmv_ls_keyboard_layout_variants_Arabic_X11_keyboard_name_ara="S_KEYBOARD_LAYOUT='ara' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"al\" `" != "" ]; then
                                #  al              Albania
                                alias mmmv_ls_keyboard_layout_variants_Albania_X11_keyboard_name_al="S_KEYBOARD_LAYOUT='al' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"am\" `" != "" ]; then
                                #  am              Armenia
                                alias mmmv_ls_keyboard_layout_variants_Armenia_X11_keyboard_name_am="S_KEYBOARD_LAYOUT='am' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"az\" `" != "" ]; then
                                #  az              Azerbaijan
                                alias mmmv_ls_keyboard_layout_variants_Azerbaijan_X11_keyboard_name_az="S_KEYBOARD_LAYOUT='az' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"by\" `" != "" ]; then
                                #  by              Belarus
                                alias mmmv_ls_keyboard_layout_variants_Belarus_X11_keyboard_name_by="S_KEYBOARD_LAYOUT='by' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"be\" `" != "" ]; then
                                #  be              Belgium
                                alias mmmv_ls_keyboard_layout_variants_Belgium_X11_keyboard_name_be="S_KEYBOARD_LAYOUT='be' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"bd\" `" != "" ]; then
                                #  bd              Bangladesh
                                alias mmmv_ls_keyboard_layout_variants_Bangladesh_X11_keyboard_name_bd="S_KEYBOARD_LAYOUT='bd' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"in\" `" != "" ]; then
                                #  in              India
                                alias mmmv_ls_keyboard_layout_variants_India_X11_keyboard_name_in="S_KEYBOARD_LAYOUT='in' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"ba\" `" != "" ]; then
                                #  ba              Bosnia_and_Herzegovina
                                alias mmmv_ls_keyboard_layout_variants_Bosnia_and_Herzegovina_X11_keyboard_name_ba="S_KEYBOARD_LAYOUT='ba' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"br\" `" != "" ]; then
                                #  br              Brazil
                                alias mmmv_ls_keyboard_layout_variants_Brazil_X11_keyboard_name_br="S_KEYBOARD_LAYOUT='br' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"bg\" `" != "" ]; then
                                #  bg              Bulgaria
                                alias mmmv_ls_keyboard_layout_variants_Bulgaria_X11_keyboard_name_bg="S_KEYBOARD_LAYOUT='bg' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"ma\" `" != "" ]; then
                                #  ma              Morocco
                                alias mmmv_ls_keyboard_layout_variants_Morocco_X11_keyboard_name_ma="S_KEYBOARD_LAYOUT='ma' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"mm\" `" != "" ]; then
                                #  mm              Myanmar
                                alias mmmv_ls_keyboard_layout_variants_Myanmar_X11_keyboard_name_mm="S_KEYBOARD_LAYOUT='mm' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"ca\" `" != "" ]; then
                                #  ca              Canada
                                alias mmmv_ls_keyboard_layout_variants_Canada_X11_keyboard_name_ca="S_KEYBOARD_LAYOUT='ca' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"cd\" `" != "" ]; then
                                #  cd              Congo
                                alias mmmv_ls_keyboard_layout_variants_Congo_X11_keyboard_name_cd="S_KEYBOARD_LAYOUT='cd' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"cn\" `" != "" ]; then
                                #  cn              China
                                alias mmmv_ls_keyboard_layout_variants_China_X11_keyboard_name_cn="S_KEYBOARD_LAYOUT='cn' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"hr\" `" != "" ]; then
                                #  hr              Croatia
                                alias mmmv_ls_keyboard_layout_variants_Croatia_X11_keyboard_name_hr="S_KEYBOARD_LAYOUT='hr' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"cz\" `" != "" ]; then
                                #  cz              Czechia
                                alias mmmv_ls_keyboard_layout_variants_Czechia_X11_keyboard_name_cz="S_KEYBOARD_LAYOUT='cz' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"dk\" `" != "" ]; then
                                #  dk              Denmark
                                alias mmmv_ls_keyboard_layout_variants_Denmark_X11_keyboard_name_dk="S_KEYBOARD_LAYOUT='dk' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"nl\" `" != "" ]; then
                                #  nl              Netherlands
                                alias mmmv_ls_keyboard_layout_variants_Netherlands_X11_keyboard_name_nl="S_KEYBOARD_LAYOUT='nl' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"bt\" `" != "" ]; then
                                #  bt              Bhutan
                                alias mmmv_ls_keyboard_layout_variants_Bhutan_X11_keyboard_name_bt="S_KEYBOARD_LAYOUT='bt' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"ee\" `" != "" ]; then
                                #  ee              Estonia
                                alias mmmv_ls_keyboard_layout_variants_Estonia_X11_keyboard_name_ee="S_KEYBOARD_LAYOUT='ee' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"ir\" `" != "" ]; then
                                #  ir              Iran
                                alias mmmv_ls_keyboard_layout_variants_Iran_X11_keyboard_name_ir="S_KEYBOARD_LAYOUT='ir' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"iq\" `" != "" ]; then
                                #  iq              Iraq
                                alias mmmv_ls_keyboard_layout_variants_Iraq_X11_keyboard_name_iq="S_KEYBOARD_LAYOUT='iq' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"fo\" `" != "" ]; then
                                #  fo              Faroe_Islands
                                alias mmmv_ls_keyboard_layout_variants_Faroe_Islands_X11_keyboard_name_fo="S_KEYBOARD_LAYOUT='fo' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"fi\" `" != "" ]; then
                                #  fi              Finland
                                alias mmmv_ls_keyboard_layout_variants_Finland_X11_keyboard_name_fi="S_KEYBOARD_LAYOUT='fi' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"fr\" `" != "" ]; then
                                #  fr              France
                                alias mmmv_ls_keyboard_layout_variants_France_X11_keyboard_name_fr="S_KEYBOARD_LAYOUT='fr' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"gh\" `" != "" ]; then
                                #  gh              Ghana
                                alias mmmv_ls_keyboard_layout_variants_Ghana_X11_keyboard_name_gh="S_KEYBOARD_LAYOUT='gh' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"gn\" `" != "" ]; then
                                #  gn              Guinea
                                alias mmmv_ls_keyboard_layout_variants_Guinea_X11_keyboard_name_gn="S_KEYBOARD_LAYOUT='gn' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"ge\" `" != "" ]; then
                                #  ge              Georgia
                                alias mmmv_ls_keyboard_layout_variants_Georgia_X11_keyboard_name_ge="S_KEYBOARD_LAYOUT='ge' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"de\" `" != "" ]; then
                                #  de              Germany
                                alias mmmv_ls_keyboard_layout_variants_Germany_X11_keyboard_name_de="S_KEYBOARD_LAYOUT='de' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"gr\" `" != "" ]; then
                                #  gr              Greece
                                alias mmmv_ls_keyboard_layout_variants_Greece_X11_keyboard_name_gr="S_KEYBOARD_LAYOUT='gr' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"hu\" `" != "" ]; then
                                #  hu              Hungary
                                alias mmmv_ls_keyboard_layout_variants_Hungary_X11_keyboard_name_hu="S_KEYBOARD_LAYOUT='hu' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"is\" `" != "" ]; then
                                #  is              Iceland
                                alias mmmv_ls_keyboard_layout_variants_Iceland_X11_keyboard_name_is="S_KEYBOARD_LAYOUT='is' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"il\" `" != "" ]; then
                                #  il              Israel
                                alias mmmv_ls_keyboard_layout_variants_Israel_X11_keyboard_name_il="S_KEYBOARD_LAYOUT='il' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"it\" `" != "" ]; then
                                #  it              Italy
                                alias mmmv_ls_keyboard_layout_variants_Italy_X11_keyboard_name_it="S_KEYBOARD_LAYOUT='it' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"jp\" `" != "" ]; then
                                #  jp              Japan
                                alias mmmv_ls_keyboard_layout_variants_Japan_X11_keyboard_name_jp="S_KEYBOARD_LAYOUT='jp' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"kg\" `" != "" ]; then
                                #  kg              Kyrgyzstan
                                alias mmmv_ls_keyboard_layout_variants_Kyrgyzstan_X11_keyboard_name_kg="S_KEYBOARD_LAYOUT='kg' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"kh\" `" != "" ]; then
                                #  kh              Cambodia
                                alias mmmv_ls_keyboard_layout_variants_Cambodia_X11_keyboard_name_kh="S_KEYBOARD_LAYOUT='kh' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"kz\" `" != "" ]; then
                                #  kz              Kazakhstan
                                alias mmmv_ls_keyboard_layout_variants_Kazakhstan_X11_keyboard_name_kz="S_KEYBOARD_LAYOUT='kz' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"la\" `" != "" ]; then
                                #  la              Laos
                                alias mmmv_ls_keyboard_layout_variants_Laos_X11_keyboard_name_la="S_KEYBOARD_LAYOUT='la' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"latam\" `" != "" ]; then
                                #  latam           Latin_American
                                alias mmmv_ls_keyboard_layout_variants_Latin_American_X11_keyboard_name_latam="S_KEYBOARD_LAYOUT='latam' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"lt\" `" != "" ]; then
                                #  lt              Lithuania
                                alias mmmv_ls_keyboard_layout_variants_Lithuania_X11_keyboard_name_lt="S_KEYBOARD_LAYOUT='lt' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"lv\" `" != "" ]; then
                                #  lv              Latvia
                                alias mmmv_ls_keyboard_layout_variants_Latvia_X11_keyboard_name_lv="S_KEYBOARD_LAYOUT='lv' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"mao\" `" != "" ]; then
                                #  mao             Maori
                                alias mmmv_ls_keyboard_layout_variants_Maori_X11_keyboard_name_mao="S_KEYBOARD_LAYOUT='mao' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"me\" `" != "" ]; then
                                #  me              Montenegro
                                alias mmmv_ls_keyboard_layout_variants_Montenegro_X11_keyboard_name_me="S_KEYBOARD_LAYOUT='me' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"mk\" `" != "" ]; then
                                #  mk              Macedonia
                                alias mmmv_ls_keyboard_layout_variants_Macedonia_X11_keyboard_name_mk="S_KEYBOARD_LAYOUT='mk' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"mt\" `" != "" ]; then
                                #  mt              Malta
                                alias mmmv_ls_keyboard_layout_variants_Malta_X11_keyboard_name_mt="S_KEYBOARD_LAYOUT='mt' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"mn\" `" != "" ]; then
                                #  mn              Mongolia
                                alias mmmv_ls_keyboard_layout_variants_Mongolia_X11_keyboard_name_mn="S_KEYBOARD_LAYOUT='mn' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"no\" `" != "" ]; then
                                #  no              Norway
                                alias mmmv_ls_keyboard_layout_variants_Norway_X11_keyboard_name_no="S_KEYBOARD_LAYOUT='no' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"pl\" `" != "" ]; then
                                #  pl              Poland
                                alias mmmv_ls_keyboard_layout_variants_Poland_X11_keyboard_name_pl="S_KEYBOARD_LAYOUT='pl' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"pt\" `" != "" ]; then
                                #  pt              Portugal
                                alias mmmv_ls_keyboard_layout_variants_Portugal_X11_keyboard_name_pt="S_KEYBOARD_LAYOUT='pt' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"ro\" `" != "" ]; then
                                #  ro              Romania
                                alias mmmv_ls_keyboard_layout_variants_Romania_X11_keyboard_name_ro="S_KEYBOARD_LAYOUT='ro' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"ru\" `" != "" ]; then
                                #  ru              Russia
                                alias mmmv_ls_keyboard_layout_variants_Russia_X11_keyboard_name_ru="S_KEYBOARD_LAYOUT='ru' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"rs\" `" != "" ]; then
                                #  rs              Serbia
                                alias mmmv_ls_keyboard_layout_variants_Serbia_X11_keyboard_name_rs="S_KEYBOARD_LAYOUT='rs' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"si\" `" != "" ]; then
                                #  si              Slovenia
                                alias mmmv_ls_keyboard_layout_variants_Slovenia_X11_keyboard_name_si="S_KEYBOARD_LAYOUT='si' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"sk\" `" != "" ]; then
                                #  sk              Slovakia
                                alias mmmv_ls_keyboard_layout_variants_Slovakia_X11_keyboard_name_sk="S_KEYBOARD_LAYOUT='sk' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"es\" `" != "" ]; then
                                #  es              Spain
                                alias mmmv_ls_keyboard_layout_variants_Spain_X11_keyboard_name_es="S_KEYBOARD_LAYOUT='es' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"se\" `" != "" ]; then
                                #  se              Sweden
                                alias mmmv_ls_keyboard_layout_variants_Sweden_X11_keyboard_name_se="S_KEYBOARD_LAYOUT='se' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"ch\" `" != "" ]; then
                                #  ch              Switzerland
                                alias mmmv_ls_keyboard_layout_variants_Switzerland_X11_keyboard_name_ch="S_KEYBOARD_LAYOUT='ch' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"sy\" `" != "" ]; then
                                #  sy              Syria
                                alias mmmv_ls_keyboard_layout_variants_Syria_X11_keyboard_name_sy="S_KEYBOARD_LAYOUT='sy' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"tj\" `" != "" ]; then
                                #  tj              Tajikistan
                                alias mmmv_ls_keyboard_layout_variants_Tajikistan_X11_keyboard_name_tj="S_KEYBOARD_LAYOUT='tj' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"lk\" `" != "" ]; then
                                #  lk              Sri_Lanka
                                alias mmmv_ls_keyboard_layout_variants_Sri_Lanka_X11_keyboard_name_lk="S_KEYBOARD_LAYOUT='lk' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"th\" `" != "" ]; then
                                #  th              Thailand
                                alias mmmv_ls_keyboard_layout_variants_Thailand_X11_keyboard_name_th="S_KEYBOARD_LAYOUT='th' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"tr\" `" != "" ]; then
                                #  tr              Turkey
                                alias mmmv_ls_keyboard_layout_variants_Turkey_X11_keyboard_name_tr="S_KEYBOARD_LAYOUT='tr' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"tw\" `" != "" ]; then
                                #  tw              Taiwan
                                alias mmmv_ls_keyboard_layout_variants_Taiwan_X11_keyboard_name_tw="S_KEYBOARD_LAYOUT='tw' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"ua\" `" != "" ]; then
                                #  ua              Ukraine
                                alias mmmv_ls_keyboard_layout_variants_Ukraine_X11_keyboard_name_ua="S_KEYBOARD_LAYOUT='ua' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"gb\" `" != "" ]; then
                                #  gb              English_United_Kingdom
                                alias mmmv_ls_keyboard_layout_variants_English_United_Kingdom_X11_keyboard_name_gb="S_KEYBOARD_LAYOUT='gb' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"uz\" `" != "" ]; then
                                #  uz              Uzbekistan
                                alias mmmv_ls_keyboard_layout_variants_Uzbekistan_X11_keyboard_name_uz="S_KEYBOARD_LAYOUT='uz' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"vn\" `" != "" ]; then
                                #  vn              Vietnam
                                alias mmmv_ls_keyboard_layout_variants_Vietnam_X11_keyboard_name_vn="S_KEYBOARD_LAYOUT='vn' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"kr\" `" != "" ]; then
                                #  kr              Korea
                                alias mmmv_ls_keyboard_layout_variants_Korea_X11_keyboard_name_kr="S_KEYBOARD_LAYOUT='kr' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"vndr\" `" != "" ]; then
                                #  nec_vndr        Japan_PC_98xx_Series
                                alias mmmv_ls_keyboard_layout_variants_nec_Japan_PC_98xx_Series_X11_keyboard_name_vndr="S_KEYBOARD_LAYOUT='vndr' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"ie\" `" != "" ]; then
                                #  ie              Ireland
                                alias mmmv_ls_keyboard_layout_variants_Ireland_X11_keyboard_name_ie="S_KEYBOARD_LAYOUT='ie' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"pk\" `" != "" ]; then
                                #  pk              Pakistan
                                alias mmmv_ls_keyboard_layout_variants_Pakistan_X11_keyboard_name_pk="S_KEYBOARD_LAYOUT='pk' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"mv\" `" != "" ]; then
                                #  mv              Maldives
                                alias mmmv_ls_keyboard_layout_variants_Maldives_X11_keyboard_name_mv="S_KEYBOARD_LAYOUT='mv' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"za\" `" != "" ]; then
                                #  za              South_Africa
                                alias mmmv_ls_keyboard_layout_variants_South_Africa_X11_keyboard_name_za="S_KEYBOARD_LAYOUT='za' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"epo\" `" != "" ]; then
                                #  epo             Esperanto
                                alias mmmv_ls_keyboard_layout_variants_Esperanto_X11_keyboard_name_epo="S_KEYBOARD_LAYOUT='epo' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"np\" `" != "" ]; then
                                #  np              Nepal
                                alias mmmv_ls_keyboard_layout_variants_Nepal_X11_keyboard_name_np="S_KEYBOARD_LAYOUT='np' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"ng\" `" != "" ]; then
                                #  ng              Nigeria
                                alias mmmv_ls_keyboard_layout_variants_Nigeria_X11_keyboard_name_ng="S_KEYBOARD_LAYOUT='ng' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"et\" `" != "" ]; then
                                #  et              Ethiopia
                                alias mmmv_ls_keyboard_layout_variants_Ethiopia_X11_keyboard_name_et="S_KEYBOARD_LAYOUT='et' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"sn\" `" != "" ]; then
                                #  sn              Senegal
                                alias mmmv_ls_keyboard_layout_variants_Senegal_X11_keyboard_name_sn="S_KEYBOARD_LAYOUT='sn' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"brai\" `" != "" ]; then
                                #  brai            Braille
                                alias mmmv_ls_keyboard_layout_variants_Braille_X11_keyboard_name_brai="S_KEYBOARD_LAYOUT='brai' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"tm\" `" != "" ]; then
                                #  tm              Turkmenistan
                                alias mmmv_ls_keyboard_layout_variants_Turkmenistan_X11_keyboard_name_tm="S_KEYBOARD_LAYOUT='tm' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"ml\" `" != "" ]; then
                                #  ml              Mali
                                alias mmmv_ls_keyboard_layout_variants_Mali_X11_keyboard_name_ml="S_KEYBOARD_LAYOUT='ml' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"tz\" `" != "" ]; then
                                #  tz              Tanzania
                                alias mmmv_ls_keyboard_layout_variants_Tanzania_X11_keyboard_name_tz="S_KEYBOARD_LAYOUT='tz' ; $S_TMP_2 "
                            fi
                            #------------------------------------------------------
                        fi
                    fi
                else # $SB_TR_EXISTS_ON_PATH" != "t"
                    #------------------------------------------------------
                    if [ "$SB_SORT_EXISTS_ON_PATH" == "t" ]; then
                        alias mmmv_ls_keyboard_layout_names_t3="localectl list-x11-keymap-layouts | sort "
                    else
                        alias mmmv_ls_keyboard_layout_names_t4="localectl list-x11-keymap-layouts "
                    fi
                    #------------------------------------------------------
                fi
            fi
            #--------------------------------------------------------------
            if [ "$SB_GREP_EXISTS_ON_PATH" == "t" ]; then
                # A related configuration file is the
                #
                #     /etc/security/limits.conf
                #
                # which gets reloaded by restarting a session, id est
                # its new values take effect at initial login. Testline:
                #
                #      mmmv_polish_ABC_2_ACB_exec_t1 " SI_RAM_BYTES=\"" "\" ; ulimit -v \$SI_RAM_BYTES ; ulimit -m \$SI_RAM_BYTES ; wait ; ulimit -a | grep --color memory " 50000000000
                #
                alias mmmv_ui_set_session_RAM_limit_in_bytes_t1="mmmv_polish_ABC_2_ACB_exec_t1 \" SI_RAM_BYTES=\\\"\" \"\\\" ; ulimit -v \\\$SI_RAM_BYTES ; ulimit -m \\\$SI_RAM_BYTES ; wait ; ulimit -a | grep --color memory \" " # 50000000000
            fi
            #--------------------------------------------------------------
        fi
    else
        #--------------------------------------------------------------
        func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
            "$S_FP_0" "d79bf6a1-b0cc-4abc-8193-c040016168e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        #--------------------------------------------------------------
    fi
fi
#--------------------------------------------------------------------------
SB_MMMV_CRE_TEMPORARY_FILE_T1_EXISTS_ON_PATH="f"
if [ "`which mmmv_cre_temporary_file_t1 2> /dev/null`" != "" ]; then
    SB_MMMV_CRE_TEMPORARY_FILE_T1_EXISTS_ON_PATH="t"
else
    #----------------------------------------------------------------------
    if [ "$SB_OPERATINGSYSTEM_LINUX_WSL" == "f" ]; then
        if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID" == "f" ]; then
            #--------------------------------------------------------------
            # As of 2023 RAM partitions are difficult to use, 
            # if not impossible to use, on 
            # Windows Subsystem for Linux (WSL) and Android Linux.
            #--------------------------------------------------------------
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "mmmv_cre_temporary_file_t1" "2dfb471f-8481-4274-8383-c040016168e7"
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                S_TMP_0="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin/mmmv_cre_temporary_file_t1_host_independent"
                if [ -e "$S_TMP_0" ]; then
                    if [ ! -d "$S_TMP_0" ]; then
                        echo -e "The\e[31m mmmv_cre_temporary_file_t1 \e[39mis meant to be a host specific copy of the "
                        echo ""
                        echo -e "\e[33m  $MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin/mmmv_cre_temporary_file_t1_host_independent \e[39m"
                        echo ""
                        echo -e "The idea is that the\e[31m mmmv_cre_temporary_file_t1\e[39m can create"
                        echo "temporary files to a RAM-partiton that has been specified at"
                        echo ""
                        echo -e "\e[33m   /etc/fstab \e[39m"
                        echo ""
                        echo "On year 2023 mainstream Linux distributions the "
                        echo -e "line at the\e[33m /etc/fstab \e[39mMIGHT look like "
                        echo -e "\e[33m"
                        echo "tmpfs  /some/folder/created_by_root_and_with_permissions_1777/RAM_10MiB  tmpfs  nodev,size=10M  0 0 "
                        echo -e "\e[39m"
                        echo -e "The motivation for using a custom script like the\e[31m mmmv_cre_temporary_file_t1 \e[39m"
                        echo -e "is that if the\e[31m mmmv_cre_temporary_file_t1 \e[39mis called like "
                        echo ""
                        echo -e "\e[36m    S_TEMPORARY_FILE_PATH=\"\`\e[31mmmmv_cre_temporary_file_t1\e[36m --max_file_size_64KiB \`\"\e[39m"
                        echo ""
                        echo "then the temporary file with a random file name is created to a "
                        echo "RAM partition that has been mounted to a folder that may have . "
                        echo "a host specific path. This increases code reuse by eliminating "
                        echo "temporary file creation code, including file name generation code, "
                        echo "from all Bash scripts that use this script. The use of RAM partition "
                        echo "for storing very short-lived temporary files reduces nonvolatile storage "
                        echo "device wear in cases, where the sync command is used. In the case of "
                        echo "year 2023 mainstream Linux distributions the sync command is "
                        echo "needed in Bash scripts to make sure that a newly created file "
                        echo "is fully present at the file system for reading."
                        echo "GUID=='7914835f-10d8-4689-a2c4-c040016168e7'"
                        echo ""
                    fi
                fi
            fi
            #--------------------------------------------------------------
        fi
    fi
    #----------------------------------------------------------------------
fi
#--------------------------------------------------------------------------
S_FP_0="$HOME/.local/bin" # pipx, a yet anothrer Python pip analogue, 
                          # creates symlinks to thtat folder.
if [ -e "$S_FP_0" ]; then
    if [ -d "$S_FP_0" ]; then
        Z_PATH="$S_FP_0:$Z_PATH"
    fi
fi
#--------------------------------------------------------------------------
export PATH="$Z_PATH"
export MMMV_PATH_0="$PATH"
alias mmmv_ui_set_PATH_0="export PATH=\"$MMMV_PATH_0\""
#----------------------------------------
#export MANPATH="$MANPATH"
export MMMV_MANPATH_0="$MANPATH"
alias mmmv_ui_set_MANPATH_0="export MANPATH=\"$MMMV_MANPATH_0\""
#----------------------------------------
export MMMV_LD_LIBRARY_PATH_0="export LD_LIBRARY_PATH=\"$LD_LIBRARY_PATH\""
export CPLUS_INCLUDE_PATH_0="export CPLUS_INCLUDE_PATH=\"$CPLUS_INCLUDE_PATH\""
export C_INCLUDE_PATH_0="export C_INCLUDE_PATH=\"$C_INCLUDE_PATH\""
#----------------------------------------
alias mmmv_ui_reset_PATH_MANPATH_LD_LIBRARY_PATH_CPLUS_INCLUDE_PATH_C_INCLUDE_PATH="export PATH=\"$MMMV_PATH_0\" ; export MANPATH=\"$MMMV_MANPATH_0\" ; export LD_LIBRARY_PATH=\"$MMMV_LD_LIBRARY_PATH_0\" ; export CPLUS_INCLUDE_PATH=\"$CPLUS_INCLUDE_PATH_0\" ; export C_INCLUDE_PATH=\"$C_INCLUDE_PATH_0\" ; "
#--------------------------------------------------------------------------
# This has to be at the very end, because the actions can depend
# on, what is available on PATH. For example, there is no point of 
# crating a cache folder of a program that is not available on PATH.
S_FP_0="$S_FP_DIR/subparts/mmmv_userspace_distro_t1_specific/common_bashrc_optional_cache_folder_initializations.bash"
func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_FP_0"
export SB_MMMV_USERSPACE_DISTRO_T1_FIRST_SESSION="f" # domain: {"","f","t"}
                                                     # default: "" -> "t"
#--------------------------------------------------------------------------
if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
    #echo "~/.bashrc execution complete." # might be printed after error messages.
    echo "common_bashrc_main.bash execution complete." # might be printed after error messages.
    #echo "✓" # might be printed after error messages.
fi
#==========================================================================
