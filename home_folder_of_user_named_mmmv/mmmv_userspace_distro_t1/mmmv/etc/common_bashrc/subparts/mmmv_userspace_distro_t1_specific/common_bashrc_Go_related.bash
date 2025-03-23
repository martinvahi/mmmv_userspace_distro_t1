#!/usr/bin/env bash
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
#
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#==========================================================================
export GOPATH="$HOME/.mmmv/mmmv_golang"
#--------------------------------------------------------------------------
S_FP_0="$GOPATH/bin"
if [ ! -e "$S_FP_0" ]; then 
    mkdir -p "$GOPATH/bin"
    func_mmmv_wait_and_sync_t1
fi
func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
    "$S_FP_0"  "4befb0d4-ae36-4891-bf4f-b1b3402139e7" \
    "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE"
export PATH="$S_FP_0:$PATH"
export Z_PATH="$S_FP_0:$Z_PATH"


# #----------------------------------------------------------------------
# TODO: study, if the following 4 lines make at least partial sense
# #export GOROOT_FINAL="$S_FP_APPLICATIONS/Go/v2016_06"
# #export GOROOT="$GOROOT_FINAL"
# #export GOARCH="arm"
# #export GOOS="linux"
# #----------------------------------------------------------------------

#==========================================================================
# S_VERSION_OF_THIS_FILE="b32e9591-ceda-4194-904f-b1b3402139e7"
#==========================================================================
