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
    echo "GUID=='37fa6a2c-28d7-44e0-9314-507090e0a9e7'"
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
            "aha" "22bc1a35-5f28-4945-b314-507090e0a9e7"
    fi
fi
#--------------------
if [ "$SB_FIND_EXISTS_ON_PATH" == "" ]; then
    SB_FIND_EXISTS_ON_PATH="f"
    if [ "`which find 2> /dev/null`" != "" ]; then
        SB_FIND_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "find" "ebd3e942-dc62-46b5-b514-507090e0a9e7"
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
            "grep" "528ada34-66ac-4047-9114-507090e0a9e7"
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
            "egrep" "82148c40-9007-49e7-9314-507090e0a9e7"
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo "The egrep is part of the GNU grep project."
            echo "GUID=='2a990995-50bc-4405-a214-507090e0a9e7'"
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
            "fgrep" "8a6fd51a-408d-4743-9114-507090e0a9e7"
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo "The fgrep is part of the GNU grep project."
            echo "GUID=='74cb7055-9df9-43c5-a314-507090e0a9e7'"
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
            "ag" "4e4795c4-c42f-42af-8814-507090e0a9e7"
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
                    echo "GUID=='5b26fb47-3237-4bf1-b214-507090e0a9e7'"
                    echo ""
                fi
            fi
        fi
    fi
fi
#--------------------
if [ "$SB_MAN_EXISTS_ON_PATH" == "" ]; then
    SB_MAN_EXISTS_ON_PATH="f"
    if [ "`which man 2> /dev/null`" != "" ]; then
        SB_MAN_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "man" "63311c49-969c-4250-8514-507090e0a9e7"
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
            "info" "8c098339-af26-443a-8214-507090e0a9e7"
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
            "tldr" "29ef95a3-27f0-4aa9-a114-507090e0a9e7"
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
            echo "GUID=='5b1905f4-9179-4875-8514-507090e0a9e7'"
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
            "fzf" "55aac316-feef-450b-8314-507090e0a9e7"
    fi
fi
#--------------------
if [ "$SB_HTOP_EXISTS_ON_PATH" == "" ]; then
    SB_HTOP_EXISTS_ON_PATH="f"
    if [ "`which htop 2> /dev/null`" != "" ]; then
        SB_HTOP_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "htop" "42131e17-c124-4078-9314-507090e0a9e7"
    fi
fi
#----------------------------------------
if [ "$SB_NCDU_EXISTS_ON_PATH" == "" ]; then
    SB_NCDU_EXISTS_ON_PATH="f"
    if [ "`which ncdu 2> /dev/null`" != "" ]; then
        SB_NCDU_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "ncdu" "2a081030-99d2-4886-b214-507090e0a9e7"
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
    S_TMP_0="$S_FP_NICE -n 2 ncdu --disable-delete --disable-shell --no-si --apparent-size --show-hidden --show-itemcount --sort=apparent-size-desc --color=dark --slow-ui-updates "
    # is to avoid slowing down the scanning during
    # scans, where there are a lot of files and/or folders to scan.
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
            "wget" "3e35a619-b42b-4eff-a414-507090e0a9e7"
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
            "curl" "1e8370e5-5223-45c7-9704-507090e0a9e7"
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
            "aria2c" "12540b37-1ca9-4e3c-b404-507090e0a9e7"
    fi
fi
#--------------------
if [ "$SB_READLINK_EXISTS_ON_PATH" == "" ]; then
    SB_READLINK_EXISTS_ON_PATH="f"
    if [ "`which readlink 2> /dev/null`" != "" ]; then
        SB_READLINK_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "readlink" "91744936-a288-4334-b304-507090e0a9e7"
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
            "xargs" "21dcf21c-6566-4b0b-8404-507090e0a9e7"
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
            "diff" "5c450229-2725-414d-95f3-507090e0a9e7"
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
                "gdiff" "842d7a91-2c02-4770-92f3-507090e0a9e7"
        else
            if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "t" ]; then
                func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                    "gdiff" "cd9f55e5-e670-430c-b3e3-507090e0a9e7"
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
                    "lsblk" "2ff00aa5-1032-45e3-b4e3-507090e0a9e7"
            fi
        fi
        #--------------------
        if [ "$SB_HDPARM_EXISTS_ON_PATH" == "" ]; then
            SB_HDPARM_EXISTS_ON_PATH="f"
            if [ "`which hdparm 2> /dev/null`" != "" ]; then
                SB_HDPARM_EXISTS_ON_PATH="t"
            else
                func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                    "hdparm" "537ae36e-877f-43d0-91e3-507090e0a9e7"
            fi
        fi
        #--------------------
        if [ "$SB_HDDTEMP_EXISTS_ON_PATH" == "" ]; then
            SB_HDDTEMP_EXISTS_ON_PATH="f"
            if [ "`which hddtemp 2> /dev/null`" != "" ]; then
                SB_HDDTEMP_EXISTS_ON_PATH="t"
            # else
            #     func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            #         "hddtemp" "6df6d150-fa32-48f2-94e3-507090e0a9e7"
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
            "df" "427a7ca5-831b-4ebb-91d3-507090e0a9e7"
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
            "xdelta3" "8398792b-6c3b-4c31-b1d3-507090e0a9e7"
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
    #         "whirlpool-hash" "2f43466b-f902-4953-92d3-507090e0a9e7"
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
    #         "tiger-hash" "00fb8332-e9c7-40b4-b2d3-507090e0a9e7"
    fi
fi
#--------------------
if [ "$SB_RHASH_EXISTS_ON_PATH" == "" ]; then
    SB_RHASH_EXISTS_ON_PATH="f"
    if [ "`which rhash 2> /dev/null`" != "" ]; then
        SB_RHASH_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "rhash" "42428029-982f-4516-a4c3-507090e0a9e7"
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
                "sha256" "4f303341-6051-4894-a2c3-507090e0a9e7"
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
                "sha256sum" "aa0bb522-1141-4e8e-93b3-507090e0a9e7"
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
                "sha512" "397aa8a3-a31a-4002-b1b3-507090e0a9e7"
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
                "sha512sum" "cd7ecc2a-2ca8-47ba-95b3-507090e0a9e7"
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
                "sha384" "48073210-33a9-4030-84b3-507090e0a9e7"
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
                "sha384sum" "5fc45055-0f04-4f4c-8fa3-507090e0a9e7"
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
                "sha1" "415585c5-427d-4096-83a3-507090e0a9e7"
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
                "sha1sum" "456413e4-c197-4dfc-b2a3-507090e0a9e7"
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
                "md5" "b1a9a329-4ed8-4596-a493-507090e0a9e7"
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
                "md5sum" "246f924b-2cea-4f9c-9593-507090e0a9e7"
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
            "xxhsum" "151238c2-f6e8-47d8-b193-507090e0a9e7"
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
                    echo "GUID=='792b9350-b0fa-4b56-a114-507090e0a9e7'"
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
                "xxh128sum" "4b8b3633-9bee-4f55-ad93-507090e0a9e7"
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
                "xxh64sum" "6a5fa42d-41dd-4b97-b583-507090e0a9e7"
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
                "xxh32sum" "28005c20-0f1f-49ab-a583-507090e0a9e7"
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
                "xdg-mime" "2506e851-eeea-49a4-a583-507090e0a9e7"
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
                "xdg-open" "52ca2a1f-4376-4e4b-9283-507090e0a9e7"
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
                "ffmpeg" "f6327432-8572-4864-8273-507090e0a9e7"
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
                "ffprobe" "4782141c-dc5d-4dec-9173-507090e0a9e7"
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
        #        "xview" "e5ab2471-4562-41de-8573-507090e0a9e7"
        fi
    fi
    #--------------------
    if [ "$SB_XVIEWER_EXISTS_ON_PATH" == "" ]; then
        SB_XVIEWER_EXISTS_ON_PATH="f"
        if [ "`which xviewer 2> /dev/null`" != "" ]; then
            SB_XVIEWER_EXISTS_ON_PATH="t"
        #else
        #    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        #        "xviewer" "135b184c-0eea-4c3c-9573-507090e0a9e7"
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
                    "viewnior" "cf06285f-c9cc-4814-a463-507090e0a9e7"
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
            "chafa" "418eb4e3-a1b9-4e29-9d63-507090e0a9e7"
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
            "catimg" "63fab604-c916-4a8f-a563-507090e0a9e7"
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
    #         "img2sixel" "5f9cb2b1-981e-40c2-ae53-507090e0a9e7"
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
            "mpv" "29486bbd-a6be-4f20-a253-507090e0a9e7"
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
            "img2txt" "d80dd8a5-8ec6-4a6f-8153-507090e0a9e7"
    fi
