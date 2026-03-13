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
        echo "GUID=='da17465f-55c7-4b3f-b2c3-913390d03ae7'"
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
        echo "GUID=='3426b291-7377-4747-88c3-913390d03ae7'"
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
        echo "GUID=='61e1a03c-3632-4667-82c3-913390d03ae7'"
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
    echo "GUID=='bc137c5c-9e3f-4f17-92c3-913390d03ae7'"
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
        echo "GUID=='73bdb14a-8218-4808-83c3-913390d03ae7'"
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
        echo "GUID=='bf46a415-cd0a-41b3-b5c3-913390d03ae7'"
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
        echo "GUID=='2d9d5ad5-0622-4b13-8fc3-913390d03ae7'"
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
        echo "GUID=='3cef0ed2-7333-457c-81c3-913390d03ae7'"
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
        echo "GUID=='b111b1e6-143b-49c7-bfb3-913390d03ae7'"
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
            echo "GUID=='2849bb26-e522-4aa2-95b3-913390d03ae7'"
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
            echo "GUID=='e273d51e-8630-4cdf-b3b3-913390d03ae7'"
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
            echo "GUID=='14102a06-06d8-4843-95b3-913390d03ae7'"
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
        echo "GUID=='7395bd44-3520-4f15-a5b3-913390d03ae7'"
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
            echo "GUID=='b544c75d-e869-44d9-beb3-913390d03ae7'"
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
            echo "GUID=='eaeffc2d-df4f-4bd6-a4b3-913390d03ae7'"
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
            echo "GUID=='71e7455b-bf71-49f1-93b3-913390d03ae7'"
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
        "85faa02e-14ed-4a98-a3c3-913390d03ae7" \
        "The environment variable GEM_HOME is not set."
else
    func_mmmv_assert_folder_exists_t1 \
        "$GEM_HOME" "3e9f5051-2139-4bbf-b1c3-913390d03ae7"
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
    "1cea1427-65f2-4f35-85c3-913390d03ae7"

#--------------------------------------------------------------------------
func_angervaks_gem_install "hdf5 --version 0.3.5" \
    "437901d2-be04-4dce-91c3-913390d03ae7"

func_angervaks_gem_install "hdf5" \
    "1b6d3846-af7f-4012-a1c3-913390d03ae7"

#--------------------------------------------------------------------------
func_angervaks_gem_install "json --version 2.2.0" \
    "2250f8d4-11ac-49df-81c3-913390d03ae7"

func_angervaks_gem_install "json" \
    "2ed9bb24-0b13-4b4c-a3c3-913390d03ae7"

#--------------------------------------------------------------------------
func_angervaks_gem_install "narray --version 0.6.1.2" \
    "63d57c43-d8c6-496d-92c3-913390d03ae7"

func_angervaks_gem_install "narray" \
    "948c7a4a-1a77-42c4-92b3-913390d03ae7"

#--------------------------------------------------------------------------

func_angervaks_gem_install "rdf" \
    "2428d346-0d57-4741-81b3-913390d03ae7"

func_angervaks_gem_install "test-unit" \
    "2f8efd52-8612-48e1-84b3-913390d03ae7"

#--------------------------------------------------------------------------
#::::::::::::::::::::::filesystem::related::gems:::::::::::::::::::::::::::
#--------------------------------------------------------------------------

# Part of standard gem set but here with the naive hope that
# may be with some good dumb luck it is at least some time
# still usable after it is thrown out of the Ruby stdlib:
#     https://github.com/ruby/stringio
func_angervaks_gem_install "stringio" \
    "185ee6b1-691e-4126-a4b3-913390d03ae7"

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
    "28565c11-190a-46da-a3b3-913390d03ae7"
# A Linux command line tool for viewing the structure of a NetCDF file:
#
#     ncdump -h the_data.nc
#

#--------------------------------------------------------------------------
#::::::::::::::::Gems::created::by::Martin.Vahi@softf1.com:::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "kibuvits_ruby_library_krl171bt4_" \
    "71196c3a-30e5-4d84-84b3-913390d03ae7"

#--------------------------------------------------------------------------
#::::::::::::::::::::::Encoding::related::gems:::::::::::::::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "cgi" \
    "e1d8ed46-3393-4c96-b1b3-913390d03ae7"

func_angervaks_gem_install "uri" \
    "13f67602-f591-4846-a8b3-913390d03ae7"

