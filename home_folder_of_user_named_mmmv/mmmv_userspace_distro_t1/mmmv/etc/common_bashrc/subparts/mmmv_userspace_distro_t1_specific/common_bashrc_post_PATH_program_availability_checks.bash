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
    echo "GUID=='3e924da3-5fa0-4084-b446-1252604198e7'"
    echo ""
    exit $S_ERR_CODE # exit with an error
fi
#--------------------------------------------------------------------------
SB_FIND_EXISTS_ON_PATH="f"
if [ "`which find 2> /dev/null`" != "" ]; then
    SB_FIND_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "find" "03a6eb63-fc70-463b-b146-1252604198e7"
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
        "grep" "46399cda-28b7-46ac-8246-1252604198e7"
fi

SB_HTOP_EXISTS_ON_PATH="f"
if [ "`which htop 2> /dev/null`" != "" ]; then
    SB_HTOP_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "htop" "5fd5651f-4340-443c-8446-1252604198e7"
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
        "ncdu" "565e202f-4ed4-42ca-a536-1252604198e7"
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
        "wget" "1fe8d9a1-ec46-4f12-9136-1252604198e7"
fi

SB_CURL_EXISTS_ON_PATH="f"
if [ "`which curl 2> /dev/null`" != "" ]; then
    SB_CURL_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "curl" "a12d2b4e-b166-4832-8536-1252604198e7"
fi

# aria2 is often times available from distribution package collection.
# https://github.com/aria2
SB_ARIA2C_EXISTS_ON_PATH="f"
if [ "`which aria2c 2> /dev/null`" != "" ]; then
    SB_ARIA2C_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "aria2c" "02594a36-3743-4a93-8536-1252604198e7"
fi

SB_READLINK_EXISTS_ON_PATH="f"
if [ "`which readlink 2> /dev/null`" != "" ]; then
    SB_READLINK_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "readlink" "53334359-2b2b-4c87-a136-1252604198e7"
fi

SB_XARGS_EXISTS_ON_PATH="f"
if [ "`which xargs 2> /dev/null`" != "" ]; then
    SB_XARGS_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "xargs" "cea01818-4c6e-4885-8436-1252604198e7"
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
        "diff" "c376a42f-b666-44a2-b236-1252604198e7"
fi
#--------------------
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
            "gdiff" "13e38a84-1cdc-4b13-b136-1252604198e7"
    else
        if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "t" ]; then
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "gdiff" "23b09d2d-80fd-4dba-9326-1252604198e7"
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
    # The ulimit is not a separate program.  It is a Bash built
    # in command and therefore always available on PATH.
    #
    # According to the 2024_03_01 statement of the Microsoft
    # Bing chat-bot, it is also available as a built in command
    # in Zsh, Ksh, Dash and its behaviour can differ between
    # different shells.
fi

SB_DF_EXISTS_ON_PATH="f"
if [ "`which df 2> /dev/null`" != "" ]; then
    SB_DF_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "df" "fd3adf4d-d805-4ec8-b126-1252604198e7"
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
    #        "xview" "26dd452d-d043-46cc-8426-1252604198e7"
    fi
    
    SB_XVIEWER_EXISTS_ON_PATH="f"
    if [ "`which xviewer 2> /dev/null`" != "" ]; then
        SB_XVIEWER_EXISTS_ON_PATH="t"
    #else
    #    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
    #        "xviewer" "5b30b4e5-5cf3-44eb-9226-1252604198e7"
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
                "viewnior" "b8509727-9c15-4e93-b226-1252604198e7"
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
        "chafa" "e442532e-fd51-48e4-9126-1252604198e7"
fi

SB_CATIMG_EXISTS_ON_PATH="f"
if [ "`which catimg 2> /dev/null`" != "" ]; then
    SB_CATIMG_EXISTS_ON_PATH="t"
    alias mmmv_image_viewer_for_terminal_catimg="nice -n 3 catimg "
    alias mmmv_image_viewer_for_terminal_catimg_w150="nice -n 3 catimg -w 150 "
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "catimg" "b02bbb39-782d-48f4-8516-1252604198e7"
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
#         "img2sixel" "1cc7ffc1-ea6d-42a6-a916-1252604198e7"
fi

SB_MPV_EXISTS_ON_PATH="f"
if [ "`which mpv 2> /dev/null`" != "" ]; then
    SB_MPV_EXISTS_ON_PATH="t"
    alias mmmv_image_viewer_for_terminal_mpv_t1="nice -n 3 mpv --quiet --vo=tct "
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "mpv" "8e0c5c2e-3067-463b-8116-1252604198e7"
fi

SB_IMG2TXT_EXISTS_ON_PATH="f"
if [ "`which img2txt 2> /dev/null`" != "" ]; then
    SB_IMG2TXT_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "img2txt" "31520db6-4873-413b-bc16-1252604198e7"
fi

