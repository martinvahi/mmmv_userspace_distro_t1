#!/usr/bin/env bash
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#
# This script consists of 3 parts, which can be
# navigated by searching for the following strings:
#
#     script_boilerplate_section
#     script_user_interface_section
#     script_data_section
#
# The boilerplate might be seen as the library of Bash functions that
# the rest of this script depends on. The user interface part handles
# command-line arguments, of which there are currently none.
#
#--------------------------------------------------------------------------
#:::::::::::::::::::: The Design Idology of This Script :::::::::::::::::::
#--------------------------------------------------------------------------
#
# For security reasons each operating system user installs its own set
# of Ruby gems, python packages, etc. To avoid re-downloading everything
# and to mitigate the effect of network outages, the Ruby gems, python
# packages, NodeJS packages, etc. should be installed through a local
# proxy server that caches the downloaded files.
#
#--------------------------------------------------------------------------
#::::::::::::::::::::::script_boilerplate_section:::start::::::::::::::::::
#--------------------------------------------------------------------------
#S_FP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
S_FP_ORIG="`pwd`"
#S_TIMESTAMP="`date +%Y`_`date +%m`_`date +%d`_T_`date +%H`h_`date +%M`min_`date +%S`s"
#--------------------------------------------------------------------------

func_mmmv_wait_and_sync_t1(){
    wait # for background processes started by this Bash script to exit/finish
    sync # network drives, USB-sticks, etc.
    wait # for sync to finish
} # func_mmmv_wait_and_sync_t1

#--------------------------------------------------------------------------

func_mmmv_exc_verify_S_FP_ORIG_t1() {
    if [ "$S_FP_ORIG" == "" ]; then
        echo ""
        echo "The code of this script is flawed."
        echo "The environment variable S_FP_ORIG is expected "
        echo "to be initialized at the start of the script by "
        echo ""
        echo "    S_FP_ORIG=\"\`pwd\`\""
        echo ""
        echo "Aborting script."
        echo "GUID=='2899f056-622f-4128-a4be-b3a121a19ae7'"
        echo ""
        exit 1 # exit with an error
    fi
    #------------------------
    local SB_IS_SYMLINK="f"     # possible values: "t", "f"
    if [ -h "$S_FP_ORIG" ]; then # Returns "false" for paths that
                                # do not refer to anything.
        SB_IS_SYMLINK="t"
    fi
    #--------
    if [ ! -e "$S_FP_ORIG" ]; then
        if [ "$SB_IS_SYMLINK" == "t" ]; then
            echo "The "
        else
            echo "The file or folder "
        fi
        echo ""
        echo "    S_FP_ORIG==$S_FP_ORIG "
        echo ""
        if [ "$SB_IS_SYMLINK" == "t" ]; then
            echo "is a broken symlink. It is expected to be a folder that "
        else
            echo "does not exist. It is expected to be a folder that "
        fi
        echo "contains the script that prints this error message."
        echo "Aborting script."
        echo "GUID=='e62fa828-72c6-4fd3-a3be-b3a121a19ae7'"
        echo ""
        exit 1 # exit with an error
    fi
    #------------------------
    if [ ! -d "$S_FP_ORIG" ]; then
        echo "The "
        echo ""
        echo "    S_FP_ORIG==$S_FP_ORIG "
        echo ""
        echo "is not a folder. It is expected to be a folder that "
        echo "contains the script that prints this error message."
        echo "Aborting script."
        echo "GUID=='8289b12a-f2d7-48e3-a2ae-b3a121a19ae7'"
        echo ""
        exit 1 # exit with an error
    fi
} # func_mmmv_exc_verify_S_FP_ORIG_t1

#--------------------------------------------------------------------------

func_mmmv_exc_exit_with_an_error_t1(){
    local S_GUID_CANDIDATE="$1" # first function argument
    func_mmmv_exc_verify_S_FP_ORIG_t1
    #--------
    echo ""
    echo "The code of this script is flawed."
    echo "Aborting script."
    if [ "$S_GUID_CANDIDATE" != "" ]; then
        echo "GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
    fi
    echo "GUID=='16be4622-47e2-4920-94ae-b3a121a19ae7'"
    echo ""
    cd "$S_FP_ORIG"
    exit 1 # exit with an error
} # func_mmmv_exc_exit_with_an_error_t1

#--------------------------------------------------------------------------

