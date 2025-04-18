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
    echo "GUID=='54b110b2-6605-4441-a934-9293501149e7'"
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
            "aha" "5ac1d062-37f8-48a8-9534-9293501149e7"
    fi
fi
#--------------------
if [ "$SB_FIND_EXISTS_ON_PATH" == "" ]; then
    SB_FIND_EXISTS_ON_PATH="f"
    if [ "`which find 2> /dev/null`" != "" ]; then
        SB_FIND_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "find" "48473f2f-0de6-46c8-a534-9293501149e7"
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
if [ "$SB_WC_EXISTS_ON_PATH" == "" ]; then
    SB_WC_EXISTS_ON_PATH="f"
    if [ "`which wc 2> /dev/null`" != "" ]; then
        SB_WC_EXISTS_ON_PATH="t"
    fi
fi
#--------------------
if [ "$SB_GREP_EXISTS_ON_PATH" == "" ]; then
    SB_GREP_EXISTS_ON_PATH="f"
    if [ "`which grep 2> /dev/null`" != "" ]; then
        SB_GREP_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "grep" "4485051d-088c-42a3-a434-9293501149e7"
    fi
fi
if [ "$SB_GREP_EXISTS_ON_PATH" == "t" ]; then
    #alias grep='grep --color=auto '
    alias mmmv_grep_color='grep --color '
fi
#--------------------
if [ "$SB_AG_EXISTS_ON_PATH" == "" ]; then
    # "ag" is "The Silver Searcher"
    SB_AG_EXISTS_ON_PATH="f"
    if [ "`which ag 2> /dev/null`" != "" ]; then
        SB_AG_EXISTS_ON_PATH="t"
    fi
fi
#--------------------
if [ "$SB_MAN_EXISTS_ON_PATH" == "" ]; then
    SB_MAN_EXISTS_ON_PATH="f"
    if [ "`which man 2> /dev/null`" != "" ]; then
        SB_MAN_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "man" "277e177d-c33c-48d1-9534-9293501149e7"
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
            "info" "b3491714-cd7d-4aa8-a324-9293501149e7"
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
            "tldr" "34c61a47-2a41-490c-b524-9293501149e7"
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
            echo "GUID=='c2719113-2fdb-433d-a134-9293501149e7'"
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
            "fzf" "7813a518-d0ac-48eb-9124-9293501149e7"
    fi
fi
#--------------------
if [ "$SB_HTOP_EXISTS_ON_PATH" == "" ]; then
    SB_HTOP_EXISTS_ON_PATH="f"
    if [ "`which htop 2> /dev/null`" != "" ]; then
        SB_HTOP_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "htop" "4edda91a-f761-4333-8524-9293501149e7"
    fi
fi
#----------------------------------------
if [ "$SB_NCDU_EXISTS_ON_PATH" == "" ]; then 
    SB_NCDU_EXISTS_ON_PATH="f"
    if [ "`which ncdu 2> /dev/null`" != "" ]; then
        SB_NCDU_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "ncdu" "4f096c15-d993-4b35-9524-9293501149e7"
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
    S_TMP_0="nice -n 2 ncdu --disable-delete --disable-shell --no-si --apparent-size --show-hidden --show-itemcount --sort=apparent-size-desc --color=dark --slow-ui-updates "
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
if [ "$SB_TEST_EXISTS_ON_PATH" == "" ]; then
    SB_TEST_EXISTS_ON_PATH="f"
    if [ "`which test 2> /dev/null`" != "" ]; then
        SB_TEST_EXISTS_ON_PATH="t"
    fi
fi
if [ "$SB_TEST_EXISTS_ON_PATH" == "t" ]; then
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
#--------------------
if [ "$SB_WGET_EXISTS_ON_PATH" == "" ]; then
    SB_WGET_EXISTS_ON_PATH="f"
    if [ "`which wget 2> /dev/null`" != "" ]; then
        SB_WGET_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "wget" "a34f5834-2e0b-49dc-9324-9293501149e7"
    fi
fi
#--------------------
if [ "$SB_CURL_EXISTS_ON_PATH" == "" ]; then
    SB_CURL_EXISTS_ON_PATH="f"
    if [ "`which curl 2> /dev/null`" != "" ]; then
        SB_CURL_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "curl" "b4fa043f-702a-4c04-9514-9293501149e7"
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
            "aria2c" "b1bd234f-95b7-4f6d-8514-9293501149e7"
    fi
fi
#--------------------
if [ "$SB_READLINK_EXISTS_ON_PATH" == "" ]; then
    SB_READLINK_EXISTS_ON_PATH="f"
    if [ "`which readlink 2> /dev/null`" != "" ]; then
        SB_READLINK_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "readlink" "fdac2748-6c11-421b-9114-9293501149e7"
    fi
fi
#--------------------
if [ "$SB_XARGS_EXISTS_ON_PATH" == "" ]; then
    SB_XARGS_EXISTS_ON_PATH="f"
    if [ "`which xargs 2> /dev/null`" != "" ]; then
        SB_XARGS_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "xargs" "12cf5970-a814-44e3-9214-9293501149e7"
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
            "diff" "6e85af48-eea5-4b82-8214-9293501149e7"
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
                "gdiff" "2eb5a439-c20e-419e-b404-9293501149e7"
        else
            if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "t" ]; then
                func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                    "gdiff" "b6141d40-61b1-4800-b404-9293501149e7"
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
    if [ "$SB_XPROP_EXISTS_ON_PATH" == "" ]; then
        SB_XPROP_EXISTS_ON_PATH="f"
        if [ "`which xprop 2> /dev/null`" != "" ]; then
            SB_XPROP_EXISTS_ON_PATH="t"
        fi
    fi
    
    if [ "$SB_XAUTH_EXISTS_ON_PATH" == "" ]; then
        SB_XAUTH_EXISTS_ON_PATH="f"
        if [ "`which xauth 2> /dev/null`" != "" ]; then
            SB_XAUTH_EXISTS_ON_PATH="t"
        fi
    fi
    
    if [ "$SB_HDDTEMP_EXISTS_ON_PATH" == "" ]; then
        SB_HDDTEMP_EXISTS_ON_PATH="f"
        if [ "`which hddtemp 2> /dev/null`" != "" ]; then
            SB_HDDTEMP_EXISTS_ON_PATH="t"
        fi
    fi

    #SB_ULIMIT_EXISTS_ON_PATH="t"
    # The ulimit is not a separate program.  It is a Bash built
    # in command and therefore always available on PATH.
    #
    # According to the 2024_03_01 statement of the Microsoft
    # Bing chat-bot, it is also available as a built in command
    # in Zsh, Ksh, Dash and its behaviour can differ between
    # different shells.
fi
#--------------------
if [ "$SB_DF_EXISTS_ON_PATH" == "" ]; then
    SB_DF_EXISTS_ON_PATH="f"
    if [ "`which df 2> /dev/null`" != "" ]; then
        SB_DF_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "df" "50a27b93-c612-47c9-b504-9293501149e7"
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
            "xdelta3" "4239841d-a348-44a5-a504-9293501149e7"
    fi
fi
#--------------------
if [ "$SB_RHASH_EXISTS_ON_PATH" == "" ]; then
    SB_RHASH_EXISTS_ON_PATH="f"
    if [ "`which rhash 2> /dev/null`" != "" ]; then
        SB_RHASH_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "rhash" "fa276f42-3a12-45fe-a304-9293501149e7"
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
                "sha256" "f56a0c7c-d597-4c24-b3f3-9293501149e7"
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
                "sha256sum" "46b9f64c-d2a3-49f2-82f3-9293501149e7"
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
            "xxhsum" "423e55d1-f047-4bcf-94f3-9293501149e7"
        if [ "$SB_OPERATINGSYSTEM_BSD" == "f" ]; then
            if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
                echo ""
                echo "\"xxhsum\" MIGHT be available form the "
                echo "operating system standard package collection."
                echo "In the case of Debian based operating systems "
                echo "it MIGHT be installed by executing "
                echo -e "\e[36m"
                echo "    apt-get install xxhash "
                echo -e "\e[39m"
                echo "GUID=='1466d4d3-5876-451d-a534-9293501149e7'"
                echo ""
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
                "xxh128sum" "4af8da40-5dab-4f5f-a5f3-9293501149e7"
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
                "xxh64sum" "37fb583c-3b92-4694-94f3-9293501149e7"
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
                "xxh32sum" "715a251f-bd6e-47a8-85f3-9293501149e7"
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
                "xdg-mime" "e2420310-5350-493d-a2d3-9293501149e7"
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
                "xdg-open" "1a520081-5e45-4cba-b3d3-9293501149e7"
        fi
    fi
