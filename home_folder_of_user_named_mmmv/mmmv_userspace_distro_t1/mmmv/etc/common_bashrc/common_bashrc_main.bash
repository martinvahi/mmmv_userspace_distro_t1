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
export MMMV_USERSPACE_DISTRO_T1_VERSION="63a9ad35-cbb2-44f3-82b0-70b2e0a059e7"
# does NOT duplicate the 
# S_VERSION_OF_THIS_FILE="302a8691-677f-4098-a3b0-70b2e0a059e7" 
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
if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "" ]; then
    # The  
    export SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT="t" # must be set to "f"
    #export SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT="f"
    # if the machine is accessible only over SSH, because SSH clients
    # may interpret any stdout output during ~/.bashrc execution as an
    # error condition and automatically disconnect, id est any stdout
    # output during ~/.bashrc execution may cause a failure to start
    # a session. A workaround is to use some non-bash shell during SSH
    # login and then execute bash manually.
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
            echo "GUID=='d5c1f84e-f95c-45be-83b0-70b2e0a059e7'"
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
            echo "GUID=='0937dc2d-08e0-4477-a5b0-70b2e0a059e7'"
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
            echo "GUID=='3dd66e4c-150c-4332-a3b0-70b2e0a059e7'"
            echo ""
        fi
    fi
fi
#--------------------------------------------------------------------------
if [ "$MMMV_SB_LOOK_FOR_OFFICE_SOFTWARE" == "" ]; then
    MMMV_SB_LOOK_FOR_OFFICE_SOFTWARE="t" # the default
fi
if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
    if [ "$MMMV_SB_LOOK_FOR_OFFICE_SOFTWARE" != "t" ]; then
        if [ "$MMMV_SB_LOOK_FOR_OFFICE_SOFTWARE" != "f" ]; then
            echo ""
            echo -e "\e[31mThe ~/.bashrc or some subpart of it is flawed. \e[39m"
            echo ""
            echo "    MMMV_SB_LOOK_FOR_OFFICE_SOFTWARE==\"$MMMV_SB_LOOK_FOR_OFFICE_SOFTWARE\""
            echo ""
            echo "but the valid values are: \"\", \"t\", \"f\"."
            echo "default: \"\" -> \"t\""
            echo "GUID=='e0bd7213-1c44-458f-b570-70b2e0a059e7'"
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
            echo "GUID=='27022bc3-b1f2-4420-8760-70b2e0a059e7'"
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
                    echo "GUID=='064ce717-d5f8-4fd6-a260-70b2e0a059e7'"
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
        # The SB_OK_4_THE_BASHFILE_2_BE_MISSING_OPTIONAL if-block is not
        # used here, because the current situation indicates a flaw at
        # the code that calls this function, not a situation, where the
        # file is allowed to be absent.
        #-----------------------------
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo -e "\e[31mThe S_FP_BASHFILE had a value of an empty string.\e[39m"
            if [ "$S_GUID_CANDIDATE" != "" ]; then
                echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
            fi 
            echo "GUID=='207a1ca1-a5ff-4c05-b360-70b2e0a059e7'"
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
                    echo "GUID=='f0b17713-80e8-4023-8260-70b2e0a059e7'"
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
            # The SB_OK_4_THE_BASHFILE_2_BE_MISSING_OPTIONAL if-block is
            # not used here, because the current situation differs from
            # the situation, where the file is allowed to be absent.
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
                echo "GUID=='660f0450-f63e-4fab-9460-70b2e0a059e7'"
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
                echo "GUID=='e676b02d-e196-4065-8350-70b2e0a059e7'"
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
            "b3faa04d-14a1-4b4e-a370-70b2e0a059e7"
    MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1="mode_loading_complete"
} # func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1

#--------------------------------------------------------------------------
SB_OK_TO_DISPLAY_COMMENT="f"

