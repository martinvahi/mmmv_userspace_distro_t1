#!/usr/bin/env bash
#==========================================================================
# Author of this file: <INCOMPLETE: name of the author comes here>
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#==========================================================================

func_i3_config_subpart(){
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
    #----------------------------------------------------------------------
    if [ "$SB_WMCTRL_EXISTS_ON_PATH" == "" ]; then
        SB_WMCTRL_EXISTS_ON_PATH="f"
        if [ "`which wmctrl 2> /dev/null`" != "" ]; then
            SB_WMCTRL_EXISTS_ON_PATH="t"
        fi
    fi
    #----------------------------------------------------------------------
    if [ "$SB_XRANDR_EXISTS_ON_PATH" == "" ]; then
        SB_XRANDR_EXISTS_ON_PATH="f"
        if [ "`which xrandr 2> /dev/null`" != "" ]; then
            SB_XRANDR_EXISTS_ON_PATH="t"
        fi
    fi
    #----------------------------------------------------------------------
    if [ "$SB_PACTL_EXISTS_ON_PATH" == "" ]; then
        SB_PACTL_EXISTS_ON_PATH="f"
        if [ "`which pactl 2> /dev/null`" != "" ]; then
            SB_PACTL_EXISTS_ON_PATH="t"
        fi
    fi
    #----------------------------------------------------------------------
    if [ "$SB_GREP_EXISTS_ON_PATH" == "" ]; then
        SB_GREP_EXISTS_ON_PATH="f"
        if [ "`which grep 2> /dev/null`" != "" ]; then
            SB_GREP_EXISTS_ON_PATH="t"
        fi
    fi
    #----------------------------------------------------------------------
    if [ "$SB_GSED_EXISTS_ON_PATH" == "" ]; then
        SB_GSED_EXISTS_ON_PATH="f"
        if [ "`which gsed 2> /dev/null`" != "" ]; then
            SB_GSED_EXISTS_ON_PATH="t"
            # On Linux the "sed" is the GNU sed, so
            # the way to get a proper "gsed" on Linux
            # is to put a symlink to the "sed" on
            # PATH and name that symlink "gsed".
        fi
    fi
    #----------------------------------------------------------------------
    if [ "$SB_CONVERT_EXISTS_ON_PATH" == "" ]; then
        SB_CONVERT_EXISTS_ON_PATH="f"
        if [ "`which convert 2> /dev/null`" != "" ]; then
            SB_CONVERT_EXISTS_ON_PATH="t"
        fi
    fi
    #----------------------------------------------------------------------
    if [ "$SB_SETXKBMAP_EXISTS_ON_PATH" == "" ]; then
        SB_SETXKBMAP_EXISTS_ON_PATH="f"
        if [ "`which convert 2> /dev/null`" != "" ]; then
            SB_SETXKBMAP_EXISTS_ON_PATH="t"
        fi
    fi
    #----------------------------------------------------------------------
    if [ "$SB_RUNNING_I3_WINDOW_MANAGER" == "" ]; then
        SB_RUNNING_I3_WINDOW_MANAGER="f"
        if [ "$(wmctrl -m 2> /dev/null | tr -d "\n" | grep -i 'i3')" != "" ]; then
            SB_RUNNING_I3_WINDOW_MANAGER="t"
        fi
    fi
    #----------------------------------------------------------------------
    if [ "$SB_XWALLPAPER_EXISTS_ON_PATH" == "" ]; then
        SB_XWALLPAPER_EXISTS_ON_PATH="f"
        if [ "`which xwallpaper 2> /dev/null`" != "" ]; then
            SB_XWALLPAPER_EXISTS_ON_PATH="t"
        fi
    fi
    #----------------------------------------------------------------------
    if [ "$SB_XSSLOCK_EXISTS_ON_PATH" == "" ]; then
        SB_XSSLOCK_EXISTS_ON_PATH="f"
        if [ "`which xss-lock 2> /dev/null`" != "" ]; then
            SB_XSSLOCK_EXISTS_ON_PATH="t"
        fi
    fi
    #----------------------------------------------------------------------
    if [ "$SB_RUNNING_I3_WINDOW_MANAGER" == "t" ]; then
        S_FP_FLAGFILE_SB_XSETUP_COMPLETE="$S_FP_FLAGFILES_FOR_ALL_USERS/`whoami`_flagfile_mmmv_userspace_distro_t1_xsetup_complete_t1.txt"
        if [ ! -e "$S_FP_FLAGFILE_SB_XSETUP_COMPLETE" ]; then
            if [ "$SB_OPERATINGSYSTEM_LINUX_WSL" == "f" ]; then
                if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID" == "f" ]; then
                    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
                        #----------------------------------------------------------
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
                        #----------------------------------------------------------
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
                        #----------------------------------------------------------
                        if [ "$SB_XRANDR_EXISTS_ON_PATH" == "t" ]; then
                            #------------------------------------------------------
                            # The next line
                            xrandr --output eDP-1 --right-of HDMI-1
                            # tells that the HDMI connected monitor is to the
                            # left of the laptop. Possible position values:
                            #     --left-of
                            #     --right-of
                            #     --above
                            #     --below
                            # Available screens/monitors can be displayed
                            # by executing:
                            #     i3-msg -t get_outputs
                            # Default screens for workspaces MIGHT be defined
                            # in $HOME/.config/i3/config by
                            #     workspace 1 output DP-2
                            #     workspace 2 output HDMI-1
                            #     workspace 3 output HDMI-1
                            #     workspace 4 output HDMI-1
                            #     workspace 5 output HDMI-1
                            #     workspace 6 output HDMI-1
                            #     workspace 7 output HDMI-1
                            #     workspace 8 output HDMI-1
                            #     workspace 10 output HDMI1
                            #     workspace 9 output eDP-1
                            #     workspace 11 output eDP-1
                            #     workspace 12 output eDP-1
                            # etc.
                            #------------------------------------------------------
                            xrandr --output DP-2 --left-of HDMI-1
                            #------------------------------------------------------
                        fi
                        #----------------------------------------------------------
                    fi
                fi
            fi
            wait ;
            echo "" >> $S_FP_FLAGFILE_SB_XSETUP_COMPLETE
        fi
        #------------------------------------------------------------------
        if [ "$SB_SETXKBMAP_EXISTS_ON_PATH" == "t" ]; then
            #------------------------------------------------------
            # At least on some Linux distributions the
            setxkbmap -layout us,ee -option "grp:ctrl_shift_toggle"
            # makes Ctrl-Shift to toggle between 2 keybard layouts.
            # The version for AltGr is:
            #     setxkbmap -layout us,ee -option "grp:toggle"
            #------------------------------------------------------
        fi
        #------------------------------------------------------------------
        S_FP_PREFIX="/home/martin/m_local/lib/taustapildid/konverteeritud"
        S_FN="Tallinn_M2nniku_20200527_aerofoto_MXM-4838_1920x1080.jpeg"
        S_FP="$S_FP_PREFIX/$S_FN"
        if [ "$SB_XWALLPAPER_EXISTS_ON_PATH" == "t" ]; then
            if [ -e "$S_FP" ]; then
                if [ ! -d "$S_FP" ]; then
                    xwallpaper --center $S_FP
                fi
            else
                func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 "$S_FP" \
                    "43ad94d4-36e7-4253-89b4-b36060905ae7"
            fi
        fi
        #------------------------------------------------------------------
        if [ "$SB_PACTL_EXISTS_ON_PATH" == "t" ]; then
            if [ "$SB_GSED_EXISTS_ON_PATH" == "t" ]; then
                if [ "$SB_GREP_EXISTS_ON_PATH" == "t" ]; then
                    #------------------------------------------------------
                    local S_0="`pactl list short sinks | grep -i bluez_output | gsed -e 's/^[^b]\+//g' | gsed -e 's/[[:blank:]].\+$//g'`"
                    local S_1="`pactl list short sinks | grep -i  alsa_output | gsed -e 's/^[^a]\+//g' | gsed -e 's/[[:blank:]].\+$//g'`"
                    #------------------------------------------------------
                    if [ "$S_0" != "" ]; then
                        pactl set-default-sink $S_0
                        alias mmmv_ui_sound_switch_to_headphones_01="pactl set-default-sink $S_0 "
                    fi
                    if [ "$S_1" != "" ]; then
                        alias mmmv_ui_sound_switch_to_pcspeakers_01="pactl set-default-sink $S_1 "
                    fi
                    #------------------------------------------------------
                fi
            fi
        fi
        #------------------------------------------------------------------
    fi # running i3 window manager
    #----------------------------------------------------------------------
} # func_i3_config_subpart

func_i3_config_subpart

#==========================================================================
# S_VERSION_OF_THIS_FILE="f4401955-1f57-4227-a1b4-b36060905ae7"
#==========================================================================
