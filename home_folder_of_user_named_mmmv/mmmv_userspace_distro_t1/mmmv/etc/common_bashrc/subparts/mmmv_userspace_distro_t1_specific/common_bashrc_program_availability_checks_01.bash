#!/usr/bin/env bash
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
#
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#==========================================================================
S_FP_DIR_TMP_0="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [ "$MMMV_USERSPACE_DISTRO_T1_HOME" == "" ]; then
    MMMV_USERSPACE_DISTRO_T1_HOME="`cd $S_FP_DIR_TMP_0/../../../../../; pwd`"
fi
#--------------------------------------------------------------------------
if [ "$MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1" != "mode_ok_to_load" ]; then
    S_ERR_CODE="1"
    echo ""
    echo "This script is expected to be a sub-part of the "
    #--------------------
    echo "$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/common_bashrc/common_bashrc_main.bash"
    #--------------------
    if [ "$MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1" != "" ]; then
        echo ""
        echo "    MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1==$MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1"
        echo ""
    fi
    echo -e "\e[31mExiting with an error code $S_ERR_CODE . \e[39m"
    echo "GUID=='47faaa31-a651-4053-933e-b2e001716ae7'"
    echo ""
    exit $S_ERR_CODE # exit with an error
fi
#--------------------------------------------------------------------------
if [ "$SB_AHA_EXISTS_ON_PATH" == "" ]; then
    SB_AHA_EXISTS_ON_PATH="f"
    if [ "`which aha 2> /dev/null`" != "" ]; then
        SB_AHA_EXISTS_ON_PATH="t"
        # "aha" converts textfiles to HTML.
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "aha" "1c2e4e33-bd2f-4d53-891e-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_FIND_EXISTS_ON_PATH" == "" ]; then
    SB_FIND_EXISTS_ON_PATH="f"
    if [ "`which find 2> /dev/null`" != "" ]; then
        SB_FIND_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "find" "59a2e095-6299-49e9-8b2e-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_CAT_EXISTS_ON_PATH" == "" ]; then
    SB_CAT_EXISTS_ON_PATH="f"
    if [ "`which cat 2> /dev/null`" != "" ]; then
        SB_CAT_EXISTS_ON_PATH="t"
    fi
fi
#--------------------
if [ "$SB_SLEEP_EXISTS_ON_PATH" == "" ]; then
    SB_SLEEP_EXISTS_ON_PATH="f"
    if [ "`which sleep 2> /dev/null`" != "" ]; then
        SB_SLEEP_EXISTS_ON_PATH="t"
    fi
fi
#--------------------
if [ "$SB_WC_EXISTS_ON_PATH" == "" ]; then
    SB_WC_EXISTS_ON_PATH="f"
    if [ "`which wc 2> /dev/null`" != "" ]; then
        SB_WC_EXISTS_ON_PATH="t"
    fi
fi
#--------------------
if [ "$SB_TEST_EXISTS_ON_PATH" == "" ]; then
    SB_TEST_EXISTS_ON_PATH="f"
    if [ "`which test 2> /dev/null`" != "" ]; then
        SB_TEST_EXISTS_ON_PATH="t"
    fi
fi
SB_DIRCOLORS="f"
if [ "$SB_TEST_EXISTS_ON_PATH" == "t" ]; then
    # The next if-clause has been copy-pasted from some
    # Linux distribution standard /etc/bash.bashrc and then slightly edited.
    if [ -x /usr/bin/dircolors ]; then
        # color support of ls and also add handy aliases
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
        SB_DIRCOLORS="t"
        alias ls='ls --color=auto '
    fi
fi
#--------------------
if [ "$SB_DIR_EXISTS_ON_PATH" == "" ]; then
    SB_DIR_EXISTS_ON_PATH="f"
    if [ "`which dir 2> /dev/null`" != "" ]; then
        SB_DIR_EXISTS_ON_PATH="t"
    fi
fi
if [ "$SB_DIR_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_DIRCOLORS" == "t" ]; then
        alias dir='dir --color=auto '
    fi
fi
#--------------------
if [ "$SB_VDIR_EXISTS_ON_PATH" == "" ]; then
    SB_VDIR_EXISTS_ON_PATH="f"
    if [ "`which vdir 2> /dev/null`" != "" ]; then
        SB_VDIR_EXISTS_ON_PATH="t"
    fi
fi
if [ "$SB_VDIR_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_DIRCOLORS" == "t" ]; then
        alias vdir='vdir --color=auto '
    fi
fi
#--------------------
if [ "$SB_GREP_EXISTS_ON_PATH" == "" ]; then
    SB_GREP_EXISTS_ON_PATH="f"
    if [ "`which grep 2> /dev/null`" != "" ]; then
        SB_GREP_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "grep" "12424292-fdcd-40b1-8b3e-b2e001716ae7"
    fi
fi
if [ "$SB_GREP_EXISTS_ON_PATH" == "t" ]; then
    alias grep='grep --color=auto '
    alias mmmv_grep_color='grep --color=auto '
fi
#--------------------
if [ "$SB_EGREP_EXISTS_ON_PATH" == "" ]; then
    SB_EGREP_EXISTS_ON_PATH="f"
    if [ "`which egrep 2> /dev/null`" != "" ]; then
        SB_EGREP_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "egrep" "594ca063-0806-4051-a81e-b2e001716ae7"
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo "The egrep is part of the GNU grep project."
            echo "GUID=='53175684-420b-49ca-bf2e-b2e001716ae7'"
            echo ""
        fi
    fi
fi
if [ "$SB_EGREP_EXISTS_ON_PATH" == "t" ]; then
    alias egrep='egrep --color=auto '
fi
#--------------------
if [ "$SB_FGREP_EXISTS_ON_PATH" == "" ]; then
    SB_FGREP_EXISTS_ON_PATH="f"
    if [ "`which fgrep 2> /dev/null`" != "" ]; then
        SB_FGREP_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "fgrep" "dc338714-bd7a-438e-8b4e-b2e001716ae7"
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo "The fgrep is part of the GNU grep project."
            echo "GUID=='5849b2d4-0a4d-4896-952e-b2e001716ae7'"
            echo ""
        fi
    fi
fi
if [ "$SB_FGREP_EXISTS_ON_PATH" == "t" ]; then
    alias fgrep='fgrep --color=auto '
fi
#--------------------
if [ "$SB_AG_EXISTS_ON_PATH" == "" ]; then
    SB_AG_EXISTS_ON_PATH="f"
    if [ "`which ag 2> /dev/null`" != "" ]; then
        # "ag" is "The Silver Searcher" text search tool.
        #     https://geoff.greer.fm/ag/
        #     https://github.com/ggreer/the_silver_searcher
        SB_AG_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "ag" "54518c2b-ba21-412e-ac4e-b2e001716ae7"
        if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
            if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
                if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
                    echo ""
                    echo "\"ag\" MIGHT be available form the "
                    echo "operating system standard package collection."
                    echo "In the case of Debian based operating systems "
                    echo "it MIGHT be installed by executing "
                    echo -e "\e[36m"
                    echo "    apt-get install silversearcher-ag "
                    echo -e "\e[39m"
                    echo "GUID=='36937e35-3599-4752-8e2e-b2e001716ae7'"
                    echo ""
                fi
            fi
        fi
    fi
fi
#--------------------
if [ "$SB_DBUSLAUNCH_EXISTS_ON_PATH" == "" ]; then
    SB_DBUSLAUNCH_EXISTS_ON_PATH="f"
    if [ "`which dbus-launch 2> /dev/null`" != "" ]; then
        SB_DBUSLAUNCH_EXISTS_ON_PATH="t"
        # https://www.freedesktop.org/wiki/Software/dbus/
    else
        if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
            if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
                func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                    "dbus-launch" "4bb19504-e7de-4a76-942e-b2e001716ae7"
                if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
                    echo ""
                    echo "\"dbus-launch\" MIGHT be available form the "
                    echo "operating system standard package collection."
                    echo "In the case of Debian based operating systems "
                    echo "it MIGHT be installed by executing "
                    echo -e "\e[36m"
                    echo "    apt-get install dbus-x11 "
                    echo -e "\e[39m"
                    echo "GUID=='ed3d3c0b-33c0-414f-a11e-b2e001716ae7'"
                    echo ""
                fi
            fi
        fi
    fi
fi
if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
        if [ "$SB_DBUSLAUNCH_EXISTS_ON_PATH" == "t" ]; then
            if [ "`echo $DBUS_SESSION_BUS_ADDRESS `" == "" ]; then
                export $(dbus-launch)
                func_mmmv_wait_and_sync_t1
                if [ "`echo $DBUS_SESSION_BUS_ADDRESS `" == "" ]; then
                    echo -e "\e[31m"
                    echo -e "Failed to start D-Bus session bus\e[39m."
                    echo -e "GUID=='3438e294-3ae9-4864-b94e-b2e001716ae7'"
                    echo -e ""
                fi
            fi
        fi
    fi
fi
# Some code for experimenting with the dbus:
#
#    if [ ! -e /var/run/dbus/system_bus_socket ]; then
#        if [ "`uname -a | grep -i 'Microsoft' `" != "" ]; then
#            if [ "`which dbus-uuidgen 2>/dev/null `" != "" ]; then
#                if [ "`which dbus-daemon 2>/dev/null `" != "" ]; then
#                    # As Windows Subsystem for Linux (WSL) distribution root user:
#                    mkdir -p /run/dbus
#                    wait ; sync; wait
#                    dbus-uuidgen --ensure
#                    wait
#                    dbus-daemon --system --fork
#                fi
#            fi
#        fi
#    fi
#    systemctl enable --now dbus
#    dbus-send --system --type=method_call --dest=org.freedesktop.DBus \
#        /org/freedesktop/DBus org.freedesktop.DBus.ListNames
#    echo $DBUS_SESSION_BUS_ADDRESS
#
#    # As WSL Linuxi distribution nonroot user:
#    sudo service dbus start
#
#--------------------
if [ "$SB_MAN_EXISTS_ON_PATH" == "" ]; then
    SB_MAN_EXISTS_ON_PATH="f"
    if [ "`which man 2> /dev/null`" != "" ]; then
        SB_MAN_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "man" "048d5e18-3513-4e3b-b22e-b2e001716ae7"
    fi
fi
if [ "$SB_MAN_EXISTS_ON_PATH" == "t" ]; then
    alias mmmv_man="man " # because some other man-like programs have
                          # aliases with the prefix of "mmmv_man_".
fi
#--------------------
if [ "$SB_INFO_EXISTS_ON_PATH" == "" ]; then
    SB_INFO_EXISTS_ON_PATH="f"
    if [ "`which info 2> /dev/null`" != "" ]; then
        SB_INFO_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "info" "493c1c41-6408-4f12-ad1e-b2e001716ae7"
    fi
fi
if [ "$SB_INFO_EXISTS_ON_PATH" == "t" ]; then
    alias mmmv_man_info="info" # because some other man-like programs have
                               # aliases with the prefix of "mmmv_man_".
fi
#--------------------
if [ "$SB_TLDR_EXISTS_ON_PATH" == "" ]; then
    SB_TLDR_EXISTS_ON_PATH="f"
    if [ "`which tldr 2> /dev/null`" != "" ]; then
        SB_TLDR_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "tldr" "cda08c94-de8a-48ab-b43e-b2e001716ae7"
        if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
            echo ""
            echo "The man analogue, \"tldr\", is a Python program that "
            echo "MIGHT be installed with its documentation by executing "
            echo -e "\e[36m"
            echo "    pipx install tldr "
            echo -e "\e[39m"
            echo "During the installation the downloaded "
            echo "documentation MIGHT be placed to "
            echo "    $HOME/.cache/tldr"
            echo "and as of 2025_01 it originates from "
            echo "    https://github.com/tldr-pages/tldr "
            echo "GUID=='34f05425-8fde-46f2-8c1e-b2e001716ae7'"
            echo ""
        fi
    fi
fi
if [ "$SB_TLDR_EXISTS_ON_PATH" == "t" ]; then
    alias mmmv_man_tldr="tldr "
fi
#--------------------
if [ "$SB_FZF_EXISTS_ON_PATH" == "" ]; then
    SB_FZF_EXISTS_ON_PATH="f"
    if [ "`which fzf 2> /dev/null`" != "" ]; then
        # The fzf has been written in Go,
        # but it MIGHT be available from
        # Debian package collection.
        #     https://github.com/junegunn/fzf
        SB_FZF_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "fzf" "1ca130c5-db0a-4c22-885e-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_HTOP_EXISTS_ON_PATH" == "" ]; then
    SB_HTOP_EXISTS_ON_PATH="f"
    if [ "`which htop 2> /dev/null`" != "" ]; then
        SB_HTOP_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "htop" "5840cce3-a51f-4a5e-ae1e-b2e001716ae7"
    fi
fi
#----------------------------------------
if [ "$SB_NCDU_EXISTS_ON_PATH" == "" ]; then
    SB_NCDU_EXISTS_ON_PATH="f"
    if [ "`which ncdu 2> /dev/null`" != "" ]; then
        SB_NCDU_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "ncdu" "652d2a85-5e1b-45c9-802d-b2e001716ae7"
    fi
fi
if [ "$SB_NCDU_EXISTS_ON_PATH" == "t" ]; then
    #----------------------------------------
    # I(Martin.Vahi@softf1.com) first learned about the
    # ncdu (NCurses Disk Usage),
    #     https://dev.yorhel.nl/ncdu
    # on 2023_10_14 from
    #     https://askubuntu.com/questions/1224/how-do-i-determine-the-total-size-of-a-directory-folder-from-the-command-line
    #     archival copy: https://archive.ph/TBQVm
    #----------------------------------------
    # The "nice -n 2 " at the following 2 lines is to mitigate filesystem scanning related hangup.
    # alias ncdu="nice -n 2 ncdu --disable-delete --disable-shell " # for safety
    # alias ncdu="nice -n 2 ncdu --disable-delete " # for safety, while
    #                                               # keeping the original default
    #                                               # settings as much as possible.
    #                                               # The "--disable-delete" option
    #                                               # does not exist at some older
    #                                               # versions of ncdu.
    # The "--slow-ui-updates" at the
    S_TMP_0="$S_FP_NICE -n 2 ncdu --disable-delete --disable-shell --no-si --apparent-size --show-hidden --show-itemcount --sort=apparent-size-desc --color=dark --slow-ui-updates --ignore-config "
    # is to avoid slowing down the scanning during scans, where there
    # are a lot of files and/or folders to scan.  The "--ignore-config"
    # is a workaround to a fault case, where the environment
    # variable XDG_CONFIG_HOME points to some folder, where there
    # is no read access. In general the XDG_CONFIG_HOME has the
    # value of "$HOME/.config", but in some fault case it might be
    # "/home/not_the_current_user_Foo/.config", which leads the ncdu
    # to look for a folder that it probably does not have access, like
    # /home/not_the_current_user_Foo/.configtde/ncdu/config
    alias mmmv_run_ncdu="$S_TMP_0 "
    alias mmmv_ncdu="$S_TMP_0 "
    #----------------------------------------
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
#--------------------
if [ "$SB_WGET_EXISTS_ON_PATH" == "" ]; then
    SB_WGET_EXISTS_ON_PATH="f"
    S_FP_WGET="`which wget 2> /dev/null`"
    if [ "$S_FP_WGET" != "" ]; then
        SB_WGET_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "wget" "fd8583e3-f855-4f5e-892d-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_CURL_EXISTS_ON_PATH" == "" ]; then
    SB_CURL_EXISTS_ON_PATH="f"
    S_FP_CURL="`which curl 2> /dev/null`"
    if [ "$S_FP_CURL" != "" ]; then
        SB_CURL_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "curl" "f431d688-83b1-4cb3-a05d-b2e001716ae7"
    fi
fi
#--------------------
# aria2 is often times available from distribution package collection.
# https://github.com/aria2
if [ "$SB_ARIA2C_EXISTS_ON_PATH" == "" ]; then
    SB_ARIA2C_EXISTS_ON_PATH="f"
    if [ "`which aria2c 2> /dev/null`" != "" ]; then
        SB_ARIA2C_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "aria2c" "6b29db71-0d0b-4919-a91d-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_READLINK_EXISTS_ON_PATH" == "" ]; then
    SB_READLINK_EXISTS_ON_PATH="f"
    if [ "`which readlink 2> /dev/null`" != "" ]; then
        SB_READLINK_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "readlink" "051d35ab-db94-475a-b43d-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_XARGS_EXISTS_ON_PATH" == "" ]; then
    SB_XARGS_EXISTS_ON_PATH="f"
    S_FP_XARGS="`which xargs 2> /dev/null`"
    if [ "$S_FP_XARGS" != "" ]; then
        SB_XARGS_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "xargs" "32f93511-7b86-44c8-8f3d-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_DIFF_EXISTS_ON_PATH" == "" ]; then
    SB_DIFF_EXISTS_ON_PATH="f"
    if [ "`which diff 2> /dev/null`" != "" ]; then
        SB_DIFF_EXISTS_ON_PATH="t"
        # On Linux it is the GNU Diffutils
        #     https://www.gnu.org/software/diffutils/
        #     archival copy: https://archive.is/wip/cnehD
        # but on BSD the program "diff" is BSD specific.
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "diff" "943ec320-631e-4b30-842d-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_GDIFF_EXISTS_ON_PATH" == "" ]; then
    SB_GDIFF_EXISTS_ON_PATH="f"
    if [ "`which gdiff 2> /dev/null`" != "" ]; then
        SB_GDIFF_EXISTS_ON_PATH="t"
    else
        if [ "$SB_OPERATINGSYSTEM_LINUX" == "f" ]; then
            # "gdiff" is the name of the GNU diff on
            # BSD, but on Linux the "diff" is the GNU
            # diff.  As of 2024 the macOS tends to use
            # BSD versions of command line utilities.
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "gdiff" "71695c40-01f5-46b4-855d-b2e001716ae7"
        else
            if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "t" ]; then
                func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                    "gdiff" "1bbe4374-6770-48bb-be4d-b2e001716ae7"
            fi
        fi
    fi
fi
#--------------------
if [ "$SB_DIFF_OR_GDIFF_EXISTS_ON_PATH" == "" ]; then
    SB_DIFF_OR_GDIFF_EXISTS_ON_PATH="f"
    if [ "$SB_DIFF_EXISTS_ON_PATH" == "t" ]; then
        SB_DIFF_OR_GDIFF_EXISTS_ON_PATH="t"
    else
        if [ "$SB_GDIFF_EXISTS_ON_PATH" == "t" ]; then
            SB_DIFF_OR_GDIFF_EXISTS_ON_PATH="t"
        fi
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
    #--------------------
    if [ "$SB_XPROP_EXISTS_ON_PATH" == "" ]; then
        SB_XPROP_EXISTS_ON_PATH="f"
        if [ "`which xprop 2> /dev/null`" != "" ]; then
            SB_XPROP_EXISTS_ON_PATH="t"
        fi
    fi
    #--------------------
    if [ "$SB_XAUTH_EXISTS_ON_PATH" == "" ]; then
        SB_XAUTH_EXISTS_ON_PATH="f"
        if [ "`which xauth 2> /dev/null`" != "" ]; then
            SB_XAUTH_EXISTS_ON_PATH="t"
        fi
    fi
    #--------------------
    #SB_ULIMIT_EXISTS_ON_PATH="t"
    # The ulimit is not a separate program.  It is a Bash built
    # in command and therefore always available on PATH.
    #
    # According to the 2024_03_01 statement of the Microsoft
    # Bing chat-bot, it is also available as a built in command
    # in Zsh, Ksh, Dash and its behaviour can differ between
    # different shells.
    #--------------------
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
        #--------------------
        if [ "$SB_SYSCTL_EXISTS_ON_PATH" == "" ]; then
            SB_SYSCTL_EXISTS_ON_PATH="f"
            if [ "`which sysctl 2> /dev/null`" != "" ]; then
                SB_SYSCTL_EXISTS_ON_PATH="t"
            fi
        fi
        #--------------------
        if [ "$SB_LSBLK_EXISTS_ON_PATH" == "" ]; then
            SB_LSBLK_EXISTS_ON_PATH="f"
            if [ "`which lsblk 2> /dev/null`" != "" ]; then
                SB_LSBLK_EXISTS_ON_PATH="t"
            else
                func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                    "lsblk" "48272053-c436-4a11-a74d-b2e001716ae7"
            fi
        fi
        #--------------------
        if [ "$SB_CPULIMIT_EXISTS_ON_PATH" == "" ]; then
            SB_CPULIMIT_EXISTS_ON_PATH="f"
            if [ "`which cpulimit 2> /dev/null`" != "" ]; then
                SB_CPULIMIT_EXISTS_ON_PATH="t"
            else
                func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                    "cpulimit" "c2550544-5d17-421e-993d-b2e001716ae7"
            fi
        fi
        #--------------------
        if [ "$SB_QEMUIMG_EXISTS_ON_PATH" == "" ]; then
            SB_QEMUIMG_EXISTS_ON_PATH="f"
            if [ "`which qemu-img 2> /dev/null`" != "" ]; then
                SB_QEMUIMG_EXISTS_ON_PATH="t"
            else
                if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID" == "f" ]; then
                    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                        "qemu-img" "5ecd6b45-6356-46dc-964d-b2e001716ae7"
                    if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
                        echo ""
                        echo "\"qemu-img\" MIGHT be available form the "
                        echo "operating system standard package collection."
                        echo "In the case of Debian based operating systems "
                        echo "it MIGHT be installed by executing "
                        echo -e "\e[36m"
                        echo "    apt-get install qemu-utils "
                        echo -e "\e[39m"
                        echo "GUID=='3c296ce2-4b03-4092-ae3e-b2e001716ae7'"
                        echo ""
                    fi
                fi
            fi
        fi
        #--------------------
        if [ "$SB_HDPARM_EXISTS_ON_PATH" == "" ]; then
            SB_HDPARM_EXISTS_ON_PATH="f"
            if [ "`which hdparm 2> /dev/null`" != "" ]; then
                SB_HDPARM_EXISTS_ON_PATH="t"
            else
                func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                    "hdparm" "8528a304-15ac-4022-855c-b2e001716ae7"
            fi
        fi
        #--------------------
        if [ "$SB_HDDTEMP_EXISTS_ON_PATH" == "" ]; then
            SB_HDDTEMP_EXISTS_ON_PATH="f"
            if [ "`which hddtemp 2> /dev/null`" != "" ]; then
                SB_HDDTEMP_EXISTS_ON_PATH="t"
            # else
            #     func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            #         "hddtemp" "131e9ff3-a8ba-4df6-ab4c-b2e001716ae7"
            #
            #     is commented out due to
            #
            #         https://web.archive.org/web/20241123070300/https://www.reddit.com/r/debian/comments/17au8xd/hddtemp_replacement_for_debian_12/
            #         ----------citation----start-------------
            #         hddtemp is not maintained for long time,
            #         since Debian 12 it is no longer in the
            #         official repos. I've created a simple
            #         replacement for the tool by the time it
            #         was removed from Ubuntu 22.04.
            #
            #         Feel free to use it in
            #         Debian now as well:
            #         https://github.com/slowpeek/hddtemp
            #         ----------citation----end---------------
            #         # archival copy: https://archive.ph/fSzza
            fi
        fi
        #--------------------
    fi
fi
#--------------------
if [ "$SB_DF_EXISTS_ON_PATH" == "" ]; then
    SB_DF_EXISTS_ON_PATH="f"
    if [ "`which df 2> /dev/null`" != "" ]; then
        SB_DF_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "df" "1e6028c1-9e7f-446b-975c-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_XDELTA3_EXISTS_ON_PATH" == "" ]; then
    SB_XDELTA3_EXISTS_ON_PATH="f"
    if [ "`which xdelta3 2> /dev/null`" != "" ]; then
        SB_XDELTA3_EXISTS_ON_PATH="t"
        # upstream: https://github.com/jmacd/xdelta
        # explanation from downstream:
        #     delta = x2 - x1 //  diff:  xdelta3 -e -c -s ./x1.blob   ./x2.blob    > ./delta.blob
        #     x1 + delta = x2 // patch:  xdelta3 -d -c -s ./x1.blob < ./delta.blob > ./x2.blob
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "xdelta3" "1257de03-d552-4ecc-b11c-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_WHIRLPOOLHASH_EXISTS_ON_PATH" == "" ]; then
    SB_WHIRLPOOLHASH_EXISTS_ON_PATH="f"
    if [ "`which whirlpool-hash 2> /dev/null`" != "" ]; then
        SB_WHIRLPOOLHASH_EXISTS_ON_PATH="t"
        # The whirlpool-hash command line program MIGHT be part of the rhash
        # project, which is tested for presence anyway. That's why the
        # else part of this if-else clause has been commented out.
    # else
    #     func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
    #         "whirlpool-hash" "3732ef05-1542-4d56-ae4c-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_TIGERHASH_EXISTS_ON_PATH" == "" ]; then
    SB_TIGERHASH_EXISTS_ON_PATH="f"
    if [ "`which tiger-hash 2> /dev/null`" != "" ]; then
        SB_TIGERHASH_EXISTS_ON_PATH="t"
        # The tiger-hash command line program MIGHT be part of the rhash
        # project, which is tested for presence anyway. That's why the
        # else part of this if-else clause has been commented out.
    # else
    #     func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
    #         "tiger-hash" "1ec21cc4-7206-4228-9f2c-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_RHASH_EXISTS_ON_PATH" == "" ]; then
    SB_RHASH_EXISTS_ON_PATH="f"
    if [ "`which rhash 2> /dev/null`" != "" ]; then
        SB_RHASH_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "rhash" "5af5b382-eec1-46dd-af2c-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_SHA256_EXISTS_ON_PATH" == "" ]; then
    SB_SHA256_EXISTS_ON_PATH="f"
    if [ "`which sha256 2> /dev/null`" != "" ]; then
        SB_SHA256_EXISTS_ON_PATH="t"
    else
        if [ "$SB_OPERATINGSYSTEM_BSD" == "t" ]; then
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "sha256" "38459a6a-11a9-4dd0-834c-b2e001716ae7"
        fi
    fi
fi
#--------------------
if [ "$SB_SHA256SUM_EXISTS_ON_PATH" == "" ]; then
    SB_SHA256SUM_EXISTS_ON_PATH="f"
    # The Android Linux distributon Termux
    # also has the "sha256sum", not the "sha256".
    if [ "`which sha256sum 2> /dev/null`" != "" ]; then
        SB_SHA256SUM_EXISTS_ON_PATH="t"
    else
        if [ "$SB_OPERATINGSYSTEM_BSD" == "f" ]; then
            # FreeBSD has "sha256", NOT "sha256sum".
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "sha256sum" "6826ce6b-582b-4356-a11c-b2e001716ae7"
        fi
    fi
fi
#--------------------
if [ "$SB_SHA512_EXISTS_ON_PATH" == "" ]; then
    SB_SHA512_EXISTS_ON_PATH="f"
    if [ "`which sha512 2> /dev/null`" != "" ]; then
        SB_SHA512_EXISTS_ON_PATH="t"
    else
        if [ "$SB_OPERATINGSYSTEM_BSD" == "t" ]; then
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "sha512" "f51542aa-fd78-4763-9b1c-b2e001716ae7"
        fi
    fi
fi
#--------------------
if [ "$SB_SHA512SUM_EXISTS_ON_PATH" == "" ]; then
    SB_SHA512SUM_EXISTS_ON_PATH="f"
    if [ "`which sha512sum 2> /dev/null`" != "" ]; then
        SB_SHA512SUM_EXISTS_ON_PATH="t"
    else
        if [ "$SB_OPERATINGSYSTEM_BSD" == "f" ]; then
            # FreeBSD has "sha512", NOT "sha512sum".
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "sha512sum" "dbaf383d-d8c7-4c77-bb5c-b2e001716ae7"
        fi
    fi
fi
#--------------------
if [ "$SB_SHA384_EXISTS_ON_PATH" == "" ]; then
    SB_SHA384_EXISTS_ON_PATH="f"
    if [ "`which sha384 2> /dev/null`" != "" ]; then
        SB_SHA384_EXISTS_ON_PATH="t"
    else
        if [ "$SB_OPERATINGSYSTEM_BSD" == "t" ]; then
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "sha384" "5931c3b5-f565-4f66-9b4c-b2e001716ae7"
        fi
    fi
fi
#--------------------
if [ "$SB_SHA384SUM_EXISTS_ON_PATH" == "" ]; then
    SB_SHA384SUM_EXISTS_ON_PATH="f"
    if [ "`which sha384sum 2> /dev/null`" != "" ]; then
        SB_SHA384SUM_EXISTS_ON_PATH="t"
    else
        if [ "$SB_OPERATINGSYSTEM_BSD" == "f" ]; then
            # FreeBSD has "sha384", NOT "sha384sum".
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "sha384sum" "42e04e8f-5158-491e-b15c-b2e001716ae7"
        fi
    fi
fi
#--------------------
if [ "$SB_SHA1_EXISTS_ON_PATH" == "" ]; then
    SB_SHA1_EXISTS_ON_PATH="f"
    if [ "`which sha1 2> /dev/null`" != "" ]; then
        SB_SHA1_EXISTS_ON_PATH="t"
    else
        if [ "$SB_OPERATINGSYSTEM_BSD" == "t" ]; then
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "sha1" "353557f4-7005-4e1a-963b-b2e001716ae7"
        fi
    fi
fi
#--------------------
if [ "$SB_SHA1SUM_EXISTS_ON_PATH" == "" ]; then
    SB_SHA1SUM_EXISTS_ON_PATH="f"
    if [ "`which sha1sum 2> /dev/null`" != "" ]; then
        SB_SHA1SUM_EXISTS_ON_PATH="t"
    else
        if [ "$SB_OPERATINGSYSTEM_BSD" == "f" ]; then
            # FreeBSD has "sha1", NOT "sha1sum".
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "sha1sum" "2ddf4ed3-1f1e-401d-b35b-b2e001716ae7"
        fi
    fi
fi
#--------------------
if [ "$SB_MD5_EXISTS_ON_PATH" == "" ]; then
    SB_MD5_EXISTS_ON_PATH="f"
    if [ "`which md5 2> /dev/null`" != "" ]; then
        SB_MD5_EXISTS_ON_PATH="t"
    else
        if [ "$SB_OPERATINGSYSTEM_BSD" == "t" ]; then
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "md5" "c5550d4a-3167-477c-92db-b2e001716ae7"
        fi
    fi
fi
#--------------------
if [ "$SB_MD5SUM_EXISTS_ON_PATH" == "" ]; then
    SB_MD5SUM_EXISTS_ON_PATH="f"
    if [ "`which md5sum 2> /dev/null`" != "" ]; then
        SB_MD5SUM_EXISTS_ON_PATH="t"
    else
        if [ "$SB_OPERATINGSYSTEM_BSD" == "f" ]; then
            # FreeBSD has "md5", NOT "md5sum".
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "md5sum" "f5b76766-3597-4cec-8a5b-b2e001716ae7"
        fi
    fi
fi
#--------------------
if [ "$SB_XXHSUM_EXISTS_ON_PATH" == "" ]; then
    SB_XXHSUM_EXISTS_ON_PATH="f"
    if [ "`which xxhsum 2> /dev/null`" != "" ]; then
        SB_XXHSUM_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "xxhsum" "152143b4-5eef-4bc1-be5b-b2e001716ae7"
        if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
            if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
                if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
                    echo ""
                    echo "\"xxhsum\" MIGHT be available form the "
                    echo "operating system standard package collection."
                    echo "In the case of Debian based operating systems "
                    echo "it MIGHT be installed by executing "
                    echo -e "\e[36m"
                    echo "    apt-get install xxhash "
                    echo -e "\e[39m"
                    echo "GUID=='03de2ee7-11e0-4dcc-b44e-b2e001716ae7'"
                    echo ""
                fi
            fi
        fi
    fi
fi
# if [ "$SB_XXHSUM_EXISTS_ON_PATH" == "t" ]; then
#     alias mmmv_something_foo="xxhsum ./bar.txt "
# fi
#--------------------
if [ "$SB_XXH128SUM_EXISTS_ON_PATH" == "" ]; then
    SB_XXH128SUM_EXISTS_ON_PATH="f"
    if [ "`which xxh128sum 2> /dev/null`" != "" ]; then
        SB_XXH128SUM_EXISTS_ON_PATH="t"
    else
        if [ "$SB_XXHSUM_EXISTS_ON_PATH" == "t" ]; then # they are at the same Debian Linux package
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "xxh128sum" "37621161-8e92-4155-bc5b-b2e001716ae7"
        fi
    fi
