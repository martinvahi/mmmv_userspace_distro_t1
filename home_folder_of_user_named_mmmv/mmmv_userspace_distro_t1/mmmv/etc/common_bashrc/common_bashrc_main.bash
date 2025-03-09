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
export MMMV_USERSPACE_DISTRO_T1_VERSION="24c14bd6-2ae3-4e86-b104-11b1509039e7"
# does NOT duplicate the 
# S_VERSION_OF_THIS_FILE="c5c0745a-2cac-4e7d-9304-11b1509039e7" 
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
            echo "GUID=='04dce5f9-cc35-439a-8704-11b1509039e7'"
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
            echo "GUID=='fdeb2056-033c-44ea-8404-11b1509039e7'"
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
            echo "GUID=='1fb39d70-4b69-492d-8104-11b1509039e7'"
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
            echo "GUID=='51cf3d9e-72bc-4bad-a204-11b1509039e7'"
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
            echo "GUID=='38fa8639-caa7-47d0-b2f3-11b1509039e7'"
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
                    echo "GUID=='51df9e44-51f4-4ae6-acf3-11b1509039e7'"
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
            echo "GUID=='e591fc5e-a8ae-4c2d-b4f3-11b1509039e7'"
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
                    echo "GUID=='ca5651ff-3a43-419d-92b3-11b1509039e7'"
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
                echo "GUID=='6c86903b-0153-4b49-85a3-11b1509039e7'"
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
                echo "GUID=='97ce5e4d-dc1f-4127-83a3-11b1509039e7'"
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
            "e64a2e39-93ad-44f5-8404-11b1509039e7"
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
            echo "GUID=='9d36cc3a-e71b-43f4-85a3-11b1509039e7'"
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
                echo "GUID=='f8180c3d-7f3b-41e2-b1a3-11b1509039e7'"
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
            echo "GUID=='245e4bad-46db-4e38-8293-11b1509039e7'"
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
        echo "GUID=='34047a23-571d-4fbe-a893-11b1509039e7'"
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
            #         "826e70f6-5f52-4399-b8f3-11b1509039e7"
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
                            echo "GUID=='a6e23a12-854f-4a5c-b293-11b1509039e7'"
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
                echo "GUID=='1d773c46-ece1-4c78-9593-11b1509039e7'"
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
                echo "GUID=='fdb002a6-3ddf-458d-8493-11b1509039e7'"
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
                echo "GUID=='483b2954-65a6-4090-8283-11b1509039e7'"
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
                "1360dbbe-0620-45a9-95f3-11b1509039e7" \
                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
            if [ "$SB_VERIFICATION_FAILED" == "t" ]; then
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo "Leaving at least one alias undefined."
                    echo "GUID=='722d8d38-bd46-4bff-a483-11b1509039e7'"
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
                    echo "GUID=='320dedc3-5e23-4e12-9483-11b1509039e7'"
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
        "53a98b19-2040-4898-83f3-11b1509039e7"
    #----------------------------------------------------------------------
    func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
        "$SB_VERIFICATION_FAILED_LOCAL" "SB_VERIFICATION_FAILED_LOCAL" \
        "f90dc74d-f1e4-4385-93f3-11b1509039e7"
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
#    "4747b442-6265-48e1-a1b3-11b1509039e7"
#
#func_mmmv_userspace_distro_t1_declare_alias_cd_t1 \
#    "mmmv_nonsense_02" \
#    "/tmp/olematu" \
#    "ac009c38-c154-4e39-81a3-11b1509039e7"
#
#func_mmmv_userspace_distro_t1_declare_alias_cd_t1 \
#    "mmmv_nonsense_03" \
#    "$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/common_bashrc/common_bashrc_main.bash" \
#    "38eede2e-117b-42f8-a2a3-11b1509039e7"
#
#--------------------------------------------------------------------------
S_FP_0="$S_FP_DIR/subparts/general/_bashrc_subpart_func_core_t3c"
func_mmmv_include_bashfile_if_possible_t2 "$S_FP_0" "ac3e5b37-abab-4ef3-93a3-11b1509039e7"
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

if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "t" ]; then
    # For some reason the " -march=native " triggers an error on Termux,
    # if the classical configure script is run.  The error message is
    # something along the lines that a compiler does not work.
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
                "0399c550-f2a4-4baf-81a3-11b1509039e7"
            #----------------------------------------
            func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
                "$S_FP_1" "d73f8518-cb5b-431f-a593-11b1509039e7" \
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
                "$S_FP_0" "b020bc52-c5dd-425c-a493-11b1509039e7" \
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
    "$S_TMP_0" "a209ce56-8207-4089-b593-11b1509039e7" \
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
        echo "GUID=='1103b14d-cf0c-47b3-b583-11b1509039e7'"
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
            echo "GUID=='11cf62bc-1dfe-4b61-9b73-11b1509039e7'"
            echo ""
        fi
    fi
    export MMMV_USERSPACE_DISTRO_T1_HOME="$S_TMP_0"
    S_TMP_1="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin"
    func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
        "$S_TMP_1" "17906c75-5e43-47bd-ae93-11b1509039e7" \
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
            echo "GUID=='134b82c5-11a4-40b4-b473-11b1509039e7'"
            echo ""
        fi
        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
            "$MMMV_USERSPACE_DISTRO_T1_HOME_USERDECLARED" \
            "20cdf544-00e5-4428-b183-11b1509039e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    fi
fi
#--------------------------------------------------------------------------
export MMMV_USERSPACE_DISTRO_T1_LINUX_WSL="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/operating_system_specific/Linux_WSL"
func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
    "$MMMV_USERSPACE_DISTRO_T1_LINUX_WSL" \
    "47eea792-d937-4fa2-b483-11b1509039e7" \
    "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