fi
#--------------------
if [ "$SB_SYSCTL_EXISTS_ON_PATH" == "" ]; then
    SB_SYSCTL_EXISTS_ON_PATH="f"
    if [ "`which sysctl 2> /dev/null`" != "" ]; then
        SB_SYSCTL_EXISTS_ON_PATH="t"
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
if [ "$SB_FFMPEG_EXISTS_ON_PATH" == "" ]; then
    SB_FFMPEG_EXISTS_ON_PATH="f"
    if [ "`which ffmpeg 2> /dev/null`" != "" ]; then
        SB_FFMPEG_EXISTS_ON_PATH="t"
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
        #        "xview" "8a844557-59dc-444a-95d3-9293501149e7"
        fi
    fi
    #--------------------
    if [ "$SB_XVIEWER_EXISTS_ON_PATH" == "" ]; then
        SB_XVIEWER_EXISTS_ON_PATH="f"
        if [ "`which xviewer 2> /dev/null`" != "" ]; then
            SB_XVIEWER_EXISTS_ON_PATH="t"
        #else
        #    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        #        "xviewer" "dbd2174a-2512-4a11-81d3-9293501149e7"
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
                    "viewnior" "262af3da-b359-4685-a4d3-9293501149e7"
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
            "chafa" "53cd835c-d4de-46c8-a3c3-9293501149e7"
    fi
fi
if [ "$SB_CHAFA_EXISTS_ON_PATH" == "t" ]; then
    alias mmmv_image_viewer_for_terminal_chafa_80x80="nice -n 3 chafa -O 9 --size 80x80 -c full "
fi
#--------------------
if [ "$SB_CATIMG_EXISTS_ON_PATH" == "" ]; then
    SB_CATIMG_EXISTS_ON_PATH="f"
    if [ "`which catimg 2> /dev/null`" != "" ]; then
        SB_CATIMG_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "catimg" "c357962a-8bb2-48b6-b4c3-9293501149e7"
    fi
fi
if [ "$SB_CATIMG_EXISTS_ON_PATH" == "t" ]; then
    alias mmmv_image_viewer_for_terminal_catimg="nice -n 3 catimg "
    alias mmmv_image_viewer_for_terminal_catimg_w150="nice -n 3 catimg -w 150 "
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
    #         "img2sixel" "bab5d227-6dfb-4df0-83c3-9293501149e7"
    fi
fi
if [ "$SB_IMG2SIXEL_EXISTS_ON_PATH" == "t" ]; then
    alias mmmv_image_viewer_for_terminal_img2sixel="nice -n 3 img2sixel"
fi
#--------------------
if [ "$SB_MPV_EXISTS_ON_PATH" == "" ]; then
    SB_MPV_EXISTS_ON_PATH="f"
    if [ "`which mpv 2> /dev/null`" != "" ]; then
        SB_MPV_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "mpv" "400f6d14-206c-43f5-83c3-9293501149e7"
    fi
fi
if [ "$SB_MPV_EXISTS_ON_PATH" == "t" ]; then
    alias mmmv_image_viewer_for_terminal_mpv_t1="nice -n 3 mpv --quiet --vo=tct "
fi
#--------------------
if [ "$SB_IMG2TXT_EXISTS_ON_PATH" == "" ]; then
    SB_IMG2TXT_EXISTS_ON_PATH="f"
    if [ "`which img2txt 2> /dev/null`" != "" ]; then
        SB_IMG2TXT_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "img2txt" "aa479043-c4db-4806-b3b3-9293501149e7"
    fi
fi
#--------------------
if [ "$SB_IMG2PDF_EXISTS_ON_PATH" == "" ]; then
    SB_IMG2PDF_EXISTS_ON_PATH="f"
    if [ "`which img2pdf 2> /dev/null`" != "" ]; then
        SB_IMG2PDF_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "img2pdf" "9dad0d4c-e62f-498a-b2b3-9293501149e7"
    fi
fi
#--------------------
if [ "$SB_CONVERT_EXISTS_ON_PATH" == "" ]; then
    SB_CONVERT_EXISTS_ON_PATH="f"
    if [ "`which convert 2> /dev/null`" != "" ]; then
        SB_CONVERT_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "convert" "6a658f38-fcf9-446e-95b3-9293501149e7"
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
            "evince" "6b2cab41-3d12-415d-b1b3-9293501149e7"
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
            "zathura" "50d02654-6016-412f-94b3-9293501149e7"
    fi
fi
#--------------------
if [ "$SB_TEXDOCTK_EXISTS_ON_PATH" == "" ]; then
    SB_TEXDOCTK_EXISTS_ON_PATH="f"
    if [ "`which texdoctk 2> /dev/null`" != "" ]; then
        SB_TEXDOCTK_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "texdoctk" "13a74ac4-25f4-422b-93a3-9293501149e7"
    fi
fi
if [ "$SB_TEXDOCTK_EXISTS_ON_PATH" == "t" ]; then
    alias mmmv_run_doc_collection_viewer_texdoctk="nice -n 5 texdoctk " 
fi
#--------------------
if [ "$SB_XDVI_EXISTS_ON_PATH" == "" ]; then
    SB_XDVI_EXISTS_ON_PATH="f"
    if [ "`which xdvi 2> /dev/null`" != "" ]; then
        SB_XDVI_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "xdvi" "2776da55-427d-4988-93a3-9293501149e7"
    fi
fi
#--------------------
if [ "$SB_XPDF_EXISTS_ON_PATH" == "" ]; then
    SB_XPDF_EXISTS_ON_PATH="f"
    if [ "`which xpdf 2> /dev/null`" != "" ]; then
        SB_XPDF_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "xpdf" "d98ba157-e9b3-4b08-b3a3-9293501149e7"
    fi
fi
#--------------------------------------------------------------------------
#::::::::::::::::::::::::::clock::applications:::::::::::::::::::::::::::::
#--------------------------------------------------------------------------


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
            "col" "b7f9e648-b65b-42ff-84a3-9293501149e7"
    fi
fi
#--------------------
if [ "$SB_DMESG_EXISTS_ON_PATH" == "" ]; then
    SB_DMESG_EXISTS_ON_PATH="f"
    if [ "`which dmesg 2> /dev/null`" != "" ]; then
        SB_DMESG_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "dmesg" "503a1a3a-61d0-4daa-9293-9293501149e7"
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
            "mount" "3c56d128-7710-422f-b493-9293501149e7"
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
            "sh" "54b06c48-ac86-4764-9393-9293501149e7"
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
            "tcsh" "edd5d2fa-2e0c-4678-9193-9293501149e7"
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
                "gcc" "106da759-43c9-4af5-a393-9293501149e7"
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
                "g++" "58eb7933-046e-433d-9193-9293501149e7"
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
                "clang" "5ac66912-9dee-4333-a493-9293501149e7"
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
                "clang++" "1460de85-465f-4708-9583-9293501149e7"
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
            "awk" "2f9ec1b3-379d-4d0b-b583-9293501149e7"
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
            "gawk" "a93be0e2-1764-4a18-a483-9293501149e7"
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
            "emacs" "d4d0a72a-93e8-4535-a583-9293501149e7"
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
            "head" "e51c6575-519e-452d-9483-9293501149e7"
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
            "jed" "4c037f1e-febc-4054-9583-9293501149e7"
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
            "joe" "4021e84c-e92a-4b67-a183-9293501149e7"
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
            "jq" "42673a3e-dc54-4db3-8283-9293501149e7"
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
            "pup" "e525072e-d1b9-4cfd-8283-9293501149e7"
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
            "mcedit" "2abd99c2-76e1-4eee-9373-9293501149e7"
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
            "printf" "ef66c357-9c24-4599-9573-9293501149e7"
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
            "rlwrap" "9216b31d-783f-487a-9973-9293501149e7"
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
            "sed" "cc8cf55d-c14f-4a8c-b173-9293501149e7"
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
                "gsed" "9c08f446-16ff-4415-8473-9293501149e7"
        else 
            if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "t" ]; then
                # The Termux Linux uses the BSD flavor of the common command line tools.
                func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                    "gsed" "40febf81-53a7-4bec-9373-9293501149e7"
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
           "replace" "4a00b41b-5281-4d21-9473-9293501149e7"
        #if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
            if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
                echo "The command \"replace\" is part of the MariaDB project."
                echo "GUID=='c1558520-d412-4c17-b134-9293501149e7'"
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
            "time" "39e71b48-7a8c-4d26-a173-9293501149e7"
    fi