fi
#--------------------
if [ "$SB_XXH64SUM_EXISTS_ON_PATH" == "" ]; then
    SB_XXH64SUM_EXISTS_ON_PATH="f"
    if [ "`which xxh64sum 2> /dev/null`" != "" ]; then
        SB_XXH64SUM_EXISTS_ON_PATH="t"
    else
        if [ "$SB_XXHSUM_EXISTS_ON_PATH" == "t" ]; then # they are at the same Debian Linux package
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "xxh64sum" "c1c0bfa7-a5ac-46fd-bb1b-b2e001716ae7"
        fi
    fi
fi
#--------------------
if [ "$SB_XXH32SUM_EXISTS_ON_PATH" == "" ]; then
    SB_XXH32SUM_EXISTS_ON_PATH="f"
    if [ "`which xxh32sum 2> /dev/null`" != "" ]; then
        SB_XXH32SUM_EXISTS_ON_PATH="t"
    else
        if [ "$SB_XXHSUM_EXISTS_ON_PATH" == "t" ]; then # they are at the same Debian Linux package
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "xxh32sum" "3c3d29f3-5e8f-495f-8449-b2e001716ae7"
        fi
    fi
fi
#--------------------
if [ "$SB_XDGMIME_EXISTS_ON_PATH" == "" ]; then
    SB_XDGMIME_EXISTS_ON_PATH="f"
    if [ "`which xdg-mime 2> /dev/null`" != "" ]; then
        SB_XDGMIME_EXISTS_ON_PATH="t"
    else
        if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "xdg-mime" "1fc45de3-0d18-412d-8948-b2e001716ae7"
        fi
    fi
fi
#--------------------
if [ "$SB_XDGMIME_EXISTS_ON_PATH" == "t" ]; then
    # https://mimetype.io/all-types
    #
    # https://unix.stackexchange.com/questions/36380/how-to-properly-and-easily-configure-xdg-open-without-any-environment
    # archival copy: https://archive.is/FuAM7
    #
    # xdg-open ./FooBar.fileextention
    #
    # The xdg-mime uses Foo.desktop files for starting the program.
    # The availability of Foo.desktop files MIGHT be checked by doing:
    #     cd /usr/share ; find . -name '*.desktop'
    #
    # The next line
    #     xdg-mime default xpdf.desktop application/pdf
    # sets the default program for opening PDF-files.
    #
    S_TMP_PDF="xdg-mime default xpdf.desktop application/pdf"
    alias mmmv_admin_xdgmime_t1_PDF="$S_TMP_PDF "
    S_TMP_JPEG="xdg-mime default xpdf.desktop application/pdf ; xdg-mime default viewnior.desktop image/jpeg ; xdg-mime default viewnior.desktop image/pjpeg ; xdg-mime default viewnior.desktop image/bmp ; xdg-mime default viewnior.desktop image/gif ; xdg-mime default viewnior.desktop image/png "
    alias mmmv_admin_xdgmime_t1_JPEG="$S_TMP_JPEG "
    alias mmmv_admin_xdgmime_t1_all="$S_TMP_PDF ; $S_TMP_JPEG "
fi
#--------------------
if [ "$SB_XDGOPEN_EXISTS_ON_PATH" == "" ]; then
    SB_XDGOPEN_EXISTS_ON_PATH="f"
    if [ "`which xdg-open 2> /dev/null`" != "" ]; then
        SB_XDGOPEN_EXISTS_ON_PATH="t"
    else
        if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "xdg-open" "54028b73-b263-4b70-aa18-b2e001716ae7"
        fi
    fi
fi
#--------------------
if [ "$SB_FFMPEG_EXISTS_ON_PATH" == "" ]; then
    SB_FFMPEG_EXISTS_ON_PATH="f"
    if [ "`which ffmpeg 2> /dev/null`" != "" ]; then
        SB_FFMPEG_EXISTS_ON_PATH="t"
    else
        if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "ffmpeg" "759c249b-58ab-44f6-9778-b2e001716ae7"
        fi
    fi
fi
#--------------------
if [ "$SB_FFPROBE_EXISTS_ON_PATH" == "" ]; then
    SB_FFPROBE_EXISTS_ON_PATH="f"
    if [ "`which ffprobe 2> /dev/null`" != "" ]; then
        SB_FFPROBE_EXISTS_ON_PATH="t"
    else
        if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "ffprobe" "0704073b-6d3b-4240-8597-b2e001716ae7"
        fi
    fi
fi
#--------------------
if [ "$MMMV_SB_LOOK_FOR_DEVELOPMENT_TOOLS" == "t" ]; then
    #----------------------------------------------------------------------
    if [ "$SB_XMLLINT_EXISTS_ON_PATH" == "" ]; then
        SB_XMLLINT_EXISTS_ON_PATH="f"
        if [ "`which xmllint 2> /dev/null`" != "" ]; then
            SB_XMLLINT_EXISTS_ON_PATH="t"
        fi
    fi
    #----------------------------------------------------------------------
fi
#--------------------
if [ "$SB_GPG_EXISTS_ON_PATH" == "" ]; then
    SB_GPG_EXISTS_ON_PATH="f"
    if [ "`which gpg 2> /dev/null`" != "" ]; then
        SB_GPG_EXISTS_ON_PATH="t"
    fi
fi
#--------------------
if [ "$SB_NETSTAT_EXISTS_ON_PATH" == "" ]; then
    SB_NETSTAT_EXISTS_ON_PATH="f"
    if [ "`which netstat 2> /dev/null`" != "" ]; then
        SB_NETSTAT_EXISTS_ON_PATH="t"
    fi
fi
#--------------------
if [ "$SB_TOR_EXISTS_ON_PATH" == "" ]; then
    SB_TOR_EXISTS_ON_PATH="f"
    if [ "`which tor 2> /dev/null`" != "" ]; then
        SB_TOR_EXISTS_ON_PATH="t"
    fi
fi
#--------------------
if [ "$SB_TORSOCKS_EXISTS_ON_PATH" == "" ]; then
    SB_TORSOCKS_EXISTS_ON_PATH="f"
    if [ "`which torsocks 2> /dev/null`" != "" ]; then
        SB_TORSOCKS_EXISTS_ON_PATH="t"
    fi
fi
#--------------------------------------------------------------------------
#::::::::::::::::::::::::::::image::viewers::::::::::::::::::::::::::::::::
#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    if [ "$SB_XLOADIMAGE_EXISTS_ON_PATH" == "" ]; then
        SB_XLOADIMAGE_EXISTS_ON_PATH="f"
        if [ "`which xloadimage 2> /dev/null`" != "" ]; then
            SB_XLOADIMAGE_EXISTS_ON_PATH="t"
        fi
    fi
    #--------------------
    if [ "$SB_XVIEW_EXISTS_ON_PATH" == "" ]; then
        SB_XVIEW_EXISTS_ON_PATH="f"
        if [ "`which xview 2> /dev/null`" != "" ]; then
            SB_XVIEW_EXISTS_ON_PATH="t"
        #else
        #    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        #        "xview" "0dd163d5-d554-4822-b427-b2e001716ae7"
        fi
    fi
    #--------------------
    if [ "$SB_XVIEWER_EXISTS_ON_PATH" == "" ]; then
        SB_XVIEWER_EXISTS_ON_PATH="f"
        if [ "`which xviewer 2> /dev/null`" != "" ]; then
            SB_XVIEWER_EXISTS_ON_PATH="t"
        #else
        #    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        #        "xviewer" "3d29b155-b9a1-4d78-9826-b2e001716ae7"
        fi
    fi
    #--------------------
    if [ "$SB_FEH_EXISTS_ON_PATH" == "" ]; then
        SB_FEH_EXISTS_ON_PATH="f"
        if [ "`which feh 2> /dev/null`" != "" ]; then
            SB_FEH_EXISTS_ON_PATH="t"
        fi
    fi
    #--------------------
    if [ "$SB_MIRAGE_EXISTS_ON_PATH" == "" ]; then
        SB_MIRAGE_EXISTS_ON_PATH="f"
        if [ "`which mirage 2> /dev/null`" != "" ]; then
            SB_MIRAGE_EXISTS_ON_PATH="t"
        fi
    fi
    #--------------------
    if [ "$SB_VIEWNIOR_EXISTS_ON_PATH" == "" ]; then
        SB_VIEWNIOR_EXISTS_ON_PATH="f"
        if [ "`which viewnior 2> /dev/null`" != "" ]; then
            SB_VIEWNIOR_EXISTS_ON_PATH="t"
        else
            if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
                func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                    "viewnior" "28faba63-bcee-4cca-a836-b2e001716ae7"
            fi
        fi
    fi
    #--------------------
    if [ "$SB_GEEQIE_EXISTS_ON_PATH" == "" ]; then
        SB_GEEQIE_EXISTS_ON_PATH="f"
        if [ "`which geeqie 2> /dev/null`" != "" ]; then
            SB_GEEQIE_EXISTS_ON_PATH="t"
        fi
    fi
    #--------------------
    if [ "$SB_GTHUMB_EXISTS_ON_PATH" == "" ]; then
        SB_GTHUMB_EXISTS_ON_PATH="f"
        if [ "`which gthumb 2> /dev/null`" != "" ]; then
            SB_GTHUMB_EXISTS_ON_PATH="t"
        fi
    fi
    #--------------------
    if [ "$SB_EOG_EXISTS_ON_PATH" == "" ]; then
        SB_EOG_EXISTS_ON_PATH="f"
        if [ "`which eog 2> /dev/null`" != "" ]; then
            SB_EOG_EXISTS_ON_PATH="t"
        fi
    fi
    #--------------------
    if [ "$SB_GWENVIEW_EXISTS_ON_PATH" == "" ]; then
        SB_GWENVIEW_EXISTS_ON_PATH="f"
        if [ "`which gwenview 2> /dev/null`" != "" ]; then
            SB_GWENVIEW_EXISTS_ON_PATH="t"
        fi
    fi
    #--------------------
    if [ "$SB_NOMACS_EXISTS_ON_PATH" == "" ]; then
        SB_NOMACS_EXISTS_ON_PATH="f"
        if [ "`which nomacs 2> /dev/null`" != "" ]; then
            SB_NOMACS_EXISTS_ON_PATH="t"
        fi
    fi
    #--------------------
    if [ "$SB_SXIV_EXISTS_ON_PATH" == "" ]; then
        SB_SXIV_EXISTS_ON_PATH="f"
        if [ "`which sxiv 2> /dev/null`" != "" ]; then
            SB_SXIV_EXISTS_ON_PATH="t"
        fi
    fi
    #--------------------
    if [ "$SB_RISTRETTO_EXISTS_ON_PATH" == "" ]; then
        SB_RISTRETTO_EXISTS_ON_PATH="f"
        if [ "`which ristretto 2> /dev/null`" != "" ]; then
            SB_RISTRETTO_EXISTS_ON_PATH="t"
        fi
    fi
    #--------------------
    if [ "$SB_EOM_EXISTS_ON_PATH" == "" ]; then
        SB_EOM_EXISTS_ON_PATH="f"
        if [ "`which eom 2> /dev/null`" != "" ]; then
            SB_EOM_EXISTS_ON_PATH="t"
        fi
    fi
    #--------------------
    if [ "$SB_GPICVIEW_EXISTS_ON_PATH" == "" ]; then
        SB_GPICVIEW_EXISTS_ON_PATH="f"
        if [ "`which gpicview 2> /dev/null`" != "" ]; then
            SB_GPICVIEW_EXISTS_ON_PATH="t"
        fi
    fi
    #--------------------
    if [ "$SB_MCOMIX_EXISTS_ON_PATH" == "" ]; then
        SB_MCOMIX_EXISTS_ON_PATH="f"
        if [ "`which mcomix 2> /dev/null`" != "" ]; then
            SB_MCOMIX_EXISTS_ON_PATH="t"
        fi
    fi
fi
#--------------------
if [ "$SB_CHAFA_EXISTS_ON_PATH" == "" ]; then
    SB_CHAFA_EXISTS_ON_PATH="f"
    if [ "`which chafa 2> /dev/null`" != "" ]; then
        SB_CHAFA_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "chafa" "79d56133-9f27-4cce-ba46-b2e001716ae7"
    fi
fi
if [ "$SB_CHAFA_EXISTS_ON_PATH" == "t" ]; then
    alias mmmv_image_viewer_for_terminal_chafa_80x80="$S_FP_NICE -n 3 chafa -O 9 --size 80x80 -c full "
fi
#--------------------
if [ "$SB_CATIMG_EXISTS_ON_PATH" == "" ]; then
    SB_CATIMG_EXISTS_ON_PATH="f"
    if [ "`which catimg 2> /dev/null`" != "" ]; then
        SB_CATIMG_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "catimg" "5e2b83e9-900a-4764-ab35-b2e001716ae7"
    fi
fi
if [ "$SB_CATIMG_EXISTS_ON_PATH" == "t" ]; then
    alias mmmv_image_viewer_for_terminal_catimg="$S_FP_NICE -n 3 catimg "
    alias mmmv_image_viewer_for_terminal_catimg_w150="$S_FP_NICE -n 3 catimg -w 150 "
fi
#--------------------
if [ "$SB_IMG2SIXEL_EXISTS_ON_PATH" == "" ]; then
    SB_IMG2SIXEL_EXISTS_ON_PATH="f"
    if [ "`which img2sixel 2> /dev/null`" != "" ]; then
        # https://github.com/saitoha/libsixel.git
        # img2sixel works with xterm, provided that the xterm has been
        # compiled to support sixels.
        SB_IMG2SIXEL_EXISTS_ON_PATH="t"
    # else
    #     func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
    #         "img2sixel" "543a3f29-f241-4344-a8a5-b2e001716ae7"
    fi
fi
if [ "$SB_IMG2SIXEL_EXISTS_ON_PATH" == "t" ]; then
    alias mmmv_image_viewer_for_terminal_img2sixel="$S_FP_NICE -n 3 img2sixel"
fi
#--------------------
if [ "$SB_MPV_EXISTS_ON_PATH" == "" ]; then
    SB_MPV_EXISTS_ON_PATH="f"
    if [ "`which mpv 2> /dev/null`" != "" ]; then
        SB_MPV_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "mpv" "419a6315-7a2c-4ed8-8b15-b2e001716ae7"
    fi
fi
if [ "$SB_MPV_EXISTS_ON_PATH" == "t" ]; then
    alias mmmv_image_viewer_for_terminal_mpv_t1="$S_FP_NICE -n 3 mpv --quiet --vo=tct "
fi
#--------------------
if [ "$SB_IMG2TXT_EXISTS_ON_PATH" == "" ]; then
    SB_IMG2TXT_EXISTS_ON_PATH="f"
    if [ "`which img2txt 2> /dev/null`" != "" ]; then
        SB_IMG2TXT_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "img2txt" "435a35c2-0dc3-4001-bc25-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_IMG2PDF_EXISTS_ON_PATH" == "" ]; then
    SB_IMG2PDF_EXISTS_ON_PATH="f"
    if [ "`which img2pdf 2> /dev/null`" != "" ]; then
        SB_IMG2PDF_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "img2pdf" "3ff00f61-dde6-4feb-8b34-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_CONVERT_EXISTS_ON_PATH" == "" ]; then
    SB_CONVERT_EXISTS_ON_PATH="f"
    if [ "`which convert 2> /dev/null`" != "" ]; then
        SB_CONVERT_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "convert" "4ca31c43-b697-423a-9914-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_ZBARIMG_EXISTS_ON_PATH" == "" ]; then
    SB_ZBARIMG_EXISTS_ON_PATH="f"
    if [ "`which zbarimg 2> /dev/null`" != "" ]; then
        SB_ZBARIMG_EXISTS_ON_PATH="t"
        # Usage:
        #     zbarimg -q --raw an_image_with_a_QR_code.png
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "zbarimg" "d569ebe8-0246-4a7d-b014-b2e001716ae7"
        if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
            if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
                if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
                    echo ""
                    echo "\"zbarimg\" MIGHT be available form the "
                    echo "operating system standard package collection."
                    echo "In the case of Debian based operating systems "
                    echo "it MIGHT be installed by executing "
                    echo -e "\e[36m"
                    echo "    apt-get install zbar-tools "
                    echo -e "\e[39m"
                    echo "GUID=='57c11b33-ce49-40d8-811e-b2e001716ae7'"
                    echo ""
                fi
            fi
        fi
    fi
fi
#--------------------
if [ "$SB_ZBARCAM_EXISTS_ON_PATH" == "" ]; then
    SB_ZBARCAM_EXISTS_ON_PATH="f"
    if [ "`which zbarcam 2> /dev/null`" != "" ]; then
        SB_ZBARCAM_EXISTS_ON_PATH="t"
        # It's a program for interactively looking
        # for QR-codes from a web camera feed.
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "zbarcam" "31d206d8-f884-43ab-9483-b2e001716ae7"
        if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
            if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
                if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
                    echo ""
                    echo "\"zbarcam\" MIGHT be available form the "
                    echo "operating system standard package collection."
                    echo "In the case of Debian based operating systems "
                    echo "it MIGHT be installed by executing "
                    echo -e "\e[36m"
                    echo "    apt-get install zbar-tools "
                    echo -e "\e[39m"
                    echo "GUID=='0db4ce3c-4c75-4d7e-971e-b2e001716ae7'"
                    echo ""
                fi
            fi
        fi
    fi
fi
#--------------------
if [ "$SB_RSVGCONVERT_EXISTS_ON_PATH" == "" ]; then
    SB_RSVGCONVERT_EXISTS_ON_PATH="f"
    if [ "`which rsvg-convert 2> /dev/null`" != "" ]; then
        SB_RSVGCONVERT_EXISTS_ON_PATH="t"
        # Usage:
        #     rsvg-convert --background-color=white -w 800 ./sample.svg | convert - -quality 95 ./sample.jpg
        #
        #      # A PNG with a transparent background:
        #      rsvg-convert --background-color=none -w 800 ./sample.svg -o ./sample.png
        #
        #      rsvg-convert --background-color=white -w 800 ./sample.svg | convert - -define bmp:format=bmp3 ./sample.bmp
        #
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "rsvg-convert" "1277e054-2821-488c-8423-b2e001716ae7"
        if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
            if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
                echo ""
                echo "\"rsvg-convert\" MIGHT be available form the "
                echo "operating system standard package collection."
                echo "In the case of Debian based operating systems "
                echo "it MIGHT be installed by executing "
                echo -e "\e[36m"
                echo "    apt-get install librsvg2-bin"
                echo -e "\e[39m"
                echo "GUID=='65f054d3-39f5-43bc-8e4e-b2e001716ae7'"
                echo ""
            fi
        fi
    fi
fi
#--------------------------------------------------------------------------
#::::::::::::::::::::::::::::various::viewers::::::::::::::::::::::::::::::
#--------------------------------------------------------------------------
if [ "$SB_EVINCE_EXISTS_ON_PATH" == "" ]; then
    # Evince is a PDF viewer.
    SB_EVINCE_EXISTS_ON_PATH="f"
    if [ "`which evince 2> /dev/null`" != "" ]; then
        SB_EVINCE_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "evince" "33f38023-d1dd-4662-8b43-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_ZATHURA_EXISTS_ON_PATH" == "" ]; then
    # zathura is a PDF viewer.
    SB_ZATHURA_EXISTS_ON_PATH="f"
    if [ "`which zathura 2> /dev/null`" != "" ]; then
        SB_ZATHURA_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "zathura" "41d55d2a-17a7-4d3b-9f12-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_TEXDOCTK_EXISTS_ON_PATH" == "" ]; then
    SB_TEXDOCTK_EXISTS_ON_PATH="f"
    if [ "`which texdoctk 2> /dev/null`" != "" ]; then
        SB_TEXDOCTK_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "texdoctk" "3641a254-b91c-4d6d-a722-b2e001716ae7"
    fi
fi
if [ "$SB_TEXDOCTK_EXISTS_ON_PATH" == "t" ]; then
    alias mmmv_run_doc_collection_viewer_texdoctk="$S_FP_NICE -n 5 texdoctk "
fi
#--------------------
if [ "$SB_XDVI_EXISTS_ON_PATH" == "" ]; then
    SB_XDVI_EXISTS_ON_PATH="f"
    if [ "`which xdvi 2> /dev/null`" != "" ]; then
        SB_XDVI_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "xdvi" "fe18b88f-8861-452b-a331-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_XPDF_EXISTS_ON_PATH" == "" ]; then
    SB_XPDF_EXISTS_ON_PATH="f"
    if [ "`which xpdf 2> /dev/null`" != "" ]; then
        SB_XPDF_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "xpdf" "2ffd7333-aff5-4793-bd21-b2e001716ae7"
    fi
fi
#--------------------------------------------------------------------------
#::network::managers::and::other::operating::system::configuration::utilities:
#--------------------------------------------------------------------------
if [ "$SB_NMAPPLET_EXISTS_ON_PATH" == "" ]; then
    SB_NMAPPLET_EXISTS_ON_PATH="f"
    if [ "`which nm-applet 2> /dev/null`" != "" ]; then
        SB_NMAPPLET_EXISTS_ON_PATH="t"
        # It is a netorkmanager
    else
        if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
            if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
                if [ "$SB_OPERATINGSYSTEM_LINUX_WSL" == "f" ]; then
                    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                        "nm-applet" "3d5dec45-1a96-467f-a521-b2e001716ae7"
                fi
            fi
        fi
    fi
fi
#--------------------
if [ "$SB_NMCLI_EXISTS_ON_PATH" == "" ]; then
    SB_NMCLI_EXISTS_ON_PATH="f"
    if [ "`which nmcli 2> /dev/null`" != "" ]; then
        SB_NMCLI_EXISTS_ON_PATH="t"
        # It is a netorkmanager
    else
        if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
            if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
                if [ "$SB_OPERATINGSYSTEM_LINUX_WSL" == "f" ]; then
                    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                        "nmcli" "1752b252-1bb7-469e-9631-b2e001716ae7"
                fi
            fi
        fi
    fi
fi
#--------------------
if [ "$SB_NMTUI_EXISTS_ON_PATH" == "" ]; then
    SB_NMTUI_EXISTS_ON_PATH="f"
    if [ "`which nmtui 2> /dev/null`" != "" ]; then
        SB_NMTUI_EXISTS_ON_PATH="t"
        # It is a netorkmanager
    else
        if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
            if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
                if [ "$SB_OPERATINGSYSTEM_LINUX_WSL" == "f" ]; then
                    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                        "nmtui" "36cdeac5-726a-4214-8b51-b2e001716ae7"
                fi
            fi
        fi
    fi
fi
#--------------------


    if [ "`which nmcli `" != "" ]; then
        alias mmmv_ui_networkmanager_nmcli_ajutine="nmcli "
    fi
    if [ "`which nmtui `" != "" ]; then
        alias mmmv_ui_networkmanager_nmtui_ajutine="nmtui "
    fi
    if [ "`which nm-applet `" != "" ]; then
        alias mmmv_ui_networkmanager_nmapplet_ajutine="nm-applet "
    fi


#--------------------------------------------------------------------------
#::::::::::::::::::clock::and::calendar::applications::::::::::::::::::::::
#--------------------------------------------------------------------------
if [ "$SB_CALCURSE_EXISTS_ON_PATH" == "" ]; then
    SB_CALCURSE_EXISTS_ON_PATH="f"
    if [ "`which calcurse 2> /dev/null`" != "" ]; then
        SB_CALCURSE_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "calcurse" "eb1c25ec-d7c4-41d5-91a0-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_CAL_EXISTS_ON_PATH" == "" ]; then
    SB_CAL_EXISTS_ON_PATH="f"
    if [ "`which cal 2> /dev/null`" != "" ]; then
        SB_CAL_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "cal" "420779f3-63bf-4708-a240-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_NCAL_EXISTS_ON_PATH" == "" ]; then
    SB_NCAL_EXISTS_ON_PATH="f"
    if [ "`which ncal 2> /dev/null`" != "" ]; then
        SB_NCAL_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "ncal" "2a47c1f3-d1e1-427e-8b40-b2e001716ae7"
    fi
fi
#--------------------------------------------------------------------------
#::::::::::::::::::::documentation::generation::tools::::::::::::::::::::::
#--------------------------------------------------------------------------
if [ "$SB_DOXYGEN_EXISTS_ON_PATH" == "" ]; then
    SB_DOXYGEN_EXISTS_ON_PATH="f"
    if [ "`which doxygen 2> /dev/null`" != "" ]; then
        SB_DOXYGEN_EXISTS_ON_PATH="t"
        # Doxygen is used for generating documentation from C/C++ code.
        #     https://doxygen.nl/
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "doxygen" "d4da0e94-47e7-442e-aed0-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_DOCUTILS_EXISTS_ON_PATH" == "" ]; then
    SB_DOCUTILS_EXISTS_ON_PATH="f"
    if [ "`which docutils 2> /dev/null`" != "" ]; then
        SB_DOCUTILS_EXISTS_ON_PATH="t"
        # https://www.docutils.org/
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "docutils" "a53da9dd-e753-446a-b240-b2e001716ae7"
        if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
            if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
                if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
                    echo ""
                    echo "\"docutils\" MIGHT be available form the "
                    echo "operating system standard package collection."
                    echo "In the case of Debian based operating systems "
                    echo "it MIGHT be installed by executing "
                    echo -e "\e[36m"
                    echo "    apt-get install docutils"
                    echo -e "\e[39m"
                    echo "Another thing to try MIGHT be "
                    echo -e "\e[36m"
                    #echo "    pipx install --include-deps --force docutils "
                    echo "    pipx install docutils "
                    # As of 2026_04 that installs the following command line programs:
                    #     docutils, rst2html, rst2html4, rst2html5, rst2latex, rst2man,
                    #     rst2odt, rst2pseudoxml, rst2s5, rst2xetex, rst2xml.
                    echo -e "\e[39m"
                    echo "GUID=='523c3705-8fd8-4e32-a62d-b2e001716ae7'"
                    echo ""
                fi
            fi
        fi
    fi
fi
#--------------------
if [ "$SB_MKDOCS_EXISTS_ON_PATH" == "" ]; then
    SB_MKDOCS_EXISTS_ON_PATH="f"
    if [ "`which mkdocs 2> /dev/null`" != "" ]; then
        SB_MKDOCS_EXISTS_ON_PATH="t"
        # https://www.mkdocs.org/
        # mkdocs generates HTML from Markdown files.
        # Usage example: https://github.com/lyz-code/blue-book
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "mkdocs" "3945fe44-8380-4c2d-aa10-b2e001716ae7"
        if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
            if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
                if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
                    echo ""
                    echo "\"mkdocs\" MIGHT be available form the "
                    echo "operating system standard package collection."
                    echo "In the case of Debian based operating systems "
                    echo "it MIGHT be installed by executing "
                    echo -e "\e[36m"
                    echo "    apt-get install mkdocs mkdocs-* "
                    echo -e "\e[39m"
                    echo "Another thing to try MIGHT be "
                    echo -e "\e[36m"
                    echo "    pipx install --include-deps --force mkdocs "
                    echo "    wait ; sync ; wait "
                    echo "    pipx install --include-deps --force mkdocs-material "
                    echo -e "\e[39m"
                    echo "GUID=='5bc2c701-26d6-4671-8e5d-b2e001716ae7'"
                    echo ""
                fi
            fi
        fi
    fi
fi
#--------------------
if [ "$SB_LUALATEX_EXISTS_ON_PATH" == "" ]; then
    SB_LUALATEX_EXISTS_ON_PATH="f"
    if [ "`which lualatex 2> /dev/null`" != "" ]; then
        SB_LUALATEX_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "lualatex" "3a9d9a84-863a-418b-b330-b2e001716ae7"
        if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
            if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
                echo ""
                echo "\"lualatex\" MIGHT be available form the "
                echo "operating system standard package collection."
                echo "In the case of Debian based operating systems "
                echo "it MIGHT be installed by executing "
                echo -e "\e[36m"
                echo "    apt-get install texlive-luatex "
                echo -e "\e[39m"
                echo "GUID=='ee1f473e-2282-4f51-8cdd-b2e001716ae7'"
                echo ""
            fi
        fi
    fi
fi
#--------------------
if [ "$SB_RST2PDF_EXISTS_ON_PATH" == "" ]; then
    SB_RST2PDF_EXISTS_ON_PATH="f"
    if [ "`which rst2pdf 2> /dev/null`" != "" ]; then
        SB_RST2PDF_EXISTS_ON_PATH="t"
        # rst2pdf generates PDF-files.
        #     https://rst2pdf.org/
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "rst2pdf" "fb805542-3fe9-4564-8530-b2e001716ae7"
        if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
            if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
                if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
                    echo ""
                    echo "\"rst2pdf\" MIGHT be available form the "
                    echo "operating system standard package collection."
                    echo "In the case of Debian based operating systems "
                    echo "it MIGHT be installed by executing "
                    echo -e "\e[36m"
                    echo "    apt-get install rst2pdf"
                    echo -e "\e[39m"
                    echo "Another thing to try MIGHT be "
                    echo -e "\e[36m"
                    #echo "    pipx install --include-deps --force rst2pdf "
                    echo "    pipx install rst2pdf "
                    echo -e "\e[39m"
                    echo "GUID=='925bfc5e-3a16-4d4e-903d-b2e001716ae7'"
                    echo ""
                fi
            fi
        fi
    fi
fi
#--------------------------------------------------------------------------
#::::::::::::::::::::::::::system::tools:::::::::::::::::::::::::::::::::::
#--------------------------------------------------------------------------
# Filesystem permissions might make some system tools unavailable
# to non-root users.

if [ "$SB_ATACONTROL_EXISTS_ON_PATH" == "" ]; then
    SB_ATACONTROL_EXISTS_ON_PATH="f"
    if [ "`which atacontrol 2> /dev/null`" != "" ]; then
        SB_ATACONTROL_EXISTS_ON_PATH="t"
    fi
fi
#--------------------
if [ "$SB_COL_EXISTS_ON_PATH" == "" ]; then
    SB_COL_EXISTS_ON_PATH="f"
    if [ "`which col 2> /dev/null`" != "" ]; then
        SB_COL_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "col" "67504c64-4850-4150-9370-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_DMESG_EXISTS_ON_PATH" == "" ]; then
    SB_DMESG_EXISTS_ON_PATH="f"
    if [ "`which dmesg 2> /dev/null`" != "" ]; then
        SB_DMESG_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "dmesg" "73bc4673-0b7f-45ac-8a50-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_FSTYP_EXISTS_ON_PATH" == "" ]; then
    SB_FSTYP_EXISTS_ON_PATH="f"
    if [ "`which fstyp 2> /dev/null`" != "" ]; then
        SB_FSTYP_EXISTS_ON_PATH="t"
    fi
fi
#--------------------
if [ "$SB_GLABEL_EXISTS_ON_PATH" == "" ]; then
    SB_GLABEL_EXISTS_ON_PATH="f"
    if [ "`which glabel 2> /dev/null`" != "" ]; then
        SB_GLABEL_EXISTS_ON_PATH="t"
    fi
fi
#--------------------
if [ "$if" == "" ]; then
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
        SB_GPART_EXISTS_ON_PATH="f"
        if [ "`which gpart 2> /dev/null`" != "" ]; then
            SB_GPART_EXISTS_ON_PATH="t"
        fi
    fi
fi
#--------------------
if [ "$SB_MOUNT_EXISTS_ON_PATH" == "" ]; then
    SB_MOUNT_EXISTS_ON_PATH="f"
    if [ "`which mount 2> /dev/null`" != "" ]; then
        SB_MOUNT_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "mount" "41f2d6e4-4997-4715-bc10-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_PSTAT_EXISTS_ON_PATH" == "" ]; then
    SB_PSTAT_EXISTS_ON_PATH="f"
    if [ "`which pstat 2> /dev/null`" != "" ]; then
        SB_PSTAT_EXISTS_ON_PATH="t"
    fi
fi
#--------------------
if [ "$SB_SH_EXISTS_ON_PATH" == "" ]; then
    SB_SH_EXISTS_ON_PATH="f"
    if [ "`which sh 2> /dev/null`" != "" ]; then
        SB_SH_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "sh" "4fe0db35-126d-42a6-b420-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_SYSTEMDRUN_EXISTS_ON_PATH" == "" ]; then
    SB_SYSTEMDRUN_EXISTS_ON_PATH="f"
    if [ "`which systemd-run 2> /dev/null`" != "" ]; then
        SB_SYSTEMDRUN_EXISTS_ON_PATH="t"
    fi