func_mmmv_exc_exit_with_an_error_t2(){
    local S_GUID_CANDIDATE="$1"   # first function argument
    local S_OPTIONAL_ERR_MSG="$2" # second function argument
    func_mmmv_exc_verify_S_FP_ORIG_t1
    #--------
    if [ "$S_GUID_CANDIDATE" == "" ]; then
        echo ""
        echo "The code of this script is flawed. "
        if [ "$S_OPTIONAL_ERR_MSG" != "" ]; then
            echo "$S_OPTIONAL_ERR_MSG"
        fi
        echo "Aborting script."
        echo "GUID=='7557b712-048b-4618-a4ae-b3a121a19ae7'"
        echo ""
        cd "$S_FP_ORIG"
        exit 1 # exit with an error
    else
        echo ""
        echo "Something went wrong."
        if [ "$S_OPTIONAL_ERR_MSG" != "" ]; then
            echo "$S_OPTIONAL_ERR_MSG"
        fi
        echo "Aborting script."
        echo "GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        echo "GUID=='4c803451-2c6e-42e8-83ae-b3a121a19ae7'"
        echo ""
        cd "$S_FP_ORIG"
        exit 1 # exit with an error
    fi
} # func_mmmv_exc_exit_with_an_error_t2

#--------------------------------------------------------------------------

func_mmmv_exit_if_not_on_path_t2() { # S_COMMAND_NAME
    local S_COMMAND_NAME="$1"
    #--------
    local S_LOCAL_VARIABLE="`which $S_COMMAND_NAME 2>/dev/null`"
    if [ "$S_LOCAL_VARIABLE" == "" ]; then
        echo ""
        echo "Command \"$S_COMMAND_NAME\" could not be found from the PATH. "
        echo "The execution of this Bash script is aborted."
        echo "GUID=='2fd1d872-61be-4c4a-b1ae-b3a121a19ae7'"
        echo ""
        cd "$S_FP_ORIG"
        exit 1;
    fi
} # func_mmmv_exit_if_not_on_path_t2

#--------------------------------------------------------------------------

func_mmmv_assert_error_code_zero_t1b(){
    local S_ERR_CODE="$1"       # the "$?"
    local S_GEM_PARAMETERS="$2" # the part after the "gem install "
    local S_GUID_CANDIDATE="$3"
    #--------
    # If the "$?" were evaluated in this function,
    # then it would be "0" even, if it is
    # something else at the calling code.
    if [ "$S_ERR_CODE" != "0" ];then
        echo ""
        echo -e "\e[31mSomething went wrong. Error code: $S_ERR_CODE \e[39m."
        echo ""
        echo "    S_GEM_PARAMETERS=\"$S_GEM_PARAMETERS\""
        echo ""
        echo "Aborting script."
        echo "GUID=='94b89a3e-fc1a-4984-93ae-b3a121a19ae7'"
        echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        echo ""
        cd "$S_FP_ORIG"
        exit 1
    fi
} # func_mmmv_assert_error_code_zero_t1b

#--------------------------------------------------------------------------

func_mmmv_assert_file_exists_t1() {  # S_FP, S_GUID
    local S_FP="$1"
    local S_GUID="$2"
    #------------------------------
    if [ "$S_GUID" == "" ]; then
        echo ""
        echo "The code that calls this function is flawed."
        echo "This function requires 2 parameters: S_FP, S_GUID"
        echo "GUID=='f4b243a6-a2bd-4271-acae-b3a121a19ae7'"
        echo ""
        #--------
        cd "$S_FP_ORIG"
        exit 1 # exiting with an error
    fi
    #------------------------------
    if [ ! -e "$S_FP" ]; then
        if [ -h "$S_FP" ]; then
            echo ""
            echo "The path "
            echo ""
            echo "    $S_FP "
            echo ""
            echo "points to a broken symlink, but a file or "
            echo "a symlinkt to a file is expected."
            echo "GUID==\"$S_GUID\""
            echo "GUID=='c4c83a46-ef9c-48c9-82ae-b3a121a19ae7'"
            echo ""
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        else
            echo ""
            echo "The file "
            echo ""
            echo "    $S_FP "
            echo ""
            echo "does not exist."
            echo "GUID==\"$S_GUID\""
            echo "GUID=='7aab2256-7651-4b5d-b1ae-b3a121a19ae7'"
            echo ""
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        fi
    else
        if [ -d "$S_FP" ]; then
            echo ""
            if [ -h "$S_FP" ]; then
                echo "The symlink to the folder "
            else
                echo "The folder "
            fi
            echo ""
            echo "    $S_FP "
            echo ""
            echo "exists, but a file or a symlink to a file is expected."
            echo "GUID==\"$S_GUID\""
            echo "GUID=='40220126-4773-4986-b5ae-b3a121a19ae7'"
            echo ""
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        fi
    fi
} # func_mmmv_assert_file_exists_t1

#--------------------------------------------------------------------------

