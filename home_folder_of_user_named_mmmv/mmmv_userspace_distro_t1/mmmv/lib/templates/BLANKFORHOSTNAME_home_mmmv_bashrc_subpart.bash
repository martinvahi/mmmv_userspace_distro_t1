#!/usr/bin/env bash
#==========================================================================
# Initial author of this file: <INCOMPLETE: name of the author comes here>
# This file is in public domain.
#
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#==========================================================================
#S_FP_DIR_TMP_0="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#if [ "$MMMV_USERSPACE_DISTRO_T1_HOME" == "" ]; then
#    MMMV_USERSPACE_DISTRO_T1_HOME="`cd $S_FP_DIR_TMP_0/../../../../../../; pwd`"
#fi
#--------------------------------------------------------------------------
if [ "$MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1" != "mode_ok_to_load" ]; then
    S_ERR_CODE="1"
    echo ""
    echo "This script is expected to be a sub-part of the "
    if [ "$MMMV_USERSPACE_DISTRO_T1_HOME" != "" ]; then
        echo "$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/common_bashrc/common_bashrc_main.bash"
    else
        echo "\$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/common_bashrc/common_bashrc_main.bash"
    fi
    if [ "$MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1" != "" ]; then
        echo ""
        echo "    MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1==$MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1"
        echo ""
    fi
    echo -e "\e[31mExiting with an error code $S_ERR_CODE . \e[39m"
    echo "GUID=='b62df234-aa6f-482e-92f4-41b360904ae7'"
    echo ""
    exit $S_ERR_CODE # exit with an error
fi
#--------------------------------------------------------------------------
if [ "$HOSTNAME" == "BLANKFORHOSTNAME" ]; then
    #----------------------------------------------------------------------
    S_FP_0="/home/mmmv/applications/declare_applications.bash"
    func_mmmv_userspace_distro_t1_specific_Bash_file_inclusion_t1 "$S_FP_0"
    #----------------------------------------------------------------------
    # S_FP_BASHFILE="/some/custom/foo.bash"
    # SB_OK_4_THE_BASHFILE_2_BE_MISSING_OPTIONAL="f" # domain: {"","t","f"}
    # func_mmmv_include_bashfile_if_possible_t2 "$S_FP_BASHFILE" \
    #     "2c9aa631-49d1-4a94-94f4-41b360904ae7" "$SB_OK_4_THE_BASHFILE_2_BE_MISSING_OPTIONAL"
    #----------------------------------------------------------------------
#    S_TMP_PRINTERNAME="Martini_OKI_ML5520_maatriksprinter"
#    alias mmmv_print_OKI_ML5520_maatriksprinter="lp -d $S_TMP_PRINTERNAME " # name of the file comes here
    #----------------------------------------------------------------------
    S_FP_0="/opt/custom_mount_points/RAM_30MiB" # not stored to general environment
                                                # variable to avoid a series of
                                                # possible security issues.
    if [ -e "$S_FP_0" ]; then
        if [ -d "$S_FP_0" ]; then
            if [ ! -h "$S_FP_0" ]; then
                alias mmmv_go_folder_RAM_partition_t1="cd $S_FP_0 "
                alias mmmv_go_RAM_partition_t1="cd $S_FP_0 "
            else
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo -e "Please fix the\e[31m issue\e[39m near GUID "
                    echo "    '1492aa8b-cd93-41fd-b6f4-41b360904ae7' "
                    echo ""
                fi
            fi
        else
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                echo ""
                echo -e "Please fix the\e[31m issue\e[39m near GUID "
                echo "    '23cf6c54-46e5-4923-b5f4-41b360904ae7' "
                echo ""
            fi
        fi
    else
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo -e "Please fix the\e[31m issue\e[39m near GUID "
            echo "    '2e972a41-3403-45ce-82f4-41b360904ae7' "
            echo ""
        fi
    fi
    #----------------------------------------------------------------------
    S_FP_TMP_FOLDER="/tmp"
    if [ "$MMMV_USERSPACE_DISTRO_T1_FP_RAM_PARTITION_64K" != "" ]; then
        S_FP_TMP_FOLDER="$MMMV_USERSPACE_DISTRO_T1_FP_RAM_PARTITION_64K"
    fi
    S_FP_FLAGFILES_FOR_ALL_USERS="$S_FP_TMP_FOLDER/flagfiles"
    if [ ! -e "$S_FP_FLAGFILES_FOR_ALL_USERS" ]; then
        mkdir -p $S_FP_FLAGFILES_FOR_ALL_USERS
        sync ; wait
        chmod 1777 $S_FP_FLAGFILES_FOR_ALL_USERS
        sync ; wait
    fi
    S_FP_FLAGFILE_SB_XSETUP_COMPLETE="$S_FP_FLAGFILES_FOR_ALL_USERS/`whoami`_flagfile_mmmv_userspace_distro_t1_xsetup_complete_t1.txt"
    if [ ! -e "$S_FP_FLAGFILE_SB_XSETUP_COMPLETE" ]; then
        if [ "$SB_OPERATINGSYSTEM_LINUX_WSL" == "f" ]; then
            if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID" == "f" ]; then
                if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
                    if [ "$SB_SETXKBMAP_EXISTS_ON_PATH" == "t" ]; then
                        #------------------------------------------------------
                        # At least on some Linux distributions the
                        setxkbmap -layout us,ee -option "grp:ctrl_shift_toggle"
                        # makes Ctrl-Shift to toggle between 2 keybard layouts.
                        # The version for AltGr is:
                        #     setxkbmap -layout us,ee -option "grp:toggle"
                        #------------------------------------------------------
                    fi
                    if [ "$SB_XSET_EXISTS_ON_PATH" == "t" ]; then
                        #------------------------------------------------------
                        # Sets the X11 built in screensaver
                        SI_NUMBER_OF_IDLING_SECONDS_TILL_SCREENSAVER_ACTIVATES="3600"
                        SI_SCREENSAVER_CYCLE_COUNT_BEFORE_LOCKING_SCREEN="0"
                        xset s \
                            $SI_NUMBER_OF_IDLING_SECONDS_TILL_SCREENSAVER_ACTIVATES \
                            $SI_SCREENSAVER_CYCLE_COUNT_BEFORE_LOCKING_SCREEN
                        # Existing values can be displayed by executing:
                        #     xset q
                        #------------------------------------------------------
                    fi
                    if [ "$SB_XSSLOCK_EXISTS_ON_PATH" == "t" ]; then
                        #------------------------------------------------------
                        # A comment from i3 window manager autogenerated config file:
                        # "xss-lock grabs a logind suspend inhibit lock and
                        # will use i3lock to lock the screen before suspend."
                        xss-lock --transfer-sleep-lock -- i3lock --nofork
                        # A command for locking the session:
                        #     loginctl lock-session
                        #------------------------------------------------------
                    fi
                fi
            fi
        fi
        wait ;
        echo "" >> $S_FP_FLAGFILE_SB_XSETUP_COMPLETE
    fi
    #----------------------------------------------------------------------
    MMMV_USERSPACE_DISTRO_T1_HOSTNAME_SPECIFIC_INITIALISATIONS_TIMESTAMP="$S_TIMESTAMP"
    #----------------------------------------------------------------------
fi
#==========================================================================
# S_VERSION_OF_THIS_FILE="73d54e4f-b0b4-4db1-b4f4-41b360904ae7"
#==========================================================================