fi
#--------------------
if [ "$SB_TCSH_EXISTS_ON_PATH" == "" ]; then
    SB_TCSH_EXISTS_ON_PATH="f"
    if [ "`which tcsh 2> /dev/null`" != "" ]; then
        SB_TCSH_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "tcsh" "b2a048d1-41fb-412b-9880-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_MOSH_EXISTS_ON_PATH" == "" ]; then
    SB_MOSH_EXISTS_ON_PATH="f"
    if [ "`which mosh 2> /dev/null`" != "" ]; then
        SB_MOSH_EXISTS_ON_PATH="t"
        # https://mosh.org/
        # ------------citation----start---------------------
        # Remote terminal application that allows roaming,
        # supports intermittent connectivity, and provides
        # intelligent local echo and line editing of user
        # keystrokes.
        #
        # Mosh is a replacement for interactive SSH
        # terminals. It's more robust and responsive,
        # especially over Wi-Fi, cellular, and long-distance
        # links.
        # ------------citation----end-----------------------
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "mosh" "1195ebae-ec33-450b-ac50-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_SERVICE_EXISTS_ON_PATH" == "" ]; then
    SB_SERVICE_EXISTS_ON_PATH="f"
    if [ "`which service 2> /dev/null`" != "" ]; then
        # TODO: for some reason the control flow never reaches this line.
        #       Try to fix that some day.
        SB_SERVICE_EXISTS_ON_PATH="t"
    fi
fi
#--------------------
if [ "$SB_SWAPINFO_EXISTS_ON_PATH" == "" ]; then
    SB_SWAPINFO_EXISTS_ON_PATH="f"
    if [ "`which swapinfo 2> /dev/null`" != "" ]; then
        SB_SWAPINFO_EXISTS_ON_PATH="t"
    fi
fi
#--------------------
if [ "$SB_SYSCTL_EXISTS_ON_PATH" == "" ]; then
    SB_SYSCTL_EXISTS_ON_PATH="f"
    if [ "`which sysctl 2> /dev/null`" != "" ]; then
        SB_SYSCTL_EXISTS_ON_PATH="t"
    fi
fi
#--------------------------------------------------------------------------
#:::::::::compilers::and::other::translators::and::interpreters::::::::::::
#--------------------------------------------------------------------------
if [ "$SB_RUBY_EXISTS_ON_PATH" == "" ]; then
    SB_RUBY_EXISTS_ON_PATH="f"
    if [ "`which ruby 2> /dev/null`" != "" ]; then
        # The Ruby version might be wrong, but at least
        # something called "ruby" is on PATH.
        SB_RUBY_EXISTS_ON_PATH="t"
    fi
fi
#--------------------
SB_JAVA_EXISTS_ON_PATH="f"
SB_JAVAC_EXISTS_ON_PATH="f"
#--------------------
# #--------------------
# if [ "$SB_PERL_EXISTS_ON_PATH" == "" ]; then
#     SB_PERL_EXISTS_ON_PATH="f"
#     if [ "`which perl 2> /dev/null`" != "" ]; then
#         SB_PERL_EXISTS_ON_PATH="t"
#     fi
# fi
#--------------------
if [ "$MMMV_SB_LOOK_FOR_DEVELOPMENT_TOOLS" == "t" ]; then
    #----------------------------------------------------------------------
    if [ "$SB_GCC_EXISTS_ON_PATH" == "" ]; then
        SB_GCC_EXISTS_ON_PATH="f"
        if [ "`which gcc 2> /dev/null`" != "" ]; then
            SB_GCC_EXISTS_ON_PATH="t"
            if [ "$CC" == "" ]; then
                export CC="$S_TMP_0"
            fi
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "gcc" "1fb45203-afe1-46da-8a10-b2e001716ae7"
        fi
    fi
    #--------------------
    if [ "$SB_GCCpp_EXISTS_ON_PATH" == "" ]; then
        SB_GCCpp_EXISTS_ON_PATH="f"
        if [ "`which g++ 2> /dev/null`" != "" ]; then
            SB_GCCpp_EXISTS_ON_PATH="t"
            if [ "$CXX" == "" ]; then
                export CXX="$S_TMP_0"
            fi
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "g++" "126f5852-01f7-4454-9330-b2e001716ae7"
        fi
    fi
    #--------------------
    if [ "$SB_CLANG_EXISTS_ON_PATH" == "" ]; then
        SB_CLANG_EXISTS_ON_PATH="f"
        if [ "`which clang 2> /dev/null`" != "" ]; then
            SB_CLANG_EXISTS_ON_PATH="t"
            if [ "$CC" == "" ]; then
                export CC="$S_TMP_0"
            fi
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "clang" "290d5d21-957d-4c40-b310-b2e001716ae7"
        fi
    fi
    #--------------------
    if [ "$SB_CLANGpp_EXISTS_ON_PATH" == "" ]; then
        SB_CLANGpp_EXISTS_ON_PATH="f"
        if [ "`which clang++ 2> /dev/null`" != "" ]; then
            SB_CLANGpp_EXISTS_ON_PATH="t"
            if [ "$CXX" == "" ]; then
                export CXX="$S_TMP_0"
            fi
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "clang++" "b907a904-ec0c-4851-9f10-b2e001716ae7"
        fi
    fi
    #----------------------------------------------------------------------
fi
#--------------------------------------------------------------------------
#:::::::::::::::text::editors::and::other::text::editing::tools::::::::::::
#--------------------------------------------------------------------------
if [ "$SB_AWK_EXISTS_ON_PATH" == "" ]; then
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
            "awk" "40404633-b9e8-4650-9d3f-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_GAWK_EXISTS_ON_PATH" == "" ]; then
    SB_GAWK_EXISTS_ON_PATH="f"
    if [ "`which gawk 2> /dev/null`" != "" ]; then
        SB_GAWK_EXISTS_ON_PATH="t"
    else
        # The "gawk" can be present on both, Linux and BSD.
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "gawk" "164362d4-7502-46c1-a24f-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_AWK_OR_GAWK_EXISTS_ON_PATH" == "" ]; then
    SB_AWK_OR_GAWK_EXISTS_ON_PATH="f"
    if [ "$SB_AWK_EXISTS_ON_PATH" == "t" ]; then
        SB_AWK_OR_GAWK_EXISTS_ON_PATH="t"
    else
        if [ "$SB_GAWK_EXISTS_ON_PATH" == "t" ]; then
            SB_AWK_OR_GAWK_EXISTS_ON_PATH="t"
        fi
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
if [ "$SB_EMACS_EXISTS_ON_PATH" == "" ]; then
    SB_EMACS_EXISTS_ON_PATH="f"
    S_FP_EMACS="`which emacs 2> /dev/null`"
    if [ "$S_FP_EMACS" != "" ]; then
        SB_EMACS_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "emacs" "23d879cd-3272-4a28-952f-b2e001716ae7"
    fi
fi
if [ "$S_FP_EMACS" == "" ]; then
    S_FP_EMACS="`which emacs 2> /dev/null`"
fi
#if [ "$SB_EMACS_EXISTS_ON_PATH" == "t" ]; then
    if [ "$S_FP_EMACS" != "" ]; then
        alias mmmv_texteditor_Emacs="$S_FP_EMACS"
    fi
#fi
#--------------------
if [ "$SB_HEAD_EXISTS_ON_PATH" == "" ]; then
    SB_HEAD_EXISTS_ON_PATH="f"
    if [ "`which head 2> /dev/null`" != "" ]; then
        SB_HEAD_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "head" "40904f22-3a0d-4254-9d2f-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_JED_EXISTS_ON_PATH" == "" ]; then
    SB_JED_EXISTS_ON_PATH="f"
    S_FP_JED="`which jed 2> /dev/null`"
    if [ "$S_FP_JED" != "" ]; then
        SB_JED_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "jed" "2eb01f21-4464-4627-914f-b2e001716ae7"
    fi
fi
if [ "$S_FP_JED" == "" ]; then
    S_FP_JED="`which jed 2> /dev/null`"
fi
#if [ "$SB_JED_EXISTS_ON_PATH" == "t" ]; then
    if [ "$S_FP_JED" != "" ]; then
        alias mmmv_texteditor_JED="$S_FP_JED"
    fi
#fi
#--------------------
if [ "$SB_JOE_EXISTS_ON_PATH" == "" ]; then
    SB_JOE_EXISTS_ON_PATH="f"
    S_FP_JOE="`which joe 2> /dev/null`"
    if [ "$S_FP_JOE" != "" ]; then
        SB_JOE_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "joe" "495a1424-d2ad-4b8c-914f-b2e001716ae7"
    fi
fi
if [ "$S_FP_JOE" == "" ]; then
    S_FP_JOE="`which joe 2> /dev/null`"
fi
#if [ "$SB_JOE_EXISTS_ON_PATH" == "t" ]; then
    if [ "$S_FP_JOE" != "" ]; then
        alias mmmv_texteditor_JOE="$S_FP_JOE"
    fi
#fi
#--------------------
if [ "$SB_DAVTEXTEDITOR_EXISTS_ON_PATH" == "" ]; then
    SB_DAVTEXTEDITOR_EXISTS_ON_PATH="f"
    S_FP_DAVTEXTEDITOR="`which dav 2> /dev/null`"
    if [ "$S_FP_DAVTEXTEDITOR" != "" ]; then
        SB_DAVTEXTEDITOR_EXISTS_ON_PATH="t"
        # As of 2026_06_20 it's under GPL and Dav is
        # an acronym for "Dav Ain't Vi".
        # https://github.com/atsb/dav-text
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "dav" "494124b2-2f97-4400-9a5f-b2e001716ae7"
        if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
            echo ""
            echo "\"dav\" MIGHT be available form the "
            echo "operating system standard package collection."
            echo "In the case of Debian based operating systems "
            echo "it MIGHT be installed by executing "
            echo -e "\e[36m"
            echo "    apt-get install dav-text"
            echo -e "\e[39m"
            echo "GUID=='103afee1-7710-4c76-9b1d-b2e001716ae7'"
            echo ""
        fi
    fi
fi
if [ "$S_FP_DAVTEXTEDITOR" == "" ]; then
    S_FP_DAVTEXTEDITOR="`which dav 2> /dev/null`"
fi
#if [ "$SB_DAVTEXTEDITOR_EXISTS_ON_PATH" == "t" ]; then
    if [ "$S_FP_DAVTEXTEDITOR" != "" ]; then
        alias mmmv_texteditor_Dav="$S_FP_DAVTEXTEDITOR"
    fi
#fi
#--------------------
if [ "$SB_RETEXT_EXISTS_ON_PATH" == "" ]; then
    SB_RETEXT_EXISTS_ON_PATH="f"
    S_FP_RETEXT="`which retext 2> /dev/null`"
    if [ "$S_FP_RETEXT" != "" ]; then
        SB_RETEXT_EXISTS_ON_PATH="t"
        # ReText
        #     https://github.com/retext-project/retext
        # is a GUI based text editor that depends on Python
        #     https://pypi.org/project/Markups/
        # project, which as of 2026_06_20 can NOT be installed
        # on Debian based Q4OS by running "pipx install markups".
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "retext" "1a711d62-6d13-4b48-b63f-b2e001716ae7"
    fi
fi
if [ "$S_FP_RETEXT" == "" ]; then
    S_FP_RETEXT="`which retext 2> /dev/null`"
fi
#if [ "$SB_RETEXT_EXISTS_ON_PATH" == "t" ]; then
    if [ "$S_FP_RETEXT" != "" ]; then
        alias mmmv_texteditor_ReText="$S_FP_RETEXT"
    fi
#fi
#--------------------
if [ "$SB_JQ_EXISTS_ON_PATH" == "" ]; then
    SB_JQ_EXISTS_ON_PATH="f"
    if [ "`which jq 2> /dev/null`" != "" ]; then
        SB_JQ_EXISTS_ON_PATH="t"
        # jq is a JSON text processor. A sample line
        #     curl "https://koodivaramu.eesti.ee/api/v4/projects?per_page=100" | jq '.[].ssh_url_to_repo'
        # by Raivo Laanemets (infdot.com, "inf" like "infinity")
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "jq" "13113b44-bc1d-407c-802f-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_PUP_EXISTS_ON_PATH" == "" ]; then
    SB_PUP_EXISTS_ON_PATH="f"
    S_FP_PUP="`which pup 2> /dev/null`"
    if [ "$S_FP_PUP" != "" ]; then
        SB_PUP_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "pup" "11a2e8c5-8d9b-4df7-903f-b2e001716ae7"
    fi
fi
if [ "$SB_PUP_EXISTS_ON_PATH" == "t" ]; then
    if [ "$S_FP_PUP" != "" ]; then
        alias mmmv_format_HTML_file_pup_t1="$S_FP_PUP --file " # ./inputfile.html
        alias mmmv_format_HTML_file_pup_t2_color="$S_FP_PUP --color --file " # ./inputfile.html
    fi
fi
#--------------------
if [ "$SB_MCEDIT_EXISTS_ON_PATH" == "" ]; then
    SB_MCEDIT_EXISTS_ON_PATH="f"
    S_FP_MCEDIT="`which mcedit 2> /dev/null`"
    if [ "$S_FP_MCEDIT" != "" ]; then
        SB_MCEDIT_EXISTS_ON_PATH="t"
        # mcedit is part of the
        # Midnight Commander File manager, the mc .
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "mcedit" "e44d41d1-03ca-45bb-915f-b2e001716ae7"
    fi
fi
if [ "$S_FP_MCEDIT" == "" ]; then
    S_FP_MCEDIT="`which mcedit 2> /dev/null`"
fi
#if [ "$SB_MCEDIT_EXISTS_ON_PATH" == "t" ]; then
    if [ "$S_FP_MCEDIT" != "" ]; then
        alias mmmv_texteditor_mcedit="$S_FP_MCEDIT"
    fi
#fi
#--------------------
if [ "$SB_PRINTF_EXISTS_ON_PATH" == "" ]; then
    SB_PRINTF_EXISTS_ON_PATH="f"
    if [ "`which printf 2> /dev/null`" != "" ]; then
        SB_PRINTF_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "printf" "cffa39af-bc29-45e0-834f-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_RLWRAP_EXISTS_ON_PATH" == "" ]; then
    SB_RLWRAP_EXISTS_ON_PATH="f"
    if [ "`which rlwrap 2> /dev/null`" != "" ]; then
        #----------------------------------------------------------------------
        SB_RLWRAP_EXISTS_ON_PATH="t"
        # https://github.com/hanslub42/rlwrap
        # https://linux.die.net/man/1/rlwrap
        # lrwrap wraps a console application and allows GNU Readline
        # (libreadline) based command line input editing with arrow keys.
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
            "rlwrap" "0e1222fa-0f42-417f-b6ef-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_SED_EXISTS_ON_PATH" == "" ]; then
    SB_SED_EXISTS_ON_PATH="f"
    S_FP_SED="`which sed 2> /dev/null`"
    if [ "$S_FP_SED" != "" ]; then
        SB_SED_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "sed" "0519b9ba-1f77-447d-a08f-b2e001716ae7"
    fi
fi
#if [ "$SB_SED_EXISTS_ON_PATH" == "t" ]; then
    if [ "$S_FP_SED" != "" ]; then
        # The following Bash test-line works on both, Linux and FreeBSD:
        #     printf 'aaa\n  \n\nbbb\n \t \nccc' | sed -e '/^[[:blank:]]*$/d'
        alias mmmv_sed_empty_lines_removal_including_lines_with_only_spaces_tabs_t1="$S_FP_SED -e '/^[[:blank:]]*\$/d' "
    fi
#fi
#--------------------
if [ "$SB_GSED_EXISTS_ON_PATH" == "" ]; then
    SB_GSED_EXISTS_ON_PATH="f"
    if [ "`which gsed 2> /dev/null`" != "" ]; then
        SB_GSED_EXISTS_ON_PATH="t"
        # On FreeBSD the BSD sed has the name "sed" and
        # the GNU sed has the name "gsed".  On Linux the
        # GNU sed has the name "sed".
    else
        if [ "$SB_OPERATINGSYSTEM_LINUX" == "f" ]; then
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "gsed" "18285775-6132-4711-8a5f-b2e001716ae7"
        else
            if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "t" ]; then
                # The Termux Linux uses the BSD flavor of the common command line tools.
                func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                    "gsed" "52167296-2873-4904-953f-b2e001716ae7"
            fi
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
if [ "$SB_REPLACE_EXISTS_ON_PATH" == "" ]; then
    SB_REPLACE_EXISTS_ON_PATH="f"
    if [ "`which replace 2> /dev/null`" != "" ]; then
        SB_REPLACE_EXISTS_ON_PATH="t"
        # replace  "/usr/local" "/Foo/Bar" < ./template.txt > ./output_with_text_replacements.txt
    else
       func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
           "replace" "b4b8bb44-5a23-4ffc-9c5f-b2e001716ae7"
        #if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
            if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
                echo "The command \"replace\" is part of the MariaDB project."
                echo "GUID=='63ad3c2e-417c-4f55-a32d-b2e001716ae7'"
                echo ""
            fi
        #fi
    fi
fi
#--------------------
if [ "$SB_TIME_EXISTS_ON_PATH" == "" ]; then
    SB_TIME_EXISTS_ON_PATH="f"
    if [ "`which time 2> /dev/null`" != "" ]; then
        SB_TIME_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "time" "21fb7815-cdd6-4368-b6ff-b2e001716ae7"
    fi
fi
#--------------------
if [ "$MMMV_SB_LOOK_FOR_DEVELOPMENT_TOOLS" == "t" ]; then
    #--------------------
    if [ "$SB_CCACHE_EXISTS_ON_PATH" == "" ]; then
        SB_CCACHE_EXISTS_ON_PATH="f"
        if [ "`which ccache 2> /dev/null`" != "" ]; then
            SB_CCACHE_EXISTS_ON_PATH="t"
            # ccache is a compiler cache for speeding up
            # the recompilation of C/C++ code.
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "ccache" "85541e7b-dab0-44e9-959f-b2e001716ae7"
        fi
    fi
    #--------------------
    if [ "$SB_CSCOPE_EXISTS_ON_PATH" == "" ]; then
        SB_CSCOPE_EXISTS_ON_PATH="f"
        if [ "`which cscope 2> /dev/null`" != "" ]; then
            SB_CSCOPE_EXISTS_ON_PATH="t"
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "cscope" "469962b2-3434-4879-8a5f-b2e001716ae7"
        fi
    fi
    #--------------------
    if [ "$SB_CTAGS_EXISTS_ON_PATH" == "" ]; then
        SB_CTAGS_EXISTS_ON_PATH="f"
        if [ "`which ctags 2> /dev/null`" != "" ]; then
            SB_CTAGS_EXISTS_ON_PATH="t"
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "ctags" "271a0541-4313-4cf2-bc5f-b2e001716ae7"
        fi
    fi
    #--------------------
    if [ "$SB_MAKEDEPEND_EXISTS_ON_PATH" == "" ]; then
        SB_MAKEDEPEND_EXISTS_ON_PATH="f"
        if [ "`which makedepend 2> /dev/null`" != "" ]; then
            SB_MAKEDEPEND_EXISTS_ON_PATH="t"
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "makedepend" "5caf8bc4-d631-487c-9f1f-b2e001716ae7"
            if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
                if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
                    if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
                        echo ""
                        echo "\"makedepend\" MIGHT be available form the "
                        echo "operating system standard package collection."
                        echo "In the case of Debian based operating systems "
                        echo "it MIGHT be installed by executing "
                        echo -e "\e[36m"
                        echo "    apt-get install xutils-dev "
                        echo -e "\e[39m"
                        echo "GUID=='159b12c3-e880-45a8-883d-b2e001716ae7'"
                        echo ""
                    fi
                fi
            fi
        fi
    fi
    #--------------------
    if [ "$SB_BOB_EXISTS_ON_PATH" == "" ]; then
        SB_BOB_EXISTS_ON_PATH="f"
        if [ "`which bob 2> /dev/null`" != "" ]; then
            SB_BOB_EXISTS_ON_PATH="t"
            # There are many different command line tools named "bob".
            #      pipx install BobBuildTool
            #      npm install bob
            #      https://github.com/MordechaiHadad/bob
            #      https://github.com/gorhom/bob
            #      etc.
            #  so a warning message should specify,
            #  which "bob" is required, if any.
        # else
        #     func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        #         "bob" "a3a3d713-5e37-4430-813e-b2e001716ae7"
        fi
    fi
    #--------------------
    if [ "$SB_BOB_EXISTS_ON_PATH" == "t" ]; then
        if [ "$SB_BOBBUILDTOOL_EXISTS_ON_PATH" == "" ]; then
            SB_BOBBUILDTOOL_EXISTS_ON_PATH="f"
            S_TMP_0="`which bob 2>/dev/null | grep -E '[.]mmmv[/]mmmv_python_pipx[/]bin[/]bob$'`"
            if [ "$S_TMP_0" != "" ]; then
                SB_BOBBUILDTOOL_EXISTS_ON_PATH="t"
            else
                func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                    "bob" "62c2f823-70cb-4006-a01e-b2e001716ae7"
                if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
                    echo "\"bob\" MIGHT be installed by executing "
                    echo -e "\e[36m"
                    echo "    pipx install BobBuildTool "
                    # Other installation options like
                    #     npm install bob
                    # are omitted from this message in the name of simplicity.
                    echo -e "\e[39m"
                    echo "GUID=='6f0829c5-d0a2-455b-965d-b2e001716ae7'"
                    echo ""
                fi
            fi
        fi
    fi
    #--------------------
    if [ "$SB_FLEX_EXISTS_ON_PATH" == "" ]; then
        SB_FLEX_EXISTS_ON_PATH="f"
        if [ "`which flex 2> /dev/null`" != "" ]; then
            SB_FLEX_EXISTS_ON_PATH="t"
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "flex" "19523d05-120e-4ab7-9e5e-b2e001716ae7"
        fi
    fi
    #--------------------
    if [ "$SB_JFLEX_EXISTS_ON_PATH" == "" ]; then
        SB_JFLEX_EXISTS_ON_PATH="f"
        if [ "`which jflex 2> /dev/null`" != "" ]; then
            SB_JFLEX_EXISTS_ON_PATH="t"
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "jflex" "2185c104-85c0-4887-982e-b2e001716ae7"
        fi
    fi
    #--------------------
    if [ "$SB_FLEXPP_EXISTS_ON_PATH" == "" ]; then
        SB_FLEXPP_EXISTS_ON_PATH="f"
        if [ "`which flex++ 2> /dev/null`" != "" ]; then
            SB_FLEXPP_EXISTS_ON_PATH="t"
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "flex++" "2e3a0433-d0ca-4fe1-855e-b2e001716ae7"
        fi
    fi
    #--------------------
    if [ "$SB_JAM_EXISTS_ON_PATH" == "" ]; then
        SB_JAM_EXISTS_ON_PATH="f"
        if [ "`which jam 2> /dev/null`" != "" ]; then
            SB_JAM_EXISTS_ON_PATH="t"
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "jam" "1bfd9e99-ddd6-46ed-9e4e-b2e001716ae7"
        fi
    fi
    #--------------------
    if [ "$SB_MAKE_EXISTS_ON_PATH" == "" ]; then
        SB_MAKE_EXISTS_ON_PATH="f"
        if [ "`which make 2> /dev/null`" != "" ]; then
            SB_MAKE_EXISTS_ON_PATH="t"
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "make" "639c9de4-702f-41e0-a9ae-b2e001716ae7"
        fi
    fi
    #--------------------
    if [ "$SB_CMAKE_EXISTS_ON_PATH" == "" ]; then
        SB_CMAKE_EXISTS_ON_PATH="f"
        if [ "`which cmake 2> /dev/null`" != "" ]; then
            SB_CMAKE_EXISTS_ON_PATH="t"
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "cmake" "3f384cc5-94f8-4f01-bb2e-b2e001716ae7"
        fi
    fi
    #--------------------
    if [ "$SB_MAKEPKG_EXISTS_ON_PATH" == "" ]; then
        SB_MAKEPKG_EXISTS_ON_PATH="f"
        if [ "`which makepkg 2> /dev/null`" != "" ]; then
            SB_MAKEPKG_EXISTS_ON_PATH="t"
            # https://wiki.archlinux.org/title/Makepkg
            # ------------citation----start---------------------
            # makepkg is a script to automate the building of
            # packages. The requirements for using the script
            # are a build-capable Unix platform and a PKGBUILD.
            # ------------citation----end-----------------------
            #
            # https://wiki.archlinux.org/title/PKGBUILD
            # ------------citation----start---------------------
            # A PKGBUILD is a Bash script containing the build
            # information required by Arch Linux packages.
            # ------------citation----end-----------------------
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "makepkg" "567831f4-f591-4272-bf2e-b2e001716ae7"
        fi
    fi
    #--------------------
    if [ "$SB_NINJA_EXISTS_ON_PATH" == "" ]; then
        SB_NINJA_EXISTS_ON_PATH="f"
        if [ "`which ninja 2> /dev/null`" != "" ]; then
            SB_NINJA_EXISTS_ON_PATH="t"
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "ninja" "3414b311-16ea-4832-a34e-b2e001716ae7"
        fi
    fi
    #--------------------
    if [ "$SB_GMAKE_EXISTS_ON_PATH" == "" ]; then
        SB_GMAKE_EXISTS_ON_PATH="f"
        if [ "`which gmake 2> /dev/null`" != "" ]; then
            SB_GMAKE_EXISTS_ON_PATH="t"
            # On FreeBSD the BSD make has the name "make"
            # and the GNU make has the name "gmake".
            # On Linux the GNU make has the name "make".
        else
            if [ "$SB_OPERATINGSYSTEM_LINUX" == "f" ]; then
                func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                    "gmake" "11e5d0a3-86a3-4603-a54e-b2e001716ae7"
            else
                if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "t" ]; then
                    # The Termux Linux uses the BSD flavor of the common command line tools.
                    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                        "gmake" "0e135c77-129b-43ac-8c5e-b2e001716ae7"
                fi
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
    if [ "$SB_PMAKE_EXISTS_ON_PATH" == "" ]; then
        SB_PMAKE_EXISTS_ON_PATH="f"
        if [ "`which pmake 2> /dev/null`" != "" ]; then
            SB_PMAKE_EXISTS_ON_PATH="t"
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "pmake" "15b113ac-a768-4285-afee-b2e001716ae7"
        fi
    fi
    #--------------------
    if [ "$SB_BAZEL_EXISTS_ON_PATH" == "" ]; then
        SB_BAZEL_EXISTS_ON_PATH="f"
        S_FP_BAZEL="`which bazel 2> /dev/null`"
        if [ "$S_FP_BAZEL" != "" ]; then
            SB_BAZEL_EXISTS_ON_PATH="t"
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "bazel" "9f440d76-d1f1-4577-b7ee-b2e001716ae7"
        fi
    fi
    # if [ "$SB_BAZEL_EXISTS_ON_PATH" == "t" ]; then
    #     if [ "$S_FP_BAZEL" != "" ]; then
    #         alias mmmv_bazel_something="$S_FP_BAZEL something"
    #     fi
    # fi
    #--------------------
    if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
        if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
            if [ "$SB_REFLEX_EXISTS_ON_PATH" == "" ]; then
                SB_REFLEX_EXISTS_ON_PATH="f"
                if [ "`which reflex 2> /dev/null`" != "" ]; then
                    SB_REFLEX_EXISTS_ON_PATH="t"
                    # Citation from reflex man page: "Reflex is a small tool
                    # to watch a directory and rerun a command when certain
                    # files change. It's great for automatically running
                    # compile/lint/test tasks and for reloading your application
                    # when the code changes."
                else
                    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                        "reflex" "5541e454-b99f-4132-a63e-b2e001716ae7"
                fi
            fi
        fi
    fi
    #--------------------
fi
#--------------------
if [ "$SB_SORT_EXISTS_ON_PATH" == "" ]; then
    SB_SORT_EXISTS_ON_PATH="f"
    if [ "`which sort 2> /dev/null`" != "" ]; then
        SB_SORT_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "sort" "3802b3f4-81b6-409b-b02e-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_TSORT_EXISTS_ON_PATH" == "" ]; then
    SB_TSORT_EXISTS_ON_PATH="f"
    if [ "`which tsort 2> /dev/null`" != "" ]; then
        # tsort is a directed graph topological sorting application.
        #
        #     ts3b@terminal01:/opt/andmekettad/RAM_200MiB_01$ cat ./dependencies.txt
        #     a b
        #     a c
        #     d a
        #     ts3b@terminal01:/opt/andmekettad/RAM_200MiB_01$ tsort ./dependencies.txt
        #     d
        #     a
        #     c
        #     b
        #     ts3b@terminal01:/opt/andmekettad/RAM_200MiB_01$
        #
        SB_TSORT_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "tsort" "36ec0c43-7054-4c60-905e-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_UNIQ_EXISTS_ON_PATH" == "" ]; then
    SB_UNIQ_EXISTS_ON_PATH="f"
    if [ "`which uniq 2> /dev/null`" != "" ]; then
        SB_UNIQ_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "uniq" "422c4c03-a0db-467a-963e-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_STRINGS_EXISTS_ON_PATH" == "" ]; then
    SB_STRINGS_EXISTS_ON_PATH="f"
    if [ "`which strings 2> /dev/null`" != "" ]; then
        SB_STRINGS_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "strings" "0bae6802-cac8-4619-992e-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_TR_EXISTS_ON_PATH" == "" ]; then
    SB_TR_EXISTS_ON_PATH="f"
    if [ "`which tr 2> /dev/null`" != "" ]; then
        SB_TR_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "tr" "3fd4a992-ec43-4ff6-af2e-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_REV_EXISTS_ON_PATH" == "" ]; then
    SB_REV_EXISTS_ON_PATH="f"
    if [ "`which rev 2> /dev/null`" != "" ]; then
        SB_REV_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "rev" "257245f2-a4db-4823-b91e-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_BASENAME_EXISTS_ON_PATH" == "" ]; then
    SB_BASENAME_EXISTS_ON_PATH="f"
    if [ "`which basename 2> /dev/null`" != "" ]; then
        SB_BASENAME_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "basename" "5f792242-278c-46c2-ac2e-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_DIRNAME_EXISTS_ON_PATH" == "" ]; then
    SB_DIRNAME_EXISTS_ON_PATH="f"
    if [ "`which dirname 2> /dev/null`" != "" ]; then
        SB_DIRNAME_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "dirname" "3c656332-5caf-4510-a01e-b2e001716ae7"
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_I3MSG_EXISTS_ON_PATH" == "" ]; then
    SB_I3MSG_EXISTS_ON_PATH="f"
    S_FP_I3MSG="`which i3-msg 2> /dev/null`"
    # The i3-msg is part of the i3 window manager:
    # https://i3wm.org/
    if [ "$S_FP_I3MSG" != "" ]; then
        SB_I3MSG_EXISTS_ON_PATH="t"
    else
        if [ "$SB_I3WINDOW_MANAGER_EXPECTED_TO_BE_INSTALLABLE" == "t" ]; then
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                echo ""
                echo -e "You MIGHT want to install the\e[33m i3 window manager\e[39m."
                echo "https://i3wm.org/"
                echo "GUID=='0478fcca-ace1-41a8-a76d-b2e001716ae7'"
                echo ""
            fi
        fi
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_VIM_EXISTS_ON_PATH" == "" ]; then
    SB_VIM_EXISTS_ON_PATH="f"
    S_FP_VIM="`which vim 2> /dev/null`"
    if [ "$S_FP_VIM" != "" ]; then
        SB_VIM_EXISTS_ON_PATH="t"
        # https://www.vim.org
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "vim" "4a92f8c4-ba9c-4838-972e-b2e001716ae7"
    fi
fi
if [ "$S_FP_VIM" == "" ]; then
    S_FP_VIM="`which vim 2> /dev/null`"
fi
#if [ "$SB_VIM_EXISTS_ON_PATH" == "t" ]; then
    if [ "$S_FP_VIM" != "" ]; then
        alias mmmv_texteditor_Vim="$S_FP_VIM"
    fi
#fi
#--------------------
if [ "$SB_VI_EXISTS_ON_PATH" == "" ]; then
    SB_VI_EXISTS_ON_PATH="f"
    S_FP_VI="`which vi 2> /dev/null`"
    if [ "$S_FP_VI" != "" ]; then
        SB_VI_EXISTS_ON_PATH="t"
    # else
    # # outcommented, because Vim is a superset of Vi.
    #     func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
    #         "vi" "1e49c2d2-099f-4a86-8d1d-b2e001716ae7"
    fi
fi
if [ "$S_FP_VI" == "" ]; then
    S_FP_VI="`which vi 2> /dev/null`"
fi
#if [ "$SB_VI_EXISTS_ON_PATH" == "t" ]; then
    if [ "$S_FP_VI" != "" ]; then
        alias mmmv_texteditor_Vi="$S_FP_VI"
    fi