func_mmmv_userspace_distro_t1_ok_to_display_console_program_related_comment_t1(){
    local S_CONSOLE_PROGRAM_NAME="$1" 
    local S_GUID_CANDIDATE="$2" 
    #--------------------
    if [ "$S_GUID_CANDIDATE" == "" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo -e "\e[31mThe value of the S_GUID_CANDIDATE is an empty string\e[39m,"
            echo "but it is expected to be a GUID."
            echo "GUID=='c5d36354-4191-4a35-9250-70b2e0a059e7'"
            echo ""
        fi 
    fi 
    #--------------------
    SB_OK_TO_DISPLAY_COMMENT="f"
    if [ "$S_CONSOLE_PROGRAM_NAME" != "" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            if [ "$SB_BASHRC_OPTIONAL_EXTRA_00_LOADED" == "t" ]; then
                SB_IS_PRESENT_IN_LIST="f"
                func_mmmv_userspace_distro_t1_OK_for_the_program_to_be_missing "$S_CONSOLE_PROGRAM_NAME"
                if [ "$SB_IS_PRESENT_IN_LIST" == "f" ]; then
                    SB_OK_TO_DISPLAY_COMMENT="t"
                fi
            else
                SB_OK_TO_DISPLAY_COMMENT="t"
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
            echo "GUID=='11d92585-a32b-40a6-b450-70b2e0a059e7'"
            echo "" 
        fi
    fi 
    wait  
    #--------------------
} # func_mmmv_userspace_distro_t1_ok_to_display_console_program_related_comment_t1

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
            echo "GUID=='b850024f-113b-441a-b150-70b2e0a059e7'"
            echo ""
        fi 
    fi 
    #--------------------
    if [ "$S_CONSOLE_PROGRAM_NAME" != "" ]; then
        func_mmmv_userspace_distro_t1_ok_to_display_console_program_related_comment_t1 \
            "$S_CONSOLE_PROGRAM_NAME" "438ad954-0533-4397-a360-70b2e0a059e7"
        if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
            echo ""
            echo -e "The console program \"\e[31m$S_CONSOLE_PROGRAM_NAME\e[39m\" is missing form PATH."
            if [ "$S_GUID_CANDIDATE" != "" ]; then
                echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
            fi
            echo "GUID=='28a54c26-bfdc-4315-9450-70b2e0a059e7'"
            echo "" 
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
            echo "GUID=='a1463335-26d5-4b20-b540-70b2e0a059e7'"
            echo "" 
        fi
    fi 
    wait  
    #--------------------
} # func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1
#--------------------------------------------------------------------------
S_FP_NICE="`which nice 2> /dev/null`"
SB_NICE_EXISTS_ON_PATH="f"
if [ "$S_FP_NICE" != "" ]; then
    SB_NICE_EXISTS_ON_PATH="t"
else
    if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
        echo ""
        echo -e "Either the\e[31m code of this Bash file is flawed\e[39m"
        echo "or there is something else very wrong, because the "
        echo -e "command \"\e[31mnice\e[39m\"\e[31m is missing from PATH\e[39m."
        echo ""
        echo "GUID=='6cd9ae5d-a975-4467-9440-70b2e0a059e7'"
        echo ""
    fi
fi
#--------------------------------------------------------------------------

# Declares an alias like 
# 
#     my_awesome_alias="cd /some/useful/folder "
#
# on a condition that the /some/useful/folder exists and is
# a folder or a symlink to a folder. If the folder does not
# exist, then it does NOT create the folder.
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
            # That's not an error condition, because the
            # SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING is, as
            # its name suggets, an optional parameter.
            #--------------------------------------------------------------
        else
            #--------------------------------------------------------------
            # The 
            #
            #     func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
            #         "$SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING" \
            #         "SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING" \
            #         "4e25c381-2df0-4600-8a60-70b2e0a059e7"
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
                            echo "GUID=='8d8e0d31-c7dc-4f7d-b540-70b2e0a059e7'"
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
                echo "GUID=='7b766f28-2725-499b-8440-70b2e0a059e7'"
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
                echo "GUID=='040d772a-06ab-4c4e-8130-70b2e0a059e7'"
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
                echo "GUID=='d28feb29-d3d0-450c-9330-70b2e0a059e7'"
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
                "5c268f59-ecd8-44e8-9160-70b2e0a059e7" \
                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
            if [ "$SB_VERIFICATION_FAILED" == "t" ]; then
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo "Leaving at least one alias undefined."
                    echo "GUID=='bcf88a31-0f52-4ec7-8330-70b2e0a059e7'"
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
                    echo "exists, but either it is not accessible to the"
                    echo "current user or the pwd-value in it differs from the"
                    echo "path given to this Bash function."
                    echo "Leaving at least one alias undefined."
                    echo "GUID=='45775639-b435-4e94-b330-70b2e0a059e7'"
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
        "7f595c13-dbab-40f9-9160-70b2e0a059e7"
    #----------------------------------------------------------------------
    func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
        "$SB_VERIFICATION_FAILED_LOCAL" "SB_VERIFICATION_FAILED_LOCAL" \
        "decbc32a-90f6-4f33-bc60-70b2e0a059e7"
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
#    "3b64e94f-2a97-4d17-a550-70b2e0a059e7"
#
#func_mmmv_userspace_distro_t1_declare_alias_cd_t1 \
#    "mmmv_nonsense_02" \
#    "/tmp/olematu" \
#    "19324f6b-6e4d-499d-8350-70b2e0a059e7"
#
#func_mmmv_userspace_distro_t1_declare_alias_cd_t1 \
#    "mmmv_nonsense_03" \
#    "$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/common_bashrc/common_bashrc_main.bash" \
#    "d667684e-77d6-4f9c-9250-70b2e0a059e7"
#
#--------------------------------------------------------------------------
S_FP_0="$S_FP_DIR/subparts/general/_bashrc_subpart_func_core_t3c"
func_mmmv_include_bashfile_if_possible_t2 "$S_FP_0" "d1693c29-d181-4f61-b350-70b2e0a059e7"
func_mmmv_report_missing_from_path_and_do_NOT_exit_t1 "grep"
#--------------------------------------------------------------------------
S_WHOAMI="`whoami`"
#--------------------------------------------------------------------------
SB_USERNAME_IS_root="f"  # domain: {"t","f"}
SB_USERNAME_IS_mmmv="f"  # domain: {"t","f"}
if [ "$S_WHOAMI" == "root" ]; then
    SB_USERNAME_IS_root="t"
else
    if [ "$S_WHOAMI" == "mmmv" ]; then
        SB_USERNAME_IS_mmmv="t"
    fi
fi
#--------------------------------------------------------------------------
# https://stackoverflow.com/questions/55673886/what-is-the-difference-between-c-utf-8-and-en-us-utf-8-locales/
# archival copy: https://archive.vn/ivNHa
# Summary: 
#     The "C" in the "C.UTF-8" stands for "computer" and supposedly the
#     "C.UTF-8" switches in a more computer-readable text output mode
#     than the "en_US.UTF-8".
export LC_TIME="C.UTF-8"
export LC_ALL="C.UTF-8" # useful on FreeBSD for making the tar work
export LANG="C.UTF-8"
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

# According to 2025_04_15 Microsoft Bing chatbot the
    # S_TMP_0=" -march=armv6 -mtune=generic-arm "
# is supposed to work as a CFLAGS/CXXFLAGS value
# for Raspberry_Pi models 1, 2, 3, 4, 400 and 5.
# but for some reason it does not work on
# Raspberry_Pi_400 with "uname -a "
#
#     Linux raspberrypi 6.12.20+rpt-rpi-v8 #1 SMP PREEMPT Debian 1:6.12.20-1+rpt1~bpo12+1 (2025-03-19) aarch64 GNU/Linux

    # MMMV_CFLAGS_TEMPLATE="$S_TMP_0 $MMMV_CFLAGS_COMMON "
# According to 2025_04_15 Microsoft Bing chatbot the
    # S_TMP_0=" -mtune=arm1176jzf-s "
# is supposed to be Raspberry_Pi_1 specific which 
# is supposed to be supported also by 
# Raspberry_Pi models 2,3,4,400 and 5.
    # MMMV_CFLAGS_TEMPLATE="$S_TMP_0 $MMMV_CFLAGS_COMMON "

if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "t" ]; then
    # For some reason the " -march=native " triggers an error on Termux,
    # if the classical configure script is run.  The error message is
    # something along the lines that a compiler does not work.
    MMMV_CFLAGS_TEMPLATE=" -mtune=native $MMMV_CFLAGS_COMMON "  
