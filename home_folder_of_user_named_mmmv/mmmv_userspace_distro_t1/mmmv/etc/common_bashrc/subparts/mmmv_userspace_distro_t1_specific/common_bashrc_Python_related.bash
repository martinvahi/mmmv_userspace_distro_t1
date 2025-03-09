#!/usr/bin/env bash
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
#
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#==========================================================================

if [ "$MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1" != "mode_ok_to_load" ]; then
    S_ERR_CODE="1"
    echo ""
    echo "This script is expected to be a sub-part of the "
    echo "/home/mmmv/mmmv_userspace_distro_t1/mmmv/etc/common_bashrc/common_bashrc_main.bash"
    if [ "$MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1" != "" ]; then
        echo ""
        echo "    MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1==$MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1"
        echo ""
    fi
    echo "Exiting with an error code $S_ERR_CODE ."
    echo "GUID=='485b1d90-9e7e-4cda-b11b-c020a08019e7'"
    echo ""
    exit $S_ERR_CODE # exit with an error
fi

#--------------------------------------------------------------------------
# Python related parts.
#
# The place, where the pip/pip3 stores Python packages, is determined by
# the environment variable PYTHONUSERBASE . The name of the variable seems
# to be the same for both, Python2 and Python3.
#
#     https://docs.python.org/3/using/cmdline.html#environment-variables
#     https://docs.python.org/2/using/cmdline.html#environment-variables
#
# However, at 
#     https://www.python.org/dev/peps/pep-0370/#implementation
#     (archival copy: https://archive.is/2QaiU )
# there is the following citation:
# 
#    ----citation----start----------------------------------------
#    The user site directory can be suppressed with a new option -s or the
#    environment variable PYTHONNOUSERSITE . The feature can be disabled
#    globally by setting site.ENABLE_USER_SITE to the value False . It must
#    be set by editing site.py . It can't be altered in sitecustomize.py or
#    later.
#
#    The path to the user base directory can be overwritten with the
#    environment variable PYTHONUSERBASE . The default location is used
#    when PYTHONUSERBASE is not set or empty.
#    ----citation----end------------------------------------------
#
# A citation from some real-life "site.py":
#
#    ----citation----start----------------------------------------
#    Enable per user site-packages directory set it to False to 
#    disable the feature or True to force the feature
#    ENABLE_USER_SITE = None
#    ----citation----end------------------------------------------
# 
#--------------------------------------------------------------------------
if [ "$SB_PYTHON_EXISTS_ON_PATH" == "" ]; then
    SB_PYTHON_EXISTS_ON_PATH="f"
    if [ "`which python 2> /dev/null`" != "" ]; then
        SB_PYTHON_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "python" "14f41a1b-b028-4cd2-941b-c020a08019e7"
    fi
fi
# There is a bit of a mess that Python version 3.x is NOT backwards
# compatible with Python version 2.7 and on some Linux distributions the
# command line program "python" is the Python 2.7 and "python3" is the
# Python 3.x, and on some other Linux distributions the "python" is the
# Python 3.x. The availability of "python2" could solve that issue,
# but the availability of the "python2" is not consistently guaranteed either,
# unless it is put on PATH as a symlink.
#--------------------
if [ "$SB_PYTHON3_EXISTS_ON_PATH" == "" ]; then
    SB_PYTHON3_EXISTS_ON_PATH="f"
    if [ "`which python3 2> /dev/null`" != "" ]; then
        SB_PYTHON3_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "python3" "21db9ab3-e9ab-42bb-a51b-c020a08019e7"
    fi
fi
#--------------------------------------------------------------------------
PYTHONUSERBASE="$HOME/.mmmv/mmmv_python_pip_storage"
if [ ! -e "$PYTHONUSERBASE" ]; then
    mkdir -p $PYTHONUSERBASE 
    func_mmmv_wait_and_sync_t1
    if [ ! -e "$PYTHONUSERBASE" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" != "f" ]; then
            echo ""
            echo "The PYTHONUSERBASE (== "
            echo "$PYTHONUSERBASE"
            echo ") is missing and its creation also failed."
            echo "GUID=='e8f11115-feac-4344-921b-c020a08019e7'"
            echo ""
        fi
    fi
fi
SB_VERIFICATION_FAILED="t" # a variable for the output of the
func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
    "$PYTHONUSERBASE" "0692f61b-4357-4cf3-811b-c020a08019e7" \
    "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
    PYTHONPATH="$PYTHONUSERBASE:$PYTHONPATH"
    S_FP_0="$PYTHONUSERBASE/bin"
    if [ ! -e "$S_FP_0" ]; then
        mkdir -p "$S_FP_0"
        func_mmmv_wait_and_sync_t1
    fi
    func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
        "$S_FP_0" "221e5031-2ff4-47bb-811b-c020a08019e7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        Z_PATH="$S_FP_0:$Z_PATH"
    fi
else
    PYTHONUSERBASE=""
fi

export PYTHONUSERBASE
export PYTHONPATH
#export PYTHONNOUSERSITE="$PYTHONUSERBASE"

#--------------------------------------------------------------------------
# Supposedly the pipx is a pip/pip3 analogue that installs Python3 packages
# by installing them into their own execution environment so that each
# package that is explicitly installed by using pipx has its own copy of
# all of its dependencies. Supposedly the issue is a software architecture
# flaw that does not allow reliable use of different versions of Python
# packages in a same execution environment.

S_FP_0="$HOME/.mmmv/mmmv_python_pipx"
PIPX_HOME="$S_FP_0/storage"
PIPX_BIN_DIR="$S_FP_0/bin"
if [ ! -e "$PIPX_HOME" ]; then
    mkdir -p $PIPX_HOME 
    mkdir -p $PIPX_BIN_DIR
    func_mmmv_wait_and_sync_t1
    if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" != "f" ]; then
        if [ ! -e "$PIPX_HOME" ]; then
            echo ""
            echo "The PIPX_HOME (== "
            echo "$PIPX_HOME"
            echo ") is missing and its creation also failed."
            echo "GUID=='553f10bf-1320-4a83-911b-c020a08019e7'"
            echo ""
        fi
        if [ ! -e "$PIPX_BIN_DIR" ]; then
            echo ""
            echo "The PIPX_BIN_DIR (== "
            echo "$PIPX_BIN_DIR"
            echo ") is missing and its creation also failed."
            echo "GUID=='b8ece242-a6f0-40e6-a21b-c020a08019e7'"
            echo ""
        fi
    fi
fi
#---------------------------------------
SB_VERIFICATION_FAILED="t" # a variable for the output of the
func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
    "$PIPX_HOME" "4ce1e553-47cb-49b8-9c1b-c020a08019e7" \
    "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
    func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
        "$PIPX_BIN_DIR" "9537054f-4062-4e2b-a41b-c020a08019e7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        Z_PATH="$PIPX_BIN_DIR:$Z_PATH"
    else
        PIPX_BIN_DIR=""
    fi
else
    PIPX_HOME=""
    PIPX_BIN_DIR=""
fi
#---------------------------------------
export PIPX_HOME
export PIPX_BIN_DIR
#==========================================================================
# S_VERSION_OF_THIS_FILE="8533574c-f2ab-4182-af1b-c020a08019e7"
#==========================================================================