#--------------------------------------------------------------------------
#::::::::::::::Plotting::and::Mathematics::related::gems:::::::::::::::::::
#--------------------------------------------------------------------------

# http://sciruby.com/docs/
# https://github.com/clbustos/distribution
func_angervaks_gem_install "distribution" \
    "1838c624-dad7-43e8-94b3-913390d03ae7"

func_angervaks_gem_install "graphviz" \
    "d57b54bc-1672-46ae-b4b3-913390d03ae7"

# http://sciruby.com/docs/
# https://github.com/clbustos/integration
func_angervaks_gem_install "integration" \
    "5ec0e621-5301-4896-b4b3-913390d03ae7"

# miniKanren is a form of logic programming.
# http://minikanren.org/
func_angervaks_gem_install "micro_kanren" \
    "af261d3b-5c67-4300-82b3-913390d03ae7"

# http://sciruby.com/docs/
# https://github.com/clbustos/minimization
func_angervaks_gem_install "minimization" \
    "c39b4635-b90f-44eb-b5b3-913390d03ae7"

#--------------------
# http://sciruby.com/docs/
# https://github.com/SciRuby/nmatrix/wiki/Installation
# Unfortunately the
#     func_angervaks_gem_install "nmatrix" \
#         "05424d2a-2f16-4526-82b3-913390d03ae7"
# tends to fail to compile its native part.
# The nmatrix-Foo gems fail to compile on old openSUSE Linux.
#
#     # http://sciruby.com/docs/
#     # https://github.com/SciRuby/nmatrix/wiki/Installation
#     func_angervaks_gem_install "nmatrix-atlas" \
#         "379f78a3-5c18-44a8-a4b3-913390d03ae7"
#
#     # http://sciruby.com/docs/
#     # https://github.com/SciRuby/nmatrix/wiki/Installation
#     func_angervaks_gem_install "nmatrix-lapacke" \
#         "2c5a72e2-101c-46e2-a3b3-913390d03ae7"
#--------------------

# http://sciruby.com/docs/
# https://github.com/zuhao/plotrb
func_angervaks_gem_install "plotrb" \
    "428b12bd-6028-4525-b4b3-913390d03ae7"

# http://sciruby.com/docs/
# https://github.com/clbustos/statsample
func_angervaks_gem_install "statsample" \
    "40965461-ce27-4250-84b3-913390d03ae7"

# https://rubygems.org/gems/statistics2
func_angervaks_gem_install "statistics2" \
    "5712fc1b-915d-4f6c-93b3-913390d03ae7"

# https://github.com/red-data-tools/YouPlot
# Bash command line example:
#
#      printf 'X axis name,Y axis name \n -5,20 \n 0,25 \n 10,-5\n' | \
#      uplot scatter -H -d, -t IRIS -w 70 -h 20 --xlim -10,20  --ylim -10,30  --title "This is a title"
#
func_angervaks_gem_install "youplot" \
    "12d303a4-4156-43e2-a1b3-913390d03ae7"

#--------------------------------------------------------------------------
#::::::::::::::::::::::::Ruby::related::gems:::::::::::::::::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "bundler" \
    "036412a5-8045-444c-a3b3-913390d03ae7"

func_angervaks_gem_install "geminabox" \
    "51341fc5-2f38-4033-93b3-913390d03ae7"

func_angervaks_gem_install "gemirro" \
    "24122724-94d4-497a-81b3-913390d03ae7"

func_angervaks_gem_install "gemstash" \
    "5b293823-6f7c-4cec-93a3-913390d03ae7"

func_angervaks_gem_install "iruby" \
    "a256262b-6082-4a5c-b2a3-913390d03ae7"

func_angervaks_gem_install "rake"  \
    "072c0e1d-fadf-43f5-b2a3-913390d03ae7"

func_angervaks_gem_install "rdoc" \
    "3649e955-bc71-40db-81a3-913390d03ae7"

func_angervaks_gem_install "rspec" \
    "c56a8435-b0d1-4001-93a3-913390d03ae7"

# https://sorbet.org/
# https://github.com/sorbet/
# Dependencies on Debian like operating systems:
#     apt-get install bazel autoconf coreutils parallel
func_angervaks_gem_install "sorbet" \
    "46a24771-50ec-430d-b8a3-913390d03ae7"
func_angervaks_gem_install "sorbet-runtime" \
    "5a880e33-f5ae-4e01-83a3-913390d03ae7"

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
    "435eae35-2329-4347-94a3-913390d03ae7"