func_mmmv_assert_folder_exists_t1() {  # S_FP, S_GUID
    local S_FP="$1"
    local S_GUID="$2"
    #------------------------------
    if [ "$S_GUID" == "" ]; then
        echo ""
        echo "The code that calls this function is flawed."
        echo "This function requires 2 parameters: S_FP, S_GUID"
        echo "GUID=='28d8394b-a7cc-4297-85ae-b3a121a19ae7'"
        echo ""
        #--------
        cd "$S_FP_ORIG"
        exit 1 # exiting with an error
    fi
    #------------------------------
    if [ ! -e "$S_FP" ]; then
        if [ -h "$S_FP" ]; then
            echo ""
            echo "The path "
            echo ""
            echo "    $S_FP "
            echo ""
            echo "points to a broken symlink, but a folder "
            echo "or a symlink to a folder is expected."
            echo "GUID==\"$S_GUID\""
            echo "GUID=='75936274-e2bd-42ac-85ae-b3a121a19ae7'"
            echo ""
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        else
            echo ""
            echo "The folder "
            echo ""
            echo "    $S_FP "
            echo ""
            echo "does not exist."
            echo "GUID==\"$S_GUID\""
            echo "GUID=='1884d041-3b15-48d6-9bae-b3a121a19ae7'"
            echo ""
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        fi
    else
        if [ ! -d "$S_FP" ]; then
            echo ""
            if [ -h "$S_FP" ]; then
                echo "The symlink to an existing file "
            else
                echo "The file "
            fi
            echo ""
            echo "    $S_FP "
            echo ""
            echo "exists, but a folder is expected."
            echo "GUID==\"$S_GUID\""
            echo "GUID=='a620ef37-2715-4bd1-92ae-b3a121a19ae7'"
            echo ""
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        fi
    fi
} # func_mmmv_assert_folder_exists_t1

#--------------------------------------------------------------------------

func_initialise_if_needed_and_possible_MMMV_USERSPACE_DISTRO_T1_SI_N_OF_COMPILATION_THREADS_T1(){
    if [ "$MMMV_USERSPACE_DISTRO_T1_SI_N_OF_COMPILATION_THREADS_T1" == "" ]; then
        if [ "$SB_BC_EXISTS_ON_PATH" == "" ]; then
            SB_BC_EXISTS_ON_PATH="f"
            if [ "`which bc 2> /dev/null`" != "" ]; then
                SB_BC_EXISTS_ON_PATH="t"
            fi
        fi
        if [ "$SB_TR_EXISTS_ON_PATH" == "" ]; then
            SB_TR_EXISTS_ON_PATH="f"
            if [ "`which tr 2> /dev/null`" != "" ]; then
                SB_TR_EXISTS_ON_PATH="t"
            fi
        fi
        if [ "$SB_BC_EXISTS_ON_PATH" == "t" ]; then
            if [ "$SB_TR_EXISTS_ON_PATH" == "t" ]; then
                if [ "`which mmmv_hardwarethreadcount_t1 2> /dev/null`" != "" ]; then
                    S_TMP_0="`mmmv_hardwarethreadcount_t1 `"
                    #------------------------------------------------------
                    # The line:
                    #     echo " 4-1 " | bc | tr -d '\n'
                    # works on both, FreeBSD and Linux.
                    #------------------------------------------------------
                    S_TMP_1="`echo \" $S_TMP_0-1 \" | bc | tr -d '\\n' `"
                    MMMV_USERSPACE_DISTRO_T1_SI_N_OF_COMPILATION_THREADS_T1="$S_TMP_1"
                fi
                #----------------------------------------------------------
            fi
        fi
    fi
} # func_initialise_if_needed_and_possible_MMMV_USERSPACE_DISTRO_T1_SI_N_OF_COMPILATION_THREADS_T1
func_initialise_if_needed_and_possible_MMMV_USERSPACE_DISTRO_T1_SI_N_OF_COMPILATION_THREADS_T1

#--------------------------------------------------------------------------

func_initialize_CFLAGS_and_CXXFLAGS_if_not_inited(){
    local S_DEFAULT_VALUE=" -march=native -mtune=native -ftree-vectorize -O3 "
    if [ "$CFLAGS" == "" ]; then
        export CFLAGS="$S_DEFAULT_VALUE"
    fi
    if [ "$CXXFLAGS" == "" ]; then
        export CXXFLAGS="$S_DEFAULT_VALUE"
    fi
} # func_initialize_CFLAGS_and_CXXFLAGS_if_not_inited
func_initialize_CFLAGS_and_CXXFLAGS_if_not_inited

#--------------------------------------------------------------------------
if [ "$MMMV_USERSPACE_DISTRO_T1_SI_N_OF_COMPILATION_THREADS_T1" != "" ]; then
    export MAKEFLAGS=" -j$MMMV_USERSPACE_DISTRO_T1_SI_N_OF_COMPILATION_THREADS_T1"
fi
#--------------------------------------------------------------------------

func_angervaks_gem_install(){
    local S_GEM_PARAMETERS="$1" # the part after the "gem install "
    local S_GUID_CANDIDATE="$2"
    #--------
    nice -n 15 gem install $S_GEM_PARAMETERS
    func_mmmv_assert_error_code_zero_t1b "$?" \
        "$S_GEM_PARAMETERS" "$S_GUID_CANDIDATE"
    func_mmmv_wait_and_sync_t1
    #--------
} # func_angervaks_gem_install

