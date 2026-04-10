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
# For security reasons each operating system user installs
# its own set of Ruby gems, python packages, etc. To avoid
# re-downloading everything and to mitigate the effect of network outages,
# the Ruby gems, python packages, NodeJS packages, etc.
# should be installed through a local proxy server that caches
# the downloaded files.
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
        echo "GUID=='c1204732-0fb2-49b1-8307-f24110704ae7'"
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
        echo "GUID=='8ac4f134-373a-4c33-8307-f24110704ae7'"
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
        echo "GUID=='8319105d-bd1f-4cff-8207-f24110704ae7'"
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
    echo "GUID=='af526b77-6abd-456e-b1f6-f24110704ae7'"
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
        echo "GUID=='5e01f03b-35a4-482b-84f6-f24110704ae7'"
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
        echo "GUID=='163857cc-4ae4-454d-aef6-f24110704ae7'"
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
        echo "GUID=='3279e45b-ddcf-4b86-83f6-f24110704ae7'"
        echo ""
        cd "$S_FP_ORIG"
        exit 1;
    fi
} # func_mmmv_exit_if_not_on_path_t2

#--------------------------------------------------------------------------

func_mmmv_assert_error_code_zero_t1(){
    local S_ERR_CODE="$1" # the "$?"
    local S_GUID_CANDIDATE="$2"
    #--------
    # If the "$?" were evaluated in this function,
    # then it would be "0" even, if it is
    # something else at the calling code.
    if [ "$S_ERR_CODE" != "0" ];then
        echo ""
        echo "Something went wrong. Error code: $S_ERR_CODE"
        echo "Aborting script."
        echo "GUID=='c5160a97-7ff3-439d-85f6-f24110704ae7'"
        echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        echo ""
        cd "$S_FP_ORIG"
        exit 1
    fi
} # func_mmmv_assert_error_code_zero_t1

#--------------------------------------------------------------------------

func_mmmv_assert_file_exists_t1() {  # S_FP, S_GUID
    local S_FP="$1"
    local S_GUID="$2"
    #------------------------------
    if [ "$S_GUID" == "" ]; then
        echo ""
        echo "The code that calls this function is flawed."
        echo "This function requires 2 parameters: S_FP, S_GUID"
        echo "GUID=='5c5e4f1f-4e60-4f2a-84f6-f24110704ae7'"
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
            echo "GUID=='dfccc274-6e2b-45a0-bdf6-f24110704ae7'"
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
            echo "GUID=='454bdd3d-040f-4147-b1f6-f24110704ae7'"
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
            echo "GUID=='a3873738-6d2c-4639-94f6-f24110704ae7'"
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
        echo "GUID=='15d13a53-c059-4d51-92f6-f24110704ae7'"
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
            echo "GUID=='2fe53975-7720-453f-b2f6-f24110704ae7'"
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
            echo "GUID=='34d16c18-a2e6-43ae-81f6-f24110704ae7'"
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
            echo "GUID=='17e66af1-00a5-4b0d-95f6-f24110704ae7'"
            echo ""
            #--------
            cd "$S_FP_ORIG"
            exit 1 # exiting with an error
        fi
    fi
} # func_mmmv_assert_folder_exists_t1

#--------------------------------------------------------------------------