#fi
#--------------------------------------------------------------------------
MMMV_USERSPACE_DISTRO_T1_FP_VIMWIKI_INSTALLATION_SCRIPT="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/lib/templates/vimwiki/2022_11_21_installation_package_by_3rd_party/try_to_install.bash"
if [ "$SB_VIM_EXISTS_ON_PATH" == "t" ]; then
    func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
        "$MMMV_USERSPACE_DISTRO_T1_FP_VIMWIKI_INSTALLATION_SCRIPT" \
        "a205fba3-cefe-412f-af4d-b2e001716ae7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        alias mmmv_admin_install_vimwiki="$MMMV_USERSPACE_DISTRO_T1_FP_VIMWIKI_INSTALLATION_SCRIPT"
    else
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo "Vim exists, but the file "
            echo "$MMMV_USERSPACE_DISTRO_T1_FP_VIMWIKI_INSTALLATION_SCRIPT"
            echo -e "\e[31mis missing\e[39m. Leaving at least one alias undefined."
            echo "GUID=='e3421534-be94-4c28-821d-b2e001716ae7'"
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
        "$S_TMP_1" "1a8e9235-c709-4bc9-a04d-b2e001716ae7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        alias mmmv_vim_open_overwriteable_txt="$S_FP_NICE -n 2 vim $S_TMP_1"
    fi
    #--------------------
fi
#--------------------
if [ "$SB_ANJUTA_EXISTS_ON_PATH" == "" ]; then
    SB_ANJUTA_EXISTS_ON_PATH="f"
    S_FP_ANJUTA="`which anjuta 2> /dev/null`"
    if [ "$S_FP_ANJUTA" != "" ]; then
        SB_ANJUTA_EXISTS_ON_PATH="t"
        # As of 2025_03_14 the Anjuta is a dead project,
        # but it can still be available from some
        # operating system standard package collections.
        # https://sourceforge.net/projects/anjuta/
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "anjuta" "2ff2fee4-f0c3-419d-b21d-b2e001716ae7"
    fi
fi
#if [ "$SB_ANJUTA_EXISTS_ON_PATH" == "t" ]; then
    if [ "$S_FP_ANJUTA" != "" ]; then
        alias mmmv_IDE_Anjuta="$S_FP_ANJUTA"
    fi
#fi
#--------------------
if [ "$SB_GEANY_EXISTS_ON_PATH" == "" ]; then
    SB_GEANY_EXISTS_ON_PATH="f"
    S_FP_GEANY="`which geany 2> /dev/null`"
    if [ "$S_FP_GEANY" != "" ]; then
        SB_GEANY_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "geany" "257ef8d1-b11b-4108-9e2d-b2e001716ae7"
    fi
fi
if [ "$S_FP_GEANY" == "" ]; then
    S_FP_GEANY="`which geany 2> /dev/null`"
fi
#if [ "$SB_GEANY_EXISTS_ON_PATH" == "t" ]; then
    if [ "$S_FP_GEANY" != "" ]; then
        alias mmmv_texteditor_Geany="$S_FP_GEANY"
        alias mmmv_IDE_Geany="$S_FP_GEANY"
    fi
#fi
#--------------------
if [ "$SB_KATE_EXISTS_ON_PATH" == "" ]; then
    SB_KATE_EXISTS_ON_PATH="f"
    S_FP_KATE="`which kate 2> /dev/null`"
    if [ "$S_FP_KATE" != "" ]; then
        SB_KATE_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "kate" "d156e11c-f46e-45c4-8c7d-b2e001716ae7"
    fi
fi
if [ "$S_FP_KATE" == "" ]; then
    S_FP_KATE="`which kate 2> /dev/null`"
fi
#if [ "$SB_KATE_EXISTS_ON_PATH" == "t" ]; then
    if [ "$S_FP_KATE" != "" ]; then
        alias mmmv_texteditor_Kate="$S_FP_KATE"
    fi
#fi
#--------------------
if [ "$SB_TEA_EXISTS_ON_PATH" == "" ]; then
    SB_TEA_EXISTS_ON_PATH="f"
    S_FP_TEA="`which tea 2> /dev/null`"
    if [ "$S_FP_TEA" != "" ]; then
        SB_TEA_EXISTS_ON_PATH="t"
        # http://tea.ourproject.org/
        # 2025_03 era home page of the main author of the TEA:
        # https://psemiletov.github.io/
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "tea" "a6b7c2a3-b5e6-4469-ba3d-b2e001716ae7"
    fi
fi
if [ "$S_FP_TEA" == "" ]; then
    S_FP_TEA="`which tea 2> /dev/null`"
fi
#if [ "$SB_TEA_EXISTS_ON_PATH" == "t" ]; then
    if [ "$S_FP_TEA" != "" ]; then
        alias mmmv_texteditor_TEA="$S_FP_TEA"
    fi
#fi
#--------------------
if [ "$SB_TEXMAKER_EXISTS_ON_PATH" == "" ]; then
    SB_TEXMAKER_EXISTS_ON_PATH="f"
    S_FP_TEXMAKER="`which texmaker 2> /dev/null`"
    if [ "$S_FP_TEXMAKER" != "" ]; then
        SB_TEXMAKER_EXISTS_ON_PATH="t"
        # https://www.xm1math.net/texmaker/
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "texmaker" "6f29e9d0-d35b-4a26-945d-b2e001716ae7"
    fi
fi
#if [ "$SB_TEXMAKER_EXISTS_ON_PATH" == "t" ]; then
    if [ "$S_FP_TEXMAKER" != "" ]; then
        alias mmmv_editor_LaTeX_Texmaker="$S_FP_TEXMAKER"
    fi