SB_IMG2PDF_EXISTS_ON_PATH="f"
if [ "`which img2pdf 2> /dev/null`" != "" ]; then
    SB_IMG2PDF_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "img2pdf" "546690b7-d423-4213-b116-1252604198e7"
fi

SB_CONVERT_EXISTS_ON_PATH="f"
if [ "`which convert 2> /dev/null`" != "" ]; then
    SB_CONVERT_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "convert" "43313a50-2fec-4a78-b316-1252604198e7"
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
        "col" "54b72e5b-bb09-464c-a416-1252604198e7"
fi

SB_DMESG_EXISTS_ON_PATH="f"
if [ "`which dmesg 2> /dev/null`" != "" ]; then
    SB_DMESG_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "dmesg" "59760482-4907-4af6-b206-1252604198e7"
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
        "mount" "c1c63740-3b25-481f-9206-1252604198e7"
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
        "sh" "b44b5856-f9d3-4e3f-8206-1252604198e7"
fi

SB_TCSH_EXISTS_ON_PATH="f"
if [ "`which tcsh 2> /dev/null`" != "" ]; then
    SB_TCSH_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "tcsh" "204d4782-055f-4032-9206-1252604198e7"
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
            "gcc" "4688c814-809c-462f-9206-1252604198e7"
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
            "g++" "c6eb9810-0b28-48f5-a206-1252604198e7"
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
            "clang" "73e1af3d-71fb-44cf-b206-1252604198e7"
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
            "clang++" "531c5234-1e2a-4d73-bdf5-1252604198e7"
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
        "awk" "58580932-81cf-4558-93f5-1252604198e7"
fi
#--------------------
SB_GAWK_EXISTS_ON_PATH="f"
if [ "`which gawk 2> /dev/null`" != "" ]; then
    SB_GAWK_EXISTS_ON_PATH="t"
else
    # The "gawk" can be present on both, Linux and BSD.
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "gawk" "246d1fdf-acc0-4034-84f5-1252604198e7"
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
        "emacs" "4f67ce40-d374-4aaa-85e5-1252604198e7"
fi
#--------------------
SB_HEAD_EXISTS_ON_PATH="f"
if [ "`which head 2> /dev/null`" != "" ]; then
    SB_HEAD_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "head" "62494a35-d516-4442-a3e5-1252604198e7"
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
        "jq" "10ade1a1-4ed6-44ff-a1e5-1252604198e7"
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
        "printf" "8c02a847-20fd-44d6-81e5-1252604198e7"
fi
#--------------------
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
        "rlwrap" "566dadc2-686a-42dd-a3e5-1252604198e7"
fi
#--------------------
SB_SED_EXISTS_ON_PATH="f"
if [ "`which sed 2> /dev/null`" != "" ]; then
    SB_SED_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "sed" "1739b94f-599c-4630-92d5-1252604198e7"
fi
#--------------------
SB_GSED_EXISTS_ON_PATH="f"
if [ "`which gsed 2> /dev/null`" != "" ]; then
    SB_GSED_EXISTS_ON_PATH="t"
    # On FreeBSD the BSD sed has the name "sed" and
    # the GNU sed has the name "gsed".  On Linux the
    # GNU sed has the name "sed".
else
    if [ "$SB_OPERATINGSYSTEM_LINUX" == "f" ]; then
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "gsed" "f2686666-ec67-46f8-83d5-1252604198e7"
    else 
        if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "t" ]; then
            # The Termux Linux uses the BSD flavor of the common command line tools.
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "gsed" "3ba5d3f6-594e-4b44-83d5-1252604198e7"
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
            "make" "6a401a3b-bf98-4c3a-b3d5-1252604198e7"
    fi
    #--------------------
    SB_GMAKE_EXISTS_ON_PATH="f"
    if [ "`which gmake 2> /dev/null`" != "" ]; then
        SB_GMAKE_EXISTS_ON_PATH="t"
        # On FreeBSD the BSD make has the name "make"
        # and the GNU make has the name "gmake".
        # On Linux the GNU make has the name "make".
    else
        if [ "$SB_OPERATINGSYSTEM_LINUX" == "f" ]; then
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "gmake" "6e56b228-4325-4910-b4d5-1252604198e7"
        else 
            if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "t" ]; then
                # The Termux Linux uses the BSD flavor of the common command line tools.
                func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                    "gmake" "41650941-650c-4ab1-82d5-1252604198e7"
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
        "sort" "a258ced4-de3a-4110-a1d5-1252604198e7"
fi
#--------------------
SB_STRINGS_EXISTS_ON_PATH="f"
if [ "`which strings 2> /dev/null`" != "" ]; then
    SB_STRINGS_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "strings" "d68a614d-bc07-47db-83c5-1252604198e7"
fi
#--------------------
SB_TR_EXISTS_ON_PATH="f"
if [ "`which tr 2> /dev/null`" != "" ]; then
    SB_TR_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "tr" "54298979-87b5-4739-95c5-1252604198e7"