#--------------------------------------------------------------------------
#::::::::::::::::::::::script_boilerplate_section:::end::::::::::::::::::::
#::::::::::::::::::::::script_user_interface_section:::start:::::::::::::::
#--------------------------------------------------------------------------
# Some basic checks:
func_mmmv_exit_if_not_on_path_t2 "gem"
func_mmmv_exit_if_not_on_path_t2 "ruby"

if [ "$GEM_HOME" == "" ]; then
    func_mmmv_exc_exit_with_an_error_t2 \
        "103ba89c-2246-4019-b2be-b3a121a19ae7" \
        "The environment variable GEM_HOME is not set."
else
    func_mmmv_assert_folder_exists_t1 \
        "$GEM_HOME" "a9783145-25e0-46e1-a1ae-b3a121a19ae7"
fi

#--------------------------------------------------------------------------

func_angervaks_print_help_msg_t1() {
    echo ""
    echo "Command line format: "
    echo ""
    echo "<the name of this script>  ARGLIST "
    echo ""
    echo "     ARGLIST :== HELP | SET_OF_GEMS "
    echo ""
    echo "        HELP :== --help | help | -h | -? "
    echo " SET_OF_GEMS :== "
    echo ""
    echo "If this API is used correctly and there are no other "
    echo ""
    echo ""
} # func_angervaks_print_help_msg_t1

#func_angervaks_print_help_msg_t1

#--------------------------------------------------------------------------
#::::::::::::::::::::::script_user_interface_section:::end:::::::::::::::::
#::::::::::::::::::::::script_data_section:::start:::::::::::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "ffi" \
    "081d3014-be8e-4b6d-95ae-b3a121a19ae7"

#--------------------------------------------------------------------------

func_angervaks_gem_install "hdf5" \
    "67f67424-b491-41a2-a3ae-b3a121a19ae7"

#--------------------------------------------------------------------------

func_angervaks_gem_install "json" \
    "0552df21-94ba-458f-83ae-b3a121a19ae7"

#--------------------------------------------------------------------------

# func_angervaks_gem_install "narray" \
#     "1b57e447-2ccc-47c4-84ae-b3a121a19ae7"
# The above 2 lines are outcommented, because gem installation failed.

#--------------------------------------------------------------------------

func_angervaks_gem_install "rdf" \
    "fd84f316-d5ed-4668-b1ae-b3a121a19ae7"

func_angervaks_gem_install "test-unit" \
    "b22e1254-a86b-4804-92ae-b3a121a19ae7"

#--------------------------------------------------------------------------
#::::::::::::::::::::::filesystem::related::gems:::::::::::::::::::::::::::
#--------------------------------------------------------------------------

# Part of standard gem set but here with the naive hope that may be with
# some good dumb luck it is at least some time still usable after it is
# thrown out of the Ruby stdlib:
#     https://github.com/ruby/stringio
# func_angervaks_gem_install "stringio" \
#     "6d5e8fde-c745-4624-b1ae-b3a121a19ae7"
# The above 2 lines are outcommented, because gem installation failed.

#--------------------------------------------------------------------------
#::::::::::::::::::::File::format::related::gems:::::::::::::::::::::::::::
#--------------------------------------------------------------------------

# On Debian based Linux distributions a prerequisite might be
#
#     apt-get install libnetcd*
#
# https://rubygems.org/gems/ruby-netcdf
# https://www.gfd-dennou.org/arch/ruby/products/ruby-netcdf/
#
# func_angervaks_gem_install "ruby-netcdf" \
#     "487a7d58-83f3-4cd4-85ae-b3a121a19ae7"
# The above 2 lines are outcommented, because gem installation failed.
#
# A Linux command line tool for viewing the structure of a NetCDF file:
#
#     ncdump -h the_data.nc
#

#--------------------------------------------------------------------------
#::::::::::::::::Gems::created::by::Martin.Vahi@softf1.com:::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "kibuvits_ruby_library_krl171bt4_" \
    "e4a5d4e7-9798-4349-94ae-b3a121a19ae7"

#--------------------------------------------------------------------------
#::::::::::::::::::::::Encoding::related::gems:::::::::::::::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "cgi" \
    "5bb52103-4fa7-4190-a8ae-b3a121a19ae7"

func_angervaks_gem_install "uri" \
    "51a25193-8c47-42d4-a1ae-b3a121a19ae7"

#--------------------------------------------------------------------------
#::::::::::::::Plotting::and::Mathematics::related::gems:::::::::::::::::::
#--------------------------------------------------------------------------

# http://sciruby.com/docs/
# https://github.com/clbustos/distribution
func_angervaks_gem_install "distribution" \
    "3eb2f133-bf22-4220-b2ae-b3a121a19ae7"

func_angervaks_gem_install "graphviz" \
    "da564722-154c-4779-b4ae-b3a121a19ae7"