#fi
#--------------------------------------------------------------------------
#::::::::::::::::::::::::::::::web::browsers:::::::::::::::::::::::::::::::
#--------------------------------------------------------------------------
S_CMD_NICE_WEBBROWSER=""
if [ "$S_FP_NICE" != "" ]; then
    S_CMD_NICE_WEBBROWSER="$S_FP_NICE -n 5 "
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    #--------------------
    S_FP_UZBL="`which uzbl 2> /dev/null`"
    SB_UZBL_EXISTS_ON_PATH="f"
    if [ "$S_FP_UZBL" != "" ]; then
        SB_UZBL_EXISTS_ON_PATH="t"
    fi
    if [ "$SB_UZBL_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_webbrowser_Uzbl="$S_CMD_NICE_WEBBROWSER $S_FP_UZBL "
        # https://www.uzbl.org/
        # https://github.com/uzbl/
    fi
    #--------------------
    S_FP_DILLO="`which dillo 2> /dev/null`"
    SB_DILLO_EXISTS_ON_PATH="f"
    if [ "$S_FP_DILLO" != "" ]; then
        SB_DILLO_EXISTS_ON_PATH="t"
    fi
    if [ "$SB_DILLO_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_webbrowser_Dillo="$S_CMD_NICE_WEBBROWSER $S_FP_DILLO "
        #--------------------
        S_FP_DILLORC_TEMPLATE="/home/mmmv/mmmv_userspace_distro_t1/mmmv/lib/templates/2023_06_02_archive_org_copy_of_dillo_org_dillorc.txt"
        # The alias singleliner has been divided between the
        S_TMP_1="S_FP_TEMPLATE=\"$S_FP_DILLORC_TEMPLATE\" ; if [ -e \"\$S_FP_TEMPLATE\" ]; then if [ -d \"\$S_FP_TEMPLATE\" ]; then echo \"\" ; echo \"The template \" ; echo \"\" ; echo \" \$S_FP_TEMPLATE\" ; echo \"\" ; if [ -h \"\$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mis a symlink to a folder\\e[39m.\" ; else echo -e \"\\e[31mis a folder\\e[39m.\" ; fi ; echo \"but a file is expected.\" ; echo \"GUID=='4224a195-03fe-4169-8cdd-b2e001716ae7'\" ; echo \"\" ; else S_FP_DILLO_HOME=\"\$HOME/.dillo\" ; S_FP_DILLORC=\"\$S_FP_DILLO_HOME/dillorc\" ; if [ ! -e \"\$S_FP_DILLO_HOME\" ]; then if [ -h \"\$S_FP_DILLO_HOME\" ]; then echo \"\" ; echo \"The \" ; echo \"\" ; echo \" \$S_FP_DILLO_HOME \" ; echo \"\" ; echo -e \"\\e[31mis a broken symlink\\e[39m.\" ; echo \"Failed to create Dillo configuration file.\" ; echo \"GUID=='034ef224-2915-42c8-884d-b2e001716ae7'\" ; echo \"\" ; else mkdir \"\$S_FP_DILLO_HOME\" ; wait ; sync ; wait ; fi ; fi ; "
        S_TMP_2="if [ -e \"\$S_FP_DILLO_HOME\" ]; then if [ -d \"\$S_FP_DILLO_HOME\" ]; then if [ -e \"\$S_FP_DILLORC\" ]; then echo \"\" ; echo \"The \" ; echo \"\" ; echo \" \$S_FP_DILLORC\" ; echo \"\" ; if [ -d \"\$S_FP_DILLORC\" ]; then echo -e \"\\e[31malready exists\\e[39m and\" ; if [ -h \"\$S_FP_DILLORC\" ]; then echo -e \"\\e[31mit is a symlink to a folder\\e[39m despite \" ; else echo -e \"\\e[31mit is a folder\\e[39m despite \" ; fi ; echo \"the fact that a file is expected.\" ; else echo -e \"\\e[31malready exists\\e[39m.\" ; fi ; echo \"Not overwriting it.\" ; echo \"GUID=='c1f2621f-4255-474c-aa5d-b2e001716ae7'\" ; echo \"\" ; else if [ -h \"\$S_FP_DILLORC\" ]; then echo \"\" ; echo \"The \" ; echo \"\" ; echo \" \$S_FP_DILLORC\" ; echo \"\" ; echo -e \"\\e[31mis a broken symlink\\e[39m.\" ; echo \"Not overwriting it.\" ; echo \"GUID=='2942d2e5-65a6-4459-948c-b2e001716ae7'\" ; echo \"\" ; else cp \"\$S_FP_TEMPLATE\" \"\$S_FP_DILLORC\" ; wait ; sync ; wait ; if [ ! -e \"\$S_FP_DILLORC\" ]; then echo \"\" ; echo -e \"\\e[31mFailed to create\\e[39m the \" ; echo \"\" ; echo \" \$S_FP_DILLORC\" ; echo \"\" ; echo \"GUID=='31b95323-285d-4260-821c-b2e001716ae7'\" ; echo \"\" ; else chmod -f -R 0700 \"\$S_FP_DILLO_HOME\" ; wait ; sync ; wait ; echo \"\" ; echo -e \"\\e[32mCreated\\e[39m \$S_FP_DILLORC\" ; echo \"\" ; fi ; fi ; fi ; else echo \"\" ; echo \"The \" ; echo \"\" ; echo \" \$S_FP_DILLO_HOME \" ; echo \"\" ; echo \"exists, but it is neither a folder \" ; echo \"nor a symlink to a folder.\" ; echo \"GUID=='3cacd492-26aa-44d0-a25c-b2e001716ae7'\" ; echo \"\" ; fi ; else echo \"\" ; echo -e \"\\e[31mFailed to create folder \\e[39m\" ; echo \"\" ; echo \" \$S_FP_DILLO_HOME \" ; echo \"\" ; echo \"GUID=='f15d81ac-b35d-4645-911c-b2e001716ae7'\" ; echo \"\" ; fi ; fi ; else echo \"\" ; echo \"The template \" ; echo \"\" ; echo \" \$S_FP_TEMPLATE\" ; echo \"\" ; echo -e \"\\e[31mdoes not exist\\e[39m.\" ; echo \"GUID=='5fdcd893-a987-4c7a-8f4c-b2e001716ae7'\" ; echo \"\" ; fi ; "
        # cope with a Vim flaw/bug that crashes the Vim. The
        #
        #     $HOME/.dillo/dillorc
        #
        # template has been downloaded on 2023_09_02 from
        #
        #     https://web.archive.org/web/20220515221251/https://dillo.org/dillorc
        #
        func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
            "$S_FP_DILLORC_TEMPLATE" "a4e60b00-989e-473d-902d-b2e001716ae7" \
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
        #         echo "GUID=='b73c0946-4c21-4051-8ddc-b2e001716ae7'" ;
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
        #                 echo "GUID=='b5a5e2fa-5331-419b-859c-b2e001716ae7'" ;
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
        #                     echo "GUID=='268eac22-64e3-49fd-9d3c-b2e001716ae7'" ;
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
        #                         echo "GUID=='a5eef2d4-32c2-4aae-881c-b2e001716ae7'" ;
        #                         echo "" ;
        #                     else
        #                         cp "$S_FP_TEMPLATE"  "$S_FP_DILLORC" ; wait ; sync ; wait ;
        #                         if [ ! -e "$S_FP_DILLORC" ]; then
        #                             echo "" ;
        #                             echo -e "\e[31mFailed to create\e[39m the " ;
        #                             echo "" ;
        #                             echo "    $S_FP_DILLORC" ;
        #                             echo "" ;
        #                             echo "GUID=='258ee113-cb52-4c09-843c-b2e001716ae7'" ;
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
        #                 echo "GUID=='51c45b6a-fd1b-49da-a83c-b2e001716ae7'" ;
        #                 echo "" ;
        #             fi ;
        #         else
        #             echo "" ;
        #             echo -e "\e[31mFailed to create folder \e[39m" ;
        #             echo "" ;
        #             echo "    $S_FP_DILLO_HOME " ;
        #             echo "" ;
        #             echo "GUID=='f474876d-90af-4923-a63c-b2e001716ae7'" ;
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
        #     echo "GUID=='6419cc07-e7b6-4340-ae7c-b2e001716ae7'" ;
        #     echo "" ;
        # fi ;
        #
        #--------------------
    fi
    #--------------------
    S_FP_DILLOPLUS="`which dillo-plus 2> /dev/null`"
    SB_DILLOPLUS_EXISTS_ON_PATH="f"
    if [ "$S_FP_DILLOPLUS" != "" ]; then
        SB_DILLOPLUS_EXISTS_ON_PATH="t"
    fi
    if [ "$SB_DILLOPLUS_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_webbrowser_DilloPlus="$S_CMD_NICE_WEBBROWSER $S_FP_DILLOPLUS "
        # DilloPlus is a Dillo fork that as of 2024_12
        # supports also Gopher and Gemini protocols.
    fi
    #--------------------
    S_FP_CHROMIUM="`which chromium 2> /dev/null`"
    SB_CHROMIUM_EXISTS_ON_PATH="f"
    if [ "$S_FP_CHROMIUM" != "" ]; then
        SB_CHROMIUM_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "chromium" "91784ba5-6381-4aaa-872d-b2e001716ae7"
    fi
    if [ "$SB_CHROMIUM_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_webbrowser_Chromium="$S_CMD_NICE_WEBBROWSER $S_FP_CHROMIUM "
        # Chromium is a noncorporate fork of the Google Chrome web browser.
    fi
    #--------------------
    S_FP_LINKS="`which links 2> /dev/null`"
    SB_LINKS_EXISTS_ON_PATH="f"
    if [ "$S_FP_LINKS" != "" ]; then
        SB_LINKS_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "links" "1f92af92-d262-43cb-b71d-b2e001716ae7"
    fi
    if [ "$SB_LINKS_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_webbrowser_links="$S_CMD_NICE_WEBBROWSER $S_FP_LINKS "
        # links is a terminal based web browser.
    fi
    #--------------------
    S_FP_ELINKS="`which elinks 2> /dev/null`"
    SB_ELINKS_EXISTS_ON_PATH="f"
    if [ "$S_FP_ELINKS" != "" ]; then
        SB_ELINKS_EXISTS_ON_PATH="t"
    fi
    if [ "$SB_ELINKS_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_webbrowser_elinks="$S_CMD_NICE_WEBBROWSER $S_FP_ELINKS "
        # ELinks is a terminal based web browser.
        # http://elinks.cz/
    fi
    #--------------------
    S_FP_LYNX="`which lynx 2> /dev/null`"
    SB_LYNX_EXISTS_ON_PATH="f"
    if [ "$S_FP_LYNX" != "" ]; then
        SB_LYNX_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "lynx" "d19754b7-b52f-48c9-961d-b2e001716ae7"
    fi
    if [ "$SB_LYNX_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_webbrowser_lynx="$S_CMD_NICE_WEBBROWSER $S_FP_LYNX "
        # lynx is a terminal based web browser.
    fi
    #--------------------
    S_FP_NETRIK="`which netrik 2> /dev/null`"
    SB_NETRIK_EXISTS_ON_PATH="f"
    if [ "$S_FP_NETRIK" != "" ]; then
        SB_NETRIK_EXISTS_ON_PATH="t"
    fi
    if [ "$SB_NETRIK_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_webbrowser_netrik="$S_CMD_NICE_WEBBROWSER $S_FP_NETRIK "
        # Netrik is a terminal based web browser.
        # https://netrik.sourceforge.net/
    fi
    #--------------------
    # "netsurf" crashes on Raspberry_Pi_1 specific Debian-like
    # 2023 era operating system named Raspbian, but
    # "netsurf-gtk" seems to work just fine.
    #S_FP_NETSURF="`which netsurf 2> /dev/null`"
    S_FP_NETSURF="`which netsurf-gtk 2> /dev/null`"
    SB_NETSURF_EXISTS_ON_PATH="f"
    if [ "$S_FP_NETSURF" != "" ]; then
        SB_NETSURF_EXISTS_ON_PATH="t"
    fi
    if [ "$SB_NETSURF_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_webbrowser_NetSurf="$S_CMD_NICE_WEBBROWSER $S_FP_NETSURF "
        #alias netsurf="$S_FP_NETSURF "
    fi
    #--------------------
    S_FP_REKONQ="`which rekonq 2> /dev/null`"
    SB_REKONQ_EXISTS_ON_PATH="f"
    if [ "$S_FP_REKONQ" != "" ]; then
        SB_REKONQ_EXISTS_ON_PATH="t"
    fi
    if [ "$SB_REKONQ_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_webbrowser_Rekonq="$S_CMD_NICE_WEBBROWSER $S_FP_REKONQ "
    fi
    #--------------------
    S_FP_MIDORI="`which midori 2> /dev/null`"
    SB_MIDORI_EXISTS_ON_PATH="f"
    if [ "$S_FP_MIDORI" != "" ]; then
        SB_MIDORI_EXISTS_ON_PATH="t"
    fi
    if [ "$SB_MIDORI_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_webbrowser_midori="$S_CMD_NICE_WEBBROWSER $S_FP_MIDORI "
    fi
    #--------------------
    S_FP_ICEWEASEL="`which iceweasel 2> /dev/null`"
    SB_ICEWEASEL_EXISTS_ON_PATH="f"
    if [ "$S_FP_ICEWEASEL" != "" ]; then
        SB_ICEWEASEL_EXISTS_ON_PATH="t"
    fi
    if [ "$SB_ICEWEASEL_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_webbrowser_iceweasel="$S_CMD_NICE_WEBBROWSER $S_FP_ICEWEASEL "
    fi
    #--------------------
    S_FP_FIREFOX="`which firefox 2> /dev/null`"
    SB_FIREFOX_EXISTS_ON_PATH="f"
    if [ "$S_FP_FIREFOX" != "" ]; then
        SB_FIREFOX_EXISTS_ON_PATH="t"
    fi
    if [ "$SB_FIREFOX_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_webbrowser_firefox="$S_CMD_NICE_WEBBROWSER $S_FP_FIREFOX "
    fi
    #--------------------
    S_FP_QUTEBROWSER="`which qutebrowser 2> /dev/null`"
    SB_QUTEBROWSER_EXISTS_ON_PATH="f"
    if [ "$S_FP_QUTEBROWSER" != "" ]; then
        SB_QUTEBROWSER_EXISTS_ON_PATH="t"
    fi
    if [ "$SB_QUTEBROWSER_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_webbrowser_qutebrowser="$S_CMD_NICE_WEBBROWSER $S_FP_QUTEBROWSER "
        #--------
        # https://github.com/qutebrowser/qutebrowser/discussions/6485
        # archival copy: https://archive.ph/zx3lF
        alias mmmv_qutebrowser_clear_cache_t1="sync ; wait ; killall qutebrowser ; wait ; sync ; rm -fr $HOME/.local/share/qutebrowser ; rm -fr $HOME/.local/share/qutebrowser/webengine ; rm -fr $HOME/.cache/qutebrowser ; wait ; sync ; wait ;"
        #--------
    fi
    #--------------------
    S_FP_EPIPHANY="`which epiphany 2> /dev/null`"
    SB_EPIPHANY_EXISTS_ON_PATH="f"
    if [ "$S_FP_EPIPHANY" != "" ]; then
        SB_EPIPHANY_EXISTS_ON_PATH="t"
    fi
    if [ "$SB_EPIPHANY_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_webbrowser_epiphany="$S_CMD_NICE_WEBBROWSER $S_FP_EPIPHANY "
    fi
    #--------------------
    S_FP_KONQUEROR="`which konqueror 2> /dev/null`"
    SB_KONQUEROR_EXISTS_ON_PATH="f"
    if [ "$S_FP_KONQUEROR" != "" ]; then
        SB_KONQUEROR_EXISTS_ON_PATH="t"
    fi
    if [ "$SB_KONQUEROR_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_webbrowser_konqueror="$S_CMD_NICE_WEBBROWSER $S_FP_KONQUEROR "
        alias mmmv_filemanager_konqueror="$S_CMD_NICE_WEBBROWSER $S_FP_KONQUEROR "
    fi
    #--------------------
    S_FP_FALKON="`which falkon 2> /dev/null`"
    SB_FALKON_EXISTS_ON_PATH="f"
    if [ "$S_FP_FALKON" != "" ]; then
        SB_FALKON_EXISTS_ON_PATH="t"
    fi
    if [ "$SB_FALKON_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_webbrowser_falkon="$S_CMD_NICE_WEBBROWSER $S_FP_FALKON "
    fi
    #--------------------
    S_FP_W3M="`which w3m 2> /dev/null`"
    SB_W3M_EXISTS_ON_PATH="f"
    if [ "$S_FP_W3M" != "" ]; then
        SB_W3M_EXISTS_ON_PATH="t"
    fi
    if [ "$SB_W3M_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_webbrowser_w3m="$S_CMD_NICE_WEBBROWSER $S_FP_W3M "
        # w3m is a terminal based web browser.
        # https://w3m.sourceforge.net/
    fi
    #--------------------
    S_FP_QUTEBROWSER="`which qutebrowser 2> /dev/null`"
    SB_QUTEBROWSER_EXISTS_ON_PATH="f"
    if [ "$S_FP_QUTEBROWSER" != "" ]; then
        SB_QUTEBROWSER_EXISTS_ON_PATH="t"
    fi
    if [ "$S_FP_QUTEBROWSER" == "t" ]; then
        #--------
        # The
        S_FP_0="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin_installed_program_specific/qutebrowser_specific/bin/qb"
        # is a wrapper script to the qutebrowser.
        func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
            "$S_FP_0" \
            "a183dacd-f7a8-45f2-91fd-b2e001716ae7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
            S_FP_QUTEBROWSER="$S_FP_0"
        fi
        #--------
        alias mmmv_webbrowser_qutebrowser="$S_CMD_NICE_WEBBROWSER $S_FP_QUTEBROWSER "
        #--------
    fi
    #--------------------
fi
#--------------------------------------------------------------------------
#::::::::::::::::::::::video::and::audio::players::::::::::::::::::::::::::
#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    #----------------------------------------------------------------------
    if [ "$SB_MPLAYER_EXISTS_ON_PATH" == "" ]; then
        SB_MPLAYER_EXISTS_ON_PATH="f"
        if [ "`which mplayer 2> /dev/null`" != "" ]; then
            SB_MPLAYER_EXISTS_ON_PATH="t"
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "mplayer" "32b34663-5fa4-4f74-8b5d-b2e001716ae7"
        fi
    fi
    if [ "$SB_MPLAYER_EXISTS_ON_PATH" == "t" ]; then
        #--------------------
        S_TMP_0="$S_FP_NICE -n 1 mplayer "
        alias mmmv_videoplayer_mplayer="$S_TMP_0"
        alias mmmv_soundplayer_mplayer="$S_TMP_0"
        #--------------------
        # The
        # alias mmmv_videoplayer_mplayer_ASCII_caca_t1="$S_TMP_0 -vo caca "
        # is outcommented, because it plays only sound and
        # it does not display video.
        #--------------------
        S_TMP_0="$S_FP_NICE -n 1 mplayer -loop 0 "
        alias mmmv_videoplayer_mplayer_loop_t1="$S_TMP_0"
        alias mmmv_soundplayer_mplayer_loop_t1="$S_TMP_0"
        #--------------------
    fi
    #----------------------------------------------------------------------
    if [ "$SB_MPV_EXISTS_ON_PATH" == "" ]; then
        SB_MPV_EXISTS_ON_PATH="f"
        if [ "`which mpv 2> /dev/null`" != "" ]; then
            SB_MPV_EXISTS_ON_PATH="t"
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "mpv" "194a4fc4-ddec-4c26-8c4d-b2e001716ae7"
        fi
    fi
    if [ "$SB_MPV_EXISTS_ON_PATH" == "t" ]; then
        #--------------------
        # TODO: declare the libcaca dependent aliases only, when libcaca is present.
        #--------------------
        S_TMP_0="$S_FP_NICE -n 1 mpv "
        S_TMP_1="$S_TMP_0 --vo=tct "
        S_TMP_2="$S_TMP_0 --vo=caca "
        #--------
        alias mmmv_videoplayer_mpv="$S_TMP_0"
        alias mmmv_soundplayer_mpv="$S_TMP_0"
        #--------
        alias mmmv_videoplayer_mpv_sixel_t1="$S_TMP_1"
        alias mmmv_videoplayer_mpv_sixel_t1_20chars="$S_TMP_1 --vo-tct-width=20 "
        alias mmmv_videoplayer_mpv_sixel_t1_40chars="$S_TMP_1 --vo-tct-width=40 "
        alias mmmv_videoplayer_mpv_sixel_t1_70chars="$S_TMP_1 --vo-tct-width=70 "
        alias mmmv_videoplayer_mpv_sixel_t1_90chars="$S_TMP_1 --vo-tct-width=90 "
        alias mmmv_videoplayer_mpv_sixel_t1_110chars="$S_TMP_1 --vo-tct-width=110 "
        #--------
        alias mmmv_videoplayer_mpv_ASCII_t1="$S_TMP_2"
        alias mmmv_videoplayer_mpv_ASCII_t1_20chars="$S_TMP_2 --term-osd-maxchs=20 "
        alias mmmv_videoplayer_mpv_ASCII_t1_40chars="$S_TMP_2 --term-osd-maxchs=40 "
        alias mmmv_videoplayer_mpv_ASCII_t1_70chars="$S_TMP_2 --term-osd-maxchs=70 "
        alias mmmv_videoplayer_mpv_ASCII_t1_90chars="$S_TMP_2 --term-osd-maxchs=90 "
        alias mmmv_videoplayer_mpv_ASCII_t1_110chars="$S_TMP_2 --term-osd-maxchs=110 "
        #--------------------
        S_TMP_0="$S_FP_NICE -n 1 mpv -loop 0 "
        S_TMP_1="$S_TMP_0 --vo=tct "
        S_TMP_2="$S_TMP_0 --vo=caca "
        #--------
        alias mmmv_videoplayer_mpv_loop_t1="$S_TMP_0"
        alias mmmv_soundplayer_mpv_loop_t1="$S_TMP_0"
        #--------
        alias mmmv_videoplayer_mpv_sixel_loop_t1="$S_TMP_1"
        alias mmmv_videoplayer_mpv_sixel_loop_t1_20chars="$S_TMP_1 --vo-tct-width=20 "
        alias mmmv_videoplayer_mpv_sixel_loop_t1_40chars="$S_TMP_1 --vo-tct-width=40 "
        alias mmmv_videoplayer_mpv_sixel_loop_t1_70chars="$S_TMP_1 --vo-tct-width=70 "
        alias mmmv_videoplayer_mpv_sixel_loop_t1_90chars="$S_TMP_1 --vo-tct-width=90 "
        alias mmmv_videoplayer_mpv_sixel_loop_t1_110chars="$S_TMP_1 --vo-tct-width=110 "
        #--------
        alias mmmv_videoplayer_mpv_ASCII_loop_t1="$S_TMP_2"
        alias mmmv_videoplayer_mpv_ASCII_loop_t1_20chars="$S_TMP_2 --term-osd-maxchs=20 "
        alias mmmv_videoplayer_mpv_ASCII_loop_t1_40chars="$S_TMP_2 --term-osd-maxchs=40 "
        alias mmmv_videoplayer_mpv_ASCII_loop_t1_70chars="$S_TMP_2 --term-osd-maxchs=70 "
        alias mmmv_videoplayer_mpv_ASCII_loop_t1_90chars="$S_TMP_2 --term-osd-maxchs=90 "
        alias mmmv_videoplayer_mpv_ASCII_loop_t1_110chars="$S_TMP_2 --term-osd-maxchs=110 "
        #--------------------
    fi
    #----------------------------------------------------------------------
    if [ "$SB_VLC_EXISTS_ON_PATH" == "" ]; then
        SB_VLC_EXISTS_ON_PATH="f"
        if [ "`which vlc 2> /dev/null`" != "" ]; then
            SB_VLC_EXISTS_ON_PATH="t"
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "vlc" "79a86ce4-8f34-4b30-991d-b2e001716ae7"
        fi
    fi
    if [ "$SB_VLC_EXISTS_ON_PATH" == "t" ]; then
        S_TMP_0="$S_FP_NICE -n 1 vlc "
        alias mmmv_videoplayer_vlc="$S_TMP_0"
        alias mmmv_soundplayer_vlc="$S_TMP_0"
        alias mmmv_videoplayer_vlc_loop_t1="$S_TMP_0 --repeat "
        alias mmmv_soundplayer_vlc_loop_t1="$S_TMP_0 --repeat "
    fi
    #----------------------------------------------------------------------
    if [ "$SB_CVLC_EXISTS_ON_PATH" == "" ]; then
        SB_CVLC_EXISTS_ON_PATH="f"
        if [ "`which cvlc 2> /dev/null`" != "" ]; then
            SB_CVLC_EXISTS_ON_PATH="t"
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "cvlc" "f53f3ac5-6140-4d03-985d-b2e001716ae7"
        fi
    fi
    if [ "$SB_CVLC_EXISTS_ON_PATH" == "t" ]; then
        # cvlc is console-VLC, a GUI-less version of the VLC video
        # player for playing sound. It launches the GUI based VLC if
        # it needs to display video.
        S_TMP_0="$S_FP_NICE -n 1 cvlc "
        alias mmmv_soundplayer_cvlc="$S_TMP_0"
        alias mmmv_soundplayer_vlc_GUIless="$S_TMP_0"
        alias mmmv_soundplayer_cvlc_loop_t1="$S_TMP_0 --repeat "
        alias mmmv_soundplayer_vlc_GUIless_loop_t1="$S_TMP_0 --repeat "
    fi
    #----------------------------------------------------------------------
fi
#--------------------------------------------------------------------------
#:::::::::::::::::::::::::::::file::managers:::::::::::::::::::::::::::::::
#--------------------------------------------------------------------------
if [ "$S_FP_NICE" != "" ]; then
    if [ "$SB_MC_EXISTS_ON_PATH" == "" ]; then
        SB_MC_EXISTS_ON_PATH="f"
        S_FP_MC="`which mc 2> /dev/null`"
        if [ "$S_FP_MC" != "" ]; then
            SB_MC_EXISTS_ON_PATH="t"
        fi
    fi
    if [ "$S_FP_MC" == "" ]; then
        S_FP_MC="`which mc 2> /dev/null`"
    fi
    #if [ "$SB_MC_EXISTS_ON_PATH" == "t" ]; then
        if [ "$S_FP_MC" != "" ]; then
                alias mmmv_filemanager_mc="$S_FP_NICE -n 5 $S_FP_MC "
        fi
    #fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    if [ "$SB_NAUTILUS_EXISTS_ON_PATH" == "" ]; then
        SB_NAUTILUS_EXISTS_ON_PATH="f"
        S_FP_NAUTILUS="`which nautilus 2> /dev/null`"
        if [ "$S_FP_NAUTILUS" != "" ]; then
            SB_NAUTILUS_EXISTS_ON_PATH="t"
        fi
    fi
    if [ "$S_FP_NAUTILUS" == "" ]; then
        S_FP_NAUTILUS="`which nautilus 2> /dev/null`"
    fi
    #if [ "$SB_NAUTILUS_EXISTS_ON_PATH" == "t" ]; then
        if [ "$S_FP_NAUTILUS" != "" ]; then
            alias mmmv_filemanager_nautilus="$S_FP_NICE -n 5 $S_FP_NAUTILUS "
        fi
    #fi
    #--------------------
    # https://dystroy.org/broot/install/
    # https://github.com/Canop/broot
    # Installation of its dependencies in year 2024
    # on a Debian Linux distribution:
    #     apt install build-essential libxcb1-dev libxcb-render0-dev libxcb-shape0-dev libxcb-xfixes0-dev
    #
    # Broot is implemented in Rust:
    #
    #     cargo install broot
    #
    if [ "$SB_BROOT_EXISTS_ON_PATH" == "" ]; then
        SB_BROOT_EXISTS_ON_PATH="f"
        S_FP_BROOT="`which broot 2> /dev/null`"
        if [ "$S_FP_BROOT" != "" ]; then
            SB_BROOT_EXISTS_ON_PATH="t"
        fi
    fi
    if [ "$S_FP_BROOT" == "" ]; then
        S_FP_BROOT="`which broot 2> /dev/null`"
    fi
    #if [ "$SB_BROOT_EXISTS_ON_PATH" == "t" ]; then
        if [ "$S_FP_BROOT" != "" ]; then
            alias mmmv_filemanager_broot="$S_FP_NICE -n 5 $S_FP_BROOT "
        fi
    #fi
    #--------------------
    if [ "$SB_DOLPHIN_EXISTS_ON_PATH" == "" ]; then
        SB_DOLPHIN_EXISTS_ON_PATH="f"
        S_FP_DOLPHIN="`which dolphin 2> /dev/null`"
        if [ "$S_FP_DOLPHIN" != "" ]; then
            SB_DOLPHIN_EXISTS_ON_PATH="t"
        fi
    fi
    if [ "$S_FP_DOLPHIN" == "" ]; then
        S_FP_DOLPHIN="`which dolphin 2> /dev/null`"
    fi
    #if [ "$SB_DOLPHIN_EXISTS_ON_PATH" == "t" ]; then
        if [ "$S_FP_DOLPHIN" != "" ]; then
            alias mmmv_filemanager_dolphin="$S_FP_NICE -n 5 $S_FP_DOLPHIN "
        fi
    #fi
    #--------------------
    # The muCommander is a Java program with a horribly
    # slow start-up, but it has very nice features.
    #     https://www.mucommander.com/
    #     https://github.com/mucommander
    if [ "$SB_MUCOMMANDER_EXISTS_ON_PATH" == "" ]; then
        SB_MUCOMMANDER_EXISTS_ON_PATH="f"
        S_FP_MUCOMMANDER="`which mucommander 2> /dev/null`"
        if [ "$S_FP_MUCOMMANDER" != "" ]; then
            SB_MUCOMMANDER_EXISTS_ON_PATH="t"
        fi
    fi
    if [ "$S_FP_MUCOMMANDER" == "" ]; then
        S_FP_MUCOMMANDER="`which mucommander 2> /dev/null`"
    fi
    #if [ "$SB_MUCOMMANDER_EXISTS_ON_PATH" == "t" ]; then
        if [ "$S_FP_MUCOMMANDER" != "" ]; then
            alias mmmv_filemanager_mucommander="$S_FP_NICE -n 5 $S_FP_MUCOMMANDER "
        fi
    #fi
    #--------------------
    # The lightweight, but occasionally unstable, Pascal based filemanager.
    if [ "$SB_PCMANFM_EXISTS_ON_PATH" == "" ]; then
        SB_PCMANFM_EXISTS_ON_PATH="f"
        S_FP_PCMANFM="`which pcmanfm 2> /dev/null`"
        if [ "$S_FP_PCMANFM" != "" ]; then
            SB_PCMANFM_EXISTS_ON_PATH="t"
        fi
    fi
    if [ "$S_FP_PCMANFM" == "" ]; then
        S_FP_PCMANFM="`which pcmanfm 2> /dev/null`"
    fi
    #if [ "$SB_PCMANFM_EXISTS_ON_PATH" == "t" ]; then
        if [ "$S_FP_PCMANFM" != "" ]; then
            alias mmmv_filemanager_pcmanfm="$S_FP_NICE -n 5 $S_FP_PCMANFM "
        fi
    #fi
    #--------------------
    # Wii Backup File System Manager (QWBFS)
    if [ "$SB_QWBFSMANAGER_EXISTS_ON_PATH" == "" ]; then
        SB_QWBFSMANAGER_EXISTS_ON_PATH="f"
        S_FP_QWBFSMANAGER="`which qwbfsmanager 2> /dev/null`"
        if [ "$S_FP_QWBFSMANAGER" != "" ]; then
            SB_QWBFSMANAGER_EXISTS_ON_PATH="t"
        fi
    fi
    if [ "$S_FP_QWBFSMANAGER" == "" ]; then
        S_FP_QWBFSMANAGER="`which qwbfsmanager 2> /dev/null`"
    fi
    #if [ "$SB_QWBFSMANAGER_EXISTS_ON_PATH" == "t" ]; then
        if [ "$S_FP_QWBFSMANAGER" != "" ]; then
            alias mmmv_filemanager_qwbfsmanager="$S_FP_NICE -n 5 $S_FP_QWBFSMANAGER "
        fi
    #fi
    #--------------------
    if [ "$SB_NEMO_EXISTS_ON_PATH" == "" ]; then
        SB_NEMO_EXISTS_ON_PATH="f"
        S_FP_NEMO="`which nemo 2> /dev/null`"
        if [ "$S_FP_NEMO" != "" ]; then
            SB_NEMO_EXISTS_ON_PATH="t"
        fi
    fi
    if [ "$S_FP_NEMO" == "" ]; then
        S_FP_NEMO="`which nemo 2> /dev/null`"
    fi
    #if [ "$SB_NEMO_EXISTS_ON_PATH" == "t" ]; then
        if [ "$S_FP_NEMO" != "" ]; then
            alias mmmv_filemanager_nemo="$S_FP_NICE -n 5 $S_FP_NEMO "
        fi
    #fi
    #--------------------
    if [ "$SB_NNN_EXISTS_ON_PATH" == "" ]; then
        SB_NNN_EXISTS_ON_PATH="f"
        S_FP_NNN="`which nnn 2> /dev/null`"
        if [ "$S_FP_NNN" != "" ]; then
            SB_NNN_EXISTS_ON_PATH="t"
        fi
    fi
    if [ "$S_FP_NNN" == "" ]; then
        S_FP_NNN="`which nnn 2> /dev/null`"
    fi
    #if [ "$SB_NNN_EXISTS_ON_PATH" == "t" ]; then
        if [ "$S_FP_NNN" != "" ]; then
            alias mmmv_filemanager_nnn="$S_FP_NICE -n 5 $S_FP_NNN "
        fi
    #fi
    #--------------------
    if [ "$SB_THUNAR_EXISTS_ON_PATH" == "" ]; then
        SB_THUNAR_EXISTS_ON_PATH="f"
        S_FP_THUNAR="`which thunar 2> /dev/null`"
        if [ "$S_FP_THUNAR" != "" ]; then
            SB_THUNAR_EXISTS_ON_PATH="t"
        fi
    fi
    if [ "$S_FP_THUNAR" == "" ]; then
        S_FP_THUNAR="`which thunar 2> /dev/null`"
    fi
    #if [ "$SB_THUNAR_EXISTS_ON_PATH" == "t" ]; then
        if [ "$S_FP_THUNAR" != "" ]; then
            alias mmmv_filemanager_thunar="$S_FP_NICE -n 5 $S_FP_THUNAR "
        fi
    #fi
    #--------------------
    # https://krusader.org/
    if [ "$SB_KRUSADER_EXISTS_ON_PATH" == "" ]; then
        SB_KRUSADER_EXISTS_ON_PATH="f"
        S_FP_KRUSADER="`which krusader 2> /dev/null`"
        if [ "$S_FP_KRUSADER" != "" ]; then
            SB_KRUSADER_EXISTS_ON_PATH="t"
        fi
    fi
    if [ "$S_FP_KRUSADER" == "" ]; then
        S_FP_KRUSADER="`which krusader 2> /dev/null`"
    fi
    #if [ "$SB_KRUSADER_EXISTS_ON_PATH" == "t" ]; then
        if [ "$S_FP_KRUSADER" != "" ]; then
            alias mmmv_filemanager_krusader="$S_FP_NICE -n 5 $S_FP_KRUSADER "
        fi
    #fi
    #--------------------
    if [ "$SB_XFE_EXISTS_ON_PATH" == "" ]; then
        SB_XFE_EXISTS_ON_PATH="f"
        S_FP_XFE="`which xfe 2> /dev/null`"
        if [ "$S_FP_XFE" != "" ]; then
            SB_XFE_EXISTS_ON_PATH="t"
        fi
    fi
    if [ "$S_FP_XFE" == "" ]; then
        S_FP_XFE="`which xfe 2> /dev/null`"
    fi
    #if [ "$SB_XFE_EXISTS_ON_PATH" == "t" ]; then
        if [ "$S_FP_XFE" != "" ]; then
            alias mmmv_filemanager_xfe="$S_FP_NICE -n 5 $S_FP_XFE "
        fi
    #fi
    #--------------------
    if [ "$SB_4PANE_EXISTS_ON_PATH" == "" ]; then
        SB_4PANE_EXISTS_ON_PATH="f"
        S_FP_4PANE="`which 4pane 2> /dev/null`"
        if [ "$S_FP_4PANE" != "" ]; then
            SB_4PANE_EXISTS_ON_PATH="t"
        fi
    fi
    if [ "$S_FP_4PANE" == "" ]; then
        S_FP_4PANE="`which 4pane 2> /dev/null`"
    fi
    #if [ "$SB_4PANE_EXISTS_ON_PATH" == "t" ]; then
        if [ "$S_FP_4PANE" != "" ]; then
            alias mmmv_filemanager_4pane="$S_FP_NICE -n 5 $S_FP_4PANE "
        fi
    #fi
    #--------------------
    if [ "$SB_SPACEFM_EXISTS_ON_PATH" == "" ]; then
        SB_SPACEFM_EXISTS_ON_PATH="f"
        S_FP_SPACEFM="`which spacefm 2> /dev/null`"
        if [ "$S_FP_SPACEFM" != "" ]; then
            SB_SPACEFM_EXISTS_ON_PATH="t"
        fi
    fi
    if [ "$S_FP_SPACEFM" == "" ]; then
        S_FP_SPACEFM="`which spacefm 2> /dev/null`"
    fi
    #if [ "$SB_SPACEFM_EXISTS_ON_PATH" == "t" ]; then
        if [ "$S_FP_SPACEFM" != "" ]; then
            alias mmmv_filemanager_spacefm="$S_FP_NICE -n 5 $S_FP_SPACEFM "
        fi
    #fi
    #--------------------
    if [ "$SB_CAJA_EXISTS_ON_PATH" == "" ]; then
        SB_CAJA_EXISTS_ON_PATH="f"
        S_FP_CAJA="`which caja 2> /dev/null`"
        if [ "$S_FP_CAJA" != "" ]; then
            SB_CAJA_EXISTS_ON_PATH="t"
        fi
    fi
    if [ "$S_FP_CAJA" == "" ]; then
        S_FP_CAJA="`which caja 2> /dev/null`"
    fi
    #if [ "$SB_CAJA_EXISTS_ON_PATH" == "t" ]; then
        if [ "$S_FP_CAJA" != "" ]; then
            alias mmmv_filemanager_caja="$S_FP_NICE -n 5 $S_FP_CAJA "
        fi
    #fi
    #--------------------
    if [ "$SB_RANGER_EXISTS_ON_PATH" == "" ]; then
        SB_RANGER_EXISTS_ON_PATH="f"
        S_FP_RANGER="`which ranger 2> /dev/null`"
        if [ "$S_FP_RANGER" != "" ]; then
            SB_RANGER_EXISTS_ON_PATH="t"
        fi
    fi
    if [ "$S_FP_RANGER" == "" ]; then
        S_FP_RANGER="`which ranger 2> /dev/null`"
    fi
    #if [ "$SB_RANGER_EXISTS_ON_PATH" == "t" ]; then
        if [ "$S_FP_RANGER" != "" ]; then
            alias mmmv_filemanager_ranger="$S_FP_NICE -n 5 $S_FP_RANGER "
        fi
    #fi
    #--------------------
    if [ "$SB_DOUBLECMD_EXISTS_ON_PATH" == "" ]; then
        SB_DOUBLECMD_EXISTS_ON_PATH="f"
        S_FP_DOUBLECMD="`which doublecmd 2> /dev/null`"
        if [ "$S_FP_DOUBLECMD" != "" ]; then
            SB_DOUBLECMD_EXISTS_ON_PATH="t"
        fi
    fi
    if [ "$S_FP_DOUBLECMD" == "" ]; then
        S_FP_DOUBLECMD="`which doublecmd 2> /dev/null`"
    fi
    #if [ "$SB_DOUBLECMD_EXISTS_ON_PATH" == "t" ]; then
        if [ "$S_FP_DOUBLECMD" != "" ]; then
            alias mmmv_filemanager_doublecmd="$S_FP_NICE -n 5 $S_FP_DOUBLECMD "
        fi
    #fi
    #--------------------
    if [ "$SB_VIFM_EXISTS_ON_PATH" == "" ]; then
        SB_VIFM_EXISTS_ON_PATH="f"
        S_FP_VIFM="`which vifm 2> /dev/null`"
        if [ "$S_FP_VIFM" != "" ]; then
            SB_VIFM_EXISTS_ON_PATH="t"
        fi
    fi
    if [ "$S_FP_VIFM" == "" ]; then
        S_FP_VIFM="`which vifm 2> /dev/null`"
    fi
    #if [ "$SB_VIFM_EXISTS_ON_PATH" == "t" ]; then
        if [ "$S_FP_VIFM" != "" ]; then
            alias mmmv_filemanager_vifm="$S_FP_NICE -n 5 $S_FP_VIFM "
        fi
    #fi
    #--------------------
    # http://www.boomerangsworld.de/cms/worker/
    if [ "$SB_WORKER_EXISTS_ON_PATH" == "" ]; then
        SB_WORKER_EXISTS_ON_PATH="f"
        S_FP_WORKER="`which worker 2> /dev/null`"
        if [ "$S_FP_WORKER" != "" ]; then
            SB_WORKER_EXISTS_ON_PATH="t"
        fi
    fi
    if [ "$S_FP_WORKER" == "" ]; then
        S_FP_WORKER="`which worker 2> /dev/null`"
    fi
    #if [ "$SB_WORKER_EXISTS_ON_PATH" == "t" ]; then
        if [ "$S_FP_WORKER" != "" ]; then
            alias mmmv_filemanager_worker="$S_FP_NICE -n 5 $S_FP_WORKER "
        fi
    #fi
    #--------------------
    if [ "$SB_GENTOO_EXISTS_ON_PATH" == "" ]; then
        SB_GENTOO_EXISTS_ON_PATH="f"
        S_FP_GENTOO="`which gentoo 2> /dev/null`"
        if [ "$S_FP_GENTOO" != "" ]; then
            SB_GENTOO_EXISTS_ON_PATH="t"
        fi
    fi
    if [ "$S_FP_GENTOO" == "" ]; then
        S_FP_GENTOO="`which gentoo 2> /dev/null`"
    fi
    #if [ "$SB_GENTOO_EXISTS_ON_PATH" == "t" ]; then
        if [ "$S_FP_GENTOO" != "" ]; then
            alias mmmv_filemanager_gentoo="$S_FP_NICE -n 5 $S_FP_GENTOO "
        fi
    #fi
fi
#--------------------
# File managers to be tested/added_here in the future:
#     fman, sunflower, polo, deepin<something>
#--------------------------------------------------------------------------
#::::::::::::::::copying::tools::other::than::file::managers:::::::::::::::
#--------------------------------------------------------------------------
if [ "$SB_LFTP_EXISTS_ON_PATH" == "" ]; then
    SB_LFTP_EXISTS_ON_PATH="f"
    if [ "`which lftp 2> /dev/null`" != "" ]; then
        SB_LFTP_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "lftp" "198b8ee5-2310-4af5-ba3d-b2e001716ae7"
    fi
fi
if [ "$SB_LFTP_EXISTS_ON_PATH" == "t" ]; then
    #--------------------
    # https://stackoverflow.com/questions/6327800/lftp-timeout-not-working
    # arcival copy: https://archive.vn/qi0z0
    alias mmmv_lftp_t1="$S_FP_NICE -n 5 lftp -e \"set net:timeout 5; set net:reconnect-interval-base 5; set net:max-retries 3;\" "
    # Supposedly by default the net:max-retries==1000 .
    #--------------------
fi
#--------------------
if [ "$SB_PUTTY_EXISTS_ON_PATH" == "" ]; then
    SB_PUTTY_EXISTS_ON_PATH="f"
    if [ "`which putty 2> /dev/null`" != "" ]; then
        SB_PUTTY_EXISTS_ON_PATH="t"
    fi
fi
#--------------------
if [ "$SB_RCLONE_EXISTS_ON_PATH" == "" ]; then
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
            "rclone" "03b4d23c-8e8f-43f9-914d-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_RSYNC_EXISTS_ON_PATH" == "" ]; then
    SB_RSYNC_EXISTS_ON_PATH="f"
    if [ "`which rsync 2> /dev/null`" != "" ]; then
        SB_RSYNC_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "rsync" "4122db38-20e6-4e7a-952d-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_SSH_EXISTS_ON_PATH" == "" ]; then
    SB_SSH_EXISTS_ON_PATH="f"
    if [ "`which ssh 2> /dev/null`" != "" ]; then
        SB_SSH_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "ssh" "1f43ed53-1f63-4c56-985d-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_SCP_EXISTS_ON_PATH" == "" ]; then
    SB_SCP_EXISTS_ON_PATH="f"
    if [ "`which scp 2> /dev/null`" != "" ]; then
        SB_SCP_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "scp" "84178f38-42b7-4d73-b83d-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_TELNET_EXISTS_ON_PATH" == "" ]; then
    SB_TELNET_EXISTS_ON_PATH="f"
    if [ "`which telnet 2> /dev/null`" != "" ]; then
        SB_TELNET_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "telnet" "3a4fa664-7e97-4717-8c1d-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_UNISON_EXISTS_ON_PATH" == "" ]; then
    SB_UNISON_EXISTS_ON_PATH="f"
    if [ "`which unison 2> /dev/null`" != "" ]; then
        SB_UNISON_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "unison" "5e1a0121-f8cd-4ecc-ae4c-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_NOTMUCH_EXISTS_ON_PATH" == "" ]; then
    SB_NOTMUCH_EXISTS_ON_PATH="f"
    if [ "`which notmuch 2> /dev/null`" != "" ]; then
        SB_NOTMUCH_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "notmuch" "31642a65-db9c-42f1-904c-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_OFFLINEIMAP_EXISTS_ON_PATH" == "" ]; then
    SB_OFFLINEIMAP_EXISTS_ON_PATH="f"
    if [ "`which offlineimap 2> /dev/null`" != "" ]; then
        SB_OFFLINEIMAP_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "offlineimap" "278ea265-8327-46ce-991c-b2e001716ae7"
    fi
fi
#--------------------------------------------------------------------------
#::::::::::::::repository::systems::id::est::revision::control:::::::::::::
#--------------------------------------------------------------------------
# https://en.wikipedia.org/wiki/List_of_version_control_software
if [ "$MMMV_SB_LOOK_FOR_DEVELOPMENT_TOOLS" == "t" ]; then
    #----------------------------------------------------------------------
    if [ "$SB_CVS_EXISTS_ON_PATH" == "" ]; then
        SB_CVS_EXISTS_ON_PATH="f"
        if [ "`which cvs 2> /dev/null`" != "" ]; then
            SB_CVS_EXISTS_ON_PATH="t"
        fi
    fi
    #--------------------
    if [ "$SB_SUBVERSION_EXISTS_ON_PATH" == "" ]; then
        SB_SUBVERSION_EXISTS_ON_PATH="f"
        if [ "`which svn 2> /dev/null`" != "" ]; then
            SB_SUBVERSION_EXISTS_ON_PATH="t"
        fi
    fi
    #--------------------
    # https://www.mercurial-scm.org/
    if [ "$SB_MERCURIAL_EXISTS_ON_PATH" == "" ]; then
        SB_MERCURIAL_EXISTS_ON_PATH="f"
        if [ "`which hg 2> /dev/null`" != "" ]; then
            SB_MERCURIAL_EXISTS_ON_PATH="t"
        fi
    fi
    #--------------------
    if [ "$SB_GIT_EXISTS_ON_PATH" == "" ]; then
        SB_GIT_EXISTS_ON_PATH="f"
        S_FP_GIT="`which git 2> /dev/null`"
        if [ "$S_FP_GIT" != "" ]; then
            SB_GIT_EXISTS_ON_PATH="t"
        fi
    fi
    if [ "$S_FP_GIT" == "" ]; then
        S_FP_GIT="`which git 2> /dev/null`"
    fi
    if [ "$SB_GIT_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_git_gc_t1="$S_FP_NICE -n 23 $S_FP_GIT gc --aggressive --prune=all ; wait ; sync ; wait ; "
        alias mmmv_git_ls_unstored="$S_FP_NICE -n 19 $S_FP_GIT status -uall --ignored "
        alias mmmv_git_clone_recursive="$S_FP_NICE -n 19 $S_FP_GIT clone --recursive ; wait ; sync ; wait ; "
        alias mmmv_git_ignore_https_certificate="GIT_SSL_NO_VERIFY=true $S_FP_NICE -n 19 $S_FP_GIT ; wait ; sync ; wait ; "
        S_FP_GIT="git config --global init.defaultBranch main ; git config --global user.email \"santa.claus@north.pole\" ; git config --global user.name \"Santa Claus\" ; git config --global pull.rebase false ; wait ; sync ; wait ; "
        alias mmmv_git_init_config_global_FooBar_t1="$S_FP_GIT"
        alias mmmv_admin_git_init_config_global_FooBar_t1="$S_FP_GIT"
    fi
    #--------------------
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
        #--------------------
        if [ "$SB_GITG_EXISTS_ON_PATH" == "" ]; then
            SB_GITG_EXISTS_ON_PATH="f"
            S_FP_GITG="`which gitg 2> /dev/null`"
            if [ "$S_FP_GITG" != "" ]; then
                SB_GITG_EXISTS_ON_PATH="t"
            fi
        fi
        if [ "$S_FP_GITG" == "" ]; then
            S_FP_GITG="`which gitg 2> /dev/null`"
        fi
        if [ "$SB_GITG_EXISTS_ON_PATH" == "t" ]; then
            if [ "$SB_GIT_EXISTS_ON_PATH" == "t" ]; then
                alias mmmv_gitg="$S_FP_NICE -n 19 $S_FP_GITG "
                alias mmmv_run_gitg="$S_FP_NICE -n 19 $S_FP_GITG "
            else
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo -e "\e[31mgitg exists on PATH while the git is missing.\e[39m"
                    echo "GUID=='53df5ea6-3564-4746-975b-b2e001716ae7'"
                    echo ""
                fi
            fi
        fi
        #--------------------
        if [ "$SB_GITK_EXISTS_ON_PATH" == "" ]; then
            SB_GITK_EXISTS_ON_PATH="f"
            S_FP_GITK="`which gitk 2> /dev/null`"
            if [ "$S_FP_GITK" != "" ]; then
                SB_GITK_EXISTS_ON_PATH="t"
            fi
        fi
        if [ "$S_FP_GITK" == "" ]; then
            S_FP_GITK="`which gitk 2> /dev/null`"
        fi
        if [ "$SB_GITK_EXISTS_ON_PATH" == "t" ]; then
            if [ "$SB_GIT_EXISTS_ON_PATH" == "t" ]; then
                alias mmmv_gitk="$S_FP_NICE -n 19 $S_FP_GITK "
                alias mmmv_run_gitk="$S_FP_NICE -n 19 $S_FP_GITK "
            else
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo -e "\e[31mgitk exists on PATH while the git is missing.\e[39m"
                    echo "GUID=='31db2ad0-0f83-4cef-b21b-b2e001716ae7'"
                    echo ""
                fi
            fi
            if [ "$SB_GITG_EXISTS_ON_PATH" == "f" ]; then
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo -e "\e[31mgitk exists on PATH while the gitg is missing.\e[39m"
                    # As of 2021 the gitk has an optionally available
                    # menu option that depends on the gitg.
                    echo "GUID=='49bceee5-f0a0-4edb-881b-b2e001716ae7'"
                    echo ""
                fi
            fi
        fi
        #--------------------
    fi
    #--------------------
    if [ "$SB_BAZAAR_EXISTS_ON_PATH" == "" ]; then
        SB_BAZAAR_EXISTS_ON_PATH="f"
        if [ "`which bzr 2> /dev/null`" != "" ]; then
            SB_BAZAAR_EXISTS_ON_PATH="t"
        fi
    fi
    #--------------------
    # https://www.gnu.org/software/gnu-arch/
    if [ "$SB_GNU_ARCH_EXISTS_ON_PATH" == "" ]; then
        SB_GNU_ARCH_EXISTS_ON_PATH="f"
        if [ "`which tla 2> /dev/null`" != "" ]; then
            SB_GNU_ARCH_EXISTS_ON_PATH="t"
        fi
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
    if [ "$SB_DARCH_EXISTS_ON_PATH" == "" ]; then
        SB_DARCH_EXISTS_ON_PATH="f"
        if [ "`which darcs 2> /dev/null`" != "" ]; then
            SB_DARCH_EXISTS_ON_PATH="t"
        fi
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
#:::::::::::::::::::::::::::package::managers::::::::::::::::::::::::::::::
#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
        #--------------------
        if [ "$SB_FLATPAK_EXISTS_ON_PATH" == "" ]; then
            SB_FLATPAK_EXISTS_ON_PATH="f"
            S_FP_FLATPAK="`which flatpak 2> /dev/null`"
            if [ "$S_FP_FLATPAK" != "" ]; then
                SB_FLATPAK_EXISTS_ON_PATH="t"
            else
                func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                    "flatpak" "b20898bf-16d9-48b9-b21c-b2e001716ae7"
                if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
                    echo "You MIGHT want to run "
                    echo -e "\e[36m"
                    # echo "    flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo "
                    echo "    flatpak --user remote-add --if-not-exists --subset=verified flathub-verified https://flathub.org/repo/flathub.flatpakrepo "
                    echo -e "\e[39m"
                    echo "after installing the \"flatpak\"."
                    echo "Flatpak project history as of 2018_06_20 "
                    echo "by one of its developers, Alexander Larsson:"
                    echo "    https://web.archive.org/web/20250320153113/https://blogs.gnome.org/alexl/2018/06/20/flatpak-a-history/"
                    echo "    https://archive.ph/9PNG8"
                    echo "GUID=='1c3eed32-ac86-4c7e-bb3b-b2e001716ae7'"
                    echo ""
                fi
            fi
        fi
        if [ "$S_FP_FLATPAK" == "" ]; then
            S_FP_FLATPAK="`which flatpak 2> /dev/null`"
        fi
        if [ "$SB_FLATPAK_EXISTS_ON_PATH" == "t" ]; then
            #--------------------
            S_CMD_FLATPAK_USER="$S_FP_NICE -n 6 $S_FP_FLATPAK --user " # might be used also at another Bash file
            #--------------------
            alias mmmv_flatpak_user="$S_CMD_FLATPAK_USER"
            # The alias can not override "flatpak", because
            # without any overriding of the "flatpak" the
            #     flatpak --user --help
            # gives an error.
            #--------------------
            alias mmmv_flatpak_aptitude="$S_CMD_FLATPAK_USER search "
            alias mmmv_flatpak_search_remote="$S_CMD_FLATPAK_USER search "
            #--------
            S_TMP_0="$S_CMD_FLATPAK_USER install "
            alias mmmv_flatpak_install="$S_TMP_0"
            alias mmmv_admin_flatpak_install="$S_TMP_0"
            alias mmmv_admin_install_flatpak="$S_TMP_0"
            #--------
            S_TMP_0="$S_CMD_FLATPAK_USER uninstall "
            alias mmmv_flatpak_uninstall="$S_TMP_0"
            alias mmmv_admin_flatpak_uninstall="$S_TMP_0"
            alias mmmv_admin_uninstall_flatpak="$S_TMP_0"
            #--------------------
            alias mmmv_ls_flatpak_remote="$S_CMD_FLATPAK_USER remote-ls "
            #--------
            # #!/usr/bin/env bash
            # S_SEARCHSTRING="$1"
            # if [ "$S_SEARCHSTRING" == ""  ]; then
            #     ls -1
            # else
            #     ls -1 | grep -i "$S_SEARCHSTRING"
            # fi
            #--------
            # mmmv_polish_ABC_2_ACB_t2_C_is_optional_exec_bash.rb " S_SEARCHSTRING=\""  "\" ; if [ \"\$S_SEARCHSTRING\" == \"\"  ]; then $S_CMD_FLATPAK_USER list ; else $S_CMD_FLATPAK_USER list | grep -i \"\$S_SEARCHSTRING\" ; fi "
            #--------
            if [ "$SB_RUBY_EXISTS_ON_PATH" == "t" ]; then
                if [ "$SB_GREP_EXISTS_ON_PATH" == "t" ]; then
                    alias mmmv_ls_flatpak_local_id_est_installed=" mmmv_polish_ABC_2_ACB_t2_C_is_optional_exec_bash.rb \" S_SEARCHSTRING=\\\"\"  \"\\\" ; if [ \\\"\\\$S_SEARCHSTRING\\\" == \\\"\\\"  ]; then $S_CMD_FLATPAK_USER list ; else $S_CMD_FLATPAK_USER list | grep -i \\\"\\\$S_SEARCHSTRING\\\" ; fi \" "
                else
                    alias mmmv_ls_flatpak_local_id_est_installed="$S_CMD_FLATPAK_USER list "
                fi
            else
                alias mmmv_ls_flatpak_local_id_est_installed="$S_CMD_FLATPAK_USER list "
            fi
            #--------------------
        fi
        #--------------------
        if [ "$SB_PIPX_EXISTS_ON_PATH" == "" ]; then
            SB_PIPX_EXISTS_ON_PATH="f"
            S_FP_PIPX="`which pipx 2> /dev/null`"
            if [ "$S_FP_PIPX" != "" ]; then
                SB_PIPX_EXISTS_ON_PATH="t"
            else
                func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                    "pipx" "3f885f44-dd37-47ac-a91c-b2e001716ae7"
            fi
        fi
        if [ "$S_FP_PIPX" == "" ]; then
            S_FP_PIPX="`which pipx 2> /dev/null`"
        fi
        if [ "$SB_PIPX_EXISTS_ON_PATH" == "t" ]; then
            alias mmmv_pipx_install_include_deps_force="$S_FP_NICE -n 18 $S_FP_PIPX install --include-deps --force "
        fi
        #--------------------
        # Python "pip" package manager related test is intentionally
        # omitted, because the "pipx" de facto supersedes it.
        #--------------------
        if [ "$SB_NPM_EXISTS_ON_PATH" == "" ]; then
            SB_NPM_EXISTS_ON_PATH="f"
            S_FP_NPM="`which npm 2> /dev/null`"
            if [ "$S_FP_NPM" != "" ]; then
                SB_NPM_EXISTS_ON_PATH="t"
            else
                func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                    "npm" "93c0ea15-c10d-41df-a11c-b2e001716ae7"
            fi
        fi
        if [ "$S_FP_NPM" == "" ]; then
            S_FP_NPM="`which npm 2> /dev/null`"
        fi
        #--------------------
        #if [ "$SB_NPM_EXISTS_ON_PATH" == "t" ]; then
        #    alias mmmv_npm_install="$S_FP_NICE -n 18 $S_FP_NPM # TODO: may be one day complete this"
        #fi
        #--------------------
        # Ruby "gem" package manager related test is intentionally
        # omitted, because it is on PATH whenever Ruby is installed.
        #--------------------
    fi
fi
#--------------------------------------------------------------------------
#:::::::::::::::::::::::::::::::printing:::::::::::::::::::::::::::::::::::
#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    #--------------------
    if [ "$SB_LPSTAT_EXISTS_ON_PATH" == "" ]; then
        SB_LPSTAT_EXISTS_ON_PATH="f"
        S_FP_LPSTAT="`which lpstat 2> /dev/null`"
        if [ "$S_FP_LPSTAT" != "" ]; then
            SB_LPSTAT_EXISTS_ON_PATH="t"
        fi
    fi
    if [ "$S_FP_LPSTAT" == "" ]; then
        S_FP_LPSTAT="`which lpstat 2> /dev/null`"
    fi
    if [ "$SB_LPSTAT_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_ls_printers="$S_FP_LPSTAT -p -d " # shows printers from CUPS setup
    fi
    #--------------------
    if [ "$SB_LP_EXISTS_ON_PATH" == "" ]; then
        SB_LP_EXISTS_ON_PATH="f"
        if [ "`which lp 2> /dev/null`" != "" ]; then
            SB_LP_EXISTS_ON_PATH="t"
        fi
    fi
    #--------------------
fi
#--------------------------------------------------------------------------
#:::::::::::::::::::::::::::code::formatters:::::::::::::::::::::::::::::::
#--------------------------------------------------------------------------
if [ "$MMMV_SB_LOOK_FOR_DEVELOPMENT_TOOLS" == "t" ]; then
    #----------------------------------------------------------------------
    if [ "$SB_ASTYLE_EXISTS_ON_PATH" == "" ]; then
        SB_ASTYLE_EXISTS_ON_PATH="f"
        S_FP_ASTYLE="`which astyle 2> /dev/null`"
        if [ "$S_FP_ASTYLE" != "" ]; then
            SB_ASTYLE_EXISTS_ON_PATH="t"
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "astyle" "3dfaae34-7ae7-415b-895c-b2e001716ae7"
        fi
    fi
    if [ "$S_FP_ASTYLE" == "" ]; then
        S_FP_ASTYLE="`which astyle 2> /dev/null`"
    fi
    if [ "$SB_ASTYLE_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_astyle_t1="$S_FP_NICE -n 4 $S_FP_ASTYLE --style=java --indent=spaces=4 "
    fi
    #----------------------------------------------------------------------
    if [ "$SB_UNCRUSTIFY_EXISTS_ON_PATH" == "" ]; then
        SB_UNCRUSTIFY_EXISTS_ON_PATH="f"
        S_FP_UNCRUSTIFY="`which uncrustify 2> /dev/null`"
        if [ "$S_FP_UNCRUSTIFY" != "" ]; then
            SB_UNCRUSTIFY_EXISTS_ON_PATH="t"
            # The uncrustify is a C, C++, ObjectiveC, C#, D,
            # Java, Pawn and VALA source code formatter.
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "uncrustify" "1928e0f5-9a2a-4373-b34c-b2e001716ae7"
        fi
    fi
    if [ "$S_FP_UNCRUSTIFY" == "" ]; then
        S_FP_UNCRUSTIFY="`which uncrustify 2> /dev/null`"
    fi
    # if [ "$SB_UNCRUSTIFY_EXISTS_ON_PATH" == "t" ]; then
    #     alias mmmv_uncrustify_t1="$S_FP_NICE -n 4 $S_FP_UNCRUSTIFY "
    # fi
    #----------------------------------------------------------------------
fi
#--------------------------------------------------------------------------
#:::::::::::::::::::::::::::code::generators:::::::::::::::::::::::::::::::
#--------------------------------------------------------------------------
if [ "$MMMV_SB_LOOK_FOR_DEVELOPMENT_TOOLS" == "t" ]; then
    #----------------------------------------------------------------------
    if [ "$SB_BISON_EXISTS_ON_PATH" == "" ]; then
        SB_BISON_EXISTS_ON_PATH="f"
        if [ "`which bison 2> /dev/null`" != "" ]; then
            SB_BISON_EXISTS_ON_PATH="t"
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "bison" "41e91a82-d01a-4eb8-ac1c-b2e001716ae7"
        fi
    fi
    #----------------------------------------------------------------------
    if [ "$SB_RE2C_EXISTS_ON_PATH" == "" ]; then
        SB_RE2C_EXISTS_ON_PATH="f"
        if [ "`which re2c 2> /dev/null`" != "" ]; then
            #-----------------------------------------
            # http://re2c.org/
            # -------citation--start------------------
            # re2c is a free and open-source lexer
            # generator for C/C++, Go and Rust with
            # a focus on generating fast code.  It
            # compiles regular expression specifications
            # to deterministic finite automata and
            # encodes them in the form of conditional
            # jumps in the target language.
            # -------citation--end--------------------
            SB_RE2C_EXISTS_ON_PATH="t"
            #-----------------------------------------
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "re2c" "d26d4a26-7a1b-4134-8c1c-b2e001716ae7"
        fi
    fi
    #----------------------------------------------------------------------
    if [ "$SB_YACC_EXISTS_ON_PATH" == "" ]; then
        SB_YACC_EXISTS_ON_PATH="f"
        if [ "`which yacc 2> /dev/null`" != "" ]; then
            SB_YACC_EXISTS_ON_PATH="t"
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "yacc" "1c245c26-71e9-4ccf-a43c-b2e001716ae7"
        fi
    fi
    #----------------------------------------------------------------------
fi
#--------------------------------------------------------------------------
#:::::::::::::::::::::::::compression::software::::::::::::::::::::::::::::
#--------------------------------------------------------------------------
if [ "$SB_ATOOL_EXISTS_ON_PATH" == "" ]; then
    SB_ATOOL_EXISTS_ON_PATH="f"
    if [ "`which atool 2> /dev/null`" != "" ]; then
        SB_ATOOL_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "atool" "1c3aec44-82d1-435f-a65c-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_ARCHIVEMOUNT_EXISTS_ON_PATH" == "" ]; then
    SB_ARCHIVEMOUNT_EXISTS_ON_PATH="f"
    if [ "`which archivemount 2> /dev/null`" != "" ]; then
        SB_ARCHIVEMOUNT_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "archivemount" "54df1009-7761-4d16-8b3c-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_TAR_EXISTS_ON_PATH" == "" ]; then
    SB_TAR_EXISTS_ON_PATH="f"
    if [ "`which tar 2> /dev/null`" != "" ]; then
        SB_TAR_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "tar" "bf314f42-7392-42fe-86fc-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_ZIP_EXISTS_ON_PATH" == "" ]; then
    SB_ZIP_EXISTS_ON_PATH="f"
    if [ "`which zip 2> /dev/null`" != "" ]; then
        SB_ZIP_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "zip" "3631c8f3-befe-47eb-ae1c-b2e001716ae7"
    fi
fi
if [ "$SB_ZIP_EXISTS_ON_PATH" == "t" ]; then
    # The following alias
    alias mmmv_zip_r_n="$S_FP_NICE -n 4 zip -r -n .3g2:.3G2:.3gp:.3GP:.7z:.7Z:.alz:.ALZ:.amv:.AMV:.apk:.APK:.arc:.ARC:.arj:.ARJ:.avi:.AVI:.b1:.B1:.b6z:.B6Z:.bz2:.BZ2:.cab:.CAB:.cpt:.CPT:.deb:.DEB:.dmg:.DMG:.dvd:.DVD:.ear:.EAR:.f4a:.F4A:.f4b:.F4B:.f4p:.F4P:.f4v:.F4V:.flv:.FLV:.gz:.GZ:.img:.IMG:.iso:.ISO:.j2k:.J2K:.jar:.JAR:.jp2:.JP2:.jpeg:.JPEG:.jpf:.JPF:.jpg:.JPG:.jpm:.JPM:.jpx:.JPX:.kgb:.KGB:.lha:.LHA:.lrzip:.LRZIP:.lz:.LZ:.lzh:.LZH:.lzma:.LZMA:.lzo:.LZO:.lzx:.LZX:.m2ts:.M2TS:.m2v:.M2V:.m4p:.M4P:.m4v:.M4V:.mar:.MAR:.mj2:.MJ2:.mkv:.MKV:.mng:.MNG:.mov:.MOV:.mp2:.MP2:.mp3:.MP3:.mp4:.MP4:.mpeg:.MPEG:.mpg:.MPG:.msi:.MSI:.mts:.MTS:.ogg:.OGG:.ogv:.OGV:.ova:.OVA:.pak:.PAK:.paq6:.PAQ6:.paq7:.PAQ7:.pit:.PIT:.pkg:.PKG:.qt:.QT:.rar:.RAR:.rd:.RD:.rk:.RK:.rm:.RM:.rmvb:.RMVB:.rpm:.RPM:.rz:.RZ:.rzip:.RZIP:.s7z:.S7Z:.sfark:.SFARK:.sfx:.SFX:.shk:.SHK:.sit:.SIT:.sitx:.SITX:.spx:.SPX:.sqx:.SQX:.stblob:.STBLOB:.svi:.SVI:.swf:.SWF:.sz:.SZ:.t7z:.T7Z:.tar:.TAR:.taz:.TAZ:.tbz2:.TBZ2:.tgz:.TGZ:.tlz:.TLZ:.txz:.TXZ:.tz:.TZ:.tzma:.TZMA:.vdi:.VDI:.vhd:.VHD:.vmdk:.VMDK:.vob:.VOB:.war:.WAR:.webm:.WEBM:.wep:.WEP:.wmv:.WMV:.xar:.XAR:.xpi:.XPI:.xz:.XZ:.z:.Z:.zip:.ZIP:.zipx:.ZIPX:.zoo:.ZOO:.zpaq:.ZPAQ:.zst:.ZST:.zz:.ZZ "
    # adds .mp4 files and alike to the
    # zip-file without attempting to compress them.
    # The goal is to avoid compressing and decompressing
    # files that are already so compressed that they
    # can not be substantially compressed with ZIP.
fi
#--------------------
if [ "$SB_UNZIP_EXISTS_ON_PATH" == "" ]; then
    SB_UNZIP_EXISTS_ON_PATH="f"
    if [ "`which unzip 2> /dev/null`" != "" ]; then
        SB_UNZIP_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "unzip" "354cb5e3-2514-4ff5-9d4c-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_GZIP_EXISTS_ON_PATH" == "" ]; then
    SB_GZIP_EXISTS_ON_PATH="f"
    if [ "`which gzip 2> /dev/null`" != "" ]; then
        SB_GZIP_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "gzip" "e3fa3ffc-a901-4366-b7ac-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_GUNZIP_EXISTS_ON_PATH" == "" ]; then
    SB_GUNZIP_EXISTS_ON_PATH="f"
    if [ "`which gunzip 2> /dev/null`" != "" ]; then
        SB_GUNZIP_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "gunzip" "cca37723-e464-4017-a54c-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_PIGZ_EXISTS_ON_PATH" == "" ]; then
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
            "pigz" "3654132f-a5c1-4751-b35c-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_PLZIP_EXISTS_ON_PATH" == "" ]; then
    SB_PLZIP_EXISTS_ON_PATH="f"
    S_FP_PLZIP="`which plzip 2> /dev/null`"
    if [ "$S_FP_PLZIP" != "" ]; then
        SB_PLZIP_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "plzip" "109af1f4-bfea-4e5e-812c-b2e001716ae7"
    fi
fi
if [ "$S_FP_PLZIP" == "" ]; then
    S_FP_PLZIP="`which plzip 2> /dev/null`"
fi
if [ "$SB_PLZIP_EXISTS_ON_PATH" == "t" ]; then
    #--------------------
    S_TMP_1="$S_FP_NICE -n 17 $S_FP_PLZIP --threads=1 --decompress  "
    alias mmmv_unpack_lz_t1="$S_TMP_1"
    S_TMP_1="$S_FP_NICE -n 17 $S_FP_PLZIP --threads=1 -9 --dictionary-size=16MiB "
    alias mmmv_pack_lz_t1="$S_TMP_1"
    # TODO: declare the
    #     alias mmmv_pack_lz_t1="$S_TMP_1"
    #     alias mmmv_unpack_lz_t1="$S_TMP_1"
    # accoding to the available hardware threads.
    #--------------------
    # Test-lines:
    #
    #     S_FP="./fff" ; S_CMD_NICE="$S_FP_NICE -n 17 " ; $S_CMD_NICE tar -cf "$S_FP.tar" "$S_FP" ; if [ "$?" == "0" ]; then  sync ; wait ; $S_CMD_NICE $S_FP_PLZIP --threads=1 -9 --dictionary-size=16MiB "$S_FP.tar" ; sync ; wait ; fi
    #
    #     S_CMD_NICE="$S_FP_NICE -n 17 " ; S_FP="./fff" ; $S_CMD_NICE tar -cf "$S_FP.tar" "$S_FP" ; if [ "$?" == "0" ]; then  sync ; wait ; $S_CMD_NICE $S_FP_PLZIP --threads=1 -9 --dictionary-size=16MiB "$S_FP.tar" ; sync ; wait ; fi
    #
    #     mmmv_polish_ABC_2_ACB_exec_t1 "S_CMD_NICE=\$S_FP_NICE -n 17 \" ; S_FP=\"" '" ; $S_CMD_NICE tar -cf "$S_FP.tar" "$S_FP" ; if [ "$?" == "0" ]; then  sync ; wait ; $S_CMD_NICE $S_FP_PLZIP --threads=1 -9 --dictionary-size=16MiB "$S_FP.tar" ; sync ; wait ; fi ' ./fff
    #
    #--------------------
    if [ "$SB_TAR_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_cre_tar_lz_t1="mmmv_polish_ABC_2_ACB_exec_t1 \"S_CMD_NICE=\\\$S_FP_NICE -n 17 \\\" ; S_FP=\\\"\" '\" ; \$S_CMD_NICE tar -cf \"\$S_FP.tar\" \"\$S_FP\" ; if [ \"\$?\" == \"0\" ]; then  sync ; wait ; \$S_CMD_NICE $S_FP_PLZIP --threads=1 -9 --dictionary-size=16MiB \"\$S_FP.tar\" ; sync ; wait ; fi ' "
    fi
    #--------------------
    #TODO: Create some soft of a reverse of the alias mmmv_cre_tar_lz_t1.
    #      To avoid cryptic code, the reverse might be some Bash script,
    #      NOT an alias. Supposedly the lzip/$S_FP_PLZIP includes some
    #      integrity checksum, but for security reasons the Silktorrent
    #      idea that an integrity checksum should be encoded into a
    #      file name, might be proctical in many cases, so some form of
    #      lz-file crator script or alias should be created that encodes
    #      SHA256 or some other secure hash to a file name. Meanwhile a
    #      compromise solution might be to use the Silktorrent packager
    #      script, which creates files that have a name syntax that
    #      lacks freeform parts of the file and where the leftmost part
    #      of the file name is reserved for a secure hash to help the
    #      various indices that list the stblob-s to find the searched
    #      stblob-file name faster.
    #
    # Some semi-random test-lines for future copy-pasting:
    #
    #     echo "Fo.tar.lz.o.tar.lz" | $S_CMD_GNU_SED -e 's/[.]\(\(tlz\)\|\(tar[.]lz\)\)$//'
    #
    #     if [ "$S_CMD_GNU_SED" == "" ]; then S_CMD_GNU_SED="`which gsed 2> /dev/null `" ;  wait ; fi ; if [ "$S_CMD_GNU_SED" == "" ]; then S_CMD_GNU_SED="`which sed 2> /dev/null `" ;  wait ; fi ; if [ "$S_CMD_GNU_SED" == "" ]; then echo -e "\e[31mGNU sed not found\e[39m." ; fi
    #
    #--------------------
fi
#--------------------
if [ "$SB_TARLZ_EXISTS_ON_PATH" == "" ]; then
    SB_TARLZ_EXISTS_ON_PATH="f"
    if [ "`which tarlz 2> /dev/null`" != "" ]; then
        SB_TARLZ_EXISTS_ON_PATH="t"
        #-------------------------------------------------
        # https://www.nongnu.org/lzip/lzip.html
        #-----------citation----start---------------------
        # For creation and manipulation of compressed tar
        # archives tarlz can be more efficient than using
        # tar and plzip because tarlz is able to keep the
        # alignment between tar members and lzip members.
        #-----------citation----end-----------------------
        # archival copy: https://archive.ph/Qe2Qo
        #-------------------------------------------------
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "tarlz" "1b45d0c2-026e-465d-b01c-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_XZ_EXISTS_ON_PATH" == "" ]; then
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
            "xz" "8ec4f8ab-dc44-4916-ae4c-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_UNXZ_EXISTS_ON_PATH" == "" ]; then
    SB_UNXZ_EXISTS_ON_PATH="f"
    if [ "`which unxz 2> /dev/null`" != "" ]; then
        SB_UNXZ_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "unxz" "034687fd-5cf7-446b-ab9b-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_RAR_EXISTS_ON_PATH" == "" ]; then
    SB_RAR_EXISTS_ON_PATH="f"
    if [ "`which rar 2> /dev/null`" != "" ]; then
        SB_RAR_EXISTS_ON_PATH="t"
    else
        if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "rar" "55ab54ec-2221-4a38-844b-b2e001716ae7"
        fi
    fi
fi
#--------------------
if [ "$SB_UNRAR_EXISTS_ON_PATH" == "" ]; then
    SB_UNRAR_EXISTS_ON_PATH="f"
    if [ "`which unrar 2> /dev/null`" != "" ]; then
        SB_UNRAR_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "unrar" "7d6fbfc9-1a3c-4140-a73b-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_ARJ_EXISTS_ON_PATH" == "" ]; then
    SB_ARJ_EXISTS_ON_PATH="f"
    if [ "`which arj 2> /dev/null`" != "" ]; then
        SB_ARJ_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "arj" "45910e50-4970-49a2-883b-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_XAR_EXISTS_ON_PATH" == "" ]; then
    SB_XAR_EXISTS_ON_PATH="f"
    if [ "`which xar 2> /dev/null`" != "" ]; then
        SB_XAR_EXISTS_ON_PATH="t"
    #else
    #    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
    #        "xar" "1a07b202-2871-4c68-bd1b-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_XZ_EXISTS_ON_PATH" != "" ]; then
    #----------------------------------------
    if [ "$SB_XZ_EXISTS_ON_PATH" == "t" ]; then
        if [ "$SB_XAR_EXISTS_ON_PATH" == "t" ]; then
            if [ "$XZ_DEFAULTS" != "" ]; then
                alias mmmv_xar="XZ_DEFAULTS=\"$XZ_DEFAULTS\" $S_FP_NICE -n 17 xar --toc-cksum=sha256 --compression=xz  --compression-args=9 --coalesce-heap --keep-existing "
            else
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo -e "\e[31mThe code of this Bash file is flawed.\e[39m"
                    echo ""
                    echo "     XZ_DEFAULTS==\"$XZ_DEFAULTS\" "
                    echo ""
                    echo "GUID=='efa42f01-4bad-4a57-ad3b-b2e001716ae7'"
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
                echo "GUID=='3d0a80b5-e927-431f-ac1b-b2e001716ae7'"
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
        echo "GUID=='57c3dd72-9324-42f8-9659-b2e001716ae7'"
        echo ""
    fi
fi
#--------------------------------------------------------------------------
#::::::::::::::::::::::::HTML::to::PDF::converters:::::::::::::::::::::::::
#--------------------------------------------------------------------------
if [ "$SB_WKHTMLTOPDF_EXISTS_ON_PATH" == "" ]; then
    SB_WKHTMLTOPDF_EXISTS_ON_PATH="f"
    S_FP_WKHTMLTOPDF="`which wkhtmltopdf 2> /dev/null`"
    if [ "$S_FP_WKHTMLTOPDF" != "" ]; then
        SB_WKHTMLTOPDF_EXISTS_ON_PATH="t"
    fi
fi
if [ "$S_FP_WKHTMLTOPDF" == "" ]; then
    S_FP_WKHTMLTOPDF="`which wkhtmltopdf 2> /dev/null`"
fi
if [ "$SB_WKHTMLTOPDF_EXISTS_ON_PATH" == "t" ]; then
    alias mmmv_HTML2PDF_wkhtmltopdf="$S_FP_NICE -n 19 $S_FP_WKHTMLTOPDF "
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
if [ "$SB_PDFTOCAIRO_EXISTS_ON_PATH" == "" ]; then
    SB_PDFTOCAIRO_EXISTS_ON_PATH="f"
    S_FP_PDFTOCAIRO="`which pdftocairo 2> /dev/null`"
    if [ "$S_FP_PDFTOCAIRO" != "" ]; then
        SB_PDFTOCAIRO_EXISTS_ON_PATH="t"
    #else
        #func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        #    "pdftocairo" "530bbad4-956d-4120-884b-b2e001716ae7"
    fi
fi
if [ "$S_FP_PDFTOCAIRO" == "" ]; then
    S_FP_PDFTOCAIRO="`which pdftocairo 2> /dev/null`"
fi
if [ "$SB_PDFTOCAIRO_EXISTS_ON_PATH" == "t" ]; then
    alias pdf2cairo="$S_FP_NICE -n 2 $S_FP_PDFTOCAIRO "
fi
#--------------------
if [ "$SB_PDFTOHTMl_EXISTS_ON_PATH" == "" ]; then
    SB_PDFTOHTMl_EXISTS_ON_PATH="f"
    S_FP_PDFTOHTMl="`which pdftohtml 2> /dev/null`"
    if [ "$S_FP_PDFTOHTMl" != "" ]; then
        SB_PDFTOHTMl_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "pdftohtml" "a2dc03e5-1f30-4251-87bb-b2e001716ae7"
    fi
fi
if [ "$S_FP_PDFTOHTMl" == "" ]; then
    S_FP_PDFTOHTMl="`which pdftohtml 2> /dev/null`"
fi
if [ "$SB_PDFTOHTMl_EXISTS_ON_PATH" == "t" ]; then
    alias pdf2html="$S_FP_NICE -n 2 $S_FP_PDFTOHTMl "
fi
#--------------------
if [ "$SB_PDFTOPPM_EXISTS_ON_PATH" == "" ]; then
    SB_PDFTOPPM_EXISTS_ON_PATH="f"
    S_FP_PDFTOPPM="`which pdftoppm 2> /dev/null`"
    if [ "$S_FP_PDFTOPPM" != "" ]; then
        SB_PDFTOPPM_EXISTS_ON_PATH="t"
    #else
        #func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        #    "pdftoppm" "59a91205-b4f2-4772-bc2b-b2e001716ae7"
    fi
fi
if [ "$S_FP_PDFTOPPM" == "" ]; then
    S_FP_PDFTOPPM="`which pdftoppm 2> /dev/null`"
fi
if [ "$SB_PDFTOPPM_EXISTS_ON_PATH" == "t" ]; then
    alias pdf2ppm="$S_FP_NICE -n 2 $S_FP_PDFTOPPM "
fi
#--------------------
if [ "$SB_PDFTOPS_EXISTS_ON_PATH" == "" ]; then
    SB_PDFTOPS_EXISTS_ON_PATH="f"
    S_FP_PDFTOPS="`which pdftops 2> /dev/null`"
    if [ "$S_FP_PDFTOPS" != "" ]; then
        SB_PDFTOPS_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "pdftops" "787668b2-dc90-470e-915b-b2e001716ae7"
    fi
fi
if [ "$S_FP_PDFTOPS" == "" ]; then
    S_FP_PDFTOPS="`which pdftops 2> /dev/null`"
fi
if [ "$SB_PDFTOPS_EXISTS_ON_PATH" == "t" ]; then
    alias pdf2ps="$S_FP_NICE -n 2 $S_FP_PDFTOPS "
fi
#--------------------
if [ "$SB_PDFTOSRC_EXISTS_ON_PATH" == "" ]; then
    SB_PDFTOSRC_EXISTS_ON_PATH="f"
    S_FP_PDFTOSRC="`which pdftosrc 2> /dev/null`"
    if [ "$S_FP_PDFTOSRC" != "" ]; then
        SB_PDFTOSRC_EXISTS_ON_PATH="t"
    #else
        #func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        #    "pdftosrc" "1e9f8462-f23c-44c1-a82b-b2e001716ae7"
    fi
fi
if [ "$S_FP_PDFTOSRC" == "" ]; then
    S_FP_PDFTOSRC="`which pdftosrc 2> /dev/null`"
fi
if [ "$SB_PDFTOSRC_EXISTS_ON_PATH" == "t" ]; then
    alias pdf2src="$S_FP_NICE -n 2 $S_FP_PDFTOSRC "
fi
#--------------------
if [ "$SB_PDFTOTEXT_EXISTS_ON_PATH" == "" ]; then
    SB_PDFTOTEXT_EXISTS_ON_PATH="f"
    S_FP_PDFTOTEXT="`which pdftotext 2> /dev/null`"
    if [ "$S_FP_PDFTOTEXT" != "" ]; then
        SB_PDFTOTEXT_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "pdftotext" "5e24a1a3-437e-4be5-831b-b2e001716ae7"
    fi
fi
if [ "$S_FP_PDFTOTEXT" == "" ]; then
    S_FP_PDFTOTEXT="`which pdftotext 2> /dev/null`"
fi
if [ "$SB_PDFTOTEXT_EXISTS_ON_PATH" == "t" ]; then
    alias pdf2text="$S_FP_NICE -n 2 $S_FP_PDFTOTEXT "
fi
#--------------------
if [ "$SB_PANDOC_EXISTS_ON_PATH" == "" ]; then
    SB_PANDOC_EXISTS_ON_PATH="f"
    S_FP_PANDOC="`which pandoc 2> /dev/null`"
    if [ "$S_FP_PANDOC" != "" ]; then
        SB_PANDOC_EXISTS_ON_PATH="t"
        # "pandoc" is used for conversion
        # between different document formats.
        # https://pandoc.org/
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "pandoc" "ddc9cf9f-b085-4bb4-8c4b-b2e001716ae7"
    fi
fi
if [ "$S_FP_PANDOC" == "" ]; then
    S_FP_PANDOC="`which pandoc 2> /dev/null`"
fi
#--------------------------------------------------------------------------
#::::::::::::::::::::::::desktopo::environment:::::::::::::::::::::::::::::
#--------------------------------------------------------------------------
if [ "$SB_GNOMETYPINGMONITOR_EXISTS_ON_PATH" == "" ]; then
    SB_GNOMETYPINGMONITOR_EXISTS_ON_PATH="t"
    S_FP_GNOMETYPINGMONITOR="`which gnome-typing-monitor 2> /dev/null`"
    if [ "$S_FP_GNOMETYPINGMONITOR" != "" ]; then
        SB_GNOMETYPINGMONITOR_EXISTS_ON_PATH="t"
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            if [ "`ps -A | grep gnome-typing-monitor 2> /dev/null`" != "" ]; then
                echo ""
                echo -e "You may want to\e[33m run the alias mmmv_ui_kill_gnometypingmonitor_t1\e[39m"
                echo "or switch the gnome-typing-monitor off some other way,"
                echo "because that bully-ware is running right now."
                echo "GUID=='28fa8303-b81a-466e-8c39-b2e001716ae7'"
                echo ""
            fi
        fi
    fi
fi
if [ "$S_FP_GNOMETYPINGMONITOR" == "" ]; then
    S_FP_GNOMETYPINGMONITOR="`which gnome-typing-monitor 2> /dev/null`"
fi
if [ "$SB_GNOMETYPINGMONITOR_EXISTS_ON_PATH" == "t" ]; then
    alias mmmv_ui_kill_gnometypingmonitor_t1="$S_FP_NICE -n 2 killall $S_FP_GNOMETYPINGMONITOR "
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    #--------------------
    if [ "$SB_XDOTOOL_EXISTS_ON_PATH" == "" ]; then
        SB_XDOTOOL_EXISTS_ON_PATH="f"
        if [ "`which xdotool 2> /dev/null`" != "" ]; then
            SB_XDOTOOL_EXISTS_ON_PATH="t"
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "xdotool" "834ccd71-03d1-4b79-904b-b2e001716ae7"
        fi
    fi
    if [ "$SB_XDOTOOL_EXISTS_ON_PATH" == "t" ]; then
        # https://askubuntu.com/questions/4876/can-i-minimize-a-window-from-the-command-line
        # archival copy: https://archive.vn/sNxpI
        alias mmmv_ui_minimize_active_window_t1="$S_FP_NICE -n 3 xdotool windowminimize \$(xdotool getactivewindow) "
    fi
    #--------------------
    if [ "$SB_WMCTRL_EXISTS_ON_PATH" == "" ]; then
        SB_WMCTRL_EXISTS_ON_PATH="f"
        if [ "`which wmctrl 2> /dev/null`" != "" ]; then
            SB_WMCTRL_EXISTS_ON_PATH="t"
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "wmctrl" "48f51031-c6de-49a0-bc5b-b2e001716ae7"
        fi
    fi
    if [ "$SB_WMCTRL_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_ui_switch_to_desktop_t1="$S_FP_NICE -n 2 wmctrl -s " # desktop number is the argument
        #--------
        if [ "$SB_XDOTOOL_EXISTS_ON_PATH" == "t" ]; then
            # https://gist.github.com/platan/e63b465c2fcfe3d0cccd
            # archival copy:https://archive.ph/PZhM8
            alias mmmv_ui_maximize_active_window_t1="$S_FP_NICE -n 3 wmctrl -i -r \"\`xdotool getactivewindow\`\" -b add,maximized_vert,maximized_horz "
        fi
        #--------
    fi
    #--------------------
    if [ "$SB_GSETTINGS_WORKS_T1" != "" ]; then
        func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
            "$SB_GSETTINGS_WORKS_T1" "SB_GSETTINGS_WORKS_T1" \
            "34ad9d62-4b8d-4ed4-b63b-b2e001716ae7"
        if [ "$SB_VERIFICATION_FAILED" == "t" ]; then
            SB_GSETTINGS_WORKS_T1="f" # to allow code at future locations
                                      # of the control flow to work
        fi
    else
        SB_GSETTINGS_WORKS_T1="f" # exists to avoid some tests at sub-sessions
    fi
    #--------
    if [ "$SB_GSETTINGS_EXISTS_ON_PATH" == "" ]; then
        SB_GSETTINGS_EXISTS_ON_PATH="f"
        if [ "`which gsettings 2> /dev/null`" != "" ]; then
            SB_GSETTINGS_EXISTS_ON_PATH="t"
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
                    echo "GUID=='1e78b352-691e-4119-ba38-b2e001716ae7'"
                    echo ""
                fi
            fi
        #     func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        #         "gsettings" "d22bb9b8-ff97-4133-ad4b-b2e001716ae7"
        fi
    fi
    if [ "$SB_GSETTINGS_EXISTS_ON_PATH" == "t" ]; then
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
    fi
    #--------------------
    if [ "$SB_IMPORT_EXISTS_ON_PATH" == "" ]; then
        SB_IMPORT_EXISTS_ON_PATH="f"
        if [ "`which import 2> /dev/null`" != "" ]; then
            SB_IMPORT_EXISTS_ON_PATH="t"
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "import" "3e77ac21-e5f9-4c10-aa1b-b2e001716ae7"
        fi
    fi
    if [ "$SB_IMPORT_EXISTS_ON_PATH" == "t" ]; then
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
    fi
    #--------------------
    if [ "$SB_GNOMECHARACTERS_EXISTS_ON_PATH" == "" ]; then
        SB_GNOMECHARACTERS_EXISTS_ON_PATH="f"
        if [ "`which gnome-characters 2> /dev/null`" != "" ]; then
            SB_GNOMECHARACTERS_EXISTS_ON_PATH="t"
        # else
        #     func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        #         "gnome-characters" "15d7b683-4baa-44cc-964b-b2e001716ae7"
        fi
    fi
    if [ "$SB_GNOMECHARACTERS_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_charmap_t1="$S_FP_NICE -n 4 gnome-characters "
    fi
    #--------------------
    if [ "$SB_GNOMETWEAKS_EXISTS_ON_PATH" == "" ]; then
        SB_GNOMETWEAKS_EXISTS_ON_PATH="f"
        if [ "`which gnome-tweaks 2> /dev/null`" != "" ]; then
            SB_GNOMETWEAKS_EXISTS_ON_PATH="t"
        # else
        #     func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        #         "gnome-tweaks" "3a927431-d2a1-4499-895b-b2e001716ae7"
        fi
    fi
    if [ "$SB_GNOMETWEAKS_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_admin_gnome_settings_GUI_gnometweaks_t1="gnome-tweaks "
    fi
    #--------------------
    if [ "$SB_GNOMESHELLEXTENSIONPREFS_EXISTS_ON_PATH" == "" ]; then
        SB_GNOMESHELLEXTENSIONPREFS_EXISTS_ON_PATH="f"
        if [ "`which gnome-shell-extension-prefs 2> /dev/null`" != "" ]; then
            SB_GNOMESHELLEXTENSIONPREFS_EXISTS_ON_PATH="t"
        # else
        #     func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        #         "gnome-shell-extension-prefs" "41cec949-a5fc-4a68-b24b-b2e001716ae7"
        fi
    fi
    if [ "$SB_GNOMESHELLEXTENSIONPREFS_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_admin_gnome_settings_GUI_gnomeshellextensionprefs_t1="gnome-shell-extension-prefs "
    fi
    #--------------------
fi
#--------------------------------------------------------------------------
#:::::::::::::::::::::::::office::applications:::::::::::::::::::::::::::::
#--------------------------------------------------------------------------
if [ "$MMMV_SB_LOOK_FOR_OFFICE_SOFTWARE" == "t" ]; then
    #----------------------------------------------------------------------
    if [ "$SB_UNOCONV_EXISTS_ON_PATH" == "" ]; then
        SB_UNOCONV_EXISTS_ON_PATH="f"
        if [ "`which unoconv 2> /dev/null`" != "" ]; then
            SB_UNOCONV_EXISTS_ON_PATH="t"
            # "unoconv" is used for converting various documents
            # to and from LibreOffice document formats.
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "unoconv" "34723a55-f4ab-4dac-b64a-b2e001716ae7"
        fi
    fi
    #----------------------------------------------------------------------
fi
#--------------------------------------------------------------------------
#:::::::::::::::start::of::tests::for::Rust::applications::::::::::::::::::
#--------------------------------------------------------------------------
if [ "$SB_BAT_EXISTS_ON_PATH" == "" ]; then
    SB_BAT_EXISTS_ON_PATH="f"
    if [ "`which bat 2> /dev/null`" != "" ]; then
        SB_BAT_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "bat" "c2f3b9e5-7037-4eaa-a15a-b2e001716ae7"
        if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
            echo "\"bat\" MIGHT be installed by executing "
            echo -e "\e[36m"
            echo "    cargo install bat "
            echo -e "\e[39m"
            echo "GUID=='bdbe9c13-7f39-4b94-a238-b2e001716ae7'"
            echo ""
        fi
    fi
fi
#----------------------------------------
if [ "$SB_ZOXIDE_EXISTS_ON_PATH" == "" ]; then
    SB_ZOXIDE_EXISTS_ON_PATH="f"
    if [ "`which zoxide 2> /dev/null`" != "" ]; then
        SB_ZOXIDE_EXISTS_ON_PATH="t"
        eval "$(zoxide init bash)"
        if [ "$?" == "0" ]; then
            alias z_q="nice -n 2 zoxide query "
            alias z_a_pwd="nice -n 2 zoxide add \`pwd\` ; "
            alias z_r_pwd="nice -n 2 zoxide remove \`pwd\` ; "
            alias z_ls_ranks_interactive="nice -n 2 zoxide edit "
        fi
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "zoxide" "110b55f3-86eb-4f7c-a21a-b2e001716ae7"
        if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
            echo "\"zoxide\" MIGHT be installed by executing "
            echo -e "\e[36m"
            echo "    cargo install zoxide "
            echo -e "\e[39m"
            echo "After installation it MIGHT be enabled "
            echo "on Bash console by executing:"
            echo -e "\e[36m"
            echo "    eval \"\$(zoxide init bash)\" "
            echo -e "\e[39m"
            echo "GUID=='3ab242d3-2f5f-41c7-8d47-b2e001716ae7'"
            echo ""
        fi
    fi
fi
#----------------------------------------
# The SB_EXA_EXISTS_ON_PATH
# MIGHT have been declared at the
# /home/mmmv/applications/declare_applications.bash
if [ "$SB_EXA_EXISTS_ON_PATH" == "" ]; then
    SB_EXA_EXISTS_ON_PATH="f"
    if [ "`which exa 2> /dev/null`" != "" ]; then
        SB_EXA_EXISTS_ON_PATH="t"
        # The aliases ls0 and mmmv_ls0
        # are declared at a lower part of this file.
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "exa" "61bcc542-0ea7-4c8a-862a-b2e001716ae7"
        if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
            echo "\"exa\" MIGHT be installed by executing "
            echo -e "\e[36m"
            echo "    cargo install exa"
            echo -e "\e[39m"
            echo "In the case of Debian based operating systems "
            echo "the \"exa\" MIGHT be available form the "
            echo "operating system standard package collection."
            echo "GUID=='9f3b134d-62a8-4182-9137-b2e001716ae7'"
            echo ""
        fi
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
            echo "GUID=='2f0efa62-4529-4d0b-bb26-b2e001716ae7'"
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
    S_TMP_0="$S_FP_NICE -n 2 exa "
    S_TMP_1=" -b -l -T -L "
    S_TMP_2="$S_TMP_0 $S_TMP_1"
    # changes the size display mode from decimal prefixes (kB,MB,GB,...)
    # to the binary, classical, prerixes (KiB,MiB,GiB,...). The
    alias ls0="$S_TMP_2"
    alias mmmv_ls0="$S_TMP_2"
    alias ll="$S_TMP_2 1 " # a fancier substitute for the 'alias ll="ls -la "'
    alias lll="$S_TMP_2 2 " # derived from the alias above
    alias llll="$S_TMP_2 3 " # derived from the alias above
    alias lllll="$S_TMP_2 4 " # derived from the alias above
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
else
    alias ll="ls -la " # output on Linux and FreeBSD differs, but it works on both of them.
    # The alias name, "ll", originates from Ubuntu Mate Linux
    # distribution's default ~/.bashrc, where the alias definitions were:
    #
    #     alias ll='ls -alF'
    #     alias la='ls -A'
    #     alias l='ls -CF'
    #
fi
#----------------------------------------
if [ "$SB_MCFLY_EXISTS_ON_PATH" == "" ]; then
    SB_MCFLY_EXISTS_ON_PATH="f"
    if [ "`which mcfly 2> /dev/null`" != "" ]; then
        SB_MCFLY_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "mcfly" "5cc2ae72-473a-455c-b73a-b2e001716ae7"
        if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
            echo "\"mcfly\" MIGHT be installed by executing "
            echo -e "\e[36m"
            echo "    cargo install mcfly "
            echo -e "\e[39m"
            echo "GUID=='0748c3d7-601a-4ec3-b656-b2e001716ae7'"
            echo ""
        fi
    fi
fi
if [ "$SB_MCFLY_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
        # The
        #     https://github.com/cantino/mcfly
        # is a neural network based Bash history
        # search engine. If the ~/.bashrc includes
        #
            eval "$(mcfly init bash)"
        #
        # then the mcfly will be used for the
        # Bash history retrieval command "Ctrl-r"
    fi
    # The above if-clause surrounds the call to the mcfly
    # because the mcfly sometimes puts messages to console.
fi
#----------------------------------------
if [ "$SB_GITUI_EXISTS_ON_PATH" == "" ]; then
    SB_GITUI_EXISTS_ON_PATH="f"
    if [ "`which gitui 2> /dev/null`" != "" ]; then
        SB_GITUI_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "gitui" "41902e22-41a7-4f87-b23a-b2e001716ae7"
    fi
fi
#----------------------------------------
if [ "$SB_RG_EXISTS_ON_PATH" == "" ]; then
    SB_RG_EXISTS_ON_PATH="f" # rg is installed by "cargo install ripgrep"
    if [ "`which rg 2> /dev/null`" != "" ]; then
        SB_RG_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "rg/ripgrep" "35ed90ca-b2b9-4656-8f4a-b2e001716ae7"
    fi
fi
if [ "$SB_RG_EXISTS_ON_PATH" == "t" ]; then
    alias rg0="$S_FP_NICE -n 5 rg --max-depth 0 "
    alias rg1="$S_FP_NICE -n 5 rg --max-depth 1 "
    alias rg2="$S_FP_NICE -n 5 rg --max-depth 2 "
    alias rg3="$S_FP_NICE -n 5 rg --max-depth 3 "
    alias rg4="$S_FP_NICE -n 5 rg --max-depth 4 "
    alias rg5="$S_FP_NICE -n 5 rg --max-depth 5 "
    alias rg6="$S_FP_NICE -n 5 rg --max-depth 6 "
    alias rg7="$S_FP_NICE -n 5 rg --max-depth 7 "
    alias rg8="$S_FP_NICE -n 5 rg --max-depth 8 "
    alias rg9="$S_FP_NICE -n 5 rg --max-depth 9 "
    alias rg10="$S_FP_NICE -n 5 rg --max-depth 10 "
    alias rg11="$S_FP_NICE -n 5 rg --max-depth 11 "
    alias rg12="$S_FP_NICE -n 5 rg --max-depth 12 "
    alias rg13="$S_FP_NICE -n 5 rg --max-depth 13 "
    alias rg14="$S_FP_NICE -n 5 rg --max-depth 14 "
    alias rg15="$S_FP_NICE -n 5 rg --max-depth 15 "
    alias rg16="$S_FP_NICE -n 5 rg --max-depth 16 "
    alias rg17="$S_FP_NICE -n 5 rg --max-depth 17 "
    alias rg18="$S_FP_NICE -n 5 rg --max-depth 18 "
    alias rg19="$S_FP_NICE -n 5 rg --max-depth 19 "
    alias rg20="$S_FP_NICE -n 5 rg --max-depth 20 "
    alias rg21="$S_FP_NICE -n 5 rg --max-depth 21 "
    alias rg22="$S_FP_NICE -n 5 rg --max-depth 22 "
    alias rg23="$S_FP_NICE -n 5 rg --max-depth 23 "
    alias rg24="$S_FP_NICE -n 5 rg --max-depth 24 "
    # Deeper recursion can be used by not setting
    # any recursion depth limits: nice -n 5 rg SearchString" .
fi
#----------------------------------------
if [ "$SB_WIKITUI_EXISTS_ON_PATH" == "" ]; then
    SB_WIKITUI_EXISTS_ON_PATH="f"
    if [ "`which wiki-tui 2> /dev/null`" != "" ]; then
        SB_WIKITUI_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "wiki-tui" "3c725882-1988-4fd4-984a-b2e001716ae7"
    fi
fi
#----------------------------------------
#--------------------------------------------------------------------------
#:::::::::::::start::of::tests::for::Python::applications::::::::::::::::::
#--------------------------------------------------------------------------
if [ "$SB_YTDLP_EXISTS_ON_PATH" == "" ]; then
    SB_YTDLP_EXISTS_ON_PATH="f"
    if [ "`which yt-dlp 2> /dev/null`" != "" ]; then
        SB_YTDLP_EXISTS_ON_PATH="t"
        S_TMP_0="yt-dlp --wait-for-video 2 "
        alias mmmv_videodownloader_ytdlp_t1="$S_TMP_0 " # <YouTube video URL comes here>
        alias mmmv_download_video_from_YouTube_ytdlp_t1="$S_TMP_0 " # <YouTube video URL comes here>
        #---------------------------------------------
        # https://github.com/yt-dlp/yt-dlp
        # As of 2025_02_12 the yt-dlp is installable
        # by executing the following Bash command:
        #
        #     pipx install yt-dlp
        #
        # As of 2025_02_12 a web browser based
        # alternative for downloading YouTube
        # videos is the online service:
        #
        #     https://cobalt.tools/
        #
        # As of 2025_02_12 the desktop
        # application named FreeTube also has
        # video download functionality:
        #
        #     https://freetubeapp.io/
        #---------------------------------------------
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "yt-dlp" "536d1f64-a225-48c1-a72a-b2e001716ae7"
        if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
            echo "\"yt-dlp\" MIGHT be installed by executing "
            echo -e "\e[36m"
            echo "    pipx install yt-dlp "
            echo -e "\e[39m"
            echo "GUID=='53054091-34bb-421f-a236-b2e001716ae7'"
            echo ""
        fi
    fi
fi
#----------------------------------------
if [ "$SB_TRAFILATURA_EXISTS_ON_PATH" == "" ]; then
    SB_TRAFILATURA_EXISTS_ON_PATH="f"
    if [ "`which trafilatura 2> /dev/null`" != "" ]; then
        SB_TRAFILATURA_EXISTS_ON_PATH="t"
        # The trafilatura is a Python3 application that
        # once upon a time was meant to be installed by
        #
        #     pip3 install --no-cache-dir trafilatura
        #
        # but as of 2025_03 is installed by executing
        #
        #     pipx install trafilatura
        #
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "trafilatura" "3051ede4-d158-4159-a21a-b2e001716ae7"
        if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
            echo "\"trafilatura\" MIGHT be installed by executing "
            echo -e "\e[36m"
            echo "    pipx install trafilatura "
            echo -e "\e[39m"
            echo "GUID=='1e6c69b1-66b1-4db1-a516-b2e001716ae7'"
            echo ""
        fi
    fi
fi
#----------------------------------------
if [ "$SB_PDM_EXISTS_ON_PATH" == "" ]; then
    SB_PDM_EXISTS_ON_PATH="f"
    if [ "`which pdm 2> /dev/null`" != "" ]; then
        SB_PDM_EXISTS_ON_PATH="t"
        # The pdm is yet another Python package manager.
        #     https://github.com/pdm-project/pdm
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "pdm" "1135e93d-ff21-46d1-954a-b2e001716ae7"
        if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
            echo "\"pdm\" MIGHT be installed by executing "
            echo -e "\e[36m"
            echo "    pipx install --include-deps --force pdm "
            echo -e "\e[39m"
            echo "GUID=='b5419392-90a5-4ed8-8755-b2e001716ae7'"
            echo ""
        fi
    fi
fi
#--------------------------------------------------------------------------
#::::::::::::::::::::::::::::::various:::::::::::::::::::::::::::::::::::::
#--------------------------------------------------------------------------
if [ "$MMMV_SB_LOOK_FOR_DEVELOPMENT_TOOLS" == "t" ]; then
    #----------------------------------------------------------------------
    if [ "$SB_AUTOCONF_EXISTS_ON_PATH" == "" ]; then
        SB_AUTOCONF_EXISTS_ON_PATH="f"
        if [ "`which autoconf 2> /dev/null`" != "" ]; then
            SB_AUTOCONF_EXISTS_ON_PATH="t"
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "autoconf" "044d1613-76f7-44ac-913a-b2e001716ae7"
        fi
    fi
    #----------------------------------------------------------------------
fi
#--------------------
if [ "$SB_Q4OSYOUTUBEDOWNLOADER_EXISTS_ON_PATH" == "" ]; then
    SB_Q4OSYOUTUBEDOWNLOADER_EXISTS_ON_PATH="f"
    if [ "`which q4os-youtube-downloader 2> /dev/null`" != "" ]; then
        SB_Q4OSYOUTUBEDOWNLOADER_EXISTS_ON_PATH="t"
    # else
    #    # Test resides after the
    #    #     SB_YOUTUBEDLGUI_EXISTS_ON_PATH
    #    # has been assigned a value, because
    #    # as of 2025_04 the "q4os-youtube-downloader"
    #    # gets uninstalled during the installation
    #    # of of the "youtubedl-gui".
    fi
fi
#--------------------
if [ "$SB_YOUTUBEDLGUI_EXISTS_ON_PATH" == "" ]; then
    SB_YOUTUBEDLGUI_EXISTS_ON_PATH="f"
    if [ "`which youtubedl-gui 2> /dev/null`" != "" ]; then
        SB_YOUTUBEDLGUI_EXISTS_ON_PATH="t"
    else
        if [ "$SB_YTDLP_EXISTS_ON_PATH" == "t" ]; then
            if [ "$SB_Q4OSYOUTUBEDOWNLOADER_EXISTS_ON_PATH" == "f" ]; then
                # As of 2025_04 the "q4os-youtube-downloader"
                # gets uninstalled during the installation
                # of of the "youtubedl-gui".
                func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                    "youtubedl-gui" "212be5f9-257b-421c-82fa-b2e001716ae7"
            fi
        fi
    fi
fi
if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
    if [ "$SB_OPERATINGSYSTEM_LINUX_WSL" == "f" ]; then
        if [ "$SB_OPERATINGSYSTEM_LINUX_WSL_ANDROID_TERMUX" == "f" ]; then
            if [ "$SB_YTDLP_EXISTS_ON_PATH" == "t" ]; then
                if [ "$SB_YOUTUBEDLGUI_EXISTS_ON_PATH" == "f" ]; then
                    if [ "$SB_Q4OSYOUTUBEDOWNLOADER_EXISTS_ON_PATH" == "f" ]; then
                        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                            "q4os-youtube-downloader" "2825da41-07e6-4f4f-8749-b2e001716ae7"
                    fi
                fi
            fi
        fi
    fi
fi
#--------------------
if [ "$SB_YTFZF_EXISTS_ON_PATH" == "" ]; then
    SB_YTFZF_EXISTS_ON_PATH="f"
    if [ "`which ytfzf 2> /dev/null`" != "" ]; then
        SB_YTFZF_EXISTS_ON_PATH="t"
        # The "ytfzf" is supposed to be for
        # searching YouTube videos, but as of 2025_04
        # in practice it does not work, but
        # maybe it does not work due to some
        #     https://invidious.io/
        # web service API changes.
    # else
    #     if [ "$SB_YTDLP_EXISTS_ON_PATH" == "t" ]; then
    #         func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
    #             "ytfzf" "27879263-81b8-47d0-ac29-b2e001716ae7"
    #         if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
    #             if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    #                 if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
    #                     echo ""
    #                     echo "\"ytfzf\" MIGHT be available form the "
    #                     echo "operating system standard package collection."
    #                     echo "In the case of Debian based operating systems"
    #                     echo "it MIGHT be installed by executing "
    #                     echo -e "\e[36m"
    #                     echo "    apt-get install ytfzf"
    #                     echo -e "\e[39m"
    #                     echo "GUID=='55659814-805e-4ebc-bd45-b2e001716ae7'"
    #                     echo ""
    #                 fi
    #             fi
    #         fi
    #     fi
    fi
fi
#--------------------
if [ "$SB_UNCOMPFACE_EXISTS_ON_PATH" == "" ]; then
    SB_UNCOMPFACE_EXISTS_ON_PATH="f"
    if [ "`which uncompface 2> /dev/null`" != "" ]; then
        SB_UNCOMPFACE_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "uncompface" "1228e265-4a66-44b6-9e19-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_COMPFACE_EXISTS_ON_PATH" == "" ]; then
    SB_COMPFACE_EXISTS_ON_PATH="f"
    if [ "`which compface 2> /dev/null`" != "" ]; then
        SB_COMPFACE_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "compface" "5876c844-7cf1-400c-9a59-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_CONVMV_EXISTS_ON_PATH" == "" ]; then
    SB_CONVMV_EXISTS_ON_PATH="f"
    if [ "`which convmv 2> /dev/null`" != "" ]; then
        SB_CONVMV_EXISTS_ON_PATH="t"
        # It's a file name encoding conversion tool.
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "convmv" "730b2b54-c77f-42e7-bd59-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_BASE64_EXISTS_ON_PATH" == "" ]; then
    SB_BASE64_EXISTS_ON_PATH="f"
    if [ "`which base64 2> /dev/null`" != "" ]; then
        SB_BASE64_EXISTS_ON_PATH="t"
    fi
fi
#--------------------
if [ "$SB_STAT_EXISTS_ON_PATH" == "" ]; then
    SB_STAT_EXISTS_ON_PATH="f"
    if [ "`which stat 2> /dev/null`" != "" ]; then
        SB_STAT_EXISTS_ON_PATH="t"
        # Supposedly on Linux the "stat" is part of the GNU coreutils.
        # "stat" on FreeBSD is a separate program with a different interface.
    fi
fi
#--------------------
if [ "$SB_BC_EXISTS_ON_PATH" == "" ]; then
    SB_BC_EXISTS_ON_PATH="f"
    if [ "`which bc 2> /dev/null`" != "" ]; then
        SB_BC_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "bc" "a5bd7d53-486f-40bb-b229-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_CONCALC_EXISTS_ON_PATH" == "" ]; then
    SB_CONCALC_EXISTS_ON_PATH="f"
    if [ "`which concalc 2> /dev/null`" != "" ]; then
        SB_CONCALC_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "concalc" "5b142d22-f3b8-4c97-8429-b2e001716ae7"
    fi
fi
#--------------------
if [ "$SB_PMAP_EXISTS_ON_PATH" == "" ]; then
    SB_PMAP_EXISTS_ON_PATH="f"
    if [ "`which pmap 2> /dev/null`" != "" ]; then
        SB_PMAP_EXISTS_ON_PATH="t"
    fi
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
    if [ "$SB_XCLIP_EXISTS_ON_PATH" == "" ]; then
        SB_XCLIP_EXISTS_ON_PATH="f"
        if [ "`which xclip 2> /dev/null`" != "" ]; then
            SB_XCLIP_EXISTS_ON_PATH="t"
        else
           func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
               "xclip" "259ee6e2-1411-461a-9049-b2e001716ae7"
        fi
    fi
    if [ "$SB_XCLIP_EXISTS_ON_PATH" == "t" ]; then
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
    fi
    #----------------------------------------------------------------------
fi
#--------------------
if [ "$MMMV_SB_LOOK_FOR_DEVELOPMENT_TOOLS" == "t" ]; then
    #----------------------------------------------------------------------
    if [ "$SB_CHECKBASHISMS_EXISTS_ON_PATH" == "" ]; then
        SB_CHECKBASHISMS_EXISTS_ON_PATH="f"
        if [ "`which checkbashisms 2> /dev/null`" != "" ]; then
            SB_CHECKBASHISMS_EXISTS_ON_PATH="t"
        fi
    fi
    if [ "$SB_CHECKBASHISMS_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_devel_checkbashisms_common_bashrc_main_bash="checkbashisms --posix $S_FP_DIR/common_bashrc_main.bash "
    fi
    #--------------------
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
        if [ "$SB_DEBTREE_EXISTS_ON_PATH" == "" ]; then
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
                    "debtree" "3d4473f4-b234-4c11-ae49-b2e001716ae7"
                # Thank You.
            fi
        fi
    fi
    #--------------------
    if [ "$SB_M4_EXISTS_ON_PATH" == "" ]; then
        SB_M4_EXISTS_ON_PATH="f"
        if [ "`which m4 2> /dev/null`" != "" ]; then
            SB_M4_EXISTS_ON_PATH="t"
            if [ "$M4" == "" ]; then
                # Some build scripts require that the environment variable
                # M4 is set even, if the m4 is available on PATH.
                export M4="$S_TMP_0"
            fi
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "m4" "42e71f45-f4f8-47b8-8859-b2e001716ae7"
        fi
    fi
    #----------------------------------------------------------------------
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    if [ "$SB_PACTL_EXISTS_ON_PATH" == "" ]; then
        SB_PACTL_EXISTS_ON_PATH="f"
        if [ "`which pactl 2> /dev/null`" != "" ]; then
            SB_PACTL_EXISTS_ON_PATH="t"
            # Usage example for redirecting desktop audio to BlueTooth headphones:
            #     pactl list short sinks | grep -i bluez_output
            #     pactl set-default-sink bluez_output.6E_35_E0_0E_92_3B.1
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "pactl" "c139ed54-dece-422d-ac19-b2e001716ae7"
            if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
                echo "On Debian based systems the \"pactl\" MIGHT be installed "
                echo -e "by installing a package named \"\e[33mpulseaudio-utils\e[39m\"."
                echo "GUID=='1d058fd4-82d1-4a01-9655-b2e001716ae7'"
                echo ""
            fi
        fi
    fi
    if [ "$SB_PACTL_EXISTS_ON_PATH" == "t" ]; then
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
if [ "$SB_LOCALECTL_EXISTS_ON_PATH" == "" ]; then
    SB_LOCALECTL_EXISTS_ON_PATH="f"
    if [ "`which localectl 2> /dev/null`" != "" ]; then
        SB_LOCALECTL_EXISTS_ON_PATH="t"
    fi
fi
if [ "$SB_LOCALECTL_EXISTS_ON_PATH" == "t" ]; then
    #----------------------------------------------------------------------
    # According to
    #     https://man.freebsd.org/cgi/man.cgi?query=localectl&sektion=1&manpath=Debian+8.1.0
    #     archival copy: https://archive.ph/p7aCa
    # Some program with the name of "localectl" does seem to
    # exist on FreeBSD and it does seem to have command-line
    # options "list-x11-keymap-models", "list-x11-keymap-layouts",
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
if [ "$SB_SETXKBMAP_EXISTS_ON_PATH" == "" ]; then
    SB_SETXKBMAP_EXISTS_ON_PATH="f"
    if [ "`which setxkbmap 2> /dev/null`" != "" ]; then
        SB_SETXKBMAP_EXISTS_ON_PATH="t"
    else
        if [ "$SB_OPERATINGSYSTEM_LINUX_WSL" == "f" ]; then
            if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
                func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                    "setxkbmap" "7347bf6d-07ce-4112-bb99-b2e001716ae7"
            fi
        fi
    fi
fi
#--------------------
if [ "$SB_XWALLPAPER_EXISTS_ON_PATH" == "" ]; then
    SB_XWALLPAPER_EXISTS_ON_PATH="f"
    if [ "`which xwallpaper 2> /dev/null`" != "" ]; then
        SB_XWALLPAPER_EXISTS_ON_PATH="t"
        # The xwallpaper is an optional dependency
        # of the i3 window manager.
        # https://i3wm.org/
        #
        # Usage example:
        #     xwallpaper --center   /foo/bar/image.jpg
        #     xwallpaper --stretch  /foo/bar/image.jpg
        #     xwallpaper --tile     /foo/bar/image.jpg
        #
        # The "--center" option might use only black color
        # by default as the surrounding color for an image that
        # is smaller than the screen size. A workaround to it
        # is to create an image with the widht and length that
        # matches the screen size and then use that image
        # as the background image. One way how the image
        # MIGHT be created at Bash comsole:
        #
        #     SI_SCREEN_WIDTH="1280"; SI_SCREEN_HEIGHT="1024"; S_WxH="$SI_SCREEN_WIDTH"'x'"$SI_SCREEN_HEIGHT" ; convert ./monorail_orig.jpeg -resize $S_WxH -background "#00aaff" -gravity center -extent $S_WxH  "./monorail_$S_WxH"'.jpeg'
        #
        # or the same Bash line developed further:
        #
        #     S_FP_INPUT_FILE_PATH="`pwd`/monorail_orig.jpeg" ; SI_SCREEN_WIDTH="1280"; SI_SCREEN_HEIGHT="1024"; S_WxH="$SI_SCREEN_WIDTH"'x'"$SI_SCREEN_HEIGHT" ; S_FP_OUTPUT_FILE_PATH="`echo $S_FP_INPUT_FILE_PATH | sed -e 's/\([.][^.]\+\)$/'$S_WxH'\1/g' `" ; sync ; wait ; convert "$S_FP_INPUT_FILE_PATH"  -resize $S_WxH -background "#000000" -gravity center -extent $S_WxH  "$S_FP_OUTPUT_FILE_PATH"
        #
        # which MIGHT be developed further to be used only if
        # mmmv_userspace_distro_t1 specific tools are available:
        #
        # alias mmmv_convert_image_to_bacground_image_with_framecolour_000000_1280x1024_t1="mmmv_polish_ABC_2_ACB_exec_t1 \"S_FP_INPUT_FILE_PATH=\\\"\"     \"\\\" ; SI_SCREEN_WIDTH=\\\"1280\\\"; SI_SCREEN_HEIGHT=\\\"1024\\\"; S_WxH=\\\"\\\$SI_SCREEN_WIDTH\\\"'x'\\\"\\\$SI_SCREEN_HEIGHT\\\" ; S_FP_OUTPUT_FILE_PATH=\\\"\\\`echo \\\$S_FP_INPUT_FILE_PATH | sed -e 's/\\\\([.][^.]\\\\+\\\\)\\\$/_'\\\$S_WxH'\\\\1/g' \\\`\\\" ; sync ; wait ; convert \\\"\\\$S_FP_INPUT_FILE_PATH\\\"  -resize \\\$S_WxH -background \\\"#000000\\\" -gravity center -extent \\\$S_WxH  \\\"\\\$S_FP_OUTPUT_FILE_PATH\\\"\" "
        #
    else
        if [ "$SB_OPERATINGSYSTEM_LINUX_WSL" == "f" ]; then
            if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID" == "f" ]; then
                func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                    "xwallpaper" "11acc707-a974-451c-8669-b2e001716ae7"
            fi
        fi
    fi
fi
#--------------------
# # It seems that the "xbackground" is not really available.
# # Hence the outcommenting of this test here.
# if [ "$SB_XBACKGROUND_EXISTS_ON_PATH" == "" ]; then
#     SB_XBACKGROUND_EXISTS_ON_PATH="f"
#     if [ "`which xbackground 2> /dev/null`" != "" ]; then
#         SB_XBACKGROUND_EXISTS_ON_PATH="t"
#         # The xbackground is an optional dependency
#         # of the i3 window manager.
#         # https://i3wm.org/
#         #
#         # Usage example:
#         #     xbackground -center /foo/bar/image.jpg
#         #     xbackground -tile   /foo/bar/image.jpg
#         #     xbackground -scale  /foo/bar/image.jpg
#     else
#         if [ "$SB_OPERATINGSYSTEM_LINUX_WSL" == "f" ]; then
#             if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID" == "f" ]; then
#                 func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
#                     "xbackground" "b3341225-3e0c-44ba-9019-b2e001716ae7"
#                 if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
#                     echo "On Debian based systems the \"xbackground\" MIGHT be installed "
#                     echo -e "by installing a package named \"\e[33mx11-xserver-utils\e[39m\"."
#                     echo "GUID=='60389cc1-924f-4b2b-8a34-b2e001716ae7'"
#                     echo ""
#                 fi
#             fi
#         fi
#     fi
# fi
#--------------------
if [ "$SB_XSET_EXISTS_ON_PATH" == "" ]; then
    SB_XSET_EXISTS_ON_PATH="f"
    if [ "`which xset 2> /dev/null`" != "" ]; then
        SB_XSET_EXISTS_ON_PATH="t"
        # The xset is an optional dependency
        # of the i3 window manager.
        # https://i3wm.org/
        #
        # A way to display the settings on command line:
        #     xset q
    else
        #if [ "$SB_OPERATINGSYSTEM_LINUX_WSL" == "f" ]; then
            # As of 2026_04 the "xset" is available at Windows10 WSL.
            if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID" == "f" ]; then
                func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                    "xset" "ccb38ee0-842b-4911-8b59-b2e001716ae7"
                if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
                    echo "On Debian based systems the \"xset\" MIGHT be installed "
                    echo -e "by installing a package named \"\e[33mxsettingsd\e[39m\"."
                    echo "GUID=='46e8ba63-5b5b-4a05-8a24-b2e001716ae7'"
                    echo ""
                fi
            fi
        #fi
    fi
fi
#--------------------
if [ "$SB_XSSLOCK_EXISTS_ON_PATH" == "" ]; then
    SB_XSSLOCK_EXISTS_ON_PATH="f"
    if [ "`which xss-lock 2> /dev/null`" != "" ]; then
        SB_XSSLOCK_EXISTS_ON_PATH="t"
        # The xss-lock is an optional dependency
        # of the i3 window manager.
        # https://i3wm.org/
    else
        if [ "$SB_OPERATINGSYSTEM_LINUX_WSL" == "f" ]; then
            if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID" == "f" ]; then
                func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                    "xss-lock" "14a8f2c5-de3a-4120-bd29-b2e001716ae7"
            fi
        fi
    fi
fi
#--------------------
if [ "$SB_XRANDR_EXISTS_ON_PATH" == "" ]; then
    SB_XRANDR_EXISTS_ON_PATH="f"
    if [ "`which xrandr 2> /dev/null`" != "" ]; then
        SB_XRANDR_EXISTS_ON_PATH="t"
    else
        # xrandr does exist and work at 2026 era Windows10 WSL Debian.
        if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID" == "f" ]; then
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "xrandr" "39d03cc1-bc47-4107-ac29-b2e001716ae7"
        fi
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    if [ "$SB_RESIZE_EXISTS_ON_PATH" == "" ]; then
        SB_RESIZE_EXISTS_ON_PATH="f"
        if [ "`which resize 2> /dev/null`" != "" ]; then
            SB_RESIZE_EXISTS_ON_PATH="t"
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "resize" "20850825-56f1-4ecc-8e49-b2e001716ae7"
        fi
    fi
    if [ "$SB_RESIZE_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_ui_display_active_terminal_dimensions_in_characters_t1="$S_FP_NICE -n 5 resize "
    fi
fi
#--------------------
if [ "$SB_SHRED_EXISTS_ON_PATH" == "" ]; then
    SB_SHRED_EXISTS_ON_PATH="f"
    if [ "`which shred 2> /dev/null`" != "" ]; then
        SB_SHRED_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "shred" "175ad829-153a-4926-8029-b2e001716ae7"
    fi
fi
if [ "$SB_SHRED_EXISTS_ON_PATH" == "t" ]; then
    alias mmmv_fs_secure_erase_shred_1="$S_FP_NICE -n 5 shred --iterations=1 --remove=wipe "
    alias mmmv_fs_secure_erase_shred_3="$S_FP_NICE -n 5 shred --iterations=3 --remove=wipe "
    alias mmmv_fs_secure_erase_shred_5="$S_FP_NICE -n 5 shred --iterations=5 --remove=wipe "
    alias mmmv_shred_t1="mmmv_polish_ABC_2_A_C_B_exec_t1 \$S_FP_NICE -n 2 shred --iterations=1 --remove=wipe \" \" ; wait ; sync \" "
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    if [ "$SB_SNAP_EXISTS_ON_PATH" == "" ]; then
        SB_SNAP_EXISTS_ON_PATH="f"
        if [ "`which snap 2> /dev/null`" != "" ]; then
            SB_SNAP_EXISTS_ON_PATH="t"
        # else
        #     func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        #         "snap" "7be7ed22-f69b-4593-b238-b2e001716ae7"
        #     if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
        #         if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
        #             if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
        #                 echo "As of 2023 the snap is a Ubuntu parent company censored package collection tool."
        #                 echo -e "\e[33mOn Debian the snap might be installed by \e[39m"
        #                 echo -e "\e[33m    apt-get install snapd \e[39m# yes, not the "snap", but "snapd"."
        #                 echo ""
        #             fi
        #         fi
        #     fi
        fi
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    if [ "$SB_SYSTEMCTL_EXISTS_ON_PATH" == "" ]; then
        SB_SYSTEMCTL_EXISTS_ON_PATH="f"
        if [ "`which systemctl 2> /dev/null`" != "" ]; then
            SB_SYSTEMCTL_EXISTS_ON_PATH="t"
        fi
    fi
fi
#--------------------
if [ "$SB_UUENCODE_EXISTS_ON_PATH" == "" ]; then
    SB_UUENCODE_EXISTS_ON_PATH="f"
    if [ "`which uuencode 2> /dev/null`" != "" ]; then
        SB_UUENCODE_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "uuencode" "92e4d2ec-b916-41b6-a7a8-b2e001716ae7"
        #if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
            if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
                echo -e "The \"\e[33muuencode\e[39m\""
                echo -e "MIGHT be part of the package \"\e[33msharutils\e[39m\". "
                echo "GUID=='5c440164-9eca-4d1c-aa34-b2e001716ae7'"
                echo ""
            fi
        #fi
    fi
fi
#--------------------
if [ "$SB_UUDECODE_EXISTS_ON_PATH" == "" ]; then
    SB_UUDECODE_EXISTS_ON_PATH="f"
    if [ "`which uudecode 2> /dev/null`" != "" ]; then
        SB_UUDECODE_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "uudecode" "ae12d762-d78c-4458-bf98-b2e001716ae7"
        #if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
            if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
                echo -e "The \"\e[33muudecode\e[39m\""
                echo -e "MIGHT be part of the package \"\e[33msharutils\e[39m\". "
                echo "GUID=='a23a3f65-d6af-4c95-a353-b2e001716ae7'"
                echo ""
            fi
        #fi
    fi
fi
#--------------------
if [ "$SB_UUID_EXISTS_ON_PATH" == "" ]; then
    SB_UUID_EXISTS_ON_PATH="f"
    if [ "`which uuid 2> /dev/null`" != "" ]; then
        SB_UUID_EXISTS_ON_PATH="t"
    else
       func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
           "uuid" "a812e6d4-d405-4732-8218-b2e001716ae7"
        if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
            if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
                # https://superuser.com/questions/621297/how-do-i-install-uuidgen
                # archival copy: https://archive.ph/S56pQ
                echo "On Debian based systems the \"uuid\" MIGHT be installed "
                echo -e "by installing a package named \"\e[33muuid-runtime\e[39m\"."
                echo "GUID=='c1857f05-2f29-4b56-a013-b2e001716ae7'"
                echo ""
            fi
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
    if [ "$SB_FCCACHE_EXISTS_ON_PATH" == "" ]; then
        SB_FCCACHE_EXISTS_ON_PATH="f"
        if [ "`which fc-cache 2> /dev/null`" != "" ]; then
            SB_FCCACHE_EXISTS_ON_PATH="t"
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "fc-cache" "9c1670ab-b2d1-4868-a858-b2e001716ae7"
        fi
    fi
    if [ "$SB_FCCACHE_EXISTS_ON_PATH" == "t" ]; then
        if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
            #--------
            # https://www.techrepublic.com/blog/linux-and-open-source/how-do-i-install-and-use-fonts-in-linux/
            # archival copy: https://archive.vn/UgphK
            alias mmmv_admin_refresh_fonts_cache_t1="$S_FP_NICE -n 18 fc-cache -f -v "
            # should probably also make the
            #
            #     ~/.fonts
            #
            # contents available to various applications.
            #--------
            # TODO: test it out on BSD so that the alias
            #       could be defined on BSD.  There's another
            #       reference to this alias in this Bash file
            #       and the code region, where it resides,
            #       should also be updated after this alias has
            #       been made available on BSD.
            #--------
        fi
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    if [ "$SB_IPTABLES_EXISTS_ON_PATH" == "" ]; then
        SB_IPTABLES_EXISTS_ON_PATH="f"
        if [ "`which iptables 2> /dev/null`" != "" ]; then
            SB_IPTABLES_EXISTS_ON_PATH="t"
        # else
        #     func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        #         "iptables" "c9164d07-2d8d-4331-b3b8-b2e001716ae7"
        fi
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
        #         "ufw" "745f8309-1552-4e53-9a58-b2e001716ae7"
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
                "gufw" "5d381e54-6e89-4261-b568-b2e001716ae7"
        fi
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    if [ "$SB_AUTHBIND_EXISTS_ON_PATH" == "" ]; then
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
        #         "iptables" "353ff099-d73f-413b-b538-b2e001716ae7"
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
            echo "GUID=='4e0b5f25-2b1f-4e18-b423-b2e001716ae7'"
            echo ""
        fi
    else
        mkdir -p $FP_DOT_VIM_MANUALLY_INSTALLED_PLUGINS
        func_mmmv_wait_and_sync_t1
        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
            "$FP_DOT_VIM_MANUALLY_INSTALLED_PLUGINS" \
            "c34b536a-e349-45f3-aa48-b2e001716ae7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    fi
else
    # The next line gives an error message, if it is a file.
    func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
        "$FP_DOT_VIM_MANUALLY_INSTALLED_PLUGINS" \
        "94a8ed31-3d7f-4328-8268-b2e001716ae7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
fi

#--------------------------------------------------------------------------
# For security reasons each operating system user installs its own set
# of Ruby gems, python packages, etc. To avoid re-downloading everything
# and to mitigate the effect of network outages, the Ruby gems, python
# packages, NodeJS packages, etc. should be installed through a local
# proxy server that caches the downloaded files.
#--------------------------------------------------------------------------
S_TMP_LIST_OF_GEMS_00=" rake rdoc sqlite3 rspec \
    net dbf net-ssh rdf mail \
    graphviz gnuplot bundler test-unit "

S_TMP_LIST_OF_GEMS_01=" rethinkdb "

S_TMP_LIST_OF_GEMS_02=" micro_kanren "
    # miniKanren is a form of logic programming.
    # http://minikanren.org/

S_TMP_LIST_OF_GEMS_03=" bitmessage "

S_TMP_LIST_OF_GEMS_04=" solargraph "
    # The solagraph.org is about a Ruby "lanuage server".
    # The idea is that some basic support for a programming
    # language can be added to multiple IDEs at once by having
    # those IDEs communicate with a "language server" by using
    # a standardized "language server protocol".
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

S_TMP_LIST_OF_GEMS_05=" kibuvits_ruby_library_krl171bt4_ "
    # https://rubygems.org/gems/kibuvits_ruby_library_krl171bt4_

S_TMP_0="$S_FP_NICE -n 5 gem install "
S_TMP_1=" ; sync ; wait ; "
alias mmmv_admin_install_Ruby_gem_set_00_basic_tools="$S_TMP_0 $S_TMP_LIST_OF_GEMS_00 $S_TMP_1"
alias mmmv_admin_install_Ruby_gem_set_01_additional_database_engines="$S_TMP_0 $S_TMP_LIST_OF_GEMS_01 $S_TMP_1"
alias mmmv_admin_install_Ruby_gem_set_02_scientific_computing="$S_TMP_0 $S_TMP_LIST_OF_GEMS_02 $S_TMP_1"
alias mmmv_admin_install_Ruby_gem_set_03_communication_applications="$S_TMP_0 $S_TMP_LIST_OF_GEMS_03 $S_TMP_1"
alias mmmv_admin_install_Ruby_gem_set_04_development_tools="$S_TMP_0 $S_TMP_LIST_OF_GEMS_04 $S_TMP_1"
alias mmmv_admin_install_Ruby_gem_set_05_Kibuvits_Ruby_Library="$S_TMP_0 $S_TMP_LIST_OF_GEMS_05 $S_TMP_1"
alias mmmv_admin_install_Ruby_gem_all_mmmv_gem_sets=" \
    $S_TMP_0 $S_TMP_LIST_OF_GEMS_00 $S_TMP_1 \
    $S_TMP_0 $S_TMP_LIST_OF_GEMS_01 $S_TMP_1 \
    $S_TMP_0 $S_TMP_LIST_OF_GEMS_02 $S_TMP_1 \
    $S_TMP_0 $S_TMP_LIST_OF_GEMS_03 $S_TMP_1 \
    $S_TMP_0 $S_TMP_LIST_OF_GEMS_04 $S_TMP_1 \
    $S_TMP_0 $S_TMP_LIST_OF_GEMS_05 $S_TMP_1 "


#--------------------------------------------------------------------------
# The Squid web cache server
#
#     http://www.squid-cache.org/
#
# is usually installed from the standard package collection, because
# it is a legacy software that requires root privileges to run.  The
# historic excuse for the root privilege requirement had something to do
# with attaching to network interfaces, etc., but in practice the custom
# compiled version that is run by an ordinary user also works. By default
# the cached files might be stored at
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
    alias mmmv_wget_proxy="$S_FP_NICE -n 12 $MMMV_WGET_THROUGH_PROXY "
    #--------
    S_TMP_0="$S_FP_NICE -n 5 gem install --http-proxy $MMMV_PROXY_URL "
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
    S_FP_0="$S_FP_DIR/subparts/mmmv_userspace_distro_t1_specific/_bashrc_subpart_wget_t1_modified"
    func_mmmv_include_bashfile_if_possible_t2 "$S_FP_0" "1328a6c1-dbd0-4c11-b838-b2e001716ae7"
fi

S_FP_0="$S_FP_DIR/subparts/general/_bashrc_subpart_create_redirection_HTML_t1"
func_mmmv_include_bashfile_if_possible_t2 "$S_FP_0" "94518f23-0aab-42b8-9138-b2e001716ae7"

if [ "$SB_FIND_EXISTS_ON_PATH" == "t" ]; then
    S_FP_0="$S_FP_DIR/subparts/mmmv_userspace_distro_t1_specific/_bashrc_subpart_find_t1_modified"
    func_mmmv_include_bashfile_if_possible_t2 "$S_FP_0" "4f9c3be4-d04c-43c2-b058-b2e001716ae7"
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
        echo "GUID=='190cb102-9ac1-4245-b932-b2e001716ae7'"
        echo ""
        # The UTF-8 locale is required by the Mosh .
        # https://mosh.org/
    fi
fi

#--------------------------------------------------------------------------
if [ "`which sshfs 2> /dev/null`" != "" ]; then
    export S_MMMV_HINT_SSHFS_T1="SSH connection failure does guarantee auto-unmounting.
For reliability the unmount command must be always run before the mount command

Unmount command for non-root users on Linux:
    \e[33m     fusermount -u <full path to the mounting point at the ssh client side> \e[39m

Unmount command for non-root users on WSL (Windows Subsystem for Linux):
    \e[33msudo\e[39m fusermount -u <full path to the mounting point at the ssh client side>

Mount command for non-root users:
    nice -n 2 \e[33msshfs -o reconnect -oport=<ssh server port> username@domain.com:<full path to the mounting point folder at the ssh server side> <full path to the mounting point folder at the local machine> \e[39m

Mount command Bash example:
    \e[96m
    S_FP_REUSABLE_SSH_TUNNELS_FOLDER=\"\$HOME/.ssh/tunnels\"
    mkdir -p \$S_FP_REUSABLE_SSH_TUNNELS_FOLDER ; wait
    chmod -f -R 0700 \$HOME/.ssh  ; wait ; sync ; wait
    S_SSHFS_MOUNTOPTS_PART_0=\"follow_symlinks,reconnect,IdentitiesOnly=no,PubkeyAuthentication=yes,ServerAliveInterval=32760,ServerAliveCountMax=400,ControlPersist=11,ControlMaster=auto,ControlPath=\$S_FP_REUSABLE_SSH_TUNNELS_FOLDER/tunnel1\"
    nice -n2 sshfs -oport=22 usernameatserverside@serverdomain.com: \$HOME/localmountfoleder -o \$S_SSHFS_MOUNTOPTS_PART_0,IdentityFile=\$HOME/.ssh/a_private_SSH_key.txt
    \e[39m
Some references:
    https://web.archive.org/web/20250326002623/https://serverfault.com/questions/6709/sshfs-mount-that-survives-disconnect
    another archival copy: https://archive.is/Og0KD  "
    #----
else
    S_TMP_0="The sshfs was not at PATH "
    S_TMP_1="at the start of this console session. "
    S_TMP_2="GUID=='615ca6bd-7a94-4c82-9442-b2e001716ae7'"
    export S_MMMV_HINT_SSHFS_T1="$S_TMP_0$S_NEWLINE$S_TMP_1$S_NEWLINE$S_TMP_2"
fi
if [ "`which fusermount 2> /dev/null`" == "" ]; then
    # The fusermount is for unmounting data carriers
    # that are mounted with the sshfs.
    S_TMP_0="The fusermount was not at PATH "
    S_TMP_1="at the start of this console session. "
    S_TMP_2="GUID=='04f501c4-fe46-45c6-a312-b2e001716ae7'"
    export S_MMMV_HINT_SSHFS_T1="$S_TMP_0$S_NEWLINE$S_TMP_1$S_NEWLINE$S_TMP_2"
fi
alias mmmv_ls_doc_SSHFS_hint_t1="echo \"\"; \\
    echo -e \"\$S_MMMV_HINT_SSHFS_T1\"; \\
    echo \"\" ;"

if [ -e "$HOME/.ssh" ]; then
    # The idea is that sometimes it is comfortable to just
    # do "chmod 0755 /home/mmmv", but that may introduce a
    # security flaw in terms of the readability of the ~/.ssh . The
    $S_FP_NICE -n 19 chmod -f -R 0700 "$HOME/.ssh"
    func_mmmv_wait_and_sync_t1
    # tries to mitigate that.
fi

#--------------------------------------------------------------------------

#if [ "$MMMV_SB_PROXY_SERVER_RUNS" == "t" ]; then

#fi

#--------------------------------------------------------------------------

func_general_Linux_userspace_specific_declarations(){
    alias mmmv_ls_K="$S_FP_NICE -n 2 ls -l --block-size=K "
    alias mmmv_ls_M="$S_FP_NICE -n 2 ls -l --block-size=M "
    alias mmmv_ls_G="$S_FP_NICE -n 2 ls -l --block-size=G "
    alias mmmv_lssize_recursive_t1_Linux="$S_FP_NICE -n 5 du  --human-readable --summarize ./ "
    alias mmmv_pid2username_t1="$S_FP_NICE -n 5 ps -o user= -p " # PID id est operating system process ID, comes here
    alias mmmv_cp_cow_t1="$S_FP_NICE -n 7 cp --reflink=auto "
    #----------------------------------------------------------------------
    if [ "$SB_NETSTAT_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_ls_ports_Linux_t1="$S_FP_NICE -n 17 netstat -ltnp "
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
        alias mmmv_ls_daemons_Linux_service_t1="$S_FP_NICE -n 4 service --status-all  "
    fi
    #--------------------
    if [ "$SB_SYSTEMCTL_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_ls_daemons_Linux_systemctl_t2="$S_FP_NICE -n 4 systemctl list-units --type=service "
    fi
    #----------------------------------------------------------------------
    if [ "$SB_GREP_EXISTS_ON_PATH" == "t" ]; then
        if [ "$SB_FIND_EXISTS_ON_PATH" == "t" ]; then
            if [ "$SB_WC_EXISTS_ON_PATH" == "t" ]; then
                #--------
                alias mmmv_ls_filecount_recursion_unlimited_t1="find . -type f | wc -l "
                alias mmmv_ls_dircount_recursion_unlimited_t1=" find . -type d | grep -E ^\.\/ | wc -l "
                #--------
                alias mmmv_ls_filecount_recursion_1_t1="find . -maxdepth  1 -type f | wc -l "
                alias mmmv_ls_dircount_recursion_1_t1=" find . -maxdepth  1 -type d | grep -E ^\.\/ | wc -l "
                #--------
                alias mmmv_ls_filecount_recursion_2_t1="find . -maxdepth  2 -type f | wc -l "
                alias mmmv_ls_dircount_recursion_2_t1=" find . -maxdepth  2 -type d | grep -E ^\.\/ | wc -l "
                #--------
                alias mmmv_ls_filecount_recursion_3_t1="find . -maxdepth  3 -type f | wc -l "
                alias mmmv_ls_dircount_recursion_3_t1=" find . -maxdepth  3 -type d | grep -E ^\.\/ | wc -l "
                #--------
                alias mmmv_ls_filecount_recursion_4_t1="find . -maxdepth  4 -type f | wc -l "
                alias mmmv_ls_dircount_recursion_4_t1=" find . -maxdepth  4 -type d | grep -E ^\.\/ | wc -l "
                #--------
                alias mmmv_ls_filecount_recursion_5_t1="find . -maxdepth  5 -type f | wc -l "
                alias mmmv_ls_dircount_recursion_5_t1=" find . -maxdepth  5 -type d | grep -E ^\.\/ | wc -l "
                #--------
                alias mmmv_ls_filecount_recursion_6_t1="find . -maxdepth  6 -type f | wc -l "
                alias mmmv_ls_dircount_recursion_6_t1=" find . -maxdepth  6 -type d | grep -E ^\.\/ | wc -l "
                #--------
                alias mmmv_ls_filecount_recursion_7_t1="find . -maxdepth  7 -type f | wc -l "
                alias mmmv_ls_dircount_recursion_7_t1=" find . -maxdepth  7 -type d | grep -E ^\.\/ | wc -l "
                #--------
                alias mmmv_ls_filecount_recursion_8_t1="find . -maxdepth  8 -type f | wc -l "
                alias mmmv_ls_dircount_recursion_8_t1=" find . -maxdepth  8 -type d | grep -E ^\.\/ | wc -l "
                #--------
                alias mmmv_ls_filecount_recursion_9_t1="find . -maxdepth  9 -type f | wc -l "
                alias mmmv_ls_dircount_recursion_9_t1=" find . -maxdepth  9 -type d | grep -E ^\.\/ | wc -l "
                #--------
                alias mmmv_ls_filecount_recursion_10_t1="find . -maxdepth  10 -type f | wc -l "
                alias mmmv_ls_dircount_recursion_10_t1=" find . -maxdepth  10 -type d | grep -E ^\.\/ | wc -l "
                #--------
                alias mmmv_ls_filecount_recursion_11_t1="find . -maxdepth  11 -type f | wc -l "
                alias mmmv_ls_dircount_recursion_11_t1=" find . -maxdepth  11 -type d | grep -E ^\.\/ | wc -l "
                #--------
                alias mmmv_ls_filecount_recursion_12_t1="find . -maxdepth  12 -type f | wc -l "
                alias mmmv_ls_dircount_recursion_12_t1=" find . -maxdepth  12 -type d | grep -E ^\.\/ | wc -l "
                #--------
                alias mmmv_ls_filecount_recursion_13_t1="find . -maxdepth  13 -type f | wc -l "
                alias mmmv_ls_dircount_recursion_13_t1=" find . -maxdepth  13 -type d | grep -E ^\.\/ | wc -l "
                #--------
                alias mmmv_ls_filecount_recursion_14_t1="find . -maxdepth  14 -type f | wc -l "
                alias mmmv_ls_dircount_recursion_14_t1=" find . -maxdepth  14 -type d | grep -E ^\.\/ | wc -l "
                #--------
                alias mmmv_ls_filecount_recursion_15_t1="find . -maxdepth  15 -type f | wc -l "
                alias mmmv_ls_dircount_recursion_15_t1=" find . -maxdepth  15 -type d | grep -E ^\.\/ | wc -l "
                #--------
                alias mmmv_ls_filecount_recursion_16_t1="find . -maxdepth  16 -type f | wc -l "
                alias mmmv_ls_dircount_recursion_16_t1=" find . -maxdepth  16 -type d | grep -E ^\.\/ | wc -l "
                #--------
            fi
            if [ "$SB_XARGS_EXISTS_ON_PATH" == "t" ]; then
                alias mmmv_ls_K_recursive="$S_FP_NICE -n 17 find . -name '*' -print0 |\
                    $S_FP_XARGS -0 ls -l --block-size=K -d | grep -E ^[-] "
                alias mmmv_ls_M_recursive="$S_FP_NICE -n 17 find . -name '*' -print0 |\
                    $S_FP_XARGS -0 ls -l --block-size=M -d | grep -E ^[-] "
                alias mmmv_ls_G_recursive="$S_FP_NICE -n 17 find . -name '*' -print0 |\
                    $S_FP_XARGS -0 ls -l --block-size=G -d | grep -E ^[-] "
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
                "54e9d072-5ef2-443d-9a98-b2e001716ae7"
        fi # whoami === root
    fi
    #----------------------------------------------------------------------
    S_TMP_2="/snap"
    if [ -e $S_TMP_2 ]; then
        if [ -d $S_TMP_2 ]; then
            func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
                "$S_TMP_2" "643f459b-037e-4c54-bd28-b2e001716ae7"
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
                "$S_TMP_2" "40a07085-bf75-42bd-b428-b2e001716ae7" \
                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        fi
    fi
    #----------------------------------------------------------------------
} # func_general_Linux_userspace_specific_declarations

#--------------------------------------------------------------------------

func_general_BSD_userspace_specific_declarations(){
    #---------
    alias mmmv_ls_BKMG="$S_FP_NICE -n 2 ls -lh "
    alias mmmv_lssize_recursive_t1_BSD="$S_FP_NICE -n 5 du -sh ./ "
    #---------
    if [ "$SB_FIND_EXISTS_ON_PATH" == "t" ]; then
        if [ "$SB_GREP_EXISTS_ON_PATH" == "t" ]; then
            if [ "$SB_WC_EXISTS_ON_PATH" == "t" ]; then
                alias mmmv_ls_filecount_t1="find . -type f | wc -l "
                alias mmmv_ls_dircount_t1="find . -type d | grep -E ^\.\/ | wc -l "
            fi
            if [ "$SB_XARGS_EXISTS_ON_PATH" == "t" ]; then
                alias mmmv_ls_BKMG_recursive="$S_FP_NICE -n 17 find . -name '*' \
                    -print0 | $S_FP_XARGS -0 ls -lhd | grep -E ^[-] "
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
    if [ "$SB_POWERSHELL_EXE_EXISTS_ON_PATH" == "" ]; then
        SB_POWERSHELL_EXE_EXISTS_ON_PATH="f"
        if [ "`which powershell.exe 2> /dev/null`" != "" ]; then
            SB_POWERSHELL_EXE_EXISTS_ON_PATH="t"
        else
           func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
               "powershell.exe" "045cf416-da37-4e40-aa18-b2e001716ae7"
        fi
    fi
    if [ "$SB_POWERSHELL_EXE_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_ui_clipboard2file_t1="powershell.exe -c Get-Clipboard " # file_name_comes_here
    fi
    #--------------------
    if [ "$SB_CLIP_EXE_EXISTS_ON_PATH" == "" ]; then
        SB_CLIP_EXE_EXISTS_ON_PATH="f"
        if [ "`which clip.exe 2> /dev/null`" != "" ]; then
            SB_CLIP_EXE_EXISTS_ON_PATH="t"
        # else
        #    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        #        "clip.exe" "224646b4-08b1-462e-b557-b2e001716ae7"
        fi
    fi
    if [ "$SB_CLIP_EXE_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_ui_file2clipboard_t1="clip.exe " # file_name_comes_here
    fi
    #----------------------------------------------------------------------
    S_FP_TASKLIST_EXE="/mnt/c/Windows/System32/tasklist.exe"
    func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
        "$S_FP_TASKLIST_EXE" "b2035903-5782-44b4-80c7-b2e001716ae7" \
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
                    echo "GUID=='59dda3d1-b4e3-42ad-9151-b2e001716ae7'"
                else
                    echo ""
                    echo "X11 not available." # as probabilistically expected, so
                    # no long distracting texts needed.
                    echo "GUID=='d5b873dc-83cb-4340-83f1-b2e001716ae7'"
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
        "01d8944c-d2bf-41e2-a027-b2e001716ae7" "$SB_OK_4_THE_BASHFILE_2_BE_MISSING_OPTIONAL"
    alias dmesg="sudo /bin/dmesg "
    #alias hddtemp="sudo /usr/sbin/hddtemp "
    #----------------------------------------------------------------------
    if [ "$SB_USERNAME_IS_root" == "t" ]; then
        # WSL specific way to mount the DVD/CDRW drive.
        alias mmmv_admin_mount_DVD_t1="mount -t drvfs D: /mnt/d "
    else
        func_mmmv_verify_sb_t_f_but_do_not_exit_t1 \
            "$SB_USERNAME_IS_root" \
            "2ac4d7a0-df30-44fb-ae47-b2e001716ae7"
    fi
    #----------------------------------------------------------------------
} # func_Windows_Subsystem_for_Linux_WSL_userspace_specific_declarations

#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_WSL" == "t" ]; then
    #----------------------------------------------------------------------
    func_Windows_Subsystem_for_Linux_WSL_userspace_specific_declarations
    #----------------------------------------------------------------------
    # # The
    # S_FP_0="/mnt/c/Windows/System32/WindowsPowerShell/v1.0/"
    # # is supposed to contain the powershell.exe
    # if [ -e "$S_FP_0" ]; then
    #     if [ -d "$S_FP_0" ]; then
    #         Z_PATH="$S_FP_0:$Z_PATH"
    #     else
    #         # The
    #         func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
    #             "$S_FP_0" "1f8a1d25-1a81-46cf-9737-b2e001716ae7" \
    #             "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    #         # is here for outputting an error message.
    #     fi
    # fi
    #----------------------------------------------------------------------
    # https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.3#winget
    # archival copy: https://archive.ph/BiBPe
    #           C:\Windows\System32\WindowsPowerShell\v1.0
    S_FP_0="/mnt/c/Windows/System32/WindowsPowerShell/v1.0"
    #         %SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe
    func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
        "$MMMV_USERSPACE_DISTRO_T1_LINUX_ANDROID_TERMUX" \
        "d4a00369-358b-4572-9817-b2e001716ae7" \
        "f"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        PATH="$S_FP_0:$PATH"
        Z_PATH="$S_FP_0:$Z_PATH"
    fi
    if [ "$SB_POWERSHELL_EXE_EXISTS_ON_PATH" == "" ]; then
        SB_POWERSHELL_EXE_EXISTS_ON_PATH="f"
        if [ "`which powershell.exe 2> /dev/null`" != "" ]; then
            SB_POWERSHELL_EXE_EXISTS_ON_PATH="t"
        else
           func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
               "powershell.exe" "5c4e4b35-7693-41a2-8147-b2e001716ae7"
           if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
               echo ""
               echo "Some further information about that MIGHT be available at "
               echo -e "\e[33m"
               echo "https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.3#winget "
               echo -e "\e[39m"
               echo "GUID=='1a083df4-6bf3-4f44-bc11-b2e001716ae7'"
               echo ""
           fi
        fi
    fi
    #----------------------------------------------------------------------
fi

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
            "1d511978-8a34-4e11-b927-b2e001716ae7"
    else
        if [ "$SB_ABSENCE_DETECTED" != "t" ]; then
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                echo ""
                echo -e "\e[31mThe code in this function is flawed.\e[39m"
                echo "SB_ABSENCE_DETECTED==\"$SB_ABSENCE_DETECTED\"."
                echo "GUID=='b1de82d9-49c8-42c8-b941-b2e001716ae7'"
                echo ""
            fi
        fi
    fi
    #----------------------------------------------------------------------
} # func_FreeBSD_userspace_specific_declarations
#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "t" ]; then
    #--------------------
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        export MMMV_USERSPACE_DISTRO_T1_LINUX_ANDROID_TERMUX_BIN="$MMMV_USERSPACE_DISTRO_T1_LINUX_ANDROID_TERMUX/bin"
        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
            "$MMMV_USERSPACE_DISTRO_T1_LINUX_ANDROID_TERMUX_BIN" \
            "95b81cc9-1e78-41f0-8e37-b2e001716ae7" \
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
    if [ "$SB_TERMUXSETUPSTORAGE_EXISTS_ON_PATH" == "" ]; then
        SB_TERMUXSETUPSTORAGE_EXISTS_ON_PATH="f"
        if [ "`which termux-setup-storage 2> /dev/null`" != "" ]; then
            SB_TERMUXSETUPSTORAGE_EXISTS_ON_PATH="t"
        fi
    fi
    if [ "$SB_TERMUXSETUPSTORAGE_EXISTS_ON_PATH" == "t" ]; then
        # The
        alias mmmv_admin_Termux_setup_storage="$S_FP_NICE -n 2 termux-setup-storage "
        # creates $HOME/storage
    fi
    #--------------------
fi
#--------------------------------------------------------------------------
if [ "$SB_LIBTOOL_EXISTS_ON_PATH" == "" ]; then
    SB_LIBTOOL_EXISTS_ON_PATH="f"
    if [ "`which libtool 2> /dev/null`" != "" ]; then
        # The GNU libtool is required for building at
        # least some versions of the GCC.
        SB_LIBTOOL_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "libtool" "c01491a4-3667-4ba3-a5c7-b2e001716ae7"
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_WSL" == "f" ]; then
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
        if [ "$SB_UNICODE_START_EXISTS_ON_PATH" == "" ]; then
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
fi
#--------------------------------------------------------------------------
if [ "$SB_FOSSIL_EXISTS_ON_PATH" == "" ]; then
    SB_FOSSIL_EXISTS_ON_PATH="f"
    if [ "`which fossil 2> /dev/null`" != "" ]; then
        SB_FOSSIL_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "fossil" "2e0a5733-02a0-4056-8a57-b2e001716ae7"
    fi
fi
if [ "$SB_FOSSIL_EXISTS_ON_PATH" == "t" ]; then
    # https://www.fossil-scm.org
    alias mmmv_run_Fossil_rebuild_t1="$S_FP_NICE -n20 fossil rebuild --vacuum --compress --cluster --analyze "
fi
#--------------------------------------------------------------------------
if [ "$SB_GEOMYIDAE_EXISTS_ON_PATH" == "" ]; then
    SB_GEOMYIDAE_EXISTS_ON_PATH="f"
    if [ "`which geomyidae 2> /dev/null`" != "" ]; then
        # geomyidae is a Gopher server.
        # Upstream cloning URL: git://r-36.net/geomyidae
        SB_GEOMYIDAE_EXISTS_ON_PATH="t"
    # else
    #     func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
    #         "geomyidae " "8d71e135-9294-47f9-b557-b2e001716ae7"
    fi
fi
# if [ "$SB_GEOMYIDAE_EXISTS_ON_PATH" == "t" ]; then
#     alias mmmv_run_geomyidae_Foo="$S_FP_NICE -n20 geomyidae Foooo_this_alias_needs_to_be_completed"
# fi
#--------------------------------------------------------------------------
if [ "$SB_GLIMPSE_EXISTS_ON_PATH" == "" ]; then
    SB_GLIMPSE_EXISTS_ON_PATH="f"
    if [ "`which glimpse 2> /dev/null`" != "" ]; then
        SB_GLIMPSE_EXISTS_ON_PATH="t"
    fi
fi
#--------------------
if [ "$SB_GLIMPSEINDEX_EXISTS_ON_PATH" == "" ]; then
    SB_GLIMPSEINDEX_EXISTS_ON_PATH="f"
    if [ "`which glimpseindex 2> /dev/null`" != "" ]; then
        SB_GLIMPSEINDEX_EXISTS_ON_PATH="t"
    fi
fi
#--------------------
if [ "$SB_AGREP_EXISTS_ON_PATH" == "" ]; then
    SB_AGREP_EXISTS_ON_PATH="f"
    if [ "`which agrep 2> /dev/null`" != "" ]; then
        SB_AGREP_EXISTS_ON_PATH="t"
        # agrep is part of the really old glimpse search engine,
        # which does not support Unicode properly. Some sample aliases:
        #     alias search_folder_foo_agrep_at_most_1_cahr_mismatch="mmmv_polish_ABC_2_A_C_B_exec_t1 \" S_TMP_0=\\\"\\\`pwd\\\`\\\" ; cd $S_FP_VIMWIKI ; wait ; nice -n 2 find . -name \\\"*.wiki\\\" | xargs agrep -1  \" \" ; wait ; cd \\\$S_TMP_0 ; \" " # 'OTSIS8NE`
        #     alias search_folder_foo_agrep_at_most_2_char_mismatch="mmmv_polish_ABC_2_A_C_B_exec_t1 \" S_TMP_0=\\\"\\\`pwd\\\`\\\" ; cd $S_FP_VIMWIKI ; wait ; nice -n 2 find . -name \\\"*.wiki\\\" | xargs agrep -2  \" \" ; wait ; cd \\\$S_TMP_0 ; \" " # 'OTSIS8NE`
        #     alias search_folder_foo_agrep_at_most_3_char_mismatch="mmmv_polish_ABC_2_A_C_B_exec_t1 \" S_TMP_0=\\\"\\\`pwd\\\`\\\" ; cd $S_FP_VIMWIKI ; wait ; nice -n 2 find . -name \\\"*.wiki\\\" | xargs agrep -3  \" \" ; wait ; cd \\\$S_TMP_0 ; \" " # 'OTSIS8NE`
        #
    fi
fi
#==========================================================================
# S_VERSION_OF_THIS_FILE="3cb14df4-b3e3-4e77-9027-b2e001716ae7"
#==========================================================================