fi
#--------------------
SB_REV_EXISTS_ON_PATH="f"
if [ "`which rev 2> /dev/null`" != "" ]; then
    SB_REV_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "rev" "ec82e732-5a66-4d64-84c5-1252604198e7"
fi
#--------------------
SB_VIM_EXISTS_ON_PATH="f"
MMMV_USERSPACE_DISTRO_T1_FP_VIMWIKI_INSTALLATION_SCRIPT="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/lib/templates/vimwiki/2022_11_21_installation_package_by_3rd_party/try_to_install.bash"
if [ "`which vim 2> /dev/null`" != "" ]; then
    #--------------------
    SB_VIM_EXISTS_ON_PATH="t"
    func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
        "$MMMV_USERSPACE_DISTRO_T1_FP_VIMWIKI_INSTALLATION_SCRIPT" \
        "71de2011-7a27-4412-84c5-1252604198e7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        alias mmmv_admin_install_vimwiki="$MMMV_USERSPACE_DISTRO_T1_FP_VIMWIKI_INSTALLATION_SCRIPT"
    else
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo "Vim exists, but the file "
            echo "$MMMV_USERSPACE_DISTRO_T1_FP_VIMWIKI_INSTALLATION_SCRIPT"
            echo -e "\e[31mis missing\e[39m. Leaving at least one alias undefined."
            echo "GUID=='5a336643-50fb-4157-a246-1252604198e7'"
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
        "$S_TMP_1" "6ccde535-b110-45dc-84c5-1252604198e7" \
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
        S_TMP_1="S_FP_TEMPLATE=\"$S_FP_DILLORC_TEMPLATE\" ; if [ -e \"\$S_FP_TEMPLATE\" ]; then if [ -d \"\$S_FP_TEMPLATE\" ]; then echo \"\" ; echo \"The template \" ; echo \"\" ; echo \" \$S_FP_TEMPLATE\" ; echo \"\" ; if [ -h \"\$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mis a symlink to a folder\\e[39m.\" ; else echo -e \"\\e[31mis a folder\\e[39m.\" ; fi ; echo \"but a file is expected.\" ; echo \"GUID=='5d27db84-2c3e-482f-b746-1252604198e7'\" ; echo \"\" ; else S_FP_DILLO_HOME=\"\$HOME/.dillo\" ; S_FP_DILLORC=\"\$S_FP_DILLO_HOME/dillorc\" ; if [ ! -e \"\$S_FP_DILLO_HOME\" ]; then if [ -h \"\$S_FP_DILLO_HOME\" ]; then echo \"\" ; echo \"The \" ; echo \"\" ; echo \" \$S_FP_DILLO_HOME \" ; echo \"\" ; echo -e \"\\e[31mis a broken symlink\\e[39m.\" ; echo \"Failed to create Dillo configuration file.\" ; echo \"GUID=='e5ab53e1-c395-4763-9746-1252604198e7'\" ; echo \"\" ; else mkdir \"\$S_FP_DILLO_HOME\" ; wait ; sync ; wait ; fi ; fi ; "
        S_TMP_2="if [ -e \"\$S_FP_DILLO_HOME\" ]; then if [ -d \"\$S_FP_DILLO_HOME\" ]; then if [ -e \"\$S_FP_DILLORC\" ]; then echo \"\" ; echo \"The \" ; echo \"\" ; echo \" \$S_FP_DILLORC\" ; echo \"\" ; if [ -d \"\$S_FP_DILLORC\" ]; then echo -e \"\\e[31malready exists\\e[39m and\" ; if [ -h \"\$S_FP_DILLORC\" ]; then echo -e \"\\e[31mit is a symlink to a folder\\e[39m despite \" ; else echo -e \"\\e[31mit is a folder\\e[39m despite \" ; fi ; echo \"the fact that a file is expected.\" ; else echo -e \"\\e[31malready exists\\e[39m.\" ; fi ; echo \"Not overwriting it.\" ; echo \"GUID=='488ab3a2-0f20-4678-8136-1252604198e7'\" ; echo \"\" ; else if [ -h \"\$S_FP_DILLORC\" ]; then echo \"\" ; echo \"The \" ; echo \"\" ; echo \" \$S_FP_DILLORC\" ; echo \"\" ; echo -e \"\\e[31mis a broken symlink\\e[39m.\" ; echo \"Not overwriting it.\" ; echo \"GUID=='d9acc517-47b5-4af1-9236-1252604198e7'\" ; echo \"\" ; else cp \"\$S_FP_TEMPLATE\" \"\$S_FP_DILLORC\" ; wait ; sync ; wait ; if [ ! -e \"\$S_FP_DILLORC\" ]; then echo \"\" ; echo -e \"\\e[31mFailed to create\\e[39m the \" ; echo \"\" ; echo \" \$S_FP_DILLORC\" ; echo \"\" ; echo \"GUID=='7e2d4cfc-422e-4373-b136-1252604198e7'\" ; echo \"\" ; else chmod -f -R 0700 \"\$S_FP_DILLO_HOME\" ; wait ; sync ; wait ; echo \"\" ; echo -e \"\\e[32mCreated\\e[39m \$S_FP_DILLORC\" ; echo \"\" ; fi ; fi ; fi ; else echo \"\" ; echo \"The \" ; echo \"\" ; echo \" \$S_FP_DILLO_HOME \" ; echo \"\" ; echo \"exists, but it is neither a folder \" ; echo \"nor a symlink to a folder.\" ; echo \"GUID=='37fc1e73-799d-479a-9936-1252604198e7'\" ; echo \"\" ; fi ; else echo \"\" ; echo -e \"\\e[31mFailed to create folder \\e[39m\" ; echo \"\" ; echo \" \$S_FP_DILLO_HOME \" ; echo \"\" ; echo \"GUID=='57276f8e-1a2f-4a68-a336-1252604198e7'\" ; echo \"\" ; fi ; fi ; else echo \"\" ; echo \"The template \" ; echo \"\" ; echo \" \$S_FP_TEMPLATE\" ; echo \"\" ; echo -e \"\\e[31mdoes not exist\\e[39m.\" ; echo \"GUID=='9b5d2f3b-c55a-4e76-8236-1252604198e7'\" ; echo \"\" ; fi ; "
        # cope with a Vim flaw/bug that crashes the Vim. The 
        #
        #     $HOME/.dillo/dillorc 
        #
        # template has been downloaded on 2023_09_02 from
        #
        #     https://web.archive.org/web/20220515221251/https://dillo.org/dillorc
        #
        func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
            "$S_FP_DILLORC_TEMPLATE" "1aa5a934-0ce9-4861-9ec5-1252604198e7" \
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
        #         echo "GUID=='088a903d-4d56-425f-8336-1252604198e7'" ;
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
        #                 echo "GUID=='31c56733-d942-404f-9226-1252604198e7'" ;
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
        #                     echo "GUID=='e32e24e3-f1e7-43af-a526-1252604198e7'" ;
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
        #                         echo "GUID=='ebccc724-3ee8-4474-b226-1252604198e7'" ;
        #                         echo "" ; 
        #                     else
        #                         cp "$S_FP_TEMPLATE"  "$S_FP_DILLORC" ; wait ; sync ; wait ;
        #                         if [ ! -e "$S_FP_DILLORC" ]; then
        #                             echo "" ; 
        #                             echo -e "\e[31mFailed to create\e[39m the " ; 
        #                             echo "" ; 
        #                             echo "    $S_FP_DILLORC" ; 
        #                             echo "" ; 
        #                             echo "GUID=='9a8f2226-6005-4965-9426-1252604198e7'" ;
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
        #                 echo "GUID=='c7de793a-0499-43b0-8126-1252604198e7'" ;
        #                 echo "" ; 
        #             fi ;
        #         else
        #             echo "" ; 
        #             echo -e "\e[31mFailed to create folder \e[39m" ; 
        #             echo "" ; 
        #             echo "    $S_FP_DILLO_HOME " ; 
        #             echo "" ; 
        #             echo "GUID=='31795d15-5161-4e20-8626-1252604198e7'" ;
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
        #     echo "GUID=='fe8ea940-bdbf-4f0a-9126-1252604198e7'" ;
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
            "chromium" "2a50d732-932b-4a88-b4b5-1252604198e7"
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
            "links" "76707e4d-0411-4077-92b5-1252604198e7"
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
            "lynx" "ba48555a-7afd-4d2c-b3b5-1252604198e7"
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
        "lftp" "52052344-743a-4ea8-a5b5-1252604198e7"
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
        "rclone" "24699349-d600-4650-a4b5-1252604198e7"