#-------------------
export MMMV_USERSPACE_DISTRO_T1_LINUX_ANDROID_TERMUX="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/operating_system_specific/Linux_Android_Termux"
func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
    "$MMMV_USERSPACE_DISTRO_T1_LINUX_ANDROID_TERMUX" \
    "89392630-c924-4a50-a283-11b1509039e7" \
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
            echo "GUID=='51592829-7453-4af6-8573-11b1509039e7'"
            echo ""
        fi
    fi
fi
#--------------------------------------------------------------------------
if [ -e "/usr/sbin" ]; then
    # The 
    func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
        "/usr/sbin" "707eac21-fbad-4970-8183-11b1509039e7" \
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
                echo "GUID=='0cf5d512-96aa-4ef9-b173-11b1509039e7'"
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
            "$S_FP_0" "2a8dba4a-c52c-404f-a373-11b1509039e7" \
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
            "$S_FP_0" "0dd60f36-adcb-49cc-b573-11b1509039e7" \
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
S_FP_0="$S_FP_DIR/subparts/mmmv_userspace_distro_t1_specific/common_bashrc_alias_mmmv_image_viewer.bash"
func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_FP_0"
#-------------------
export MMMV_DEVEL_TOOLS_HOME="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/lib/mmmv_devel_tools/2015_01_22_mmmv_devel_tools_without_JumpGUID_and_IDE_integration_v_02_with_UpGUID_bugfix"
S_FP_0="$MMMV_DEVEL_TOOLS_HOME/src/api/mmmv_devel_tools_bashrc_extension.bash"
func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_FP_0"
#-------------------
export PATH="$Z_PATH" # to take into account the possible Z_PATH changes.
#-------------------
# The 
S_FP_0="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin_installed_program_specific/_bashrc_subpart_that_contains_the_set_of_checks_and_declarations_01.bash"
# might add more programs to the Z_PATH.
func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_FP_0"
export PATH="$Z_PATH" # to take into account the possible Z_PATH changes.
#--------------------------------------------------------------------------
# The 
S_FP_0="$S_FP_DIR/subparts/mmmv_userspace_distro_t1_specific/common_bashrc_program_availability_checks_01.bash"
# has to be included
func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_FP_0"
# after all of the more specialised inclusion files.
export PATH="$Z_PATH" # to take into account the possible Z_PATH changes.
#--------------------------------------------------------------------------
S_FP_0="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/lib/core_applications_set_01/_bashrc_subpart_that_adds_core_applications_set_01_elements_to_Z_PATH_according_to_availability_tests.bash"
func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_FP_0"
export PATH="$Z_PATH"
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
            echo "GUID=='ae09425a-5a49-4810-a463-11b1509039e7'"
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
            "198f733c-5007-4cd6-b373-11b1509039e7" \
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
    "75e3aca0-fe81-4149-9373-11b1509039e7" \
    "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
if [ "$SB_OPERATINGSYSTEM_BSD" == "f" ]; then
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
        if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
            #--------------------
            export MMMV_USERSPACE_DISTRO_T1_LINUX_GENERAL_ONLY_BIN="$MMMV_USERSPACE_DISTRO_T1_LINUX_GENERAL_ONLY/bin"
            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                "$MMMV_USERSPACE_DISTRO_T1_LINUX_GENERAL_ONLY_BIN" \
                "265f2c73-8ddd-4c2a-9263-11b1509039e7" \
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
        "$S_TMP_0" "c5a8f159-061a-41b3-a363-11b1509039e7" \
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
            "45c843b3-8a9b-4675-8163-11b1509039e7" \
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
                "ce655a1b-017b-4626-8563-11b1509039e7" \
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
                echo "GUID=='08ee475b-3dcf-4527-a263-11b1509039e7'"
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
                    "$S_FP_GLOBALTMP" "a80a4d37-2400-44e3-b463-11b1509039e7" \
                    "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
            else
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo -e "$S_FP_GLOBALTMP is a\e[31m broken symlink \e[39m."
                    echo "GUID=='3a445559-da80-4aed-b163-11b1509039e7'"
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
                                echo "GUID=='5d64a094-e3e1-4e8d-a863-11b1509039e7'"
                                echo ""
                            fi
                        fi
                    else
                        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                            echo ""
                            echo -e "$S_FP_USERTMP is a\e[31m broken symlink \e[39m."
                            echo "GUID=='924a6447-27ee-4a7a-a253-11b1509039e7'"
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
S_FP_0="$HOME/m_local/etc/_bashrc_optional_extra_01"
if [ -e "$S_FP_0" ]; then
    if [ ! -d "$S_FP_0" ]; then
        func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_FP_0"
    else
        # The
        func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
            "$S_FP_0" "8b33f94b-9360-466e-9253-11b1509039e7" \
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
                      # installed programs. There's another
                      # line like that later.
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
            echo "GUID=='10250b50-fa95-4e23-a553-11b1509039e7'"
            echo ""
        fi
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
                    # The sed command at the above example makes
                    # sure that a word at the end of one line is not
                    # concatenated to the word at the start of the next
                    # line. As the very last line in a textfile never has
                    # an ending linebreak, the sed command also makes
                    # sure that the very last non-space character at
                    # the very last line of the textfile does not get deleted.
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
                "$S_FP_0" "1d5e2155-b632-4b53-9953-11b1509039e7" \
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
            "$S_FP_0" "30a192a5-f20b-4dcb-b553-11b1509039e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        #--------------------------------------------------------------
    fi
fi
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
                    "mmmv_cre_temporary_file_t1" "6c961b50-114b-479a-8353-11b1509039e7"
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
                            echo "GUID=='d53ed8d2-ab7c-4daf-9853-11b1509039e7'"
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