# http://sciruby.com/docs/
# https://github.com/clbustos/integration
func_angervaks_gem_install "integration" \
    "5ed9da74-3a70-4fef-b4ae-b3a121a19ae7"

# miniKanren is a form of logic programming.
# http://minikanren.org/
func_angervaks_gem_install "micro_kanren" \
    "4e157001-1b07-4663-a5ae-b3a121a19ae7"

# http://sciruby.com/docs/
# https://github.com/clbustos/minimization
func_angervaks_gem_install "minimization" \
    "31c22811-685b-4ce6-95ae-b3a121a19ae7"

#--------------------
# http://sciruby.com/docs/
# https://github.com/SciRuby/nmatrix/wiki/Installation
# Unfortunately the
#     func_angervaks_gem_install "nmatrix" \
#         "7161ad21-93c3-4fb6-a1ae-b3a121a19ae7"
# tends to fail to compile its native part.
# The nmatrix-Foo gems fail to compile on old openSUSE Linux.
#
#     # http://sciruby.com/docs/
#     # https://github.com/SciRuby/nmatrix/wiki/Installation
#     func_angervaks_gem_install "nmatrix-atlas" \
#         "e7904f5e-4ece-47fa-b29e-b3a121a19ae7"
#
#     # http://sciruby.com/docs/
#     # https://github.com/SciRuby/nmatrix/wiki/Installation
#     func_angervaks_gem_install "nmatrix-lapacke" \
#         "af93ab17-2533-4cfc-b59e-b3a121a19ae7"
#--------------------

# http://sciruby.com/docs/
# https://github.com/zuhao/plotrb
func_angervaks_gem_install "plotrb" \
    "10055313-7845-48c0-b59e-b3a121a19ae7"

# http://sciruby.com/docs/
# https://github.com/clbustos/statsample
func_angervaks_gem_install "statsample" \
    "aa5f6f13-8b1f-44d6-939e-b3a121a19ae7"

# https://rubygems.org/gems/statistics2
func_angervaks_gem_install "statistics2" \
    "6f16d35d-f6aa-4081-919e-b3a121a19ae7"

# https://github.com/red-data-tools/YouPlot
# Bash command line example:
#
#      printf 'X axis name,Y axis name \n -5,20 \n 0,25 \n 10,-5\n' | \
#      uplot scatter -H -d, -t IRIS -w 70 -h 20 --xlim -10,20  --ylim -10,30  --title "This is a title"
#
func_angervaks_gem_install "youplot" \
    "336edb26-d304-47d4-b29e-b3a121a19ae7"

#--------------------------------------------------------------------------
#::::::::::::::::::::::::Ruby::related::gems:::::::::::::::::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "bundler" \
    "8cd05b39-0708-446e-859e-b3a121a19ae7"

func_angervaks_gem_install "geminabox" \
    "2bbb76b2-6bea-40ae-bf9e-b3a121a19ae7"

func_angervaks_gem_install "gemirro" \
    "61d39652-db14-4525-849e-b3a121a19ae7"

func_angervaks_gem_install "gemstash" \
    "1956d542-4204-4b2d-949e-b3a121a19ae7"

func_angervaks_gem_install "iruby" \
    "d80b4b59-7d06-48c7-859e-b3a121a19ae7"

func_angervaks_gem_install "rake"  \
    "53c3b630-d1f9-4d32-959e-b3a121a19ae7"

func_angervaks_gem_install "rdoc" \
    "d4fb1914-e9da-457f-849e-b3a121a19ae7"

# func_angervaks_gem_install "rspec" \
#     "51bfc484-11dc-434e-b49e-b3a121a19ae7"
# The above 2 lines are outcommented, because gem installation failed.

# https://sorbet.org/
# https://github.com/sorbet/
# Dependencies on Debian like operating systems:
#     apt-get install bazel autoconf coreutils parallel
func_angervaks_gem_install "sorbet" \
    "5bf7e1ce-58d5-4de6-859e-b3a121a19ae7"
func_angervaks_gem_install "sorbet-runtime" \
    "f00c5c2d-d28d-4cc0-b49e-b3a121a19ae7"

# https://github.com/Shopify/tapioca
#    ------------citation----start---------------------
#    Tapioca makes it easy to work with Sorbet in your
#    codebase. It surfaces types and methods from many
#    sources that Sorbet cannot otherwise see – such
#    as gems, Rails and other DSLs – compiles them
#    into RBI files and makes it easy for you to add
#    gradual typing to your application.
#    ------------citation----end-----------------------
func_angervaks_gem_install "tapioca" \
    "50517074-e8fe-41d7-929e-b3a121a19ae7"

#--------------------------------------------------------------------------
#::::::::::::::::::::::::GUI/UI::related::gems:::::::::::::::::::::::::::::
#--------------------------------------------------------------------------

# func_angervaks_gem_install "glimmer-dsl-libui" \
#     "20c7e623-fb5c-41a7-a29e-b3a121a19ae7"
# The above 2 lines are outcommented, because gem installation failed.

