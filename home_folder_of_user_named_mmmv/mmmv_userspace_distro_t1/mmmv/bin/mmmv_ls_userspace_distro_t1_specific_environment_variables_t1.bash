#!/usr/bin/env bash
#==========================================================================
# Authors of this file: Martin.Vahi@softf1.com
# This file is in public domain.
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#
# --mistral.ai--mistral-large-latest--2026_09_28--version--citation--start--
# Shell variables (like XFOO="Bar" without export) are not inherited by child
# processes. Only environment variables (those marked with export) are passed
# to child processes.
# --mistral.ai--mistral-large-latest--2026_09_28--version--citation--end----
#
#==========================================================================

echo ""
echo "PATH==\"$PATH\""
echo ""
echo "LD_LIBRARY_PATH==\"$LD_LIBRARY_PATH\""
echo ""
echo ""
echo "  CFLAGS==\"$CFLAGS\""
echo "CXXFLAGS==\"$CXXFLAGS\""
echo ""
echo "MMMV_USERSPACE_DISTRO_T1_HOME==\"$MMMV_USERSPACE_DISTRO_T1_HOME\""
echo "MMMV_USERSPACE_DISTRO_T1_SI_N_OF_COMPILATION_THREADS_T1==\"$MMMV_USERSPACE_DISTRO_T1_SI_N_OF_COMPILATION_THREADS_T1\""
echo ""
echo "grep: `which grep`"
echo " sed: `which sed`"
echo "wget: `which wget`"
echo ""
#--------------------------------------------------------------------------
exit 0
#==========================================================================
# S_VERSION_OF_THIS_FILE="21d8db05-0b80-44f5-a720-324070c19ae7"
#==========================================================================