fi
#--------------------
SB_RSYNC_EXISTS_ON_PATH="f"
if [ "`which rsync 2> /dev/null`" != "" ]; then
    SB_RSYNC_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "rsync" "9abfe65d-b57c-40a9-b2b5-1252604198e7"
fi
#--------------------
SB_SSH_EXISTS_ON_PATH="f"
if [ "`which ssh 2> /dev/null`" != "" ]; then
    SB_SSH_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "ssh" "af410551-620d-4e24-85b5-1252604198e7"
fi
#--------------------
SB_SCP_EXISTS_ON_PATH="f"
if [ "`which scp 2> /dev/null`" != "" ]; then
    SB_SCP_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "scp" "ad81ac29-e030-45f8-84a5-1252604198e7"
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
        S_TMP_0="git config --global init.defaultBranch main ; git config --global user.email \"Foo@Bar.com\" ; git config --global user.name \"Foo Bar\" ; git config --global pull.rebase false ; wait ; sync ; wait ; "
        alias mmmv_git_init_config_global_FooBar_t1="$S_TMP_0"
        alias mmmv_admin_git_init_config_global_FooBar_t1="$S_TMP_0"
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
                    echo "GUID=='461f0b1d-941a-47fb-9416-1252604198e7'"
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
                    echo "GUID=='65a38c15-49f1-408d-a616-1252604198e7'"
                    echo ""
                fi
            fi
            if [ "$SB_GITG_EXISTS_ON_PATH" == "f" ]; then
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo -e "\e[31mgitk exists on PATH while the gitg is missing.\e[39m"
                    # As of 2021 the gitk has an optionally available 
                    # menu option that depends on the gitg.
                    echo "GUID=='b223785a-f662-4c0a-a416-1252604198e7'"
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
            "bison" "2363b491-2247-40db-98a5-1252604198e7"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="`which re2c 2> /dev/null`"
    SB_RE2C_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
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
            "re2c" "3d6b9a04-a234-4d30-bda5-1252604198e7"
    fi
    #----------------------------------------------------------------------
    S_TMP_0="`which yacc 2> /dev/null`"
    SB_YACC_EXISTS_ON_PATH="f"
    if [ "$S_TMP_0" != "" ]; then
        SB_YACC_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "yacc" "1f8ba632-25ae-4e41-a5a5-1252604198e7"
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
        "atool" "3321baca-ba57-47a7-a1a5-1252604198e7"