fi
#--------------------
if [ "$SB_IMG2PDF_EXISTS_ON_PATH" == "" ]; then
    SB_IMG2PDF_EXISTS_ON_PATH="f"
    if [ "`which img2pdf 2> /dev/null`" != "" ]; then
        SB_IMG2PDF_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "img2pdf" "a13c4514-dd00-4dc3-b553-507090e0a9e7"
    fi
fi
#--------------------
if [ "$SB_CONVERT_EXISTS_ON_PATH" == "" ]; then
    SB_CONVERT_EXISTS_ON_PATH="f"
    if [ "`which convert 2> /dev/null`" != "" ]; then
        SB_CONVERT_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "convert" "4562614c-de94-4b81-a153-507090e0a9e7"
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
            "evince" "584b0c03-bfd6-4826-9a53-507090e0a9e7"
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
            "zathura" "731c72bb-2fa2-4a12-8553-507090e0a9e7"
    fi
fi
#--------------------
if [ "$SB_TEXDOCTK_EXISTS_ON_PATH" == "" ]; then
    SB_TEXDOCTK_EXISTS_ON_PATH="f"
    if [ "`which texdoctk 2> /dev/null`" != "" ]; then
        SB_TEXDOCTK_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "texdoctk" "9aa0524b-3277-450d-9553-507090e0a9e7"
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
            "xdvi" "3345e034-5af1-42c5-9353-507090e0a9e7"
    fi
fi
#--------------------
if [ "$SB_XPDF_EXISTS_ON_PATH" == "" ]; then
    SB_XPDF_EXISTS_ON_PATH="f"
    if [ "`which xpdf 2> /dev/null`" != "" ]; then
        SB_XPDF_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "xpdf" "cc127de4-80ba-4832-b453-507090e0a9e7"
    fi
fi
#--------------------------------------------------------------------------
#::::::::::::::::::::::::::clock::applications:::::::::::::::::::::::::::::
#--------------------------------------------------------------------------

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
            "doxygen" "25a02d91-e060-4f48-9153-507090e0a9e7"
    fi
fi
#--------------------
if [ "$SB_MKDOCS_EXISTS_ON_PATH" == "" ]; then
    SB_MKDOCS_EXISTS_ON_PATH="f"
    if [ "`which mkdocs 2> /dev/null`" != "" ]; then
        SB_MKDOCS_EXISTS_ON_PATH="t"
        # mkdocs generates HTML from Markdown files.
        #     https://www.mkdocs.org/
        # Usage example: https://github.com/lyz-code/blue-book
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "mkdocs" "86cdfb13-2a08-4db0-8353-507090e0a9e7"
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
                    echo "GUID=='42e9fc83-430c-4e39-9214-507090e0a9e7'"
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
            "col" "d01c2039-fef0-4fc2-8153-507090e0a9e7"
    fi
fi
#--------------------
if [ "$SB_DMESG_EXISTS_ON_PATH" == "" ]; then
    SB_DMESG_EXISTS_ON_PATH="f"
    if [ "`which dmesg 2> /dev/null`" != "" ]; then
        SB_DMESG_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "dmesg" "4752f31e-b224-499b-9253-507090e0a9e7"
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
            "mount" "d04a5414-25e4-4f8c-8453-507090e0a9e7"
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
            "sh" "046a124f-a184-4a2e-b553-507090e0a9e7"
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
            "tcsh" "283fc02d-ce43-4084-9553-507090e0a9e7"
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
            "mosh" "d1de879d-9c13-4c95-ba53-507090e0a9e7"
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
                "gcc" "dd1cb127-ade3-46a6-a553-507090e0a9e7"
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
                "g++" "f4d6f34c-c621-42fb-a353-507090e0a9e7"
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
                "clang" "a2785120-0a34-44c1-a543-507090e0a9e7"
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
                "clang++" "7f09e82b-375f-40c8-9243-507090e0a9e7"
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
            "awk" "1a96a42b-a231-4a07-8443-507090e0a9e7"
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
            "gawk" "4c39d616-905d-457e-9143-507090e0a9e7"
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
            "emacs" "2c97146f-b563-4ce4-a543-507090e0a9e7"
    fi
fi
if [ "$SB_EMACS_EXISTS_ON_PATH" == "t" ]; then
    if [ "$S_FP_EMACS" != "" ]; then
        alias mmmv_editor_Emacs="$S_FP_EMACS"
    fi
fi
#--------------------
if [ "$SB_HEAD_EXISTS_ON_PATH" == "" ]; then
    SB_HEAD_EXISTS_ON_PATH="f"
    if [ "`which head 2> /dev/null`" != "" ]; then
        SB_HEAD_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "head" "0d1f52c5-df31-4f36-a943-507090e0a9e7"
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
            "jed" "4c2dfaf2-423f-487c-8b43-507090e0a9e7"
    fi
fi
if [ "$SB_JED_EXISTS_ON_PATH" == "t" ]; then
    if [ "$S_FP_JED" != "" ]; then
        alias mmmv_editor_JED="$S_FP_JED"
    fi
fi
#--------------------
if [ "$SB_JOE_EXISTS_ON_PATH" == "" ]; then
    SB_JOE_EXISTS_ON_PATH="f"
    S_FP_JOE="`which joe 2> /dev/null`"
    if [ "$S_FP_JOE" != "" ]; then
        SB_JOE_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "joe" "51333415-b214-415b-9243-507090e0a9e7"
    fi
fi
if [ "$SB_JOE_EXISTS_ON_PATH" == "t" ]; then
    if [ "$S_FP_JOE" != "" ]; then
        alias mmmv_editor_JOE="$S_FP_JOE"
    fi
fi
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
            "jq" "601fee28-fec4-4e8c-b243-507090e0a9e7"
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
            "pup" "ea9ce317-d2f7-464d-9343-507090e0a9e7"
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
            "mcedit" "e2825e56-71ce-4f00-8443-507090e0a9e7"
    fi
fi
if [ "$SB_MCEDIT_EXISTS_ON_PATH" == "t" ]; then
    if [ "$S_FP_MCEDIT" != "" ]; then
        alias mmmv_editor_mcedit="$S_FP_MCEDIT"
    fi
fi
#--------------------
if [ "$SB_PRINTF_EXISTS_ON_PATH" == "" ]; then
    SB_PRINTF_EXISTS_ON_PATH="f"
    if [ "`which printf 2> /dev/null`" != "" ]; then
        SB_PRINTF_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "printf" "41a97b45-c354-45ad-b443-507090e0a9e7"
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
            "rlwrap" "5f05505f-ec98-425e-b343-507090e0a9e7"
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
            "sed" "fce6cc46-f3a1-4a77-8543-507090e0a9e7"
    fi
fi
if [ "$SB_SED_EXISTS_ON_PATH" == "t" ]; then
    if [ "$S_FP_SED" != "" ]; then
        # The following Bash test-line works on both, Linux and FreeBSD:
        #     printf 'aaa\n  \n\nbbb\n \t \nccc' | sed -e '/^[[:blank:]]*$/d'
        alias mmmv_sed_empty_lines_removal_including_lines_with_only_spaces_tabs_t1="$S_FP_SED -e '/^[[:blank:]]*\$/d' "
    fi
