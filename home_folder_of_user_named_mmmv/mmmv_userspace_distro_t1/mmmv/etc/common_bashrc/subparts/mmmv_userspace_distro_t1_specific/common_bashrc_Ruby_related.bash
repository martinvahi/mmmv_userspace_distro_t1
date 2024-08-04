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
    echo "GUID=='258a4432-346c-4404-a2ed-e102600178e7'"
    echo ""
    exit $S_ERR_CODE # exit with an error
fi

#--------------------------------------------------------------------------
export GEM_HOME="$HOME/.mmmv/mmmv_gem_home"
if [ ! -e "$GEM_HOME" ]; then
    if [ -h "$GEM_HOME" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" != "f" ]; then
            echo ""
            echo "The GEM_HOME(== "
            echo "$GEM_HOME"
            echo ") is a broken symlink. "
            echo "GUID=='7709a219-7dc4-4e72-82ed-e102600178e7'"
            echo ""
            # It's OK for the GEM_HOME to be a symlink and
            # if it is a symlink, then the symlink 
            # should not be deleted by this script.
        fi
    else
        mkdir -p $GEM_HOME 
        func_mmmv_wait_and_sync_t1
        if [ ! -e "$GEM_HOME" ]; then
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" != "f" ]; then
                echo ""
                echo "The GEM_HOME(== "
                echo "$GEM_HOME"
                echo ") is missing. and its creation also failed."
                echo "GUID=='51cb7e2b-b89c-4e25-a4ed-e102600178e7'"
                echo ""
            fi
        fi
    fi
fi
if [ -e "$GEM_HOME" ]; then
    S_FP_0="$GEM_HOME/bin"
    if [ ! -e "$S_FP_0" ]; then
        if [ -h "$S_FP_0" ]; then
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" != "f" ]; then
                echo ""
                echo "The "
                echo "$S_FP_0"
                echo ") is a broken symlink and it will be replaced with a folder."
                echo "GUID=='c3e6bb59-abd6-41a8-a3ed-e102600178e7'"
                echo ""
            fi
            rm -f "$S_FP_0" # removes a broken symlink, if the broken symlink exists
        fi
        mkdir -p  $S_FP_0 # for the case, where no gems have been installed yet
        func_mmmv_wait_and_sync_t1
    fi
    func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
        "$S_FP_0" "69838545-223c-4f70-95ed-e102600178e7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    if [ -e "$S_FP_0" ]; then
        if [ -d "$S_FP_0" ]; then
            Z_PATH="$S_FP_0:$Z_PATH"
            S_FP_1="$S_FP_0/solargraph"
            if [ -e "$S_FP_1" ]; then
                if [ ! -d "$S_FP_1" ]; then
                    alias mmmv_run_solargraph_jit_01="nice -n 5 ruby --jit $S_FP_1 "
                else
                    func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
                        "$S_FP_1" "a8aae02f-b7a5-4901-a2ed-e102600178e7" \
                        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
                fi
            fi
        fi
    fi
fi

#--------------------------------------------------------------------------
if [ "$SB_RUBY_EXISTS_ON_PATH" == "t" ]; then
    S_TMP_0="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/lib/mmmv_utilities/orderless_linediff"
    func_mmmv_add_bin_2_Z_PATH_and_optionally_share_man_2_MANPATH_t1 \
        "$S_TMP_0" "38b2082f-7dd5-4fa0-a3ed-e102600178e7" 
else
    if [ "$SB_RUBY_EXISTS_ON_PATH" != "f" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" != "f" ]; then
            echo ""
            echo "There's a flaw at some subpart of the ~/.bashrc. The "
            echo ""
            echo "    SB_RUBY_EXISTS_ON_PATH==\"$SB_RUBY_EXISTS_ON_PATH\""
            echo ""
            echo "but its valid domain is {\"t\", \"f\"}."
            echo "GUID=='7b76641d-55ff-4d8c-92ed-e102600178e7'"
            echo ""
        fi
    fi
fi
#==========================================================================
# S_VERSION_OF_THIS_FILE="d6730e43-4f9e-4ba6-93ed-e102600178e7"
#==========================================================================