fi
#--------------------
SB_ARCHIVEMOUNT_EXISTS_ON_PATH="f"
if [ "`which archivemount 2> /dev/null`" != "" ]; then
    SB_ARCHIVEMOUNT_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "archivemount" "6e7b1d2c-7b9a-40be-93a5-1252604198e7"
fi
#--------------------
SB_TAR_EXISTS_ON_PATH="f"
if [ "`which tar 2> /dev/null`" != "" ]; then
    SB_TAR_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "tar" "009cc03b-4981-4175-8195-1252604198e7"
fi
#--------------------
SB_GZIP_EXISTS_ON_PATH="f"
if [ "`which gzip 2> /dev/null`" != "" ]; then
    SB_GZIP_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "gzip" "79634b53-7627-4bf2-b595-1252604198e7"
fi
#--------------------
SB_GUNZIP_EXISTS_ON_PATH="f"
if [ "`which gunzip 2> /dev/null`" != "" ]; then
    SB_GUNZIP_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "gunzip" "1d55a574-3a29-492e-9595-1252604198e7"
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
        "pigz" "5352e9be-ef98-44a3-9395-1252604198e7"
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
    #TODO: Create some soft of a reverse of the alias mmmv_cre_tar_lz_t1.
    #      To avoid cryptic code, the reverse might be some Bash script,
    #      NOT an alias. Supposedly the lzip/plzip includes some
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
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "plzip" "bde36c3f-e372-46f2-b495-1252604198e7"
fi
#--------------------
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
        "tarlz" "cfd23f49-4379-4138-8595-1252604198e7"
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
        "xz" "f61d8b52-c863-4f80-9595-1252604198e7"
fi
#--------------------
SB_UNXZ_EXISTS_ON_PATH="f"
if [ "`which unxz 2> /dev/null`" != "" ]; then
    SB_UNXZ_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "unxz" "22b1f630-c43a-4477-9595-1252604198e7"
fi
#--------------------
SB_RAR_EXISTS_ON_PATH="f"
if [ "`which rar 2> /dev/null`" != "" ]; then
    SB_RAR_EXISTS_ON_PATH="t"
else
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "rar" "17cf20c3-69ec-47c2-8195-1252604198e7"
    fi
fi
#--------------------
SB_UNRAR_EXISTS_ON_PATH="f"
if [ "`which unrar 2> /dev/null`" != "" ]; then
    SB_UNRAR_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "unrar" "7e5b3154-cac1-44a0-9495-1252604198e7"
fi
#--------------------
SB_ARJ_EXISTS_ON_PATH="f"
if [ "`which arj 2> /dev/null`" != "" ]; then
    SB_ARJ_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "arj" "6997c643-37f1-413f-9595-1252604198e7"
fi
#--------------------
SB_XAR_EXISTS_ON_PATH="f"
if [ "`which xar 2> /dev/null`" != "" ]; then
    SB_XAR_EXISTS_ON_PATH="t"
#else
#    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
#        "xar" "9238c44d-9145-4902-a485-1252604198e7"
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
                    echo "GUID=='7a821b51-51d0-4fb3-a416-1252604198e7'"
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
                echo "GUID=='25505171-4a20-471b-b516-1252604198e7'"
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
        echo "GUID=='8a4a2645-e79e-4e44-b216-1252604198e7'"
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
    #    "pdftocairo" "369d0de1-7ffd-4148-b385-1252604198e7"