fi
#----------------------------------------
if [ "$CFLAGS" == "" ]; then
    export CFLAGS="$MMMV_CFLAGS_TEMPLATE"
fi
if [ "$CXXFLAGS" == "" ]; then
    export CXXFLAGS="$MMMV_CFLAGS_TEMPLATE"
fi
#--------------------------------------------------------------------------
# https://gcc.gnu.org/onlinedocs/gcc/C_002b_002b-Modules.html
# archival copy: https://archive.vn/JFNH3
export MMMV_CXXFLAGS_EXTRA_GCC=" -std=c++20 -fmodules-ts "

# https://clang.llvm.org/docs/Modules.html#problems-modules-do-not-solve
# archival copy: https://archive.vn/QYqMU
export MMMV_CXXFLAGS_EXTRA_LLVM=" -fmodules -fbuiltin-module-map -fmodules-decluse -fmodules-search-all "

#--------------------------------------------------------------------------
# The clang and clang++ seem to introduce linking problems on Raspberry
# Pi 3, Raspbian.  A general rule is that binaries produced by different
# C/C++ compilers can not be linked together.
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
    S_FP_1="$S_FP_0/env"  # Rust related $HOME/.bashrc subpart
    if [ -e "$S_FP_0" ]; then
        if [ -d "$S_FP_0" ]; then
            #----------------------------------------
            func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
                "$S_FP_0" \
                "25f76f10-75be-43bf-a450-70b2e0a059e7"
            #----------------------------------------
            func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
                "$S_FP_1" "47b36532-89ea-48ee-b240-70b2e0a059e7" \
                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
            if [ -e "$S_FP_1" ]; then
                if [ ! -d "$S_FP_1" ]; then
                    source "$S_FP_1"
                fi
            fi
            #----------------------------------------
        fi
    else
        if [ -h "$S_FP_0" ]; then # broken symlink
            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                "$S_FP_0" "32957566-8bb8-4201-8540-70b2e0a059e7" \
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
MMMV_USERSPACE_DISTRO_T1_HOME_USERDECLARED="$MMMV_USERSPACE_DISTRO_T1_HOME"
# Usually the
#     export MMMV_USERSPACE_DISTRO_T1_HOME="/home/mmmv/mmmv_userspace_distro_t1"
# would do, but there are use cases, where user "mmmv" is not used and
# for that reason the path is derived:
S_TMP_0="`cd $S_FP_DIR/../../../ ; pwd`"
func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
    "$S_TMP_0" "74654527-fff8-4394-a240-70b2e0a059e7" \
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
        echo "GUID=='5d00cc02-201b-489b-b830-70b2e0a059e7'"
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
            echo "GUID=='fa13f023-1e3e-4038-9230-70b2e0a059e7'"
            echo ""
        fi
    fi
    export MMMV_USERSPACE_DISTRO_T1_HOME="$S_TMP_0"
    S_TMP_1="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin"
    func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
        "$S_TMP_1" "9d734c1e-6185-4957-a340-70b2e0a059e7" \
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
            echo "GUID=='b80de94f-b607-49b0-9420-70b2e0a059e7'"
            echo ""
        fi
        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
            "$MMMV_USERSPACE_DISTRO_T1_HOME_USERDECLARED" \
            "739cf214-8985-4ba3-9340-70b2e0a059e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    fi