#--------------------------------------------------------------------------
#::::::::::::::::::::::::GUI/UI::related::gems:::::::::::::::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "glimmer-dsl-libui" \
    "f8b2c633-44c4-457e-94a3-913390d03ae7"

# https://github.com/mcorino/wxRuby3
func_angervaks_gem_install "wxruby3" \
    "5e5d1995-d3bc-4a75-81a3-913390d03ae7"

#----------------------------------------------------------------
#    https://www.ruby-toolbox.com/projects/gtk4
#    ------------------citation----start-------------------------
#    Ruby/GTK4 is a Ruby binding of GTK 4.x. It allows Ruby
#    programmers to use the GTK graphics toolkit to make
#    graphical user interfaces for their Ruby scripts.
#    ------------------citation----end---------------------------
func_angervaks_gem_install "gtk4" \
    "05471b10-4871-4098-91a3-913390d03ae7"

func_angervaks_gem_install "gtk3" \
    "0aba3031-cf64-4bc8-b1a3-913390d03ae7"

#--------------------------------------------------------------------------
#:::::::::::::::::::::::gnuplot::related::gems:::::::::::::::::::::::::::::
#--------------------------------------------------------------------------

# https://github.com/rdp/ruby_gnuplot
func_angervaks_gem_install "gnuplot" \
    "d3c5ed43-d18d-48c3-b9a3-913390d03ae7"
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
    "39c18602-a6fd-4b9a-95a3-913390d03ae7"

func_angervaks_gem_install "awesome_print" \
    "dbed8227-3c72-41fe-a5a3-913390d03ae7"

func_angervaks_gem_install "cztop" \
    "5781b361-d2aa-4e54-93a3-913390d03ae7"

func_angervaks_gem_install "nyaplot" \
    "a054b55c-aa7d-49df-81a3-913390d03ae7"

func_angervaks_gem_install "pry" \
    "f236a54a-28c2-477c-83a3-913390d03ae7"

func_angervaks_gem_install "pry-doc" \
    "107bc7cc-1b24-493d-a1a3-913390d03ae7"

# http://sciruby.com/docs/
# https://github.com/clbustos/rubyvis
func_angervaks_gem_install "rubyvis" \
    "68b3f056-2ad0-406e-a1a3-913390d03ae7"

#--------------------------------------------------------------------------
#:::::::::::::::network::and::other::type::of::connectivity::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "net" \
    "38021f13-fbdd-442a-baa3-913390d03ae7"

func_angervaks_gem_install "net-ssh" \
    "2c260c5b-c116-4198-81a3-913390d03ae7"

func_angervaks_gem_install "mail" \
    "4bb5283a-c314-4b85-b5a3-913390d03ae7"

func_angervaks_gem_install "bitmessage" \
    "fcc1ed5b-d709-4cdb-b1a3-913390d03ae7"

# RPC(Remote Procedure Call) tools for multiple languages, including Ruby
#     https://grpc.io/
#     https://github.com/grpc/grpc
func_angervaks_gem_install "grpc" \
    "329d9e22-b462-4f65-a2a3-913390d03ae7"

# Allows plain Ruby to load C DLLs.
# https://github.com/ffi/ffi
func_angervaks_gem_install "ffi" \
    "88da1529-0035-4bdc-a2a3-913390d03ae7"

# The rbczmq gem installation script fails to build its extensions on
# Linux nameofthemachine  4.19.0-6-amd64 #1 SMP Debian 4.19.67-2+deb10u2 (2019-11-11) x86_64 GNU/Linux
#func_angervaks_gem_install "rbczmq" \
#    "61a9fa24-2895-4c94-a4a3-913390d03ae7"
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
#    "0fb7e212-6393-4138-b1a3-913390d03ae7"
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
    "48722641-30f6-46f2-a3a3-913390d03ae7"

#--------------------------------------------------------------------------
#:::::::::::::::::technical::documentation::geneneration:::::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "jekyll" \
    "442c2320-85ef-4d6c-a1a3-913390d03ae7"

# Fails to compile/install on
# Linux hoidla01 4.19.0-10-amd64 #1 SMP Debian 4.19.132-1 (2020-07-24) x86_64 GNU/Linux
#func_angervaks_gem_install "gallium" \
#    "3d91a357-6468-4926-83a3-913390d03ae7"