# https://github.com/mcorino/wxRuby3
# func_angervaks_gem_install "wxruby3" \
#     "53ddf239-2378-433a-819e-b3a121a19ae7"
# The above 2 lines are outcommented, because gem installation failed.

# The Ruby2D
#     https://www.ruby2d.com/
#     https://github.com/ruby2d
# depends on SDL2
#     https://www.libsdl.org/
# which should be installed from operating system standard package
# collection, because the SDL2 has a lot of dependencies. On Debian-like
# operating systems the installation command MIGHT be:
#     apt-get install  build-essential  libsdl2-dev  libsdl2-image-dev   libsdl2-mixer-dev  libsdl2-ttf-dev
func_angervaks_gem_install "ruby2d" \
    "1e64c87b-2681-4792-949e-b3a121a19ae7"


#----------------------------------------------------------------
#    https://www.ruby-toolbox.com/projects/gtk4
#    ------------------citation----start-------------------------
#    Ruby/GTK4 is a Ruby binding of GTK 4.x. It allows Ruby
#    programmers to use the GTK graphics toolkit to make
#    graphical user interfaces for their Ruby scripts.
#    ------------------citation----end---------------------------
func_angervaks_gem_install "gtk4" \
    "36a30714-24dd-4fcd-859e-b3a121a19ae7"

func_angervaks_gem_install "gtk3" \
    "09a08726-0df4-41ad-a39e-b3a121a19ae7"

#--------------------------------------------------------------------------
#:::::::::::::::::::::::gnuplot::related::gems:::::::::::::::::::::::::::::
#--------------------------------------------------------------------------

# https://github.com/rdp/ruby_gnuplot
func_angervaks_gem_install "gnuplot" \
    "a026254e-f72c-4440-819e-b3a121a19ae7"
#-----------------------------------------
# 2025_03 era code examples:
#
#     Gnuplot.open do |gp|
#        Gnuplot::Plot.new( gp ) do |plot|
#           plot.xrange "[-10:10]"
#           plot.title  "Sin Wave Example"
#           plot.xlabel "x"
#           plot.ylabel "sin(x)"
#           plot.data << Gnuplot::DataSet.new( "sin(x)" ) do |ds|
#              ds.with = "lines"
#              ds.linewidth = 4
#           end
#        end
#     end
#
#     Gnuplot.open do |gp|
#        Gnuplot::Plot.new( gp ) do |plot|
#           plot.title  "Array Plot Example"
#           plot.xlabel "x"
#           plot.ylabel "x^2"
#           x = (0..50).collect { |v| v.to_f }
#           y = x.collect { |v| v ** 2 }
#           plot.data << Gnuplot::DataSet.new( [x, y] ) do |ds|
#              ds.with = "linespoints"
#              ds.notitle
#           end
#        end
#     end
#-----------------------------------------

# https://github.com/ruby-numo/numo-gnuplot
func_angervaks_gem_install "numo-gnuplot" \
    "822ae53b-a99d-4e61-849e-b3a121a19ae7"

func_angervaks_gem_install "awesome_print" \
    "330bc055-106f-4c1a-859e-b3a121a19ae7"

func_angervaks_gem_install "cztop" \
    "e448b937-98b3-452e-b29e-b3a121a19ae7"

# func_angervaks_gem_install "nyaplot" \
#     "70620f29-beb4-43c0-949e-b3a121a19ae7"
# The above 2 lines are outcommented, because gem installation failed.

func_angervaks_gem_install "pry" \
    "3286f681-167b-4503-aa9e-b3a121a19ae7"

func_angervaks_gem_install "pry-doc" \
    "d6945523-6afa-4f9c-b28e-b3a121a19ae7"

# http://sciruby.com/docs/
# https://github.com/clbustos/rubyvis
func_angervaks_gem_install "rubyvis" \
    "1878ea33-1a60-4100-a58e-b3a121a19ae7"

#--------------------------------------------------------------------------
#:::::::::::::::network::and::other::type::of::connectivity::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "net" \
    "2173885e-48a8-453e-848e-b3a121a19ae7"

# func_angervaks_gem_install "net-ssh" \
#     "3d7704fb-c510-486b-828e-b3a121a19ae7"
# The above 2 lines are outcommented, because gem installation failed.

# func_angervaks_gem_install "mail" \
#     "3d40b454-7ca9-4225-848e-b3a121a19ae7"
# The above 2 lines are outcommented, because gem installation failed.

func_angervaks_gem_install "bitmessage" \
    "22d65091-16d2-4318-a38e-b3a121a19ae7"

# RPC(Remote Procedure Call) tools for multiple languages, including Ruby
#     https://grpc.io/
#     https://github.com/grpc/grpc
# func_angervaks_gem_install "grpc" \
#     "93b66e51-2c9e-4841-a28e-b3a121a19ae7"
# The above 2 lines are outcommented, because gem installation failed.