fi
#--------------------------------------------------------------------------
export MMMV_USERSPACE_DISTRO_T1_LINUX_WSL="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/operating_system_specific/Linux_WSL"
func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
    "$MMMV_USERSPACE_DISTRO_T1_LINUX_WSL" \
    "6f06974d-1bc8-4d1e-a230-70b2e0a059e7" \
    "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
#-------------------
export MMMV_USERSPACE_DISTRO_T1_LINUX_ANDROID_TERMUX="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/operating_system_specific/Linux_Android_Termux"
func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
    "$MMMV_USERSPACE_DISTRO_T1_LINUX_ANDROID_TERMUX" \
    "e987751f-285a-4566-b130-70b2e0a059e7" \
    "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
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
        # Probably the SB_CONSOLE_OUTPUT_IS_ALLOWED=="", but it
        # might have been set to "t" at the ~/.bashrc , if the
        # code at the ~/.bashrc has determined that the session
        # is a local session, not an SSH session.
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo ""
            echo "You may want to use the alias "
            echo -e "\e[33m    mmmv_admin_create_home_tmp_t1 \e[39m"
            echo "for creating a symlink "
            S_TMP_0="_tmp_"
            echo "    /home/$S_WHOAMI/tmp_  -->  /tmp/$S_WHOAMI$S_TMP_0 "
            echo "GUID=='2107399f-293f-45ea-b420-70b2e0a059e7'"
            echo ""
        fi
    fi
fi
#--------------------------------------------------------------------------
if [ -e "/usr/sbin" ]; then
    # The 
    func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
        "/usr/sbin" "6e82ed47-08ef-4968-b430-70b2e0a059e7" \
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
                echo "GUID=='723cf12e-7b03-4804-a120-70b2e0a059e7'"
                echo ""
            fi
        fi
    fi
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
S_FP_0="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin_hostname_specific/`hostname`"
if [ -e "$S_FP_0" ]; then
    if [ -d "$S_FP_0" ]; then
        Z_PATH="$S_FP_0:$Z_PATH"
    else
        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
            "$S_FP_0" "54e96994-04a8-4cbd-8d30-70b2e0a059e7" \
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
export PATH="$Z_PATH" # to have the $MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin 
                      # on PATH before starting to declare aliases that
                      # depend on its content.