fi
#--------------------
if [ "$MMMV_SB_LOOK_FOR_DEVELOPMENT_TOOLS" == "t" ]; then
    #--------------------
    if [ "$SB_CSCOPE_EXISTS_ON_PATH" == "" ]; then
        SB_CSCOPE_EXISTS_ON_PATH="f"
        if [ "`which cscope 2> /dev/null`" != "" ]; then
            SB_CSCOPE_EXISTS_ON_PATH="t"
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "cscope" "1f40d23a-3bc1-4063-a373-9293501149e7"
        fi
    fi
    #--------------------
    if [ "$SB_CTAGS_EXISTS_ON_PATH" == "" ]; then
        SB_CTAGS_EXISTS_ON_PATH="f"
        if [ "`which ctags 2> /dev/null`" != "" ]; then
            SB_CTAGS_EXISTS_ON_PATH="t"
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "ctags" "c8004a5c-a958-4d75-b563-9293501149e7"
        fi
    fi
    #--------------------
    if [ "$SB_MAKE_EXISTS_ON_PATH" == "" ]; then
        SB_MAKE_EXISTS_ON_PATH="f"
        if [ "`which make 2> /dev/null`" != "" ]; then
            SB_MAKE_EXISTS_ON_PATH="t"
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "make" "216ee12f-630c-42a0-b363-9293501149e7"
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
                    "gmake" "33f76431-3396-422d-a563-9293501149e7"
            else 
                if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "t" ]; then
                    # The Termux Linux uses the BSD flavor of the common command line tools.
                    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                        "gmake" "b120c22e-3ff2-45ae-9563-9293501149e7"
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
    if [ "$SB_BAZEL_EXISTS_ON_PATH" == "" ]; then
        SB_BAZEL_EXISTS_ON_PATH="f"
        S_FP_BAZEL="`which bazel 2> /dev/null`"
        if [ "$S_FP_BAZEL" != "" ]; then
            SB_BAZEL_EXISTS_ON_PATH="t"
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "bazel" "c31ee52e-f53f-4126-b263-9293501149e7"
        fi
    fi
    # if [ "$SB_BAZEL_EXISTS_ON_PATH" == "t" ]; then
    #     if [ "$S_FP_BAZEL" != "" ]; then
    #         alias mmmv_bazel_something="$S_FP_BAZEL something"
    #     fi
    # fi
    #--------------------
fi
#--------------------
if [ "$SB_SORT_EXISTS_ON_PATH" == "" ]; then
    SB_SORT_EXISTS_ON_PATH="f"
    if [ "`which sort 2> /dev/null`" != "" ]; then
        SB_SORT_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "sort" "35f15c20-2e30-45e3-9463-9293501149e7"
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
            "tsort" "fb5e2a53-e2b6-4c66-b263-9293501149e7"
    fi
fi
#--------------------
if [ "$SB_UNIQ_EXISTS_ON_PATH" == "" ]; then
    SB_UNIQ_EXISTS_ON_PATH="f"
    if [ "`which uniq 2> /dev/null`" != "" ]; then
        SB_UNIQ_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "uniq" "e705454d-9c81-4def-8463-9293501149e7"
    fi
fi
#--------------------
if [ "$SB_STRINGS_EXISTS_ON_PATH" == "" ]; then
    SB_STRINGS_EXISTS_ON_PATH="f"
    if [ "`which strings 2> /dev/null`" != "" ]; then
        SB_STRINGS_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "strings" "d5910327-23f9-4750-a263-9293501149e7"
    fi
fi
#--------------------
if [ "$SB_TR_EXISTS_ON_PATH" == "" ]; then
    SB_TR_EXISTS_ON_PATH="f"
    if [ "`which tr 2> /dev/null`" != "" ]; then
        SB_TR_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "tr" "9ca89523-8e6b-4fc6-b253-9293501149e7"
    fi
fi
#--------------------
if [ "$SB_REV_EXISTS_ON_PATH" == "" ]; then
    SB_REV_EXISTS_ON_PATH="f"
    if [ "`which rev 2> /dev/null`" != "" ]; then
        SB_REV_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "rev" "2d3e432c-cab6-4db1-9453-9293501149e7"
    fi
fi
#--------------------
if [ "$SB_VIM_EXISTS_ON_PATH" == "" ]; then
    SB_VIM_EXISTS_ON_PATH="f"
    S_FP_VIM="`which vim 2> /dev/null`"
    if [ "$S_FP_VIM" != "" ]; then
        SB_VIM_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "vim" "2384de83-6a2e-443b-a553-9293501149e7"
    fi
fi
if [ "$SB_VIM_EXISTS_ON_PATH" == "t" ]; then
    if [ "$S_FP_VIM" != "" ]; then
        alias mmmv_editor_Vim="$S_FP_VIM"
    fi