# Allows plain Ruby to load C DLLs.
# https://github.com/ffi/ffi
func_angervaks_gem_install "ffi" \
    "61805ee3-ea61-44c7-9f8e-b3a121a19ae7"

# The rbczmq gem installation script fails to build its extensions on
# Linux nameofthemachine  4.19.0-6-amd64 #1 SMP Debian 4.19.67-2+deb10u2 (2019-11-11) x86_64 GNU/Linux
#func_angervaks_gem_install "rbczmq" \
#    "87b4a84a-2601-49ab-918e-b3a121a19ae7"
#
# The "zmq" gem from
#     https://zeromq.org/languages/ruby/
#     https://rubygems.org/gems/zmq
#     https://github.com/zeromq/rbzmq
# also seems to fail to build on  ("uname -a")
# Linux terminal01 6.1.0-39-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.1.148-1 (2025-08-26) x86_64 GNU/Linux
# for ("ruby -v")
# ruby 3.4.1 (2025-05-18) +PRISM [x86_64-linux]
#func_angervaks_gem_install "zmq" \
#    "a1ece049-9eab-4b61-a48e-b3a121a19ae7"
#
# However, the
#     https://github.com/chuckremes/ffi-rzmq
# MIGHT work on Linux. Tutorials, references:
#
#     ("ZeroMQ with Ruby", 2024_11_13, Benjamin Tan Wei Hao)
#     https://www.sitepoint.com/zeromq-ruby/
#     archival copy: https://archive.ph/0rOP8
#
#     # 2025_10_08 code example by Microsoft Bing chatbot:
#     #------untested--code--citation--start----
#     require 'ffi-rzmq'
#     context = ZMQ::Context.new
#     socket = context.socket(ZMQ::REQ)
#     socket.connect("tcp://localhost:5555")
#     socket.send_string("Hello")
#     reply = ''
#     socket.recv_string(reply)
#     puts "Received: #{reply}"
#     #------untested--code--citation--end-----
#
func_angervaks_gem_install "ffi-rzmq" \
    "71751126-6d4f-47bd-958e-b3a121a19ae7"

if [ "`uname -a | grep -i linux`" != "" ]; then
    # 2026_04_19 citation of ChatGPT chatbot:
    #     "D-Bus (Desktop Bus) is an inter-process
    #     communication (IPC) system used mainly on Linux
    #     and Unix-like systems."
    func_angervaks_gem_install "ruby-dbus" \
        "523ae148-7922-4d00-948e-b3a121a19ae7"
fi

#--------------------------------------------------------------------------
#:::::::::::::::::technical::documentation::geneneration:::::::::::::::::::
#--------------------------------------------------------------------------

# func_angervaks_gem_install "jekyll" \
#     "bb909a43-1003-4dcf-a18e-b3a121a19ae7"
# The above 2 lines are outcommented, because gem installation failed.

# Fails to compile/install on
# Linux hoidla01 4.19.0-10-amd64 #1 SMP Debian 4.19.132-1 (2020-07-24) x86_64 GNU/Linux
#func_angervaks_gem_install "gallium" \
#    "a676eb3a-1c49-4509-b58e-b3a121a19ae7"

# https://asciidoctor.org/
# https://github.com/asciidoctor
# https://rubygems.org/gems/asciidoctor
func_angervaks_gem_install "asciidoctor" \
    "3ec0aa17-6c4c-4702-838e-b3a121a19ae7"

# https://github.com/asciidoctor/kramdown-asciidoc
# Usage example:
#     kramdoc sample1.md
#     kramdoc -o result.adoc sample2.md
#     kramdoc -o - sample3.md  # supposedly outputs to the stdout
func_angervaks_gem_install "kramdown-asciidoc" \
    "d7c8b588-5f88-4060-a88e-b3a121a19ae7"

# https://github.com/gollum/gollum/
# Supposedly the "gollum" is the GitHub official wiki rendering engine.
# As of 2025_11_xx it has also been packaged as Java WAR file:
# https://github.com/gollum/gollum/releases/download/v6.1.0/gollum.war
# func_angervaks_gem_install "gollum" \
#     "4ab42083-5b4d-4124-8a8e-b3a121a19ae7"
# # The abouve 2 lines have been commented out, because the
# gem form of "gollum" is unstable, flimsy.

#--------------------------------------------------------------------------
#::::someting::to::do::with::mmmv_devel_tools::optional::dependencies::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "bond" \
    "2c42b130-1a79-4867-b58e-b3a121a19ae7"

#--------------------------------------------------------------------------
#:::::::::::::::::::::::::::::::::::IDE::::::::::::::::::::::::::::::::::::
#--------------------------------------------------------------------------

# Some related links:
#
#     https://microsoft.github.io/language-server-protocol/
#     https://github.com/autozimu/LanguageClient-neovim/blob/next/INSTALL.md
#     https://solargraph.org/
#     https://github.com/MaskRay/ccls
#