func_angervaks_gem_install(){
    local S_GEM_PARAMETERS="$1" # the part after the "gem install "
    local S_GUID_CANDIDATE="$2"
    #--------
    nice -n 15 gem install $S_GEM_PARAMETERS
    func_mmmv_assert_error_code_zero_t1 "$?" "$S_GUID_CANDIDATE"
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
        "f4671c2e-6c5c-4d4a-a307-f24110704ae7" \
        "The environment variable GEM_HOME is not set."
else
    func_mmmv_assert_folder_exists_t1 \
        "$GEM_HOME" "9e4a51e5-944a-41ea-a507-f24110704ae7"
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
    "1ea84324-56f8-4f66-b907-f24110704ae7"

#--------------------------------------------------------------------------
func_angervaks_gem_install "hdf5 --version 0.3.5" \
    "7eb07d3d-2d85-467d-a4f6-f24110704ae7"

func_angervaks_gem_install "hdf5" \
    "19e41891-10ba-4f2f-bff6-f24110704ae7"

#--------------------------------------------------------------------------
func_angervaks_gem_install "json --version 2.2.0" \
    "6db49d2c-f766-43b2-b5f6-f24110704ae7"

func_angervaks_gem_install "json" \
    "36a1bf30-5c49-42b1-95f6-f24110704ae7"

#--------------------------------------------------------------------------
func_angervaks_gem_install "narray --version 0.6.1.2" \
    "7183a949-6933-486b-83f6-f24110704ae7"

func_angervaks_gem_install "narray" \
    "61bb4d42-f7c6-45b1-a1f6-f24110704ae7"

#--------------------------------------------------------------------------

func_angervaks_gem_install "rdf" \
    "8ad4f900-6829-4339-bcf6-f24110704ae7"

func_angervaks_gem_install "test-unit" \
    "10c94f44-9d43-4a78-a2f6-f24110704ae7"

#--------------------------------------------------------------------------
#::::::::::::::::::::::filesystem::related::gems:::::::::::::::::::::::::::
#--------------------------------------------------------------------------

# Part of standard gem set but here with the naive hope that
# may be with some good dumb luck it is at least some time
# still usable after it is thrown out of the Ruby stdlib:
#     https://github.com/ruby/stringio
func_angervaks_gem_install "stringio" \
    "423cba55-5aca-4538-84f6-f24110704ae7"

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
func_angervaks_gem_install "ruby-netcdf" \
    "4af671ef-8ba9-4a7e-83f6-f24110704ae7"
# A Linux command line tool for viewing the structure of a NetCDF file:
#
#     ncdump -h the_data.nc
#

#--------------------------------------------------------------------------
#::::::::::::::::Gems::created::by::Martin.Vahi@softf1.com:::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "kibuvits_ruby_library_krl171bt4_" \
    "50141425-3dc0-4669-85f6-f24110704ae7"

#--------------------------------------------------------------------------
#::::::::::::::::::::::Encoding::related::gems:::::::::::::::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "cgi" \
    "0ca9182e-7107-45f5-b1f6-f24110704ae7"

func_angervaks_gem_install "uri" \
    "74928b4d-f885-4f91-95f6-f24110704ae7"

#--------------------------------------------------------------------------
#::::::::::::::Plotting::and::Mathematics::related::gems:::::::::::::::::::
#--------------------------------------------------------------------------

# http://sciruby.com/docs/
# https://github.com/clbustos/distribution
func_angervaks_gem_install "distribution" \
    "f510fcc4-1994-4e65-84f6-f24110704ae7"

func_angervaks_gem_install "graphviz" \
    "122511d2-cf6c-4439-a4f6-f24110704ae7"

# http://sciruby.com/docs/
# https://github.com/clbustos/integration
func_angervaks_gem_install "integration" \
    "253e2be8-ab9d-4d3b-b2f6-f24110704ae7"

# miniKanren is a form of logic programming.
# http://minikanren.org/
func_angervaks_gem_install "micro_kanren" \
    "7f840c55-f0c6-430b-95f6-f24110704ae7"

# http://sciruby.com/docs/
# https://github.com/clbustos/minimization
func_angervaks_gem_install "minimization" \
    "29c9bb44-8848-4c24-83f6-f24110704ae7"

#--------------------
# http://sciruby.com/docs/
# https://github.com/SciRuby/nmatrix/wiki/Installation
# Unfortunately the
#     func_angervaks_gem_install "nmatrix" \
#         "a595499e-fdf6-48b7-86f6-f24110704ae7"
# tends to fail to compile its native part.
# The nmatrix-Foo gems fail to compile on old openSUSE Linux.
#
#     # http://sciruby.com/docs/
#     # https://github.com/SciRuby/nmatrix/wiki/Installation
#     func_angervaks_gem_install "nmatrix-atlas" \
#         "a6b5ac29-68a3-436b-a2f6-f24110704ae7"
#
#     # http://sciruby.com/docs/
#     # https://github.com/SciRuby/nmatrix/wiki/Installation
#     func_angervaks_gem_install "nmatrix-lapacke" \
#         "77c14c34-92e4-4e6c-a5f6-f24110704ae7"
#--------------------

# http://sciruby.com/docs/
# https://github.com/zuhao/plotrb
func_angervaks_gem_install "plotrb" \
    "bdd69419-47b0-475d-a1e6-f24110704ae7"

# http://sciruby.com/docs/
# https://github.com/clbustos/statsample
func_angervaks_gem_install "statsample" \
    "6dd4941a-7718-4d91-a3e6-f24110704ae7"

# https://rubygems.org/gems/statistics2
func_angervaks_gem_install "statistics2" \
    "47061594-1732-4921-a2e6-f24110704ae7"

# https://github.com/red-data-tools/YouPlot
# Bash command line example:
#
#      printf 'X axis name,Y axis name \n -5,20 \n 0,25 \n 10,-5\n' | \
#      uplot scatter -H -d, -t IRIS -w 70 -h 20 --xlim -10,20  --ylim -10,30  --title "This is a title"
#
func_angervaks_gem_install "youplot" \
    "f9e8ef12-aacc-42f8-b5e6-f24110704ae7"

#--------------------------------------------------------------------------
#::::::::::::::::::::::::Ruby::related::gems:::::::::::::::::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "bundler" \
    "48e4f9d2-9b03-42ae-8ce6-f24110704ae7"

func_angervaks_gem_install "geminabox" \
    "df74b826-92af-49f4-a5e6-f24110704ae7"

func_angervaks_gem_install "gemirro" \
    "ccd2e214-77d8-4cf4-91e6-f24110704ae7"

func_angervaks_gem_install "gemstash" \
    "3a41861f-ee7c-417d-b2e6-f24110704ae7"

func_angervaks_gem_install "iruby" \
    "cd48373a-bef5-4000-a2e6-f24110704ae7"

func_angervaks_gem_install "rake"  \
    "ba171fe7-2638-4fb0-b2e6-f24110704ae7"

func_angervaks_gem_install "rdoc" \
    "97a1ce2a-cd10-4070-85e6-f24110704ae7"

func_angervaks_gem_install "rspec" \
    "2135be68-3cd0-4d6a-8ae6-f24110704ae7"

# https://sorbet.org/
# https://github.com/sorbet/
# Dependencies on Debian like operating systems:
#     apt-get install bazel autoconf coreutils parallel
func_angervaks_gem_install "sorbet" \
    "34c5b2d2-1184-4cef-93e6-f24110704ae7"
func_angervaks_gem_install "sorbet-runtime" \
    "630baa1b-bddf-4ca2-a3e6-f24110704ae7"

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
    "2fe57c23-a5b2-4eaf-a1e6-f24110704ae7"

#--------------------------------------------------------------------------
#::::::::::::::::::::::::GUI/UI::related::gems:::::::::::::::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "glimmer-dsl-libui" \
    "1d31836c-bf44-4481-91e6-f24110704ae7"

# https://github.com/mcorino/wxRuby3
func_angervaks_gem_install "wxruby3" \
    "7a90d110-1723-4761-91e6-f24110704ae7"

# The Ruby2D
#     https://www.ruby2d.com/
#     https://github.com/ruby2d
# depends on SDL2
#     https://www.libsdl.org/
# which should be installed from operating system standard
# package collection, because the SDL2 has a lot of
# dependencies. On Debian-like operating systems the
# installation command MIGHT be:
#     apt-get install libsdl2-*
func_angervaks_gem_install "ruby2d" \
    "b10ad24b-436e-4d69-b4e6-f24110704ae7"


#----------------------------------------------------------------
#    https://www.ruby-toolbox.com/projects/gtk4
#    ------------------citation----start-------------------------
#    Ruby/GTK4 is a Ruby binding of GTK 4.x. It allows Ruby
#    programmers to use the GTK graphics toolkit to make
#    graphical user interfaces for their Ruby scripts.
#    ------------------citation----end---------------------------
func_angervaks_gem_install "gtk4" \
    "2107d2d1-c8bb-4604-b1e6-f24110704ae7"

func_angervaks_gem_install "gtk3" \
    "586a8271-408f-4557-b1e6-f24110704ae7"

#--------------------------------------------------------------------------
#:::::::::::::::::::::::gnuplot::related::gems:::::::::::::::::::::::::::::
#--------------------------------------------------------------------------

# https://github.com/rdp/ruby_gnuplot
func_angervaks_gem_install "gnuplot" \
    "416d6964-3953-4338-99e6-f24110704ae7"
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
    "ce7ffe19-c72c-41c7-b1e6-f24110704ae7"

func_angervaks_gem_install "awesome_print" \
    "178bbc94-ceb7-4979-a5e6-f24110704ae7"

func_angervaks_gem_install "cztop" \
    "02cf82c1-8dbf-4750-94e6-f24110704ae7"

func_angervaks_gem_install "nyaplot" \
    "e4898657-f9a6-4df8-95e6-f24110704ae7"

func_angervaks_gem_install "pry" \
    "59c3aa5d-1c45-46ad-a2e6-f24110704ae7"

func_angervaks_gem_install "pry-doc" \
    "d4f38011-184e-4580-a1e6-f24110704ae7"

# http://sciruby.com/docs/
# https://github.com/clbustos/rubyvis
func_angervaks_gem_install "rubyvis" \
    "3f7b4b44-6f16-4f0d-91e6-f24110704ae7"

#--------------------------------------------------------------------------
#:::::::::::::::network::and::other::type::of::connectivity::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "net" \
    "4c940551-76dd-47fb-a1e6-f24110704ae7"

func_angervaks_gem_install "net-ssh" \
    "19cab911-5bed-4ea6-a5e6-f24110704ae7"

func_angervaks_gem_install "mail" \
    "5e784235-9f11-410a-81d6-f24110704ae7"

func_angervaks_gem_install "bitmessage" \
    "56631415-44fd-4869-b3d6-f24110704ae7"

# RPC(Remote Procedure Call) tools for multiple languages, including Ruby
#     https://grpc.io/
#     https://github.com/grpc/grpc
func_angervaks_gem_install "grpc" \
    "5d86ae2f-eccf-4835-95d6-f24110704ae7"

# Allows plain Ruby to load C DLLs.
# https://github.com/ffi/ffi
func_angervaks_gem_install "ffi" \
    "b72f1635-36e6-4347-82d6-f24110704ae7"

# The rbczmq gem installation script fails to build its extensions on
# Linux nameofthemachine  4.19.0-6-amd64 #1 SMP Debian 4.19.67-2+deb10u2 (2019-11-11) x86_64 GNU/Linux
#func_angervaks_gem_install "rbczmq" \
#    "6d73e226-ae62-4caf-b2d6-f24110704ae7"
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
#    "7da4e535-62cf-4692-81d6-f24110704ae7"
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
    "0b89b928-2c3f-4241-a4d6-f24110704ae7"

#--------------------------------------------------------------------------
#:::::::::::::::::technical::documentation::geneneration:::::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "jekyll" \
    "a4965491-72e0-4021-b2d6-f24110704ae7"

# Fails to compile/install on
# Linux hoidla01 4.19.0-10-amd64 #1 SMP Debian 4.19.132-1 (2020-07-24) x86_64 GNU/Linux
#func_angervaks_gem_install "gallium" \
#    "fe2b10ed-8f58-4f66-a4d6-f24110704ae7"

# https://asciidoctor.org/
# https://github.com/asciidoctor
# https://rubygems.org/gems/asciidoctor
func_angervaks_gem_install "asciidoctor" \
    "1ee07a28-d386-4c81-b1d6-f24110704ae7"

# https://github.com/asciidoctor/kramdown-asciidoc
# Usage example:
#     kramdoc sample1.md
#     kramdoc -o result.adoc sample2.md
#     kramdoc -o - sample3.md  # supposedly outputs to the stdout
func_angervaks_gem_install "kramdown-asciidoc" \
    "57fe2255-fbf4-43ff-a8d6-f24110704ae7"

# https://github.com/gollum/gollum/
# Supposedly the "gollum" is the GitHub official wiki rendering engine.
# As of 2025_11_xx it has also been packaged as Java WAR file:
# https://github.com/gollum/gollum/releases/download/v6.1.0/gollum.war
# func_angervaks_gem_install "gollum" \
#     "a5cd2f27-45c6-459f-b5d6-f24110704ae7"
# # The abouve 2 lines have been commented out, because the
# gem form of "gollum" is unstable, flimsy.

#--------------------------------------------------------------------------
#::::someting::to::do::with::mmmv_devel_tools::optional::dependencies::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "bond" \
    "d3e5564e-f7da-4ccd-93d6-f24110704ae7"

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

func_angervaks_gem_install "solargraph" \
    "64abd6ce-b17f-4e4b-bcd6-f24110704ae7"
    # The solagraph.org is about a Ruby "lanuage server".
    # The idea is that some basic support for a programming
    # language can be added to multiple IDEs at once by
    # having those IDEs communicate with a "language server"
    # by using a standardized "language server protocol".
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

#--------------------------------------------------------------------------
#::::::::::::::::::::::database::engine::related::gems:::::::::::::::::::::
#--------------------------------------------------------------------------

# func_angervaks_gem_install "couchdb" \
#     "aa6d202f-78fd-41fb-83d6-f24110704ae7"

# DBF gem is just file format support, but
# it's closelyrelated to databases.
func_angervaks_gem_install "dbf" \
    "984e5ba7-6ea3-43f3-91d6-f24110704ae7"

# The mysql2 gem fail to compile on old openSUSE Linux.
# func_angervaks_gem_install "mysql2" \
#     "671a8441-ab79-4057-92d6-f24110704ae7"

# func_angervaks_gem_install "mongodb" \
#     "332ac524-5393-4895-82d6-f24110704ae7"

# func_angervaks_gem_install "neo4j" \
#     "b015be3a-9053-4e21-a2d6-f24110704ae7"

# func_angervaks_gem_install "postgresql" \
#     "c66e1036-9992-4ea2-83d6-f24110704ae7"

# func_angervaks_gem_install "rethinkdb" \
#     "3365e002-d60b-4b64-a9d6-f24110704ae7"

# func_angervaks_gem_install "sqlite3 --version 1.4.1" \
#     "28d57b5d-0609-4f25-a1d6-f24110704ae7"

func_angervaks_gem_install "sqlite3" \
    "34ca2d8f-4ec7-4365-bad6-f24110704ae7"

#--------------------------------------------------------------------------
#::::::Classifiers::and::Artificial::Intelligence::related::gems:::::::::::
#--------------------------------------------------------------------------

# https://github.com/jedld/tensor_stream
func_angervaks_gem_install "tensor_stream" \
    "ff38c91f-7c2d-47d4-b1d6-f24110704ae7"

# https://github.com/irfansharif/cerebrum
func_angervaks_gem_install "cerebrum" \
    "21f23ab2-ca78-48ca-b3d6-f24110704ae7"

# https://github.com/tangledpath/ruby-fann
# func_angervaks_gem_install "ruby-fann" \
#     "2ad118a3-ed79-47cf-b5d6-f24110704ae7"
# is a Ruby wrapper to the LGPL licensed
# Fast Artificial Neural Network (FANN) Library
# https://github.com/libfann/fann
# Unfortunately there can sometimes be a mismatch between the
# version of the FANN library that is available from Linux
# distribution standard package collection and the version of
# the FANN library that this Ruby gem requires.

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
    "9c1e2a54-2851-4eee-b5d6-f24110704ae7"

# Agoo is a HTTP server for Ruby web applications.
#     https://github.com/ohler55/agoo
func_angervaks_gem_install "agoo" \
    "308f1212-1d95-44d6-b5d6-f24110704ae7"

# Thin is a HTTP server for Ruby web applications.
#     https://github.com/macournoyer/thin
# func_angervaks_gem_install "thin" \
#     "5d44fe26-471f-496f-81c6-f24110704ae7"
# # The above 2 lines are outcommented, because
# there was some sort of collision between the "thin" and the "gollum".

# Thin is a HTTP server for Ruby web applications.
#     https://github.com/boazsegev/iodine
func_angervaks_gem_install "iodine" \
    "b2c50814-515f-4541-a5c6-f24110704ae7"

#--------------------------------------------------------------------------
#::::::::::::::::::::::script_data_section:::end:::::::::::::::::::::::::::
#--------------------------------------------------------------------------
cd "$S_FP_ORIG"
exit 0 # no errors occurred
#==========================================================================
# S_VERSION_OF_THIS_FILE="2aa70c33-1810-431c-81c6-f24110704ae7"
#==========================================================================