fi
MMMV_USERSPACE_DISTRO_T1_FP_VIMWIKI_INSTALLATION_SCRIPT="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/lib/templates/vimwiki/2022_11_21_installation_package_by_3rd_party/try_to_install.bash"
if [ "$SB_VIM_EXISTS_ON_PATH" == "t" ]; then
    func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
        "$MMMV_USERSPACE_DISTRO_T1_FP_VIMWIKI_INSTALLATION_SCRIPT" \
        "8c73b921-b984-432a-9553-9293501149e7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        alias mmmv_admin_install_vimwiki="$MMMV_USERSPACE_DISTRO_T1_FP_VIMWIKI_INSTALLATION_SCRIPT"
    else
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo "Vim exists, but the file "
            echo "$MMMV_USERSPACE_DISTRO_T1_FP_VIMWIKI_INSTALLATION_SCRIPT"
            echo -e "\e[31mis missing\e[39m. Leaving at least one alias undefined."
            echo "GUID=='abfd1d2a-5206-4989-9534-9293501149e7'"
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
        "$S_TMP_1" "e241434c-1df1-4708-b253-9293501149e7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        alias mmmv_vim_open_overwriteable_txt="nice -n 2 vim $S_TMP_1"
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
            "anjuta" "1384f2a1-8169-4222-b453-9293501149e7"
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
            "geany" "448c2905-6781-43c9-a253-9293501149e7"
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
            "kate" "333f9144-7441-401e-a153-9293501149e7"
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
            "tea" "b2ff445d-0c79-4149-b553-9293501149e7"
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
            "texmaker" "22c89a23-ed0a-46e2-9353-9293501149e7"
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
S_CMD_NICE_WEBBROWSER="nice -n 5 "
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
        S_TMP_1="S_FP_TEMPLATE=\"$S_FP_DILLORC_TEMPLATE\" ; if [ -e \"\$S_FP_TEMPLATE\" ]; then if [ -d \"\$S_FP_TEMPLATE\" ]; then echo \"\" ; echo \"The template \" ; echo \"\" ; echo \" \$S_FP_TEMPLATE\" ; echo \"\" ; if [ -h \"\$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mis a symlink to a folder\\e[39m.\" ; else echo -e \"\\e[31mis a folder\\e[39m.\" ; fi ; echo \"but a file is expected.\" ; echo \"GUID=='9794d55d-cab5-4e7a-b224-9293501149e7'\" ; echo \"\" ; else S_FP_DILLO_HOME=\"\$HOME/.dillo\" ; S_FP_DILLORC=\"\$S_FP_DILLO_HOME/dillorc\" ; if [ ! -e \"\$S_FP_DILLO_HOME\" ]; then if [ -h \"\$S_FP_DILLO_HOME\" ]; then echo \"\" ; echo \"The \" ; echo \"\" ; echo \" \$S_FP_DILLO_HOME \" ; echo \"\" ; echo -e \"\\e[31mis a broken symlink\\e[39m.\" ; echo \"Failed to create Dillo configuration file.\" ; echo \"GUID=='15246286-c34b-499e-a324-9293501149e7'\" ; echo \"\" ; else mkdir \"\$S_FP_DILLO_HOME\" ; wait ; sync ; wait ; fi ; fi ; "
        S_TMP_2="if [ -e \"\$S_FP_DILLO_HOME\" ]; then if [ -d \"\$S_FP_DILLO_HOME\" ]; then if [ -e \"\$S_FP_DILLORC\" ]; then echo \"\" ; echo \"The \" ; echo \"\" ; echo \" \$S_FP_DILLORC\" ; echo \"\" ; if [ -d \"\$S_FP_DILLORC\" ]; then echo -e \"\\e[31malready exists\\e[39m and\" ; if [ -h \"\$S_FP_DILLORC\" ]; then echo -e \"\\e[31mit is a symlink to a folder\\e[39m despite \" ; else echo -e \"\\e[31mit is a folder\\e[39m despite \" ; fi ; echo \"the fact that a file is expected.\" ; else echo -e \"\\e[31malready exists\\e[39m.\" ; fi ; echo \"Not overwriting it.\" ; echo \"GUID=='1766879f-bc1c-49b2-8324-9293501149e7'\" ; echo \"\" ; else if [ -h \"\$S_FP_DILLORC\" ]; then echo \"\" ; echo \"The \" ; echo \"\" ; echo \" \$S_FP_DILLORC\" ; echo \"\" ; echo -e \"\\e[31mis a broken symlink\\e[39m.\" ; echo \"Not overwriting it.\" ; echo \"GUID=='d4954a20-47d9-41ab-b224-9293501149e7'\" ; echo \"\" ; else cp \"\$S_FP_TEMPLATE\" \"\$S_FP_DILLORC\" ; wait ; sync ; wait ; if [ ! -e \"\$S_FP_DILLORC\" ]; then echo \"\" ; echo -e \"\\e[31mFailed to create\\e[39m the \" ; echo \"\" ; echo \" \$S_FP_DILLORC\" ; echo \"\" ; echo \"GUID=='5b0b5495-86e3-4aee-a424-9293501149e7'\" ; echo \"\" ; else chmod -f -R 0700 \"\$S_FP_DILLO_HOME\" ; wait ; sync ; wait ; echo \"\" ; echo -e \"\\e[32mCreated\\e[39m \$S_FP_DILLORC\" ; echo \"\" ; fi ; fi ; fi ; else echo \"\" ; echo \"The \" ; echo \"\" ; echo \" \$S_FP_DILLO_HOME \" ; echo \"\" ; echo \"exists, but it is neither a folder \" ; echo \"nor a symlink to a folder.\" ; echo \"GUID=='32e4a441-62ac-4204-b414-9293501149e7'\" ; echo \"\" ; fi ; else echo \"\" ; echo -e \"\\e[31mFailed to create folder \\e[39m\" ; echo \"\" ; echo \" \$S_FP_DILLO_HOME \" ; echo \"\" ; echo \"GUID=='c107d63a-6f9b-4aa8-8514-9293501149e7'\" ; echo \"\" ; fi ; fi ; else echo \"\" ; echo \"The template \" ; echo \"\" ; echo \" \$S_FP_TEMPLATE\" ; echo \"\" ; echo -e \"\\e[31mdoes not exist\\e[39m.\" ; echo \"GUID=='5f981384-ad8c-48bc-b314-9293501149e7'\" ; echo \"\" ; fi ; "
        # cope with a Vim flaw/bug that crashes the Vim. The 
        #
        #     $HOME/.dillo/dillorc 
        #
        # template has been downloaded on 2023_09_02 from
        #
        #     https://web.archive.org/web/20220515221251/https://dillo.org/dillorc
        #
        func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
            "$S_FP_DILLORC_TEMPLATE" "a6e3dd01-3eb8-4081-bf43-9293501149e7" \
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
        #         echo "GUID=='257db514-5329-4551-af14-9293501149e7'" ;
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
        #                 echo "GUID=='31993852-42e3-410d-a214-9293501149e7'" ;
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
        #                     echo "GUID=='15d4fe2d-413f-4889-8214-9293501149e7'" ;
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
        #                         echo "GUID=='1b42c44f-bff7-41d1-9204-9293501149e7'" ;
        #                         echo "" ; 
        #                     else
        #                         cp "$S_FP_TEMPLATE"  "$S_FP_DILLORC" ; wait ; sync ; wait ;
        #                         if [ ! -e "$S_FP_DILLORC" ]; then
        #                             echo "" ; 
        #                             echo -e "\e[31mFailed to create\e[39m the " ; 
        #                             echo "" ; 
        #                             echo "    $S_FP_DILLORC" ; 
        #                             echo "" ; 
        #                             echo "GUID=='23c0e025-6beb-4cbc-9204-9293501149e7'" ;
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
        #                 echo "GUID=='5f25b844-8855-4264-8304-9293501149e7'" ;
        #                 echo "" ; 
        #             fi ;
        #         else
        #             echo "" ; 
        #             echo -e "\e[31mFailed to create folder \e[39m" ; 
        #             echo "" ; 
        #             echo "    $S_FP_DILLO_HOME " ; 
        #             echo "" ; 
        #             echo "GUID=='49c30813-02e9-40f5-b404-9293501149e7'" ;
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
        #     echo "GUID=='a248afbd-f375-4680-a204-9293501149e7'" ;
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
            "chromium" "e42d7fbe-a4d9-485b-b443-9293501149e7"
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
            "links" "24384910-b029-46ab-a343-9293501149e7"
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
            "lynx" "70b9ab24-938c-48d4-8543-9293501149e7"
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
            "349dcad2-8832-4be3-a843-9293501149e7" \
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
                "mplayer" "558ef434-59db-495a-a943-9293501149e7"
        fi
    fi
    if [ "$SB_MPLAYER_EXISTS_ON_PATH" == "t" ]; then
        #--------------------
        S_TMP_0="nice -n 1 mplayer "
        alias mmmv_videoplayer_mplayer="$S_TMP_0"
        alias mmmv_soundplayer_mplayer="$S_TMP_0"
        #--------------------
        # The 
        # alias mmmv_videoplayer_mplayer_ASCII_caca_t1="$S_TMP_0 -vo caca " 
        # is outcommented, because it plays only sound and 
        # it does not display video.
        #--------------------
        S_TMP_0="nice -n 1 mplayer -loop 0 "
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
                "mpv" "7862a810-b869-43ef-9243-9293501149e7"
        fi
    fi
    if [ "$SB_MPV_EXISTS_ON_PATH" == "t" ]; then
        #--------------------
        # TODO: declare the libcaca dependent aliases only, when libcaca is present.
        #--------------------
        S_TMP_0="nice -n 1 mpv "
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
        S_TMP_0="nice -n 1 mpv -loop 0 "
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
                "vlc" "2b31f327-1956-4b27-9343-9293501149e7"
        fi
    fi
    if [ "$SB_VLC_EXISTS_ON_PATH" == "t" ]; then
        S_TMP_0="nice -n 1 vlc "
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
                "cvlc" "b1c22652-9fe9-4c2b-a143-9293501149e7"
        fi
    fi
    if [ "$SB_CVLC_EXISTS_ON_PATH" == "t" ]; then
        # cvlc is console-VLC, a GUI-less version of the VLC video
        # player for playing sound. It launches the GUI based VLC if
        # it needs to display video.
        S_TMP_0="nice -n 1 cvlc "
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
    alias mmmv_filemanager_mc="nice -n 5 $S_FP_MC " 
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
        alias mmmv_filemanager_nautilus="nice -n 5 $S_FP_NAUTILUS "
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
        alias mmmv_filemanager_broot="nice -n 5 $S_FP_BROOT "
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
        alias mmmv_filemanager_dolphin="nice -n 5 $S_FP_DOLPHIN "
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
        alias mmmv_filemanager_mucommander="nice -n 5 $S_FP_MUCOMMANDER "
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
        alias mmmv_filemanager_pcmanfm="nice -n 5 $S_FP_PCMANFM "
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
        alias mmmv_filemanager_qwbfsmanager="nice -n 5 $S_FP_QWBFSMANAGER "
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
        alias mmmv_filemanager_nemo="nice -n 5 $S_FP_NEMO "
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
        alias mmmv_filemanager_nnn="nice -n 5 $S_FP_NNN "
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
        alias mmmv_filemanager_thunar="nice -n 5 $S_FP_THUNAR "
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
        alias mmmv_filemanager_krusader="nice -n 5 $S_FP_KRUSADER "
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
        alias mmmv_filemanager_xfe="nice -n 5 $S_FP_XFE "
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
        alias mmmv_filemanager_4pane="nice -n 5 $S_FP_4PANE "
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
        alias mmmv_filemanager_spacefm="nice -n 5 $S_FP_SPACEFM "
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
        alias mmmv_filemanager_caja="nice -n 5 $S_FP_CAJA "
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
        alias mmmv_filemanager_ranger="nice -n 5 $S_FP_RANGER "
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
        alias mmmv_filemanager_doublecmd="nice -n 5 $S_FP_DOUBLECMD "
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
        alias mmmv_filemanager_vifm="nice -n 5 $S_FP_VIFM "
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
        alias mmmv_filemanager_worker="nice -n 5 $S_FP_WORKER "
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
        alias mmmv_filemanager_nnn="nice -n 5 $S_FP_NNN "
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
        alias mmmv_filemanager_gentoo="nice -n 5 $S_FP_GENTOO "
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
            "lftp" "3bee6b92-fa39-485a-8343-9293501149e7"
    fi
fi
if [ "$SB_LFTP_EXISTS_ON_PATH" == "t" ]; then
    #--------------------
    # https://stackoverflow.com/questions/6327800/lftp-timeout-not-working
    # arcival copy: https://archive.vn/qi0z0
    alias mmmv_lftp_t1="nice -n 5 lftp -e \"set net:timeout 5; set net:reconnect-interval-base 5; set net:max-retries 3;\" "
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
            "rclone" "9954cb4f-f51a-4dfc-8533-9293501149e7"
    fi
fi
#--------------------
if [ "$SB_RSYNC_EXISTS_ON_PATH" == "" ]; then
    SB_RSYNC_EXISTS_ON_PATH="f"
    if [ "`which rsync 2> /dev/null`" != "" ]; then
        SB_RSYNC_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "rsync" "b5c9d16c-00b5-40c2-a333-9293501149e7"
    fi