fi
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
                "gsed" "2a456b44-d1ea-4033-8443-507090e0a9e7"
        else
            if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "t" ]; then
                # The Termux Linux uses the BSD flavor of the common command line tools.
                func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                    "gsed" "0d2c6118-6914-4ef3-8143-507090e0a9e7"
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
           "replace" "7b9c695b-c9c7-48fa-b243-507090e0a9e7"
        #if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
            if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
                echo "The command \"replace\" is part of the MariaDB project."
                echo "GUID=='352b2911-d0fb-4240-8214-507090e0a9e7'"
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
            "time" "8827bf18-e511-4ce0-a343-507090e0a9e7"
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
                "ccache" "49733674-6b64-4f5d-a143-507090e0a9e7"
        fi
    fi
    #--------------------
    if [ "$SB_CSCOPE_EXISTS_ON_PATH" == "" ]; then
        SB_CSCOPE_EXISTS_ON_PATH="f"
        if [ "`which cscope 2> /dev/null`" != "" ]; then
            SB_CSCOPE_EXISTS_ON_PATH="t"
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "cscope" "54551a22-2e94-4c4d-9443-507090e0a9e7"
        fi
    fi
    #--------------------
    if [ "$SB_CTAGS_EXISTS_ON_PATH" == "" ]; then
        SB_CTAGS_EXISTS_ON_PATH="f"
        if [ "`which ctags 2> /dev/null`" != "" ]; then
            SB_CTAGS_EXISTS_ON_PATH="t"
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "ctags" "936b0300-1608-4506-b943-507090e0a9e7"
        fi
    fi
    #--------------------
    if [ "$SB_MAKEDEPEND_EXISTS_ON_PATH" == "" ]; then
        SB_MAKEDEPEND_EXISTS_ON_PATH="f"
        if [ "`which makedepend 2> /dev/null`" != "" ]; then
            SB_MAKEDEPEND_EXISTS_ON_PATH="t"
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "makedepend" "2e5264d3-8345-4ea5-9d43-507090e0a9e7"
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
                        echo "GUID=='8f26ee12-0c96-4ea8-8514-507090e0a9e7'"
                        echo ""
                    fi
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
                "flex" "0aec6743-03c7-4159-a243-507090e0a9e7"
        fi
    fi
    #--------------------
    if [ "$SB_JFLEX_EXISTS_ON_PATH" == "" ]; then
        SB_JFLEX_EXISTS_ON_PATH="f"
        if [ "`which jflex 2> /dev/null`" != "" ]; then
            SB_JFLEX_EXISTS_ON_PATH="t"
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "jflex" "4e873721-86a0-43e6-8243-507090e0a9e7"
        fi
    fi
    #--------------------
    if [ "$SB_FLEXPP_EXISTS_ON_PATH" == "" ]; then
        SB_FLEXPP_EXISTS_ON_PATH="f"
        if [ "`which flex++ 2> /dev/null`" != "" ]; then
            SB_FLEXPP_EXISTS_ON_PATH="t"
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "flex++" "15829862-24cc-403c-9343-507090e0a9e7"
        fi
    fi
    #--------------------
    if [ "$SB_JAM_EXISTS_ON_PATH" == "" ]; then
        SB_JAM_EXISTS_ON_PATH="f"
        if [ "`which jam 2> /dev/null`" != "" ]; then
            SB_JAM_EXISTS_ON_PATH="t"
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "jam" "38c65f44-c91c-4c52-bf43-507090e0a9e7"
        fi
    fi
    #--------------------
    if [ "$SB_MAKE_EXISTS_ON_PATH" == "" ]; then
        SB_MAKE_EXISTS_ON_PATH="f"
        if [ "`which make 2> /dev/null`" != "" ]; then
            SB_MAKE_EXISTS_ON_PATH="t"
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "make" "502f38c4-e4e1-4f4e-9d33-507090e0a9e7"
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
                    "gmake" "10356724-9665-47eb-b533-507090e0a9e7"
            else
                if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "t" ]; then
                    # The Termux Linux uses the BSD flavor of the common command line tools.
                    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                        "gmake" "65230d3f-38ae-4e87-9233-507090e0a9e7"
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
                "pmake" "47f7c7a2-7483-4101-bd33-507090e0a9e7"
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
                "bazel" "94085eea-2d28-4f48-a233-507090e0a9e7"
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
                        "reflex" "b41bbf2d-9d00-49e4-a233-507090e0a9e7"
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
            "sort" "646ba08e-e71e-4336-ab33-507090e0a9e7"
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
            "tsort" "0b14fcc2-c0a1-4b7b-a433-507090e0a9e7"
    fi
fi
#--------------------
if [ "$SB_UNIQ_EXISTS_ON_PATH" == "" ]; then
    SB_UNIQ_EXISTS_ON_PATH="f"
    if [ "`which uniq 2> /dev/null`" != "" ]; then
        SB_UNIQ_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "uniq" "9c36d45f-e90b-4ef7-b533-507090e0a9e7"
    fi
fi
#--------------------
if [ "$SB_STRINGS_EXISTS_ON_PATH" == "" ]; then
    SB_STRINGS_EXISTS_ON_PATH="f"
    if [ "`which strings 2> /dev/null`" != "" ]; then
        SB_STRINGS_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "strings" "59276e1b-565c-4f3f-8333-507090e0a9e7"
    fi
fi
#--------------------
if [ "$SB_TR_EXISTS_ON_PATH" == "" ]; then
    SB_TR_EXISTS_ON_PATH="f"
    if [ "`which tr 2> /dev/null`" != "" ]; then
        SB_TR_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "tr" "357d472f-9652-4ded-9333-507090e0a9e7"
    fi
fi
#--------------------
if [ "$SB_REV_EXISTS_ON_PATH" == "" ]; then
    SB_REV_EXISTS_ON_PATH="f"
    if [ "`which rev 2> /dev/null`" != "" ]; then
        SB_REV_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "rev" "065a6d10-9619-43c4-9333-507090e0a9e7"
    fi
fi
#--------------------
if [ "$SB_BASENAME_EXISTS_ON_PATH" == "" ]; then
    SB_BASENAME_EXISTS_ON_PATH="f"
    if [ "`which basename 2> /dev/null`" != "" ]; then
        SB_BASENAME_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "basename" "65ab3e15-d0f0-46ab-8233-507090e0a9e7"
    fi
fi
#--------------------
if [ "$SB_DIRNAME_EXISTS_ON_PATH" == "" ]; then
    SB_DIRNAME_EXISTS_ON_PATH="f"
    if [ "`which dirname 2> /dev/null`" != "" ]; then
        SB_DIRNAME_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "dirname" "0fe87942-b441-4be5-a533-507090e0a9e7"
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_VIM_EXISTS_ON_PATH" == "" ]; then
    SB_VIM_EXISTS_ON_PATH="f"
    S_FP_VIM="`which vim 2> /dev/null`"
    if [ "$S_FP_VIM" != "" ]; then
        SB_VIM_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "vim" "1da0cf92-c71b-4c96-b133-507090e0a9e7"
    fi