fi
#--------------------
SB_PDFTOHTMl_EXISTS_ON_PATH="f"
if [ "`which pdftohtml 2> /dev/null`" != "" ]; then
    SB_PDFTOHTMl_EXISTS_ON_PATH="t"
    alias pdf2html="nice -n 2 pdftohtml "
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "pdftohtml" "e2104b13-05b0-45e4-a385-1252604198e7"
fi
#--------------------
SB_PDFTOPPM_EXISTS_ON_PATH="f"
if [ "`which pdftoppm 2> /dev/null`" != "" ]; then
    SB_PDFTOPPM_EXISTS_ON_PATH="t"
    alias pdf2ppm="nice -n 2 pdftoppm "
#else
    #func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
    #    "pdftoppm" "c65d4d24-d750-4564-8385-1252604198e7"
fi
#--------------------
SB_PDFTOPS_EXISTS_ON_PATH="f"
if [ "`which pdftops 2> /dev/null`" != "" ]; then
    SB_PDFTOPS_EXISTS_ON_PATH="t"
    alias pdf2ps="nice -n 2 pdftops "
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "pdftops" "7ccb8a56-eb3c-4c95-8185-1252604198e7"
fi
#--------------------
SB_PDFTOSRC_EXISTS_ON_PATH="f"
if [ "`which pdftosrc 2> /dev/null`" != "" ]; then
    SB_PDFTOSRC_EXISTS_ON_PATH="t"
    alias pdf2src="nice -n 2 pdftosrc "
#else
    #func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
    #    "pdftosrc" "563b0c6c-dd6a-4549-9285-1252604198e7"
fi
#--------------------
SB_PDFTOTEXT_EXISTS_ON_PATH="f"
if [ "`which pdftotext 2> /dev/null`" != "" ]; then
    SB_PDFTOTEXT_EXISTS_ON_PATH="t"
    alias pdf2text="nice -n 2 pdftotext "
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "pdftotext" "36302a15-d01a-4716-9485-1252604198e7"
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
            echo "GUID=='6e70a739-ba82-4e69-8516-1252604198e7'"
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
            "xdotool" "a54d9037-73e7-4809-8485-1252604198e7"
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
            "wmctrl" "9adab916-ced2-45da-8375-1252604198e7"
    fi
    #--------------------
    if [ "$SB_GSETTINGS_WORKS_T1" != "" ]; then
        func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
            "$SB_GSETTINGS_WORKS_T1" "SB_GSETTINGS_WORKS_T1" \
            "43ec4254-e874-46dc-b875-1252604198e7"
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
                echo "GUID=='59ddecc3-5168-4a17-8206-1252604198e7'"
                echo ""
            fi
        fi
    #     func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
    #         "gsettings" "d3cf3c31-c32c-4cbf-8175-1252604198e7"
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
            "import" "874bfb54-1bd2-4445-8175-1252604198e7"
    fi
    #--------------------
    SB_GNOMECHARACTERS_EXISTS_ON_PATH="f"
    if [ "`which gnome-characters 2> /dev/null`" != "" ]; then
        SB_GNOMECHARACTERS_EXISTS_ON_PATH="t"
        alias mmmv_charmap_t1="nice -n 4 gnome-characters "
    # else
    #     func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
    #         "gnome-characters" "a427d01a-b53c-4bbf-b375-1252604198e7"
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
            "autoconf" "d37637c7-95eb-4086-be65-1252604198e7"
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
    # "stat" on FreeBSD is a separate program with a different interface.
fi
#--------------------
SB_BC_EXISTS_ON_PATH="f"
if [ "`which bc 2> /dev/null`" != "" ]; then
    SB_BC_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "bc" "b6aff42e-121b-4510-8265-1252604198e7"
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
           "xclip" "b10a9e38-f7b3-42d1-b265-1252604198e7"
    fi
    #----------------------------------------------------------------------