fi
#--------------------
if [ "$SB_SSH_EXISTS_ON_PATH" == "" ]; then
    SB_SSH_EXISTS_ON_PATH="f"
    if [ "`which ssh 2> /dev/null`" != "" ]; then
        SB_SSH_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "ssh" "aceeca19-4f0c-4e03-b333-9293501149e7"
    fi
fi
#--------------------
if [ "$SB_SCP_EXISTS_ON_PATH" == "" ]; then
    SB_SCP_EXISTS_ON_PATH="f"
    if [ "`which scp 2> /dev/null`" != "" ]; then
        SB_SCP_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "scp" "49bbac52-c87e-46e9-9133-9293501149e7"
    fi
fi
#--------------------
if [ "$SB_TELNET_EXISTS_ON_PATH" == "" ]; then
    SB_TELNET_EXISTS_ON_PATH="f"
    if [ "`which telnet 2> /dev/null`" != "" ]; then
        SB_TELNET_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "telnet" "9f2fe65d-9654-4eee-8133-9293501149e7"
    fi
fi
#--------------------
if [ "$SB_UNISON_EXISTS_ON_PATH" == "" ]; then
    SB_UNISON_EXISTS_ON_PATH="f"
    if [ "`which unison 2> /dev/null`" != "" ]; then
        SB_UNISON_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "unison" "14760851-380b-4dc3-8233-9293501149e7"
    fi
fi
#--------------------
if [ "$SB_NOTMUCH_EXISTS_ON_PATH" == "" ]; then
    SB_NOTMUCH_EXISTS_ON_PATH="f"
    if [ "`which notmuch 2> /dev/null`" != "" ]; then
        SB_NOTMUCH_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "notmuch" "4cd329f3-4fc0-4bf2-b333-9293501149e7"
    fi