#--------------------------------------------------------------------------
if [ "$S_WHOAMI" == "mmmv" ]; then
    Z_PATH="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin_user_specific/mmmv:$Z_PATH"
fi
#--------------------------------------------------------------------------
# The 
S_FP_0="$HOME/m_local/etc/_bashrc_optional_extra_00.bash"
# declares the list of programs that are allowed to be missing
# from PATH without warning/complaining about their absence.
SB_BASHRC_OPTIONAL_EXTRA_00_LOADED="f"
if [ -e "$S_FP_0" ]; then
    if [ ! -d "$S_FP_0" ]; then
        func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_FP_0"
        SB_BASHRC_OPTIONAL_EXTRA_00_LOADED="t"
    else
        # The
        func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
            "$S_FP_0" "4cf0e0b5-5ec3-4385-a330-70b2e0a059e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        # is here for outputting an error message.
    fi
fi
#--------------------------------------------------------------------------
export PATH="$Z_PATH"
#--------------------------------------------------------------------------
# To save operating system userspace distribution creators from studying
# this huge ./common_bashrc_main.bash , the userspace distribution
# specific parts are placed to a separate, dedicated, file:
#---------------------------------------
S_FP_0="$S_FP_DIR/subparts/mmmv_userspace_distro_t1_specific/appliance_instance_specific_Bash_code/appliance_instance_specific_main.bash"
func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_FP_0"
# which optionally includes the 
#
#     /home/mmmv/applications/declare_applications.bash
#
export PATH="$Z_PATH" # to take into account the optional /home/mmmv/applications/declare_applications.bash
#---------------------------------------
# The 
S_FP_0="$S_FP_DIR/subparts/mmmv_userspace_distro_t1_specific/common_bashrc_Ruby_related.bash"
func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_FP_0"
# has to be included only after the application delcaration 
# Bash scripts have been included.
#-------------------
S_FP_0="$S_FP_DIR/subparts/mmmv_userspace_distro_t1_specific/common_bashrc_Python_related.bash"
func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_FP_0"
#-------------------
S_FP_0="$S_FP_DIR/subparts/mmmv_userspace_distro_t1_specific/common_bashrc_dot_NET_related.bash"
func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_FP_0"
#-------------------
S_FP_0="$S_FP_DIR/subparts/mmmv_userspace_distro_t1_specific/common_bashrc_Nodejs_related.bash"
func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_FP_0"
#-------------------
S_FP_0="$S_FP_DIR/subparts/mmmv_userspace_distro_t1_specific/common_bashrc_Go_related.bash"
func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_FP_0"
#-------------------
export PATH="$Z_PATH" # to take into account the possible Z_PATH changes.
#-------------------
export MMMV_DEVEL_TOOLS_HOME="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/lib/mmmv_devel_tools/2015_01_22_mmmv_devel_tools_without_JumpGUID_and_IDE_integration_v_02_with_UpGUID_bugfix"
S_FP_0="$MMMV_DEVEL_TOOLS_HOME/src/api/mmmv_devel_tools_bashrc_extension.bash"
func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_FP_0"
#-------------------
export PATH="$Z_PATH" # to take into account the possible Z_PATH changes.
#--------------------------------------------------------------------------
# The 
S_FP_0="$S_FP_DIR/subparts/mmmv_userspace_distro_t1_specific/common_bashrc_program_availability_checks_01.bash"
# has to be included
func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_FP_0"
# after all of the more specialised inclusion files.
export PATH="$Z_PATH" # to take into account the possible Z_PATH changes.
#-------------------
S_FP_0="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/lib/core_applications_set_01/_bashrc_subpart_that_adds_core_applications_set_01_elements_to_Z_PATH_according_to_availability_tests.bash"
func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_FP_0"
export PATH="$Z_PATH"
#-------------------
S_FP_0="$S_FP_DIR/subparts/mmmv_userspace_distro_t1_specific/common_bashrc_alias_mmmv_image_viewer.bash"
func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_FP_0"
export PATH="$Z_PATH"
#-------------------
# The 
S_FP_0="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin_installed_program_specific/_bashrc_subpart_that_contains_the_set_of_checks_and_declarations_01.bash"
# might add more programs to the Z_PATH.
func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_FP_0"
export PATH="$Z_PATH" # to take into account the possible Z_PATH changes.
#--------------------------------------------------------------------------
S_FP_0="$S_FP_DIR/subparts/mmmv_userspace_distro_t1_specific/common_bashrc_alias_declarations_01.bash"
func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_FP_0"
export PATH="$Z_PATH" # here just in case, for comfort
#--------------------------------------------------------------------------
# The newline trick 
S_NEWLINE=$'\n'
# originates from the answer of Gordon Davisson:
# https://stackoverflow.com/questions/17821277/how-to-separate-multiple-commands-passed-to-eval-in-bash
# archival copy: https://archive.fo/7XI3a 
#--------------------------------------------------------------------------
# https://superuser.com/questions/365847/where-should-the-xdg-config-home-variable-be-defined
# archival copy: https://archive.ph/m7cFg
if [ "$XDG_CONFIG_HOME" == "" ]; then
    export XDG_CONFIG_HOME="$HOME/.config"