fi
#--------------------
if [ "$MMMV_SB_LOOK_FOR_DEVELOPMENT_TOOLS" == "t" ]; then
    #----------------------------------------------------------------------
    SB_CHECKBASHISMS_EXISTS_ON_PATH="f"
    if [ "`which checkbashisms 2> /dev/null`" != "" ]; then
        SB_CHECKBASHISMS_EXISTS_ON_PATH="t"
        alias mmmv_devel_checkbashisms_common_bashrc_main_bash="checkbashisms --posix $S_FP_DIR/common_bashrc_main.bash "
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
                "debtree" "49bc77c1-730b-4eab-a265-1252604198e7"
            # Thank You.
        fi
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
            "m4" "5b43d921-25e6-4e9c-8265-1252604198e7"
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
            "resize" "6ce4a425-4357-4c7b-a565-1252604198e7"
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
        "shred" "1606a3d4-8c36-4028-b255-1252604198e7"
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    SB_SNAP_EXISTS_ON_PATH="f"
    if [ "`which snap 2> /dev/null`" != "" ]; then
        SB_SNAP_EXISTS_ON_PATH="t"
    # else
    #     # func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
    #     #     "snap" "5ae291d2-e8df-49d5-a455-1252604198e7"
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
        "uuencode" "5b80557c-57be-4d22-9355-1252604198e7"
    #if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo -e "The \"\e[33muuencode\e[39m\""
            echo -e "MIGHT be part of the package \"\e[33msharutils\e[39m\". "
            echo "GUID=='3abde948-cfe0-4263-8506-1252604198e7'"
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
        "uudecode" "48e4ec56-366b-4e08-9455-1252604198e7"
    #if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo -e "The \"\e[33muudecode\e[39m\""
            echo -e "MIGHT be part of the package \"\e[33msharutils\e[39m\". "
            echo "GUID=='96c32c40-ac86-4ba3-9106-1252604198e7'"
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
       "uuid" "3d03eb31-7d72-45c7-9155-1252604198e7"
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            # https://superuser.com/questions/621297/how-do-i-install-uuidgen
            # archival copy: https://archive.ph/S56pQ
            echo "On Debian based systems the \"uuid\" MIGHT be installed "
            echo -e "by installing a package named \"\e[33muuid-runtime\e[39m\"."
            echo "GUID=='419200d1-2e05-4e88-9506-1252604198e7'"
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
            # TODO: test it out on BSD so that the alias
            #       could be defined on BSD.  There's another
            #       reference to this alias in this Bash file
            #       and the code region, where it resides,
            #       should also be updated after this alias has
            #       been made available on BSD.
            #--------
        fi
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "fc-cache" "37c536c5-f299-46b6-8455-1252604198e7"
    fi
fi
#--------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
    SB_IPTABLES_EXISTS_ON_PATH="f"
    if [ "`which iptables 2> /dev/null`" != "" ]; then
        SB_IPTABLES_EXISTS_ON_PATH="t"
    # else
    #     func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
    #         "iptables" "883bb32e-2d45-4c9d-8d55-1252604198e7"
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
        #         "ufw" "98ef693d-be12-4014-b345-1252604198e7"
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
                "gufw" "c4a39c27-0795-4682-8345-1252604198e7"
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
    #         "iptables" "b57c930e-6048-4580-b145-1252604198e7"
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
            echo "GUID=='566bb252-c902-4a56-a106-1252604198e7'"
            echo ""
        fi
    else
        mkdir -p $FP_DOT_VIM_MANUALLY_INSTALLED_PLUGINS
        func_mmmv_wait_and_sync_t1
        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
            "$FP_DOT_VIM_MANUALLY_INSTALLED_PLUGINS" \
            "a3eb9118-78f2-430e-b145-1252604198e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    fi
else
    # The next line gives an error message, if it is a file.
    func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
        "$FP_DOT_VIM_MANUALLY_INSTALLED_PLUGINS" \
        "3505391d-6ed3-4418-a545-1252604198e7" \
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
    func_mmmv_include_bashfile_if_possible_t2 "$S_FP_0" "4eb04811-a2dc-40de-b945-1252604198e7"
fi

S_FP_0="$S_FP_DIR/subparts/general/_bashrc_subpart_create_redirection_HTML_t1"
func_mmmv_include_bashfile_if_possible_t2 "$S_FP_0" "4d03b573-124d-4f9e-9845-1252604198e7"

if [ "$SB_FIND_EXISTS_ON_PATH" == "t" ]; then
    S_FP_0="$S_FP_DIR/subparts/general/_bashrc_subpart_find_t1"
    func_mmmv_include_bashfile_if_possible_t2 "$S_FP_0" "154771a1-6bcf-484b-a235-1252604198e7"
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
        echo "GUID=='8bccfa36-2204-4e25-b206-1252604198e7'"
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
    S_TMP_2="GUID=='c167f911-1e91-42c2-a106-1252604198e7'"
    export S_MMMV_HINT_SSHFS_T1="$S_TMP_0$S_NEWLINE$S_TMP_1$S_NEWLINE$S_TMP_2"