fi
#--------------------
if [ "$SB_OFFLINEIMAP_EXISTS_ON_PATH" == "" ]; then
    SB_OFFLINEIMAP_EXISTS_ON_PATH="f"
    if [ "`which offlineimap 2> /dev/null`" != "" ]; then
        SB_OFFLINEIMAP_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "offlineimap" "2d2bf32b-da49-4838-9433-9293501149e7"
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
        alias mmmv_git_gc_t1="nice -n 23 $S_FP_GIT gc --aggressive --prune=all "
        alias mmmv_git_ls_unstored="nice -n 19 $S_FP_GIT status -uall --ignored "
        alias mmmv_git_clone_recursive="nice -n 19 $S_FP_GIT clone --recursive "
        alias mmmv_git_ignore_https_certificate="GIT_SSL_NO_VERIFY=true nice -n 19 $S_FP_GIT "
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
                alias mmmv_gitg="nice -n 19 $S_FP_GITG "
                alias mmmv_run_gitg="nice -n 19 $S_FP_GITG "
            else
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo -e "\e[31mgitg exists on PATH while the git is missing.\e[39m"
                    echo "GUID=='1c0e9a40-d57c-427e-83f3-9293501149e7'"
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
                alias mmmv_gitk="nice -n 19 $S_FP_GITK "
                alias mmmv_run_gitk="nice -n 19 $S_FP_GITK "
            else
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo -e "\e[31mgitk exists on PATH while the git is missing.\e[39m"
                    echo "GUID=='6fd72036-5d52-49c2-b2f3-9293501149e7'"
                    echo ""
                fi
            fi
            if [ "$SB_GITG_EXISTS_ON_PATH" == "f" ]; then
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo -e "\e[31mgitk exists on PATH while the gitg is missing.\e[39m"
                    # As of 2021 the gitk has an optionally available 
                    # menu option that depends on the gitg.
                    echo "GUID=='9f3c3d45-82e6-4487-94f3-9293501149e7'"
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
        fi
    fi
    if [ "$S_FP_ASTYLE" == "" ]; then
        S_FP_ASTYLE="`which astyle 2> /dev/null`"
    fi
    if [ "$SB_ASTYLE_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_astyle_t1="nice -n 4 $S_FP_ASTYLE --style=java --indent=spaces=4 "
    fi
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
                "bison" "7befbf16-8307-4332-8333-9293501149e7"
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
                "re2c" "9411423d-daae-445b-8333-9293501149e7"
        fi
    fi
    #----------------------------------------------------------------------
    if [ "$SB_YACC_EXISTS_ON_PATH" == "" ]; then
        SB_YACC_EXISTS_ON_PATH="f"
        if [ "`which yacc 2> /dev/null`" != "" ]; then
            SB_YACC_EXISTS_ON_PATH="t"
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "yacc" "85c1ee6c-fca0-457d-9a23-9293501149e7"
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
            "atool" "53650545-9646-42d3-b623-9293501149e7"
    fi
fi
#--------------------
if [ "$SB_ARCHIVEMOUNT_EXISTS_ON_PATH" == "" ]; then
    SB_ARCHIVEMOUNT_EXISTS_ON_PATH="f"
    if [ "`which archivemount 2> /dev/null`" != "" ]; then
        SB_ARCHIVEMOUNT_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "archivemount" "a006515d-ab54-480f-a523-9293501149e7"
    fi
fi
#--------------------
if [ "$SB_TAR_EXISTS_ON_PATH" == "" ]; then
    SB_TAR_EXISTS_ON_PATH="f"
    if [ "`which tar 2> /dev/null`" != "" ]; then
        SB_TAR_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "tar" "c1add7b6-d295-448e-a623-9293501149e7"
    fi
fi
#--------------------
if [ "$SB_ZIP_EXISTS_ON_PATH" == "" ]; then
    SB_ZIP_EXISTS_ON_PATH="f"
    if [ "`which zip 2> /dev/null`" != "" ]; then
        SB_ZIP_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "zip" "3b494c11-92b3-4d50-8223-9293501149e7"
    fi
fi
#--------------------
if [ "$SB_UNZIP_EXISTS_ON_PATH" == "" ]; then
    SB_UNZIP_EXISTS_ON_PATH="f"
    if [ "`which unzip 2> /dev/null`" != "" ]; then
        SB_UNZIP_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "unzip" "fe12084b-562d-4c52-b423-9293501149e7"
    fi
fi
#--------------------
if [ "$SB_GZIP_EXISTS_ON_PATH" == "" ]; then
    SB_GZIP_EXISTS_ON_PATH="f"
    if [ "`which gzip 2> /dev/null`" != "" ]; then
        SB_GZIP_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "gzip" "9d27db39-8d67-4537-9223-9293501149e7"
    fi
fi
#--------------------
if [ "$SB_GUNZIP_EXISTS_ON_PATH" == "" ]; then
    SB_GUNZIP_EXISTS_ON_PATH="f"
    if [ "`which gunzip 2> /dev/null`" != "" ]; then
        SB_GUNZIP_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "gunzip" "c1ffd62f-2c0f-45e3-b323-9293501149e7"
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
            "pigz" "c9422d59-cce4-41a4-9123-9293501149e7"
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
            "plzip" "cd22e01b-a288-410b-8313-9293501149e7"
    fi
fi
if [ "$S_FP_PLZIP" == "" ]; then
    S_FP_PLZIP="`which plzip 2> /dev/null`"
fi
if [ "$SB_PLZIP_EXISTS_ON_PATH" == "t" ]; then
    #--------------------
    S_TMP_1="nice -n 17 $S_FP_PLZIP --threads=1 --decompress  "
    alias mmmv_unpack_lz_t1="$S_TMP_1"
    S_TMP_1="nice -n 17 $S_FP_PLZIP --threads=1 -9 --dictionary-size=16MiB "
    alias mmmv_pack_lz_t1="$S_TMP_1"
    # TODO: declare the 
    #     alias mmmv_pack_lz_t1="$S_TMP_1"
    #     alias mmmv_unpack_lz_t1="$S_TMP_1"
    # accoding to the available hardware threads.
    #--------------------
    # Test-lines:
    #
    #     S_FP="./fff" ; S_CMD_NICE="nice -n 17 " ; $S_CMD_NICE tar -cf "$S_FP.tar" "$S_FP" ; if [ "$?" == "0" ]; then  sync ; wait ; $S_CMD_NICE $S_FP_PLZIP --threads=1 -9 --dictionary-size=16MiB "$S_FP.tar" ; sync ; wait ; fi
    #
    #     S_CMD_NICE="nice -n 17 " ; S_FP="./fff" ; $S_CMD_NICE tar -cf "$S_FP.tar" "$S_FP" ; if [ "$?" == "0" ]; then  sync ; wait ; $S_CMD_NICE $S_FP_PLZIP --threads=1 -9 --dictionary-size=16MiB "$S_FP.tar" ; sync ; wait ; fi
    #
    #     mmmv_polish_ABC_2_ACB_exec_t1 "S_CMD_NICE=\"nice -n 17 \" ; S_FP=\"" '" ; $S_CMD_NICE tar -cf "$S_FP.tar" "$S_FP" ; if [ "$?" == "0" ]; then  sync ; wait ; $S_CMD_NICE $S_FP_PLZIP --threads=1 -9 --dictionary-size=16MiB "$S_FP.tar" ; sync ; wait ; fi ' ./fff
    #
    #--------------------
    if [ "$SB_TAR_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_cre_tar_lz_t1="mmmv_polish_ABC_2_ACB_exec_t1 \"S_CMD_NICE=\\\"nice -n 17 \\\" ; S_FP=\\\"\" '\" ; \$S_CMD_NICE tar -cf \"\$S_FP.tar\" \"\$S_FP\" ; if [ \"\$?\" == \"0\" ]; then  sync ; wait ; \$S_CMD_NICE $S_FP_PLZIP --threads=1 -9 --dictionary-size=16MiB \"\$S_FP.tar\" ; sync ; wait ; fi ' "
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
            "tarlz" "f131ca1f-4965-406e-9413-9293501149e7"
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
            "xz" "f06e261a-7ae0-45f1-8213-9293501149e7"
    fi
fi
#--------------------
if [ "$SB_UNXZ_EXISTS_ON_PATH" == "" ]; then
    SB_UNXZ_EXISTS_ON_PATH="f"
    if [ "`which unxz 2> /dev/null`" != "" ]; then
        SB_UNXZ_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "unxz" "973b1851-5d4d-48a4-8513-9293501149e7"
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
                "rar" "578c19f9-4421-4f3a-8213-9293501149e7"
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
            "unrar" "dc3f213b-8ee8-4169-9313-9293501149e7"
    fi
fi
#--------------------
if [ "$SB_ARJ_EXISTS_ON_PATH" == "" ]; then
    SB_ARJ_EXISTS_ON_PATH="f"
    if [ "`which arj 2> /dev/null`" != "" ]; then
        SB_ARJ_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "arj" "4b68ab11-1b20-4394-9213-9293501149e7"
    fi
fi
#--------------------
if [ "$SB_XAR_EXISTS_ON_PATH" == "" ]; then
    SB_XAR_EXISTS_ON_PATH="f"
    if [ "`which xar 2> /dev/null`" != "" ]; then
        SB_XAR_EXISTS_ON_PATH="t"
    #else
    #    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
    #        "xar" "2fadd315-c77f-456c-b413-9293501149e7"
    fi
fi
#--------------------
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
                    echo "GUID=='47e13871-0fd8-49c9-a4f3-9293501149e7'"
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
                echo "GUID=='f208424e-2a58-407f-a4f3-9293501149e7'"
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
        echo "GUID=='15ebad10-b24e-4f9e-a5e3-9293501149e7'"
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
    alias mmmv_HTML2PDF_wkhtmltopdf="nice -n 19 $S_FP_WKHTMLTOPDF "
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
        #    "pdftocairo" "4d92ad1f-05d3-4e79-8213-9293501149e7"
    fi
fi
if [ "$S_FP_PDFTOCAIRO" == "" ]; then
    S_FP_PDFTOCAIRO="`which pdftocairo 2> /dev/null`"
fi
if [ "$SB_PDFTOCAIRO_EXISTS_ON_PATH" == "t" ]; then
    alias pdf2cairo="nice -n 2 $S_FP_PDFTOCAIRO "
fi
#--------------------
if [ "$SB_PDFTOHTMl_EXISTS_ON_PATH" == "" ]; then
    SB_PDFTOHTMl_EXISTS_ON_PATH="f"
    S_FP_PDFTOHTMl="`which pdftohtml 2> /dev/null`"
    if [ "$S_FP_PDFTOHTMl" != "" ]; then
        SB_PDFTOHTMl_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "pdftohtml" "cf71b55d-5ea3-4263-b213-9293501149e7"
    fi
fi
if [ "$S_FP_PDFTOHTMl" == "" ]; then
    S_FP_PDFTOHTMl="`which pdftohtml 2> /dev/null`"
fi
if [ "$SB_PDFTOHTMl_EXISTS_ON_PATH" == "t" ]; then
    alias pdf2html="nice -n 2 $S_FP_PDFTOHTMl "
fi
#--------------------
if [ "$SB_PDFTOPPM_EXISTS_ON_PATH" == "" ]; then
    SB_PDFTOPPM_EXISTS_ON_PATH="f"
    S_FP_PDFTOPPM="`which pdftoppm 2> /dev/null`"
    if [ "$S_FP_PDFTOPPM" != "" ]; then
        SB_PDFTOPPM_EXISTS_ON_PATH="t"
    #else
        #func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        #    "pdftoppm" "1755db14-47ca-4124-9503-9293501149e7"
    fi
fi
if [ "$S_FP_PDFTOPPM" == "" ]; then
    S_FP_PDFTOPPM="`which pdftoppm 2> /dev/null`"
fi
if [ "$SB_PDFTOPPM_EXISTS_ON_PATH" == "t" ]; then
    alias pdf2ppm="nice -n 2 $S_FP_PDFTOPPM "
fi
#--------------------
if [ "$SB_PDFTOPS_EXISTS_ON_PATH" == "" ]; then
    SB_PDFTOPS_EXISTS_ON_PATH="f"
    S_FP_PDFTOPS="`which pdftops 2> /dev/null`"
    if [ "$S_FP_PDFTOPS" != "" ]; then
        SB_PDFTOPS_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "pdftops" "8b9b4a13-9a24-4ef8-b403-9293501149e7"
    fi
fi
if [ "$S_FP_PDFTOPS" == "" ]; then
    S_FP_PDFTOPS="`which pdftops 2> /dev/null`"
fi
if [ "$SB_PDFTOPS_EXISTS_ON_PATH" == "t" ]; then
    alias pdf2ps="nice -n 2 $S_FP_PDFTOPS "
fi
#--------------------
if [ "$SB_PDFTOSRC_EXISTS_ON_PATH" == "" ]; then
    SB_PDFTOSRC_EXISTS_ON_PATH="f"
    S_FP_PDFTOSRC="`which pdftosrc 2> /dev/null`"
    if [ "$S_FP_PDFTOSRC" != "" ]; then
        SB_PDFTOSRC_EXISTS_ON_PATH="t"
    #else
        #func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        #    "pdftosrc" "48ba1b64-80c8-4f64-8303-9293501149e7"
    fi
fi
if [ "$S_FP_PDFTOSRC" == "" ]; then
    S_FP_PDFTOSRC="`which pdftosrc 2> /dev/null`"
fi
if [ "$SB_PDFTOSRC_EXISTS_ON_PATH" == "t" ]; then
    alias pdf2src="nice -n 2 $S_FP_PDFTOSRC "
fi
#--------------------
if [ "$SB_PDFTOTEXT_EXISTS_ON_PATH" == "" ]; then
    SB_PDFTOTEXT_EXISTS_ON_PATH="f"
    S_FP_PDFTOTEXT="`which pdftotext 2> /dev/null`"
    if [ "$S_FP_PDFTOTEXT" != "" ]; then
        SB_PDFTOTEXT_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "pdftotext" "77a4df3e-9b2b-4ea7-9303-9293501149e7"
    fi
fi
if [ "$S_FP_PDFTOTEXT" == "" ]; then
    S_FP_PDFTOTEXT="`which pdftotext 2> /dev/null`"
fi
if [ "$SB_PDFTOTEXT_EXISTS_ON_PATH" == "t" ]; then
    alias pdf2text="nice -n 2 $S_FP_PDFTOTEXT "
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
                echo "GUID=='8e91ee5c-736f-4155-82d3-9293501149e7'"
                echo ""
            fi
        fi
    fi
fi
if [ "$S_FP_GNOMETYPINGMONITOR" == "" ]; then
    S_FP_GNOMETYPINGMONITOR="`which gnome-typing-monitor 2> /dev/null`"
fi
if [ "$SB_GNOMETYPINGMONITOR_EXISTS_ON_PATH" == "t" ]; then
    alias mmmv_ui_kill_gnometypingmonitor_t1="nice -n 2 killall $S_FP_GNOMETYPINGMONITOR "
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
                "xdotool" "1fcc4215-3adc-401a-9503-9293501149e7"
        fi
    fi
    if [ "$SB_XDOTOOL_EXISTS_ON_PATH" == "t" ]; then
        # https://askubuntu.com/questions/4876/can-i-minimize-a-window-from-the-command-line
        # archival copy: https://archive.vn/sNxpI
        alias mmmv_ui_minimize_active_window_t1="nice -n 3 xdotool windowminimize \$(xdotool getactivewindow) "
    fi
    #--------------------
    if [ "$SB_WMCTRL_EXISTS_ON_PATH" == "" ]; then
        SB_WMCTRL_EXISTS_ON_PATH="f"
        if [ "`which wmctrl 2> /dev/null`" != "" ]; then
            SB_WMCTRL_EXISTS_ON_PATH="t"
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "wmctrl" "485b9f9b-c8ff-44a4-a503-9293501149e7"
        fi
    fi
    if [ "$SB_WMCTRL_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_ui_switch_to_desktop_t1="nice -n 2 wmctrl -s " # desktop number is the argument
        #--------
        if [ "$SB_XDOTOOL_EXISTS_ON_PATH" == "t" ]; then
            # https://gist.github.com/platan/e63b465c2fcfe3d0cccd
            # archival copy:https://archive.ph/PZhM8 
            alias mmmv_ui_maximize_active_window_t1="nice -n 3 wmctrl -i -r \"\`xdotool getactivewindow\`\" -b add,maximized_vert,maximized_horz "
        fi
        #--------
    fi
    #--------------------
    if [ "$SB_GSETTINGS_WORKS_T1" != "" ]; then
        func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
            "$SB_GSETTINGS_WORKS_T1" "SB_GSETTINGS_WORKS_T1" \
            "117f0291-232b-4c09-a703-9293501149e7"
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
                    echo "GUID=='851fe616-443e-4665-92d3-9293501149e7'"
                    echo ""
                fi
            fi
        #     func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        #         "gsettings" "28ac4155-ff52-42f0-a403-9293501149e7"
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
                "import" "3d85cdd4-ff02-4954-b303-9293501149e7"
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
        #         "gnome-characters" "2454e6d1-a114-4abe-a203-9293501149e7"
        fi
    fi
    if [ "$SB_GNOMECHARACTERS_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_charmap_t1="nice -n 4 gnome-characters "
    fi
    #--------------------
    if [ "$SB_GNOMETWEAKS_EXISTS_ON_PATH" == "" ]; then
        SB_GNOMETWEAKS_EXISTS_ON_PATH="f"
        if [ "`which gnome-tweaks 2> /dev/null`" != "" ]; then
            SB_GNOMETWEAKS_EXISTS_ON_PATH="t"
        # else
        #     func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        #         "gnome-tweaks" "98e4193c-3a99-4f32-94f2-9293501149e7"
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
        #         "gnome-shell-extension-prefs" "40218539-3e1a-4fd4-b4f2-9293501149e7"
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
                "unoconv" "3b1b5534-ecfd-4ece-a292-9293501149e7"
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
            "bat" "bd6bce1b-42b7-4986-9592-9293501149e7"
        if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
            echo "\"bat\" MIGHT be installed by executing "
            echo -e "\e[36m"
            echo "    cargo install bat "
            echo -e "\e[39m"
            echo "GUID=='33b6ea82-b4bb-4b43-93d3-9293501149e7'"
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
            "exa" "8266a126-f18f-4adb-a492-9293501149e7"
        if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
            echo "\"exa\" MIGHT be installed by executing "
            echo -e "\e[36m"
            echo "    cargo install exa"
            echo -e "\e[39m"
            echo "In the case of Debian based operating systems "
            echo "the \"exa\" MIGHT be available form the "
            echo "operating system standard package collection."
            echo "GUID=='768bee45-3048-40b5-81d3-9293501149e7'"
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
            echo "GUID=='4b0b7ef1-a1c8-4c3f-94c3-9293501149e7'"
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
            "mcfly" "06a6f818-1f75-4fe8-8482-9293501149e7"
        if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
            echo "\"mcfly\" MIGHT be installed by executing "
            echo -e "\e[36m"
            echo "    cargo install mcfly "
            echo -e "\e[39m"
            echo "GUID=='d0a5aa5b-436a-4f69-82c3-9293501149e7'"
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
            "gitui" "57e4af51-be46-4c2e-b182-9293501149e7"
    fi
fi
#----------------------------------------
if [ "$SB_RG_EXISTS_ON_PATH" == "" ]; then
    SB_RG_EXISTS_ON_PATH="f" # rg is installed by "cargo install ripgrep"
    if [ "`which rg 2> /dev/null`" != "" ]; then
        SB_RG_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "rg/ripgrep" "5901a91b-8df3-421a-8282-9293501149e7"
    fi
fi
if [ "$SB_RG_EXISTS_ON_PATH" == "t" ]; then
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
fi
#----------------------------------------
if [ "$SB_WIKITUI_EXISTS_ON_PATH" == "" ]; then
    SB_WIKITUI_EXISTS_ON_PATH="f"
    if [ "`which wiki-tui 2> /dev/null`" != "" ]; then
        SB_WIKITUI_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "wiki-tui" "1777e4c2-24b8-47ee-ab82-9293501149e7"
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
            "yt-dlp" "45d2b028-62c1-4e42-b182-9293501149e7"
        if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
            echo "\"yt-dlp\" MIGHT be installed by executing "
            echo -e "\e[36m"
            echo "    pipx install yt-dlp "
            echo -e "\e[39m"
            echo "GUID=='17960354-93ce-4da9-afc3-9293501149e7'"
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
            "trafilatura" "450f392d-c79c-4659-b472-9293501149e7"
        if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
            echo "\"trafilatura\" MIGHT be installed by executing "
            echo -e "\e[36m"
            echo "    pipx install trafilatura "
            echo -e "\e[39m"
            echo "GUID=='1ceab233-add3-4ebb-86c3-9293501149e7'"
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
                "autoconf" "64481f47-b43d-4ed9-b372-9293501149e7"
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
                    "youtubedl-gui" "0796644b-110f-4c7d-b372-9293501149e7"
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
                            "q4os-youtube-downloader" "21628720-70a7-4f6c-8172-9293501149e7"
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
    #             "ytfzf" "d224ca39-d9f0-495a-8562-9293501149e7"
    #         if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
    #             echo ""
    #             echo "\"ytfzf\" MIGHT be available form the "
    #             echo "operating system standard package collection."
    #             echo "In the case of Debian based operating systems"
    #             echo "it MIGHT be installed by executing "
    #             echo -e "\e[36m"
    #             echo "    apt-get install ytfzf"
    #             echo -e "\e[39m"
    #             echo "GUID=='27dbd042-3005-482f-85c3-9293501149e7'"
    #             echo ""
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
            "uncompface" "de1f731e-461b-4995-a462-9293501149e7"
    fi
fi
#--------------------
if [ "$SB_COMPFACE_EXISTS_ON_PATH" == "" ]; then
    SB_COMPFACE_EXISTS_ON_PATH="f"
    if [ "`which compface 2> /dev/null`" != "" ]; then
        SB_COMPFACE_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "compface" "7178ad14-a9a4-48e9-b562-9293501149e7"
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
            "bc" "a6aad535-0d39-41d6-a252-9293501149e7"
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
               "xclip" "89b00c29-c44f-4db5-8152-9293501149e7"
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
                    "debtree" "6a2f0f42-b5e6-49e0-9252-9293501149e7"
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
                "m4" "54d80f5c-bd07-4b2e-9452-9293501149e7"
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
                "resize" "8195db5a-5c97-49ed-a452-9293501149e7"
        fi
    fi
    if [ "$SB_RESIZE_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_ui_display_active_terminal_dimensions_in_characters_t1="nice -n 5 resize "
    fi
fi
#--------------------
if [ "$SB_SHRED_EXISTS_ON_PATH" == "" ]; then
    SB_SHRED_EXISTS_ON_PATH="f"
    if [ "`which shred 2> /dev/null`" != "" ]; then
        SB_SHRED_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "shred" "36546320-a16b-4a5f-9242-9293501149e7"
    fi
fi
if [ "$SB_SHRED_EXISTS_ON_PATH" == "t" ]; then
    alias mmmv_fs_secure_erase_shred_1="nice -n 5 shred --iterations=1 --remove=wipe "
    alias mmmv_fs_secure_erase_shred_3="nice -n 5 shred --iterations=3 --remove=wipe "
    alias mmmv_fs_secure_erase_shred_5="nice -n 5 shred --iterations=5 --remove=wipe "
    alias mmmv_shred_t1="mmmv_polish_ABC_2_A_C_B_exec_t1 \"nice -n 2 shred --iterations=1 --remove=wipe \" \" ; wait ; sync \" " 
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    if [ "$SB_SNAP_EXISTS_ON_PATH" == "" ]; then
        SB_SNAP_EXISTS_ON_PATH="f"
        if [ "`which snap 2> /dev/null`" != "" ]; then
            SB_SNAP_EXISTS_ON_PATH="t"
        # else
        #     # func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        #     #     "snap" "ee4a394f-2ee4-47f3-a142-9293501149e7"
        #     if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
        #         echo "As of 2023 the snap is a Ubuntu parent company censored package collection tool."
        #         echo -e "\e[33mOn Debian the snap might be installed by \e[39m"
        #         echo -e "\e[33m    apt-get install snapd \e[39m# yes, not the "snap", but "snapd"."
        #         echo ""
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
            "uuencode" "8e8ed13c-b661-4127-a142-9293501149e7"
        #if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
            if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
                echo -e "The \"\e[33muuencode\e[39m\""
                echo -e "MIGHT be part of the package \"\e[33msharutils\e[39m\". "
                echo "GUID=='2878cccf-eee4-46a3-85b3-9293501149e7'"
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
            "uudecode" "be4cbd37-a62b-4fa7-b442-9293501149e7"
        #if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
            if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
                echo -e "The \"\e[33muudecode\e[39m\""
                echo -e "MIGHT be part of the package \"\e[33msharutils\e[39m\". "
                echo "GUID=='24703d66-c58d-4c44-a2b3-9293501149e7'"
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
           "uuid" "2172ca25-ab4c-4092-a532-9293501149e7"
        if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
            if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
                # https://superuser.com/questions/621297/how-do-i-install-uuidgen
                # archival copy: https://archive.ph/S56pQ
                echo "On Debian based systems the \"uuid\" MIGHT be installed "
                echo -e "by installing a package named \"\e[33muuid-runtime\e[39m\"."
                echo "GUID=='c9589d5a-8929-432e-95b3-9293501149e7'"
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
                "fc-cache" "2d479aa2-91b4-4669-b832-9293501149e7"
        fi
    fi
    if [ "$SB_FCCACHE_EXISTS_ON_PATH" == "t" ]; then
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
        #         "iptables" "3f89385e-8154-4f12-b532-9293501149e7"
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
        #         "ufw" "af3cba29-b412-4049-b422-9293501149e7"
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
                "gufw" "25c6921c-7399-46bb-9122-9293501149e7"
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
        #         "iptables" "114b07c6-f616-46a8-a122-9293501149e7"
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
            echo "GUID=='2ce72243-cf2c-4339-82b3-9293501149e7'"
            echo ""
        fi
    else
        mkdir -p $FP_DOT_VIM_MANUALLY_INSTALLED_PLUGINS
        func_mmmv_wait_and_sync_t1
        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
            "$FP_DOT_VIM_MANUALLY_INSTALLED_PLUGINS" \
            "1108afa4-e4d1-4f59-9222-9293501149e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    fi
else
    # The next line gives an error message, if it is a file.
    func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
        "$FP_DOT_VIM_MANUALLY_INSTALLED_PLUGINS" \
        "64603b96-252b-4d22-9212-9293501149e7" \
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
   
S_TMP_0="nice -n 5 gem install "
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
    func_mmmv_include_bashfile_if_possible_t2 "$S_FP_0" "05a1cc20-1701-4c72-b212-9293501149e7"
fi

S_FP_0="$S_FP_DIR/subparts/general/_bashrc_subpart_create_redirection_HTML_t1"
func_mmmv_include_bashfile_if_possible_t2 "$S_FP_0" "2b9e86f3-d577-414f-b312-9293501149e7"

if [ "$SB_FIND_EXISTS_ON_PATH" == "t" ]; then
    S_FP_0="$S_FP_DIR/subparts/general/_bashrc_subpart_find_t1"
    func_mmmv_include_bashfile_if_possible_t2 "$S_FP_0" "20748137-7718-4726-b512-9293501149e7"
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
        echo "GUID=='2434645c-a6e6-4221-81a3-9293501149e7'"
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
    \e[33mfusermount -u <full path to the mounting point at the ssh client side> \e[39m

Mount command for non-root users:
    nice -n 2 \e[33msshfs -oport=<ssh server port> username@domain.com:<full path to the mounting point folder at the ssh server side> <full path to the mounting point folder at the local machine> \e[39m"
    #----
else
    S_TMP_0="The sshfs was not at PATH "
    S_TMP_1="at the start of this console session. "
    S_TMP_2="GUID=='c6da2315-6707-4a1f-a5a3-9293501149e7'"
    export S_MMMV_HINT_SSHFS_T1="$S_TMP_0$S_NEWLINE$S_TMP_1$S_NEWLINE$S_TMP_2"
fi
if [ "`which fusermount 2> /dev/null`" == "" ]; then
    # The fusermount is for unmounting data carriers 
    # that are mounted with the sshfs.
    S_TMP_0="The fusermount was not at PATH "
    S_TMP_1="at the start of this console session. "
    S_TMP_2="GUID=='5133d14e-28e4-4122-a4a3-9293501149e7'"
    export S_MMMV_HINT_SSHFS_T1="$S_TMP_0$S_NEWLINE$S_TMP_1$S_NEWLINE$S_TMP_2"
fi
alias mmmv_ls_doc_SSHFS_hint_t1="echo \"\"; \\
    echo -e \"\$S_MMMV_HINT_SSHFS_T1\"; \\
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
                "072c2849-7470-4999-b212-9293501149e7"
        fi # whoami === root
    fi
    #----------------------------------------------------------------------
    S_TMP_2="/snap"
    if [ -e $S_TMP_2 ]; then
        if [ -d $S_TMP_2 ]; then
            func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
                "$S_TMP_2" "c8c5ca2e-a2c3-4cdb-a402-9293501149e7" 
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
                "$S_TMP_2" "6bb90010-4211-42ba-8502-9293501149e7" \
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
    if [ "$SB_POWERSHELL_EXE_EXISTS_ON_PATH" == "" ]; then
        SB_POWERSHELL_EXE_EXISTS_ON_PATH="f"
        if [ "`which powershell.exe 2> /dev/null`" != "" ]; then
            SB_POWERSHELL_EXE_EXISTS_ON_PATH="t"
        else
           func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
               "powershell.exe" "1f03273c-5d8a-4181-8302-9293501149e7"
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
        #        "clip.exe" "4912691d-e42c-4ed4-a202-9293501149e7"
        fi
    fi
    if [ "$SB_CLIP_EXE_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_ui_file2clipboard_t1="clip.exe " # file_name_comes_here
    fi
    #----------------------------------------------------------------------
    S_FP_TASKLIST_EXE="/mnt/c/Windows/System32/tasklist.exe"
    func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
        "$S_FP_TASKLIST_EXE" "55439d6a-f99b-4ee2-a302-9293501149e7" \
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
                    echo "GUID=='7f88985d-ecbb-4b88-a4a3-9293501149e7'"
                else
                    echo ""
                    echo "X11 not available." # as probabilistically expected, so 
                    # no long distracting texts needed.
                    echo "GUID=='28516411-8216-49ea-b4a3-9293501149e7'"
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
        "7a65184f-5a65-406f-82f1-9293501149e7" "$SB_OK_4_THE_BASHFILE_2_BE_MISSING_OPTIONAL"
    alias dmesg="sudo /bin/dmesg "
    #alias hddtemp="sudo /usr/sbin/hddtemp "
    #----------------------------------------------------------------------
    if [ "$SB_USERNAME_IS_root" == "t" ]; then
        # WSL specific way to mount the DVD/CDRW drive.
        alias mmmv_admin_mount_DVD_t1="mount -t drvfs D: /mnt/d "
    else
        func_mmmv_verify_sb_t_f_but_do_not_exit_t1 \
            "$SB_USERNAME_IS_root" \
            "3d89e282-fc62-46ca-a5f1-9293501149e7"
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
    #             "$S_FP_0" "30bf675a-6568-4670-b1f1-9293501149e7" \
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
        "4e23ba19-4fd9-4e08-a5e1-9293501149e7" \
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
               "powershell.exe" "34979b45-20da-4178-81e1-9293501149e7"
           if [ "$SB_OK_TO_DISPLAY_COMMENT" == "t" ]; then
               echo ""
               echo "Some further information about that MIGHT be available at "
               echo -e "\e[33m"
               echo "https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.3#winget "
               echo -e "\e[39m"
               echo "GUID=='4e65bc5c-6517-46c4-a593-9293501149e7'"
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
            "343197c3-d145-4cba-b2e1-9293501149e7" 
    else
        if [ "$SB_ABSENCE_DETECTED" != "t" ]; then
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                echo ""
                echo -e "\e[31mThe code in this function is flawed.\e[39m"
                echo "SB_ABSENCE_DETECTED==\"$SB_ABSENCE_DETECTED\"."
                echo "GUID=='aea27e40-a837-49db-8493-9293501149e7'"
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
            "0caa9250-0544-4b25-84e1-9293501149e7" \
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
        alias mmmv_admin_Termux_setup_storage="nice -n 2 termux-setup-storage "
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
            "libtool" "3b6baf36-7f6f-48cc-82e1-9293501149e7"
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
            "fossil" "eb4a3d26-70e3-4845-b5d1-9293501149e7"
    fi
fi
if [ "$SB_FOSSIL_EXISTS_ON_PATH" == "t" ]; then
    # https://www.fossil-scm.org
    alias mmmv_run_Fossil_rebuild_t1="nice -n20 fossil rebuild --vacuum --compress --cluster --analyze "
fi
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
# S_VERSION_OF_THIS_FILE="0177944b-35b2-4b32-85d1-9293501149e7"
#==========================================================================