fi
#--------------------
if [ "$SB_VIM_EXISTS_ON_PATH" == "t" ]; then
    if [ "$S_FP_VIM" == "" ]; then
        S_FP_VIM="`which vim 2> /dev/null`"
    fi
    if [ "$S_FP_VIM" != "" ]; then
        #--------------------
        alias mmmv_editor_Vim="$S_FP_VIM"
        #--------------------
        S_TMP_0="$HOME/m_local/etc"
        S_TMP_1="$S_TMP_0/list_of_vimwikis.txt"
        if [ -e "$S_TMP_0" ]; then
            if [ -d "$S_TMP_0" ]; then
                alias mmmv_vim_edit_list_of_vimwikis="$S_FP_NICE -n 2 vim $S_TMP_1 ; "
            fi
        fi
        if [ "$SB_RUBY_EXISTS_ON_PATH" == "t" ]; then
            alias mmmv_admin_update_list_of_vimwikis="mmmv_admin_vimwiki_list_of_wikis_2_vimrc_subpart_t1.rb '--origin=$S_TMP_1'"
        fi
        #--------------------
        if [ "$SB_USERNAME_IS_mmmv" == "t" ]; then
            #--------------------
            # The next line
            S_TMP_0="/home/mmmv/mmmv_userspace_distro_t1/attic/documentation/application_specific_documentation/vimwiki/notes_set_01/in_vimwiki_format/index.wiki"
            # has hardcoded full path by intention.
            if [ -e "$S_TMP_0" ]; then
                if [ ! -d "$S_TMP_0" ]; then
                    alias mmmv_vimwiki_userspace_distro_t1_notes_set_01="vim $S_TMP_0 "
                fi
            fi
            #--------------------
            # The next line
            S_TMP_0="/home/mmmv/mmmv_userspace_distro_t1/attic/documentation/development_ideas/arendusideede_vimwiki/index.wiki"
            # has hardcoded full path by intention.
            if [ -e "$S_TMP_0" ]; then
                if [ ! -d "$S_TMP_0" ]; then
                    # "arendusideed" stands for "development ideas" in Estonian.
                    alias mmmv_vimwiki_userspace_distro_t1_arendusideed="vim $S_TMP_0 "
                fi
            fi
            #--------------------
        fi
        #--------------------
    fi
fi
#--------------------------------------------------------------------------
MMMV_USERSPACE_DISTRO_T1_FP_VIMWIKI_INSTALLATION_SCRIPT="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/lib/templates/vimwiki/2022_11_21_installation_package_by_3rd_party/try_to_install.bash"
if [ "$SB_VIM_EXISTS_ON_PATH" == "t" ]; then
    func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
        "$MMMV_USERSPACE_DISTRO_T1_FP_VIMWIKI_INSTALLATION_SCRIPT" \
        "45010f15-490b-4d8d-a133-507090e0a9e7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        alias mmmv_admin_install_vimwiki="$MMMV_USERSPACE_DISTRO_T1_FP_VIMWIKI_INSTALLATION_SCRIPT"
    else
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo "Vim exists, but the file "
            echo "$MMMV_USERSPACE_DISTRO_T1_FP_VIMWIKI_INSTALLATION_SCRIPT"
            echo -e "\e[31mis missing\e[39m. Leaving at least one alias undefined."
            echo "GUID=='231a9e04-c4d5-4c4a-ad14-507090e0a9e7'"
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
        "$S_TMP_1" "47ea5e4c-8477-4784-8333-507090e0a9e7" \
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
            "anjuta" "4b6c4723-7ca4-48ce-a233-507090e0a9e7"
    fi
fi
if [ "$SB_ANJUTA_EXISTS_ON_PATH" == "t" ]; then
    if [ "$S_FP_ANJUTA" != "" ]; then
        alias mmmv_editor_Anjuta="$S_FP_ANJUTA"
        alias mmmv_IDE_Anjuta="$S_FP_ANJUTA"
    fi
fi
#--------------------
if [ "$SB_GEANY_EXISTS_ON_PATH" == "" ]; then
    SB_GEANY_EXISTS_ON_PATH="f"
    S_FP_GEANY="`which geany 2> /dev/null`"
    if [ "$S_FP_GEANY" != "" ]; then
        SB_GEANY_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "geany" "ba13673a-0438-4fed-a333-507090e0a9e7"
    fi
fi
if [ "$SB_GEANY_EXISTS_ON_PATH" == "t" ]; then
    if [ "$S_FP_GEANY" != "" ]; then
        alias mmmv_editor_Geany="$S_FP_GEANY"
        alias mmmv_IDE_Geany="$S_FP_GEANY"
    fi
fi
#--------------------
if [ "$SB_KATE_EXISTS_ON_PATH" == "" ]; then
    SB_KATE_EXISTS_ON_PATH="f"
    S_FP_KATE="`which kate 2> /dev/null`"
    if [ "$S_FP_KATE" != "" ]; then
        SB_KATE_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "kate" "d89b74f5-0dcc-4052-a233-507090e0a9e7"
    fi
fi
if [ "$SB_KATE_EXISTS_ON_PATH" == "t" ]; then
    if [ "$S_FP_KATE" != "" ]; then
        alias mmmv_editor_Kate="$S_FP_KATE"
    fi
fi
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
            "tea" "64f5b026-8ab1-43ee-a233-507090e0a9e7"
    fi
fi
if [ "$SB_TEA_EXISTS_ON_PATH" == "t" ]; then
    if [ "$S_FP_TEA" != "" ]; then
        alias mmmv_editor_TEA="$S_FP_TEA"
    fi
fi
#--------------------
if [ "$SB_TEXMAKER_EXISTS_ON_PATH" == "" ]; then
    SB_TEXMAKER_EXISTS_ON_PATH="f"
    S_FP_TEXMAKER="`which texmaker 2> /dev/null`"
    if [ "$S_FP_TEXMAKER" != "" ]; then
        SB_TEXMAKER_EXISTS_ON_PATH="t"
        # https://www.xm1math.net/texmaker/
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "texmaker" "593c0815-954b-46a8-a333-507090e0a9e7"
    fi
fi
if [ "$SB_TEXMAKER_EXISTS_ON_PATH" == "t" ]; then
    if [ "$S_FP_TEXMAKER" != "" ]; then
        alias mmmv_editor_LaTeX_Texmaker="$S_FP_TEXMAKER"
    fi