# https://asciidoctor.org/
# https://github.com/asciidoctor
# https://rubygems.org/gems/asciidoctor
func_angervaks_gem_install "asciidoctor" \
    "d291a52f-8d85-433e-b5a3-913390d03ae7"

# https://github.com/asciidoctor/kramdown-asciidoc
# Usage example:
#     kramdoc sample1.md
#     kramdoc -o result.adoc sample2.md
#     kramdoc -o - sample3.md  # supposedly outputs to the stdout
func_angervaks_gem_install "kramdown-asciidoc" \
    "bf86db23-076f-4ab5-b593-913390d03ae7"

# https://github.com/gollum/gollum/
# Supposedly the "gollum" is the GitHub official wiki rendering engine.
# As of 2025_11_xx it has also been packaged as Java WAR file:
# https://github.com/gollum/gollum/releases/download/v6.1.0/gollum.war
# func_angervaks_gem_install "gollum" \
#     "8fd78823-836d-4729-9293-913390d03ae7"
# # The abouve 2 lines have been commented out, because the
# gem form of "gollum" is unstable, flimsy.

#--------------------------------------------------------------------------
#::::someting::to::do::with::mmmv_devel_tools::optional::dependencies::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "bond" \
    "b598f3a5-cc43-4ea2-b193-913390d03ae7"

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
    "1d6fb065-48b2-4e92-8a93-913390d03ae7"
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
#     "4fc6bc15-00f6-4e41-8193-913390d03ae7"

# DBF gem is just file format support, but
# it's closelyrelated to databases.
func_angervaks_gem_install "dbf" \
    "16fc0242-2ae7-46ce-be93-913390d03ae7"

# The mysql2 gem fail to compile on old openSUSE Linux.
# func_angervaks_gem_install "mysql2" \
#     "b4461829-5f4f-4b86-a493-913390d03ae7"

# func_angervaks_gem_install "mongodb" \
#     "32b86999-96b3-4447-a193-913390d03ae7"

# func_angervaks_gem_install "neo4j" \
#     "ac97b233-1957-4147-b293-913390d03ae7"

# func_angervaks_gem_install "postgresql" \
#     "c2b7e284-919f-4b31-8f93-913390d03ae7"

# func_angervaks_gem_install "rethinkdb" \
#     "29fa4a50-096b-42d1-9593-913390d03ae7"

# func_angervaks_gem_install "sqlite3 --version 1.4.1" \
#     "36a68448-ca20-4bfc-a193-913390d03ae7"

func_angervaks_gem_install "sqlite3" \
    "beccb050-15a1-4d51-b293-913390d03ae7"

#--------------------------------------------------------------------------
#::::::Classifiers::and::Artificial::Intelligence::related::gems:::::::::::
#--------------------------------------------------------------------------

# https://github.com/jedld/tensor_stream
func_angervaks_gem_install "tensor_stream" \
    "877a3229-52e4-4b44-b193-913390d03ae7"

# https://github.com/irfansharif/cerebrum
func_angervaks_gem_install "cerebrum" \
    "803aa84c-6dc9-4181-8193-913390d03ae7"

# https://github.com/tangledpath/ruby-fann
# func_angervaks_gem_install "ruby-fann" \
#     "32027014-af85-40b5-a193-913390d03ae7"
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
    "b77f8a26-e0d4-4403-9593-913390d03ae7"

# Agoo is a HTTP server for Ruby web applications.
#     https://github.com/ohler55/agoo
func_angervaks_gem_install "agoo" \
    "3c18045b-5e7c-4980-8393-913390d03ae7"

# Thin is a HTTP server for Ruby web applications.
#     https://github.com/macournoyer/thin
# func_angervaks_gem_install "thin" \
#     "c3d3774d-056a-4b37-a193-913390d03ae7"
# # The above 2 lines are outcommented, because
# there was some sort of collision between the "thin" and the "gollum".

# Thin is a HTTP server for Ruby web applications.
#     https://github.com/boazsegev/iodine
func_angervaks_gem_install "iodine" \
    "7e1c552c-b595-4561-b293-913390d03ae7"

#--------------------------------------------------------------------------
#::::::::::::::::::::::script_data_section:::end:::::::::::::::::::::::::::
#--------------------------------------------------------------------------
cd "$S_FP_ORIG"
exit 0 # no errors occurred
#==========================================================================
# S_VERSION_OF_THIS_FILE="10758360-7e1a-4401-a593-913390d03ae7"
#==========================================================================