fi
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
            echo "GUID=='c160b5ee-49ee-4205-8520-70b2e0a059e7'"
            echo ""
        fi
    fi
else
    export EDITOR="$S_TMP_0"
fi
#----------------------------------------
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
    # is that back in the teletype era text editors that could move
    # the cursor were difficult to use and supposedly scripts had a
    # convention that if the text editor that was determined by the value
    # of the VISUAL could not be used, then the scripts used the text
    # editor that was determined by the environment variable EDITOR.  In
    # 2020 the difference might be that the VISUAL references a graphical
    # text editor and the EDITOR references a console text editor. It's
    # OK to make them both to reference a console text editor.
fi
#--------------------------------------------------------------------------
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
if [ "$SB_OPERATINGSYSTEM_LINUX_WSL" == "t" ]; then
    #--------------------
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        export MMMV_USERSPACE_DISTRO_T1_LINUX_WSL_BIN="$MMMV_USERSPACE_DISTRO_T1_LINUX_WSL/bin"
        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
            "$MMMV_USERSPACE_DISTRO_T1_LINUX_WSL_BIN" \
            "8250fc5e-d4ea-4b0d-9120-70b2e0a059e7" \
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
    "42a5cc31-e37c-41e9-a320-70b2e0a059e7" \
    "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
if [ "$SB_OPERATINGSYSTEM_BSD" == "f" ]; then
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
        if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
            #--------------------
            export MMMV_USERSPACE_DISTRO_T1_LINUX_GENERAL_ONLY_BIN="$MMMV_USERSPACE_DISTRO_T1_LINUX_GENERAL_ONLY/bin"
            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                "$MMMV_USERSPACE_DISTRO_T1_LINUX_GENERAL_ONLY_BIN" \
                "3a653e72-fa76-4c7d-8320-70b2e0a059e7" \
                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
            if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
                Z_PATH="$MMMV_USERSPACE_DISTRO_T1_LINUX_GENERAL_ONLY_BIN:$Z_PATH"
            fi
            #--------------------
        fi
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_RUBY_EXISTS_ON_PATH" == "t" ]; then
    S_TMP_0="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin/mmmv_polish_ABC_2_B_C_A_exec_t1" # is written in Ruby
    func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
        "$S_TMP_0" "4a3222c5-580c-443d-8120-70b2e0a059e7" \
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
S_TMP_0="_home_mmmv_bashrc_subpart.bash"
S_TMP_1="/m_local/etc/$HOSTNAME$S_TMP_0"
S_FP_0="/home/mmmv$S_TMP_1" # does NOT need to exist
if [ -e "$S_FP_0" ]; then
    #----------------------------------------
    if [ ! -d "$S_FP_0" ]; then
        func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_FP_0"
    else
        # The 
        func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
            "$S_FP_0" \
            "69364420-9b43-4648-9120-70b2e0a059e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        # is here to conditionally display an error message.
    fi
    #----------------------------------------
else
    S_FP_0="$HOME$S_TMP_1" # does NOT need to exist
    if [ -e "$S_FP_0" ]; then
        #----------------------------------------
        if [ ! -d "$S_FP_0" ]; then
            func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_FP_0"
        else
            # The 
            func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
                "$S_FP_0" \
                "212979da-8812-4bf4-b110-70b2e0a059e7" \
                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
            # is here to conditionally display an error message.
        fi
        #----------------------------------------
    else
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            if [ "$HOSTNAME" != "hoidla01" ]; then
                echo ""
                echo "Could not find an optioally used file "
                echo ""
                echo "    $S_FP_0"
                echo ""
                echo "You might find it useful for storing "
                echo "host specific general ~/.bashrc subpart code."
                echo "GUID=='e7320b46-84ec-437e-a520-70b2e0a059e7'"
                echo ""
            fi
        fi
    fi