fi
if [ "`which fusermount 2> /dev/null`" == "" ]; then
    # The fusermount is for unmounting data carriers 
    # that are mounted with the sshfs.
    S_TMP_0="The fusermount was not at PATH "
    S_TMP_1="at the start of this console session. "
    S_TMP_2="GUID=='904faa83-de35-4c8f-a5f5-1252604198e7'"
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
                "d4a73c35-7b6e-4160-b535-1252604198e7"
        fi # whoami === root
    fi
    #----------------------------------------------------------------------
    S_TMP_2="/snap"
    if [ -e $S_TMP_2 ]; then
        if [ -d $S_TMP_2 ]; then
            func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
                "$S_TMP_2" "38ef0311-095c-422c-b235-1252604198e7" 
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
                "$S_TMP_2" "26a7ba92-bc0e-49e5-9435-1252604198e7" \
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
           "powershell.exe" "4deb7057-92e3-4d4b-b535-1252604198e7"
    fi
    #--------------------
    SB_CLIP_EXE_EXISTS_ON_PATH="f"
    if [ "`which clip.exe 2> /dev/null`" != "" ]; then
        SB_CLIP_EXE_EXISTS_ON_PATH="t"
        alias mmmv_ui_file2clipboard_t1="clip.exe " # file_name_comes_here
    # else
    #    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
    #        "clip.exe" "6790de8a-1128-4d8a-8135-1252604198e7"
    fi
    #----------------------------------------------------------------------
    S_FP_TASKLIST_EXE="/mnt/c/Windows/System32/tasklist.exe"
    func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
        "$S_FP_TASKLIST_EXE" "cb3a3f34-e991-4cf7-8525-1252604198e7" \
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
                    echo "GUID=='3de78a14-f0a7-41b6-82f5-1252604198e7'"
                else
                    echo ""
                    echo "X11 not available." # as probabilistically expected, so 
                    # no long distracting texts needed.
                    echo "GUID=='2a774391-d21b-47be-a4e5-1252604198e7'"
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
        "3035a1ef-a345-4e1e-9425-1252604198e7" "$SB_OK_4_THE_BASHFILE_2_BE_MISSING_OPTIONAL"
    alias dmesg="sudo /bin/dmesg "
    #alias hddtemp="sudo /usr/sbin/hddtemp "
    #----------------------------------------------------------------------
    if [ "$SB_USERNAME_IS_root" == "t" ]; then
        # WSL specific way to mount the DVD/CDRW drive.
        alias mmmv_admin_mount_DVD_t1="mount -t drvfs D: /mnt/d "
    else
        func_mmmv_verify_sb_t_f_but_do_not_exit_t1 \
            "$SB_USERNAME_IS_root" \
            "8466df2b-9c3c-4f72-8525-1252604198e7"
    fi
    #----------------------------------------------------------------------
} # func_Windows_Subsystem_for_Linux_WSL_userspace_specific_declarations

#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_WSL" == "t" ]; then
    #----------------------------------------------------------------------
    func_Windows_Subsystem_for_Linux_WSL_userspace_specific_declarations
    #----------------------------------------------------------------------
    # The
    S_FP_0="/mnt/c/Windows/System32/WindowsPowerShell/v1.0/"
    # is supposed to contain the powershell.exe
    if [ -e "$S_FP_0" ]; then
        if [ -d "$S_FP_0" ]; then
            Z_PATH="$S_FP_0:$Z_PATH"
        else
            # The
            func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
                "$S_FP_0" "3559d464-3e9c-46ae-a425-1252604198e7" \
                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
            # is here for outputting an error message.
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
            "98c8812f-0796-4469-9525-1252604198e7" 
    else
        if [ "$SB_ABSENCE_DETECTED" != "t" ]; then
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                echo ""
                echo -e "\e[31mThe code in this function is flawed.\e[39m"
                echo "SB_ABSENCE_DETECTED==\"$SB_ABSENCE_DETECTED\"."
                echo "GUID=='910594b3-5572-4282-a1e5-1252604198e7'"
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
            "6d36e909-1256-4cba-8d25-1252604198e7" \
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
fi
#--------------------------------------------------------------------------
SB_LIBTOOL_EXISTS_ON_PATH="f"
if [ "`which libtool 2> /dev/null`" != "" ]; then
    # The GNU libtool is required for building at
    # least some versions of the GCC.
    SB_LIBTOOL_EXISTS_ON_PATH="t"
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "libtool" "fbc8c25c-5fc9-4650-b225-1252604198e7"
fi
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
SB_FOSSIL_EXISTS_ON_PATH="f"
if [ "`which fossil 2> /dev/null`" != "" ]; then
    # https://www.fossil-scm.org
    SB_FOSSIL_EXISTS_ON_PATH="t"
    alias mmmv_run_Fossil_rebuild_t1="nice -n20 fossil rebuild --vacuum --compress --cluster --analyze "
else
    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        "fossil" "25c50f75-cc18-4bd5-a415-1252604198e7"
fi
#--------------------------------------------------------------------------
SB_TRAFILATURA_EXISTS_ON_PATH="f"
if [ "`which trafilatura 2> /dev/null`" != "" ]; then
    SB_TRAFILATURA_EXISTS_ON_PATH="t"
    # The trafilatura is a Python3 application that
    # is meant to be installed by
    #
    #     pip3 install --no-cache-dir trafilatura 
    # 
#else
    # func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
    #     "trafilatura" "32d09653-dd65-4e39-9215-1252604198e7"
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
#==========================================================================
# S_VERSION_OF_THIS_FILE="40a14350-60e4-4f0d-a115-1252604198e7"
#==========================================================================