# func_angervaks_gem_install "solargraph" \
#     "23e8d3a4-824f-4a88-a28e-b3a121a19ae7"
# The above 2 lines are outcommented, because gem installation failed.
    # The solagraph.org is about a Ruby "lanuage server".  The idea is that some
    # basic support for a programming language can be added to multiple IDEs at
    # once by having those IDEs communicate with a "language server" by using a
    # standardized "language server protocol".
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
    # The phrase "language server" is in quotation marks here because a more
    # appropriate name for those software components is project_analysis_server.
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

#--------------------------------------------------------------------------
#::::::::::::::::::::::database::engine::related::gems:::::::::::::::::::::
#--------------------------------------------------------------------------

# func_angervaks_gem_install "couchdb" \
#     "665dea90-4382-4f29-b18e-b3a121a19ae7"

# DBF gem is just file format support, but
# it's closelyrelated to databases.
func_angervaks_gem_install "dbf" \
    "ef3c271b-b809-4973-818e-b3a121a19ae7"

# The mysql2 gem fail to compile on old openSUSE Linux.
# func_angervaks_gem_install "mysql2" \
#     "37678052-ab8f-45e3-a38e-b3a121a19ae7"

# func_angervaks_gem_install "mongodb" \
#     "582d1422-3c32-42e8-a28e-b3a121a19ae7"

# func_angervaks_gem_install "neo4j" \
#     "15355f13-145e-4e1f-858e-b3a121a19ae7"

# func_angervaks_gem_install "postgresql" \
#     "5ae0924d-a703-402c-958e-b3a121a19ae7"

# func_angervaks_gem_install "rethinkdb" \
#     "f237f694-a37e-415b-958e-b3a121a19ae7"

# func_angervaks_gem_install "sqlite3 --version 1.4.1" \
#     "c79ec75a-fe12-4f5a-a48e-b3a121a19ae7"

func_angervaks_gem_install "sqlite3" \
    "43932e42-e826-4a31-938e-b3a121a19ae7"

#--------------------------------------------------------------------------
#::::::Classifiers::and::Artificial::Intelligence::related::gems:::::::::::
#--------------------------------------------------------------------------

# https://github.com/jedld/tensor_stream
# func_angervaks_gem_install "tensor_stream" \
#     "10199857-53de-4693-a48e-b3a121a19ae7"
# The above 2 lines are outcommented, because gem installation failed.

# https://github.com/irfansharif/cerebrum
func_angervaks_gem_install "cerebrum" \
    "612ef934-e273-4e90-a37e-b3a121a19ae7"

# https://github.com/tangledpath/ruby-fann
# func_angervaks_gem_install "ruby-fann" \
#     "b7f8cd55-f98c-44a4-b27e-b3a121a19ae7"
# is a Ruby wrapper to the LGPL licensed
# Fast Artificial Neural Network (FANN) Library
# https://github.com/libfann/fann
# Unfortunately there can sometimes be a mismatch between the version of
# the FANN library that is available from Linux distribution standard
# package collection and the version of the FANN library that this Ruby
# gem requires.

#--------------------------------------------------------------------------
#::::::Web::Application::Development::and::various::web::Servers:::::::::::
#--------------------------------------------------------------------------

# https://github.com/jeremyevans/roda
# https://roda.jeremyevans.net/
#
#     ("RubyConf 2014 - Roda: The Routing Tree Web Framework by
#     Jeremy Evans", 2025_12_05, Confreaks)
#     https://www.youtube.com/watch?v=W8zglFFFRMM
#
func_angervaks_gem_install "roda" \
    "04baf794-2b74-4f9c-857e-b3a121a19ae7"

# Agoo is a HTTP server for Ruby web applications.
#     https://github.com/ohler55/agoo
# func_angervaks_gem_install "agoo" \
#     "ec627835-a246-4569-a27e-b3a121a19ae7"
# The above 2 lines are outcommented, because gem installation failed.

# Thin is a HTTP server for Ruby web applications.
#     https://github.com/macournoyer/thin
# func_angervaks_gem_install "thin" \
#     "302ea24b-1f24-406f-847e-b3a121a19ae7"
# # The above 2 lines are outcommented, because
# there was some sort of collision between the "thin" and the "gollum".

# Thin is a HTTP server for Ruby web applications.
#     https://github.com/boazsegev/iodine
func_angervaks_gem_install "iodine" \
    "537e57a5-b3a6-47c4-b27e-b3a121a19ae7"

#--------------------------------------------------------------------------
#::::::::::::::::::::::script_data_section:::end:::::::::::::::::::::::::::
#--------------------------------------------------------------------------
cd "$S_FP_ORIG"
exit 0 # no errors occurred
#==========================================================================
# S_VERSION_OF_THIS_FILE="a81e7b56-e10a-45f8-847e-b3a121a19ae7"
#==========================================================================