fi
#--------------------------------------------------------------------------
func_mmmv_userspace_distro_t1_alias_admin_create_home_tmp_t1(){
    #----------------------------------------------------------------------
    # /home might be at a parttition that uses the NilFS2 file system.
    # /tmp might reside at a partition that uses the ext4 file system.
    # NilFS2 file system is optimised for safeguarding data to the point
    # that as of 2023_01 it lacks the fsck tool, because the NilFS2 does
    # not need that tool. The space of files that are deleted from a
    # NilFS2 partition is released by a nilfs-clean daemon. If the daemon
    # is not running, deleting files from a NilFS2 partition consumes
    # extra space, because the record that says, that a file is deleted,
    # takes extra space. From speed point of view it makes sense to
    # keep all temporary files at some non-NilFS2 partion. For example,
    # build folders should be at non-NilFS2 partitions and all valuable
    # data that must be retained, including installation folders, should
    # reside at a NilFS2 partiton.
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
                    "$S_FP_GLOBALTMP" "74c95d3b-e374-47e5-8510-70b2e0a059e7" \
                    "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
            else
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo -e "$S_FP_GLOBALTMP is a\e[31m broken symlink \e[39m."
                    echo "GUID=='02face5a-f053-4606-8110-70b2e0a059e7'"
                    echo ""
                fi
            fi
        fi
        #----------------------------------------
        if [ ! -e "$S_FP_USERTMP" ]; then 
            #----------------------------------------
            # The S_FP_USERTMP might have referenced
            # a broken symlink that might have become 
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
                                echo "GUID=='411824ff-f2e7-4196-a410-70b2e0a059e7'"
                                echo ""
                            fi
                        fi
                    else
                        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                            echo ""
                            echo -e "$S_FP_USERTMP is a\e[31m broken symlink \e[39m."
                            echo "GUID=='26261b29-3fa0-4541-a410-70b2e0a059e7'"
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
# can NOT be called automatically at login, because it needs to output
# warning messages and that might terminate an SSH session. Sometimes
# SSH clients interperet any stdout output during the execution of the
# ~/.bashrc as a login related error condition.
#--------------------------------------------------------------------------
S_TMP_0="echo -e '\\a' ; "
alias mmmv_bell="$S_TMP_0"
alias mmmv_system_bell="$S_TMP_0"
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
                      # installed programs. There's another
                      # line like that later.
#--------------------------------------------------------------------------
if [ "$SB_SH_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_CURL_EXISTS_ON_PATH" == "t" ]; then
        # SH_EXISTS_ON_PATH
        alias mmmv_admin_install_Rust_t1="rm -fr $HOME/.rustup ; wait ; rm -fr $HOME/.cargo ; wait ; sync ; wait ; nice -n 2 curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh "
    fi
fi
#--------------------
if [ "$SB_MMMV_CRE_TEMPORARY_FILE_T1_EXISTS_ON_PATH" == "" ]; then
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
            echo "GUID=='12fabdf2-9df7-4b7b-9510-70b2e0a059e7'"
            echo ""
        fi
    fi
fi
#--------------------------------------------------------------------------
func_mmmv_wait_and_sync_t1 # Just to be sure.
#--------------------------------------------------------------------------
if [ "$SB_MMMV_CRE_TEMPORARY_FILE_T1_EXISTS_ON_PATH" == "" ]; then
    SB_MMMV_CRE_TEMPORARY_FILE_T1_EXISTS_ON_PATH="f"
    if [ "`which mmmv_cre_temporary_file_t1 2> /dev/null`" != "" ]; then
        SB_MMMV_CRE_TEMPORARY_FILE_T1_EXISTS_ON_PATH="t"
    else
        #----------------------------------------------------------------------
        if [ "$SB_OPERATINGSYSTEM_LINUX_WSL" == "f" ]; then
            if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID" == "f" ]; then
                #--------------------------------------------------------------
                # As of 2023 RAM partitions are difficult to use,
                # if not impossible to use, on Windows Subsystem
                # for Linux (WSL) and Android Linux.
                #--------------------------------------------------------------
                func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                    "mmmv_cre_temporary_file_t1" "ef75565f-03d7-4820-b510-70b2e0a059e7"
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
                            echo "then the temporary file with a random file name is"
                            echo "created to a RAM partition that has been mounted to"
                            echo "a folder that may have . a host specific path. This"
                            echo "increases code reuse by eliminating temporary file"
                            echo "creation code, including file name generation code,"
                            echo "from all Bash scripts that use this script. The use of"
                            echo "RAM partition for storing very short-lived temporary"
                            echo "files reduces nonvolatile storage device wear in cases,"
                            echo "where the sync command is used. In the case of year"
                            echo "2023 mainstream Linux distributions the sync command is"
                            echo "needed in Bash scripts to make sure that a newly created"
                            echo "file is fully present at the file system for reading."
                            echo "GUID=='672d7640-f433-4946-a410-70b2e0a059e7'"
                            echo ""
                        fi
                    fi
                fi
                #--------------------------------------------------------------
            fi
        fi
        #----------------------------------------------------------------------
    fi
fi
#--------------------------------------------------------------------------
# This has to be at the very end, because the actions can depend
# on, what is available on PATH. For example, there is no point of 
# crating a cache folder of a program that is not available on PATH.
S_FP_0="$S_FP_DIR/subparts/mmmv_userspace_distro_t1_specific/common_bashrc_optional_cache_folder_initializations.bash"
func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_FP_0"
#--------------------------------------------------------------------------
S_FP_0="$HOME/m_local/etc/_bashrc_optional_extra_01"
if [ -e "$S_FP_0" ]; then
    if [ ! -d "$S_FP_0" ]; then
        func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_FP_0"
    else
        # The
        func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
            "$S_FP_0" "361ba2c3-8516-4bfa-ad10-70b2e0a059e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        # is here for outputting an error message.
    fi
fi
S_FP_0="$HOME/m_local/etc/_bashrc_optional_extra_01.bash"
if [ -e "$S_FP_0" ]; then
    if [ ! -d "$S_FP_0" ]; then
        func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_FP_0"
    else
        # The
        func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
            "$S_FP_0" "64ae6021-999d-460b-8410-70b2e0a059e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        # is here for outputting an error message.
    fi
fi
#--------------------------------------------------------------------------
Z_PATH="$Z_PATH:$PATH" # to take into account the possible 
                       # Z_PATH and PATH changes at the 
                       # _bashrc_optional_extra_01.bash and 
                       # _bashrc_optional_extra_01 .
                       # TODO: remove duplicate paths from the Z_PATH value
                       # while retaining the leftmost instance of the path-string. 
export PATH="$Z_PATH" 
#----------------------------------------
export MMMV_MANPATH_0="$MANPATH"
alias mmmv_ui_set_MANPATH_0="export MANPATH=\"$MMMV_MANPATH_0\""
#----------------------------------------
export MMMV_LD_LIBRARY_PATH_0="export LD_LIBRARY_PATH=\"$LD_LIBRARY_PATH\""
export CPLUS_INCLUDE_PATH_0="export CPLUS_INCLUDE_PATH=\"$CPLUS_INCLUDE_PATH\""
export C_INCLUDE_PATH_0="export C_INCLUDE_PATH=\"$C_INCLUDE_PATH\""
#----------------------------------------
export MMMV_PATH_0="$PATH"
alias mmmv_ui_set_PATH_0="export PATH=\"$MMMV_PATH_0\""
alias mmmv_ui_reset_PATH_MANPATH_LD_LIBRARY_PATH_CPLUS_INCLUDE_PATH_C_INCLUDE_PATH="export PATH=\"$MMMV_PATH_0\" ; export MANPATH=\"$MMMV_MANPATH_0\" ; export LD_LIBRARY_PATH=\"$MMMV_LD_LIBRARY_PATH_0\" ; export CPLUS_INCLUDE_PATH=\"$CPLUS_INCLUDE_PATH_0\" ; export C_INCLUDE_PATH=\"$C_INCLUDE_PATH_0\" ; "
#--------------------------------------------------------------------------
func_mmmv_wait_and_sync_t1 # Just to be sure.
#--------------------------------------------------------------------------
export SB_MMMV_USERSPACE_DISTRO_T1_FIRST_SESSION="f" # domain: {"","f","t"}
                                                     # default: "" -> "t"
#--------------------------------------------------------------------------
if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
    #echo "~/.bashrc execution complete." # might be printed after error messages.
    echo "common_bashrc_main.bash execution complete." # might be printed after error messages.
    #echo "✓" # might be printed after error messages.
fi
#==========================================================================