fi
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
        S_TMP_1="S_FP_TEMPLATE=\"$S_FP_DILLORC_TEMPLATE\" ; if [ -e \"\$S_FP_TEMPLATE\" ]; then if [ -d \"\$S_FP_TEMPLATE\" ]; then echo \"\" ; echo \"The template \" ; echo \"\" ; echo \" \$S_FP_TEMPLATE\" ; echo \"\" ; if [ -h \"\$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mis a symlink to a folder\\e[39m.\" ; else echo -e \"\\e[31mis a folder\\e[39m.\" ; fi ; echo \"but a file is expected.\" ; echo \"GUID=='49f72aae-aa18-4885-9414-507090e0a9e7'\" ; echo \"\" ; else S_FP_DILLO_HOME=\"\$HOME/.dillo\" ; S_FP_DILLORC=\"\$S_FP_DILLO_HOME/dillorc\" ; if [ ! -e \"\$S_FP_DILLO_HOME\" ]; then if [ -h \"\$S_FP_DILLO_HOME\" ]; then echo \"\" ; echo \"The \" ; echo \"\" ; echo \" \$S_FP_DILLO_HOME \" ; echo \"\" ; echo -e \"\\e[31mis a broken symlink\\e[39m.\" ; echo \"Failed to create Dillo configuration file.\" ; echo \"GUID=='3a4f2f38-8904-46c4-8114-507090e0a9e7'\" ; echo \"\" ; else mkdir \"\$S_FP_DILLO_HOME\" ; wait ; sync ; wait ; fi ; fi ; "
        S_TMP_2="if [ -e \"\$S_FP_DILLO_HOME\" ]; then if [ -d \"\$S_FP_DILLO_HOME\" ]; then if [ -e \"\$S_FP_DILLORC\" ]; then echo \"\" ; echo \"The \" ; echo \"\" ; echo \" \$S_FP_DILLORC\" ; echo \"\" ; if [ -d \"\$S_FP_DILLORC\" ]; then echo -e \"\\e[31malready exists\\e[39m and\" ; if [ -h \"\$S_FP_DILLORC\" ]; then echo -e \"\\e[31mit is a symlink to a folder\\e[39m despite \" ; else echo -e \"\\e[31mit is a folder\\e[39m despite \" ; fi ; echo \"the fact that a file is expected.\" ; else echo -e \"\\e[31malready exists\\e[39m.\" ; fi ; echo \"Not overwriting it.\" ; echo \"GUID=='5e284f95-9938-48b5-b114-507090e0a9e7'\" ; echo \"\" ; else if [ -h \"\$S_FP_DILLORC\" ]; then echo \"\" ; echo \"The \" ; echo \"\" ; echo \" \$S_FP_DILLORC\" ; echo \"\" ; echo -e \"\\e[31mis a broken symlink\\e[39m.\" ; echo \"Not overwriting it.\" ; echo \"GUID=='c936fa2f-cccd-4a7d-a304-507090e0a9e7'\" ; echo \"\" ; else cp \"\$S_FP_TEMPLATE\" \"\$S_FP_DILLORC\" ; wait ; sync ; wait ; if [ ! -e \"\$S_FP_DILLORC\" ]; then echo \"\" ; echo -e \"\\e[31mFailed to create\\e[39m the \" ; echo \"\" ; echo \" \$S_FP_DILLORC\" ; echo \"\" ; echo \"GUID=='a1c00468-f8f1-4985-bd04-507090e0a9e7'\" ; echo \"\" ; else chmod -f -R 0700 \"\$S_FP_DILLO_HOME\" ; wait ; sync ; wait ; echo \"\" ; echo -e \"\\e[32mCreated\\e[39m \$S_FP_DILLORC\" ; echo \"\" ; fi ; fi ; fi ; else echo \"\" ; echo \"The \" ; echo \"\" ; echo \" \$S_FP_DILLO_HOME \" ; echo \"\" ; echo \"exists, but it is neither a folder \" ; echo \"nor a symlink to a folder.\" ; echo \"GUID=='ff3fdd3a-3dcd-4e3f-a304-507090e0a9e7'\" ; echo \"\" ; fi ; else echo \"\" ; echo -e \"\\e[31mFailed to create folder \\e[39m\" ; echo \"\" ; echo \" \$S_FP_DILLO_HOME \" ; echo \"\" ; echo \"GUID=='4bf42875-3cc8-44a1-8e04-507090e0a9e7'\" ; echo \"\" ; fi ; fi ; else echo \"\" ; echo \"The template \" ; echo \"\" ; echo \" \$S_FP_TEMPLATE\" ; echo \"\" ; echo -e \"\\e[31mdoes not exist\\e[39m.\" ; echo \"GUID=='67ec3429-4e4d-47c6-b104-507090e0a9e7'\" ; echo \"\" ; fi ; "
        # cope with a Vim flaw/bug that crashes the Vim. The
        #
        #     $HOME/.dillo/dillorc
        #
        # template has been downloaded on 2023_09_02 from
        #
        #     https://web.archive.org/web/20220515221251/https://dillo.org/dillorc
        #
        func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
            "$S_FP_DILLORC_TEMPLATE" "5d285023-7449-447d-8c23-507090e0a9e7" \
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
        #         echo "GUID=='e2a1000b-1cba-4e22-b9f3-507090e0a9e7'" ;
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
        #                 echo "GUID=='10510bd3-0117-4579-97f3-507090e0a9e7'" ;
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
        #                     echo "GUID=='8408f154-9675-4a27-b3e3-507090e0a9e7'" ;
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
        #                         echo "GUID=='e461a93b-9f59-4d4e-95e3-507090e0a9e7'" ;
        #                         echo "" ;
        #                     else
        #                         cp "$S_FP_TEMPLATE"  "$S_FP_DILLORC" ; wait ; sync ; wait ;
        #                         if [ ! -e "$S_FP_DILLORC" ]; then
        #                             echo "" ;
        #                             echo -e "\e[31mFailed to create\e[39m the " ;
        #                             echo "" ;
        #                             echo "    $S_FP_DILLORC" ;
        #                             echo "" ;
        #                             echo "GUID=='4ac5fcc3-b225-406e-83e3-507090e0a9e7'" ;
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
        #                 echo "GUID=='26190e3f-b26e-46b5-a5d3-507090e0a9e7'" ;
        #                 echo "" ;
        #             fi ;
        #         else
        #             echo "" ;
        #             echo -e "\e[31mFailed to create folder \e[39m" ;
        #             echo "" ;
        #             echo "    $S_FP_DILLO_HOME " ;
        #             echo "" ;
        #             echo "GUID=='ff6f211c-5564-45e7-82d3-507090e0a9e7'" ;
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
        #     echo "GUID=='abce7255-0f97-4e3f-b4d3-507090e0a9e7'" ;
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
            "chromium" "01e8d93b-b68a-4b0e-8323-507090e0a9e7"
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
            "links" "4519d575-68a2-427b-a323-507090e0a9e7"
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
            "lynx" "f299cd93-8b66-4494-bd23-507090e0a9e7"
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
            "7565f0e5-9668-4240-8223-507090e0a9e7" \
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
                "mplayer" "2adaa434-8581-4a6f-8423-507090e0a9e7"
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
                "mpv" "514f4a49-531b-4d45-b423-507090e0a9e7"
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
                "vlc" "5744a852-13b3-405c-8523-507090e0a9e7"
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
                "cvlc" "a19baa25-432a-46a1-a323-507090e0a9e7"
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
if [ "$SB_MC_EXISTS_ON_PATH" == "t" ]; then
    alias mmmv_filemanager_mc="$S_FP_NICE -n 5 $S_FP_MC "
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
    if [ "$SB_NAUTILUS_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_filemanager_nautilus="$S_FP_NICE -n 5 $S_FP_NAUTILUS "
    fi
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
    if [ "$SB_BROOT_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_filemanager_broot="$S_FP_NICE -n 5 $S_FP_BROOT "
    fi
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
    if [ "$SB_DOLPHIN_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_filemanager_dolphin="$S_FP_NICE -n 5 $S_FP_DOLPHIN "
    fi
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
    if [ "$SB_MUCOMMANDER_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_filemanager_mucommander="$S_FP_NICE -n 5 $S_FP_MUCOMMANDER "
    fi
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
    if [ "$SB_PCMANFM_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_filemanager_pcmanfm="$S_FP_NICE -n 5 $S_FP_PCMANFM "
    fi
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
    if [ "$SB_QWBFSMANAGER_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_filemanager_qwbfsmanager="$S_FP_NICE -n 5 $S_FP_QWBFSMANAGER "
    fi
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
    if [ "$SB_NEMO_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_filemanager_nemo="$S_FP_NICE -n 5 $S_FP_NEMO "
    fi
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
    if [ "$SB_NNN_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_filemanager_nnn="$S_FP_NICE -n 5 $S_FP_NNN "
    fi
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
    if [ "$SB_THUNAR_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_filemanager_thunar="$S_FP_NICE -n 5 $S_FP_THUNAR "
    fi
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
    if [ "$SB_KRUSADER_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_filemanager_krusader="$S_FP_NICE -n 5 $S_FP_KRUSADER "
    fi
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
    if [ "$SB_XFE_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_filemanager_xfe="$S_FP_NICE -n 5 $S_FP_XFE "
    fi
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
    if [ "$SB_4PANE_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_filemanager_4pane="$S_FP_NICE -n 5 $S_FP_4PANE "
    fi
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
    if [ "$SB_SPACEFM_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_filemanager_spacefm="$S_FP_NICE -n 5 $S_FP_SPACEFM "
    fi
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
    if [ "$SB_CAJA_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_filemanager_caja="$S_FP_NICE -n 5 $S_FP_CAJA "
    fi
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
    if [ "$SB_RANGER_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_filemanager_ranger="$S_FP_NICE -n 5 $S_FP_RANGER "
    fi
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
    if [ "$SB_DOUBLECMD_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_filemanager_doublecmd="$S_FP_NICE -n 5 $S_FP_DOUBLECMD "
    fi
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
    if [ "$SB_VIFM_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_filemanager_vifm="$S_FP_NICE -n 5 $S_FP_VIFM "
    fi
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
    if [ "$SB_WORKER_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_filemanager_worker="$S_FP_NICE -n 5 $S_FP_WORKER "
    fi
    #--------------------
    # https://github.com/jarun/nnn
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
    if [ "$SB_NNN_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_filemanager_nnn="$S_FP_NICE -n 5 $S_FP_NNN "
    fi
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
    if [ "$SB_GENTOO_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_filemanager_gentoo="$S_FP_NICE -n 5 $S_FP_GENTOO "
    fi
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
            "lftp" "02546138-b63e-4314-b423-507090e0a9e7"
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
            "rclone" "282c1ea3-d992-493a-a423-507090e0a9e7"
    fi
fi
#--------------------
if [ "$SB_RSYNC_EXISTS_ON_PATH" == "" ]; then
    SB_RSYNC_EXISTS_ON_PATH="f"
    if [ "`which rsync 2> /dev/null`" != "" ]; then
        SB_RSYNC_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "rsync" "9e9f0949-d83c-4506-8423-507090e0a9e7"
    fi
fi
#--------------------
if [ "$SB_SSH_EXISTS_ON_PATH" == "" ]; then
    SB_SSH_EXISTS_ON_PATH="f"
    if [ "`which ssh 2> /dev/null`" != "" ]; then
        SB_SSH_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "ssh" "354ec64a-3a09-400f-9123-507090e0a9e7"
    fi
fi
#--------------------
if [ "$SB_SCP_EXISTS_ON_PATH" == "" ]; then
    SB_SCP_EXISTS_ON_PATH="f"
    if [ "`which scp 2> /dev/null`" != "" ]; then
        SB_SCP_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "scp" "3f853393-d14b-4591-9123-507090e0a9e7"
    fi
fi
#--------------------
if [ "$SB_TELNET_EXISTS_ON_PATH" == "" ]; then
    SB_TELNET_EXISTS_ON_PATH="f"
    if [ "`which telnet 2> /dev/null`" != "" ]; then
        SB_TELNET_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "telnet" "41338ec1-b84d-465c-b123-507090e0a9e7"
    fi
fi
#--------------------
if [ "$SB_UNISON_EXISTS_ON_PATH" == "" ]; then
    SB_UNISON_EXISTS_ON_PATH="f"
    if [ "`which unison 2> /dev/null`" != "" ]; then
        SB_UNISON_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "unison" "cadd1430-6a55-4fb5-b223-507090e0a9e7"
    fi
fi
#--------------------
if [ "$SB_NOTMUCH_EXISTS_ON_PATH" == "" ]; then
    SB_NOTMUCH_EXISTS_ON_PATH="f"
    if [ "`which notmuch 2> /dev/null`" != "" ]; then
        SB_NOTMUCH_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "notmuch" "4ee48bb5-c15d-42f4-a523-507090e0a9e7"
    fi
fi
#--------------------
if [ "$SB_OFFLINEIMAP_EXISTS_ON_PATH" == "" ]; then
    SB_OFFLINEIMAP_EXISTS_ON_PATH="f"
    if [ "`which offlineimap 2> /dev/null`" != "" ]; then
        SB_OFFLINEIMAP_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "offlineimap" "13bfdbeb-e472-49ed-9423-507090e0a9e7"
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
                    echo "GUID=='25434c6d-a871-4826-aed3-507090e0a9e7'"
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
                    echo "GUID=='20833019-3ca4-46a4-b5c3-507090e0a9e7'"
                    echo ""
                fi
            fi
            if [ "$SB_GITG_EXISTS_ON_PATH" == "f" ]; then
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo -e "\e[31mgitk exists on PATH while the gitg is missing.\e[39m"
                    # As of 2021 the gitk has an optionally available
                    # menu option that depends on the gitg.
                    echo "GUID=='15976405-708e-473d-b5c3-507090e0a9e7'"
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
                    "flatpak" "8b68b116-cdab-4a4e-8423-507090e0a9e7"
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
                    echo "GUID=='2f87d123-5401-4193-b6c3-507090e0a9e7'"
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
                    "pipx" "e861cc1e-8b9d-4e3b-9223-507090e0a9e7"
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
                    "npm" "fb1e7319-7b23-4f64-9223-507090e0a9e7"
            fi
        fi
        if [ "$S_FP_NPM" == "" ]; then
            S_FP_NPM="`which npm 2> /dev/null`"
        fi
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
                "astyle" "4a62925d-2f99-4652-8123-507090e0a9e7"
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
                "uncrustify" "509d2a11-0ce6-454c-8523-507090e0a9e7"
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
                "bison" "13867e3f-c158-4217-8323-507090e0a9e7"
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
                "re2c" "c31b204d-4a80-4595-8523-507090e0a9e7"
        fi
    fi
    #----------------------------------------------------------------------
    if [ "$SB_YACC_EXISTS_ON_PATH" == "" ]; then
        SB_YACC_EXISTS_ON_PATH="f"
        if [ "`which yacc 2> /dev/null`" != "" ]; then
            SB_YACC_EXISTS_ON_PATH="t"
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "yacc" "5a85f222-6ffd-47c7-ac23-507090e0a9e7"
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
            "atool" "223c3852-4f60-472c-ab13-507090e0a9e7"
    fi
fi
#--------------------
if [ "$SB_ARCHIVEMOUNT_EXISTS_ON_PATH" == "" ]; then
    SB_ARCHIVEMOUNT_EXISTS_ON_PATH="f"
    if [ "`which archivemount 2> /dev/null`" != "" ]; then
        SB_ARCHIVEMOUNT_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "archivemount" "aa07734a-d07c-44e4-9513-507090e0a9e7"
    fi
fi
#--------------------
if [ "$SB_TAR_EXISTS_ON_PATH" == "" ]; then
    SB_TAR_EXISTS_ON_PATH="f"
    if [ "`which tar 2> /dev/null`" != "" ]; then
        SB_TAR_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "tar" "f2a484c2-95e1-453c-ab13-507090e0a9e7"
    fi
fi
#--------------------
if [ "$SB_ZIP_EXISTS_ON_PATH" == "" ]; then
    SB_ZIP_EXISTS_ON_PATH="f"
    if [ "`which zip 2> /dev/null`" != "" ]; then
        SB_ZIP_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "zip" "5c18cd74-0c1f-499a-aa13-507090e0a9e7"
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
            "unzip" "7154c939-5c30-4d45-b113-507090e0a9e7"
    fi
fi
#--------------------
if [ "$SB_GZIP_EXISTS_ON_PATH" == "" ]; then
    SB_GZIP_EXISTS_ON_PATH="f"
    if [ "`which gzip 2> /dev/null`" != "" ]; then
        SB_GZIP_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "gzip" "baebe333-a146-49be-8313-507090e0a9e7"
    fi
fi
#--------------------
if [ "$SB_GUNZIP_EXISTS_ON_PATH" == "" ]; then
    SB_GUNZIP_EXISTS_ON_PATH="f"
    if [ "`which gunzip 2> /dev/null`" != "" ]; then
        SB_GUNZIP_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "gunzip" "4e7df9ff-c8f5-423b-b113-507090e0a9e7"
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
            "pigz" "475adec5-a9ca-4cbf-af13-507090e0a9e7"
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
            "plzip" "3927aa72-9931-4615-bc13-507090e0a9e7"
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
            "tarlz" "f27ef512-d090-4557-b213-507090e0a9e7"
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
            "xz" "19dc9614-0867-490e-9413-507090e0a9e7"
    fi
fi
#--------------------
if [ "$SB_UNXZ_EXISTS_ON_PATH" == "" ]; then
    SB_UNXZ_EXISTS_ON_PATH="f"
    if [ "`which unxz 2> /dev/null`" != "" ]; then
        SB_UNXZ_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "unxz" "5eb243d5-9452-4db2-b413-507090e0a9e7"
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
                "rar" "84ec1135-e7b9-4b71-b213-507090e0a9e7"
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
            "unrar" "e74b0c26-32ff-47f3-9213-507090e0a9e7"
    fi
fi
#--------------------
if [ "$SB_ARJ_EXISTS_ON_PATH" == "" ]; then
    SB_ARJ_EXISTS_ON_PATH="f"
    if [ "`which arj 2> /dev/null`" != "" ]; then
        SB_ARJ_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "arj" "368cba45-65f1-422b-8313-507090e0a9e7"
    fi
fi
#--------------------
if [ "$SB_XAR_EXISTS_ON_PATH" == "" ]; then
    SB_XAR_EXISTS_ON_PATH="f"
    if [ "`which xar 2> /dev/null`" != "" ]; then
        SB_XAR_EXISTS_ON_PATH="t"
    #else
    #    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
    #        "xar" "c2ede556-c5f4-4ac0-9513-507090e0a9e7"
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
                    echo "GUID=='104da3b3-3a87-4b63-86b3-507090e0a9e7'"
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
                echo "GUID=='ea40a114-00f4-44c7-a1b3-507090e0a9e7'"
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
        echo "GUID=='95805010-73d0-4cb8-a4b3-507090e0a9e7'"
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
        #    "pdftocairo" "4d422dc5-dba7-451c-9213-507090e0a9e7"
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
            "pdftohtml" "4ad48073-c81b-4680-9413-507090e0a9e7"
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
        #    "pdftoppm" "833ab235-1684-42cf-a313-507090e0a9e7"
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
            "pdftops" "4f52c436-acaf-4f65-b513-507090e0a9e7"
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
        #    "pdftosrc" "27784942-fa05-4280-b113-507090e0a9e7"
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
            "pdftotext" "25ad8ec6-938d-451b-8213-507090e0a9e7"
    fi
fi
if [ "$S_FP_PDFTOTEXT" == "" ]; then
    S_FP_PDFTOTEXT="`which pdftotext 2> /dev/null`"
fi
if [ "$SB_PDFTOTEXT_EXISTS_ON_PATH" == "t" ]; then
    alias pdf2text="$S_FP_NICE -n 2 $S_FP_PDFTOTEXT "
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
                echo "GUID=='19222394-6cdb-4c44-87b3-507090e0a9e7'"
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
                "xdotool" "4724a45d-65aa-4d39-8413-507090e0a9e7"
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
                "wmctrl" "11d53d5b-28d4-4e91-b403-507090e0a9e7"
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
            "1be56e23-2857-4aa6-b403-507090e0a9e7"
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
                    echo "GUID=='13a3a253-a6a9-436f-b6a3-507090e0a9e7'"
                    echo ""
                fi
            fi
        #     func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        #         "gsettings" "1cdead28-64f4-4a15-b503-507090e0a9e7"
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
                "import" "12a0d3b3-f047-4da9-9a03-507090e0a9e7"
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
        #         "gnome-characters" "49b72cb4-2a49-4221-9503-507090e0a9e7"
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
        #         "gnome-tweaks" "e4c9c247-f8e2-4c32-a103-507090e0a9e7"
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
        #         "gnome-shell-extension-prefs" "41697501-e54b-4fed-8103-507090e0a9e7"
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
                "unoconv" "534511ec-de20-497f-9103-507090e0a9e7"
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
            "bat" "f3471a4b-dfad-47e8-8403-507090e0a9e7"
        if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
            echo "\"bat\" MIGHT be installed by executing "
            echo -e "\e[36m"
            echo "    cargo install bat "
            echo -e "\e[39m"
            echo "GUID=='e50fcb16-b242-4884-92a3-507090e0a9e7'"
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
            "zoxide" "110eb941-82a9-4861-9203-507090e0a9e7"
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
            echo "GUID=='007ba436-5876-46fd-82a3-507090e0a9e7'"
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
            "exa" "ac31c638-379c-48d1-8403-507090e0a9e7"
        if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
            echo "\"exa\" MIGHT be installed by executing "
            echo -e "\e[36m"
            echo "    cargo install exa"
            echo -e "\e[39m"
            echo "In the case of Debian based operating systems "
            echo "the \"exa\" MIGHT be available form the "
            echo "operating system standard package collection."
            echo "GUID=='476c2090-e77f-49af-b393-507090e0a9e7'"
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
            echo "GUID=='a0f8e91f-c25a-4c86-8393-507090e0a9e7'"
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
            "mcfly" "834ee71b-e923-4091-92f2-507090e0a9e7"
        if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
            echo "\"mcfly\" MIGHT be installed by executing "
            echo -e "\e[36m"
            echo "    cargo install mcfly "
            echo -e "\e[39m"
            echo "GUID=='03656b5b-686c-4536-b193-507090e0a9e7'"
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
            "gitui" "65d2d655-95c3-4930-a1f2-507090e0a9e7"
    fi
fi
#----------------------------------------
if [ "$SB_RG_EXISTS_ON_PATH" == "" ]; then
    SB_RG_EXISTS_ON_PATH="f" # rg is installed by "cargo install ripgrep"
    if [ "`which rg 2> /dev/null`" != "" ]; then
        SB_RG_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "rg/ripgrep" "c8523bd3-34de-4847-aef2-507090e0a9e7"
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
            "wiki-tui" "921d4742-92e8-4bc3-b2f2-507090e0a9e7"
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
            "yt-dlp" "f6e47a53-e560-4d25-b2f2-507090e0a9e7"
        if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
            echo "\"yt-dlp\" MIGHT be installed by executing "
            echo -e "\e[36m"
            echo "    pipx install yt-dlp "
            echo -e "\e[39m"
            echo "GUID=='1334c713-1c26-44c9-ac93-507090e0a9e7'"
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
            "trafilatura" "f789f145-348c-4ec0-a4f2-507090e0a9e7"
        if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
            echo "\"trafilatura\" MIGHT be installed by executing "
            echo -e "\e[36m"
            echo "    pipx install trafilatura "
            echo -e "\e[39m"
            echo "GUID=='dc4bb44c-4239-453d-a283-507090e0a9e7'"
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
            "pdm" "ccd08847-2745-4b24-b2f2-507090e0a9e7"
        if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
            echo "\"pdm\" MIGHT be installed by executing "
            echo -e "\e[36m"
            echo "    pipx install --include-deps --force pdm "
            echo -e "\e[39m"
            echo "GUID=='1fed35d3-a4ee-4f41-9583-507090e0a9e7'"
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
                "autoconf" "5bf60687-d8d0-4451-82f2-507090e0a9e7"
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
                    "youtubedl-gui" "87c6aa21-3c17-4fcc-b2f2-507090e0a9e7"
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
                            "q4os-youtube-downloader" "84e4a2ba-4d2c-4564-83f2-507090e0a9e7"
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
    #             "ytfzf" "c3297a42-5dc3-4fc9-b5f2-507090e0a9e7"
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
    #                     echo "GUID=='eef54b27-5570-4296-b483-507090e0a9e7'"
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
            "uncompface" "107c2223-9096-441e-b3f2-507090e0a9e7"
    fi
fi
#--------------------
if [ "$SB_COMPFACE_EXISTS_ON_PATH" == "" ]; then
    SB_COMPFACE_EXISTS_ON_PATH="f"
    if [ "`which compface 2> /dev/null`" != "" ]; then
        SB_COMPFACE_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "compface" "1fb13141-c3f7-4adb-a3f2-507090e0a9e7"
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
            "bc" "0f29221a-2de3-4a22-b2f2-507090e0a9e7"
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
               "xclip" "6970bd55-dee4-4a10-94f2-507090e0a9e7"
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
                    "debtree" "6942544c-4072-44f2-a2f2-507090e0a9e7"
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
                "m4" "f14e1f3d-2a74-4420-a3f2-507090e0a9e7"
        fi
    fi
    #----------------------------------------------------------------------
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    if [ "$SB_PACTL_EXISTS_ON_PATH" == "" ]; then
        SB_PACTL_EXISTS_ON_PATH="f"
        if [ "`which pactl 2> /dev/null`" != "" ]; then
            SB_LPSTAT_EXISTS_ON_PATH="t"
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
                "resize" "52e625e8-c6aa-44cb-95f2-507090e0a9e7"
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
            "shred" "aeb5d71c-e53b-4dc0-94f2-507090e0a9e7"
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
        #         "snap" "81773a33-d430-45a2-b3f2-507090e0a9e7"
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
            "uuencode" "f593e711-78ab-4a29-8df2-507090e0a9e7"
        #if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
            if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
                echo -e "The \"\e[33muuencode\e[39m\""
                echo -e "MIGHT be part of the package \"\e[33msharutils\e[39m\". "
                echo "GUID=='ba07382d-ad09-4d46-8183-507090e0a9e7'"
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
            "uudecode" "59d37345-4532-4ba6-b1e2-507090e0a9e7"
        #if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
            if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
                echo -e "The \"\e[33muudecode\e[39m\""
                echo -e "MIGHT be part of the package \"\e[33msharutils\e[39m\". "
                echo "GUID=='8e349736-a812-4254-8473-507090e0a9e7'"
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
           "uuid" "04683efe-235f-4bd3-8ee2-507090e0a9e7"
        if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
            if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
                # https://superuser.com/questions/621297/how-do-i-install-uuidgen
                # archival copy: https://archive.ph/S56pQ
                echo "On Debian based systems the \"uuid\" MIGHT be installed "
                echo -e "by installing a package named \"\e[33muuid-runtime\e[39m\"."
                echo "GUID=='13121a3e-146b-4322-8273-507090e0a9e7'"
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
                "fc-cache" "b871b734-974e-4d53-b3e2-507090e0a9e7"
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
        #         "iptables" "aca42450-440b-463b-82e2-507090e0a9e7"
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
        #         "ufw" "2499988a-3d8b-4ad1-b2e2-507090e0a9e7"
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
                "gufw" "ad78d538-685a-4f5d-94e2-507090e0a9e7"
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
        #         "iptables" "5c3c45f5-e5f5-4452-9ce2-507090e0a9e7"
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
            echo "GUID=='356837e2-746e-4938-b473-507090e0a9e7'"
            echo ""
        fi
    else
        mkdir -p $FP_DOT_VIM_MANUALLY_INSTALLED_PLUGINS
        func_mmmv_wait_and_sync_t1
        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
            "$FP_DOT_VIM_MANUALLY_INSTALLED_PLUGINS" \
            "35055f26-3b18-4ce2-a1e2-507090e0a9e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    fi
else
    # The next line gives an error message, if it is a file.
    func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
        "$FP_DOT_VIM_MANUALLY_INSTALLED_PLUGINS" \
        "85174925-f6d6-4675-85e2-507090e0a9e7" \
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
    func_mmmv_include_bashfile_if_possible_t2 "$S_FP_0" "b61e8892-a028-4196-b4e2-507090e0a9e7"
fi

S_FP_0="$S_FP_DIR/subparts/general/_bashrc_subpart_create_redirection_HTML_t1"
func_mmmv_include_bashfile_if_possible_t2 "$S_FP_0" "d4f43653-ac35-4970-93e2-507090e0a9e7"

if [ "$SB_FIND_EXISTS_ON_PATH" == "t" ]; then
    S_FP_0="$S_FP_DIR/subparts/mmmv_userspace_distro_t1_specific/_bashrc_subpart_find_t1_modified"
    func_mmmv_include_bashfile_if_possible_t2 "$S_FP_0" "7e058e25-f023-4d7f-93e2-507090e0a9e7"
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
        echo "GUID=='fdda3a44-b707-49a3-8273-507090e0a9e7'"
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
    S_TMP_2="GUID=='37582761-7afe-4b26-b463-507090e0a9e7'"
    export S_MMMV_HINT_SSHFS_T1="$S_TMP_0$S_NEWLINE$S_TMP_1$S_NEWLINE$S_TMP_2"
fi
if [ "`which fusermount 2> /dev/null`" == "" ]; then
    # The fusermount is for unmounting data carriers
    # that are mounted with the sshfs.
    S_TMP_0="The fusermount was not at PATH "
    S_TMP_1="at the start of this console session. "
    S_TMP_2="GUID=='81253a38-0ffa-4996-b363-507090e0a9e7'"
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
                "31d554f5-15b3-44f7-81e2-507090e0a9e7"
        fi # whoami === root
    fi
    #----------------------------------------------------------------------
    S_TMP_2="/snap"
    if [ -e $S_TMP_2 ]; then
        if [ -d $S_TMP_2 ]; then
            func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
                "$S_TMP_2" "b2d11645-f4c3-4a38-b3e2-507090e0a9e7"
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
                "$S_TMP_2" "77620e41-3bd8-4dc3-94e2-507090e0a9e7" \
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
               "powershell.exe" "32f3d64c-7487-4f79-a4e2-507090e0a9e7"
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
        #        "clip.exe" "4908cc10-c1ab-4f41-a4e2-507090e0a9e7"
        fi
    fi
    if [ "$SB_CLIP_EXE_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_ui_file2clipboard_t1="clip.exe " # file_name_comes_here
    fi
    #----------------------------------------------------------------------
    S_FP_TASKLIST_EXE="/mnt/c/Windows/System32/tasklist.exe"
    func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
        "$S_FP_TASKLIST_EXE" "74a4763e-4fd3-4205-94e2-507090e0a9e7" \
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
                    echo "GUID=='5c27cf39-36b0-42eb-a163-507090e0a9e7'"
                else
                    echo ""
                    echo "X11 not available." # as probabilistically expected, so
                    # no long distracting texts needed.
                    echo "GUID=='28f39648-32b8-4cd7-8253-507090e0a9e7'"
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
        "46a14844-4d53-463a-9ae2-507090e0a9e7" "$SB_OK_4_THE_BASHFILE_2_BE_MISSING_OPTIONAL"
    alias dmesg="sudo /bin/dmesg "
    #alias hddtemp="sudo /usr/sbin/hddtemp "
    #----------------------------------------------------------------------
    if [ "$SB_USERNAME_IS_root" == "t" ]; then
        # WSL specific way to mount the DVD/CDRW drive.
        alias mmmv_admin_mount_DVD_t1="mount -t drvfs D: /mnt/d "
    else
        func_mmmv_verify_sb_t_f_but_do_not_exit_t1 \
            "$SB_USERNAME_IS_root" \
            "38f0021a-23c4-4817-b4e2-507090e0a9e7"
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
    #             "$S_FP_0" "238e2674-4e64-43f7-a1e2-507090e0a9e7" \
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
        "5ab66593-3640-42b7-8ed2-507090e0a9e7" \
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
               "powershell.exe" "39d2c139-6161-486b-82d2-507090e0a9e7"
           if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
               echo ""
               echo "Some further information about that MIGHT be available at "
               echo -e "\e[33m"
               echo "https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.3#winget "
               echo -e "\e[39m"
               echo "GUID=='f26d6010-2bcf-470b-b253-507090e0a9e7'"
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
            "2f373282-574d-4e27-a4d2-507090e0a9e7"
    else
        if [ "$SB_ABSENCE_DETECTED" != "t" ]; then
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                echo ""
                echo -e "\e[31mThe code in this function is flawed.\e[39m"
                echo "SB_ABSENCE_DETECTED==\"$SB_ABSENCE_DETECTED\"."
                echo "GUID=='14126436-9333-4f1e-8353-507090e0a9e7'"
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
            "9cb1ec10-86be-4003-81d2-507090e0a9e7" \
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
            "libtool" "184b2f3d-a00e-426a-a5d2-507090e0a9e7"
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
            "fossil" "72e82119-4d88-48a9-a5d2-507090e0a9e7"
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
    #         "geomyidae " "3eccf07c-2300-4f88-81d2-507090e0a9e7"
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
    fi
fi
#==========================================================================
# S_VERSION_OF_THIS_FILE="2a2e7d52-cf3b-482e-b5d2-507090e0a9e7"
#==========================================================================
