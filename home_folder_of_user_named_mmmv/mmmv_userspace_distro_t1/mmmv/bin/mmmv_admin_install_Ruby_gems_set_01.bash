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
        echo "GUID=='63a79159-8acb-4d96-b116-b122a0f0b9e7'"
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
        echo "GUID=='9be1cd5c-de4f-480e-a516-b122a0f0b9e7'"
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
        echo "GUID=='2b2e3354-6f48-4d62-8306-b122a0f0b9e7'"
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
    echo "GUID=='e565dd49-6025-48d7-b106-b122a0f0b9e7'"
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
        echo "GUID=='3f0b8635-219b-4e2d-a506-b122a0f0b9e7'"
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
        echo "GUID=='31cf113a-889b-499a-9506-b122a0f0b9e7'"
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
        echo "GUID=='35a4a4f9-dc75-471b-8106-b122a0f0b9e7'"
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
        echo "GUID=='4ac7ad04-562a-4117-a506-b122a0f0b9e7'"
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
        echo "GUID=='12f5a552-67c7-4414-9106-b122a0f0b9e7'"
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
            echo "GUID=='444a1456-df67-4b9a-8306-b122a0f0b9e7'"
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
            echo "GUID=='22381d29-7596-476a-a306-b122a0f0b9e7'"
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
            echo "GUID=='e2d96b14-e939-4f6e-b506-b122a0f0b9e7'"
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
        echo "GUID=='36bdfd82-5bd2-426b-8506-b122a0f0b9e7'"
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
            echo "GUID=='646de447-942c-4d69-a306-b122a0f0b9e7'"
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
            echo "GUID=='99c6a344-a825-42a7-8306-b122a0f0b9e7'"
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
            echo "GUID=='159fe843-d1ff-4309-a506-b122a0f0b9e7'"
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
        "e282bdc2-2704-4c61-b516-b122a0f0b9e7" \
        "The environment variable GEM_HOME is not set."
else
    func_mmmv_assert_folder_exists_t1 \
        "$GEM_HOME" "9fa34f4f-1285-4119-8116-b122a0f0b9e7"
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
    "dd00c9e4-a864-4a6f-a406-b122a0f0b9e7"

#--------------------------------------------------------------------------
func_angervaks_gem_install "hdf5 --version 0.3.5" \
    "9bb2f175-87e5-4717-9206-b122a0f0b9e7"

func_angervaks_gem_install "hdf5" \
    "2f7d0a5f-6103-4504-b106-b122a0f0b9e7"

#--------------------------------------------------------------------------
func_angervaks_gem_install "json --version 2.2.0" \
    "31663e57-f605-41af-b106-b122a0f0b9e7"

func_angervaks_gem_install "json" \
    "26f28037-f31f-4cd9-8506-b122a0f0b9e7"

#--------------------------------------------------------------------------
func_angervaks_gem_install "narray --version 0.6.1.2" \
    "647a3a38-e7dd-49d4-a406-b122a0f0b9e7"

func_angervaks_gem_install "narray" \
    "68d9221c-09a8-4f36-9406-b122a0f0b9e7"

#--------------------------------------------------------------------------

func_angervaks_gem_install "rdf" \
    "3c602825-eefb-4767-a906-b122a0f0b9e7"

func_angervaks_gem_install "test-unit" \
    "12bde083-8887-4c58-a106-b122a0f0b9e7"

#--------------------------------------------------------------------------
#::::::::::::::::Gems::created::by::Martin.Vahi@softf1.com:::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "kibuvits_ruby_library_krl171bt4_" \
    "48425900-42be-49cd-9c06-b122a0f0b9e7"

#--------------------------------------------------------------------------
#::::::::::::::::::::::Encoding::related::gems:::::::::::::::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "cgi" \
    "a773661d-bef5-42fd-b306-b122a0f0b9e7"

func_angervaks_gem_install "uri" \
    "9e21b344-699e-4a96-a406-b122a0f0b9e7"

#--------------------------------------------------------------------------
#::::::::::::::Plotting::and::Mathematics::related::gems:::::::::::::::::::
#--------------------------------------------------------------------------

# http://sciruby.com/docs/
# https://github.com/clbustos/distribution
func_angervaks_gem_install "distribution" \
    "38c14461-e200-4faf-ae06-b122a0f0b9e7"

func_angervaks_gem_install "graphviz" \
    "3c2e7018-6185-4461-b206-b122a0f0b9e7"

# http://sciruby.com/docs/
# https://github.com/clbustos/integration
func_angervaks_gem_install "integration" \
    "1766004e-52ab-4dea-8206-b122a0f0b9e7"

# miniKanren is a form of logic programming.
# http://minikanren.org/
func_angervaks_gem_install "micro_kanren" \
    "59ecbe91-7319-4dcd-9806-b122a0f0b9e7"

# http://sciruby.com/docs/
# https://github.com/clbustos/minimization
func_angervaks_gem_install "minimization" \
    "c5301a8c-35af-42aa-9306-b122a0f0b9e7"

#--------------------
# http://sciruby.com/docs/
# https://github.com/SciRuby/nmatrix/wiki/Installation
# Unfortunately the
#     func_angervaks_gem_install "nmatrix" \
#         "2d423f23-d25c-4441-b506-b122a0f0b9e7"
# tends to fail to compile its native part.
# The nmatrix-Foo gems fail to compile on old openSUSE Linux.
#
#     # http://sciruby.com/docs/
#     # https://github.com/SciRuby/nmatrix/wiki/Installation
#     func_angervaks_gem_install "nmatrix-atlas" \
#         "31131394-8264-4fa5-a106-b122a0f0b9e7"
#
#     # http://sciruby.com/docs/
#     # https://github.com/SciRuby/nmatrix/wiki/Installation
#     func_angervaks_gem_install "nmatrix-lapacke" \
#         "71c4bc5b-94d4-4326-9506-b122a0f0b9e7"
#--------------------

# http://sciruby.com/docs/
# https://github.com/zuhao/plotrb
func_angervaks_gem_install "plotrb" \
    "e2209449-16cb-43b8-9f06-b122a0f0b9e7"

# http://sciruby.com/docs/
# https://github.com/clbustos/statsample
func_angervaks_gem_install "statsample" \
    "81367619-8062-4b47-95f5-b122a0f0b9e7"

# https://rubygems.org/gems/statistics2
func_angervaks_gem_install "statistics2" \
    "737cf0af-c91c-48fd-92f5-b122a0f0b9e7"

# https://github.com/red-data-tools/YouPlot
# Bash command line example:
#
#      printf 'X axis name,Y axis name \n -5,20 \n 0,25 \n 10,-5\n' | \
#      uplot scatter -H -d, -t IRIS -w 70 -h 20 --xlim -10,20  --ylim -10,30  --title "This is a title"
#
func_angervaks_gem_install "youplot" \
    "388ed51e-9749-48f7-94f5-b122a0f0b9e7"

#--------------------------------------------------------------------------
#::::::::::::::::::::::::Ruby::related::gems:::::::::::::::::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "bundler" \
    "27dd374d-d941-4976-b1f5-b122a0f0b9e7"

func_angervaks_gem_install "geminabox" \
    "51c4ad41-18f0-4cd5-acf5-b122a0f0b9e7"

func_angervaks_gem_install "gemirro" \
    "b5949922-0557-4e87-93f5-b122a0f0b9e7"

func_angervaks_gem_install "gemstash" \
    "566d3b02-48fd-4846-a2f5-b122a0f0b9e7"

func_angervaks_gem_install "iruby" \
    "0b37b421-7078-46d3-b2f5-b122a0f0b9e7"

func_angervaks_gem_install "rake"  \
    "2ee15eb6-a9ec-40c6-a2f5-b122a0f0b9e7"

func_angervaks_gem_install "rdoc" \
    "a11f2494-acf6-4979-b5f5-b122a0f0b9e7"

func_angervaks_gem_install "rspec" \
    "75f6725c-0b04-4ba4-93f5-b122a0f0b9e7"

# https://sorbet.org/
# https://github.com/sorbet/
# Dependencies on Debian like operating systems:
#     apt-get install bazel autoconf coreutils parallel
func_angervaks_gem_install "sorbet" \
    "15cdd04b-c244-4b44-b4f5-b122a0f0b9e7"
func_angervaks_gem_install "sorbet-runtime" \
    "b185e9cf-363e-4c43-a3f5-b122a0f0b9e7"

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
    "06b25c1d-73e3-4dbe-93f5-b122a0f0b9e7"


#--------------------------------------------------------------------------
#::::::::::::::::::::::filesystem::related::gems:::::::::::::::::::::::::::
#--------------------------------------------------------------------------

# Part of standard gem set but here with the naive hope that
# may be with some good dumb luck it is at least some time
# still usable after it is thrown out of the Ruby stdlib:
#     https://github.com/ruby/stringio
func_angervaks_gem_install "stringio" \
    "434ba424-af19-4ca1-87f5-b122a0f0b9e7"

#--------------------------------------------------------------------------
#::::::::::::::::::::::::GUI/UI::related::gems:::::::::::::::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "glimmer-dsl-libui" \
    "1782f43e-d9ff-4a0d-a3f5-b122a0f0b9e7"

# https://github.com/mcorino/wxRuby3
func_angervaks_gem_install "wxruby3"
    "2d0ac104-f262-413c-83f5-b122a0f0b9e7"

#----------------------------------------------------------------
#    https://www.ruby-toolbox.com/projects/gtk4
#    ------------------citation----start-------------------------
#    Ruby/GTK4 is a Ruby binding of GTK 4.x. It allows Ruby
#    programmers to use the GTK graphics toolkit to make
#    graphical user interfaces for their Ruby scripts.
#    ------------------citation----end---------------------------
func_angervaks_gem_install "gtk4"
    "ecc42036-2dc3-4ada-b1f5-b122a0f0b9e7"

func_angervaks_gem_install "gtk3"
    "ccc40232-b5b4-43ed-95f5-b122a0f0b9e7"

#--------------------------------------------------------------------------
#:::::::::::::::::::::::gnuplot::related::gems:::::::::::::::::::::::::::::
#--------------------------------------------------------------------------

# https://github.com/rdp/ruby_gnuplot
func_angervaks_gem_install "gnuplot" \
    "27d53f41-e791-4484-b2f5-b122a0f0b9e7"
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
    "523ddf1d-0ea5-4798-b8f5-b122a0f0b9e7"

func_angervaks_gem_install "awesome_print" \
    "0863884a-e065-4636-b5f5-b122a0f0b9e7"

func_angervaks_gem_install "cztop" \
    "e83adf48-2939-4f11-94f5-b122a0f0b9e7"

func_angervaks_gem_install "nyaplot" \
    "4aa86318-580c-4b32-b4f5-b122a0f0b9e7"

func_angervaks_gem_install "pry" \
    "5e6db65b-c186-4f31-91f5-b122a0f0b9e7"

func_angervaks_gem_install "pry-doc" \
    "5b24a35a-3a79-40d9-84f5-b122a0f0b9e7"

# http://sciruby.com/docs/
# https://github.com/clbustos/rubyvis
func_angervaks_gem_install "rubyvis" \
    "b46ca853-2362-4d6e-94f5-b122a0f0b9e7"

#--------------------------------------------------------------------------
#:::::::::::::::network::and::other::type::of::connectivity::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "net" \
    "a7a91f25-da8a-4ff8-83f5-b122a0f0b9e7"

func_angervaks_gem_install "net-ssh" \
    "494e9737-219b-42dc-a3f5-b122a0f0b9e7"

func_angervaks_gem_install "mail" \
    "ce392fe7-2c06-4748-83f5-b122a0f0b9e7"

func_angervaks_gem_install "bitmessage" \
    "eec74fcf-434d-45dc-8bf5-b122a0f0b9e7"

# RPC(Remote Procedure Call) tools for multiple languages, including Ruby
#     https://grpc.io/
#     https://github.com/grpc/grpc
func_angervaks_gem_install "grpc" \
    "664e9d2d-e1de-4c9e-94e5-b122a0f0b9e7"

# Allows plain Ruby to load C DLLs.
# https://github.com/ffi/ffi
func_angervaks_gem_install "ffi" \
    "17cb9271-2389-4695-b3e5-b122a0f0b9e7"

# The rbczmq gem installation script fails to build its extensions on
# Linux nameofthemachine  4.19.0-6-amd64 #1 SMP Debian 4.19.67-2+deb10u2 (2019-11-11) x86_64 GNU/Linux
#func_angervaks_gem_install "rbczmq" \
#    "1deb52cb-21b0-4438-a1e5-b122a0f0b9e7"
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
#    "433e5d2d-3d40-4bb6-91e5-b122a0f0b9e7"
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
    "177cc523-4235-4ac0-94e5-b122a0f0b9e7"

#--------------------------------------------------------------------------
#:::::::::::::::::technical::documentation::geneneration:::::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "jekyll" \
    "def30f56-c65a-4415-95e5-b122a0f0b9e7"

# Fails to compile/install on
# Linux hoidla01 4.19.0-10-amd64 #1 SMP Debian 4.19.132-1 (2020-07-24) x86_64 GNU/Linux
#func_angervaks_gem_install "gallium" \
#    "6bc9b04b-7901-443a-93e5-b122a0f0b9e7"

# https://asciidoctor.org/
# https://github.com/asciidoctor
# https://rubygems.org/gems/asciidoctor
func_angervaks_gem_install "asciidoctor" \
    "c8eff55b-d492-4fde-b4e5-b122a0f0b9e7"

# https://github.com/asciidoctor/kramdown-asciidoc
# Usage example:
#     kramdoc sample1.md
#     kramdoc -o result.adoc sample2.md
#     kramdoc -o - sample3.md  # supposedly outputs to the stdout
func_angervaks_gem_install "kramdown-asciidoc" \
    "3e5a3e41-1dba-4dfc-91e5-b122a0f0b9e7"

# https://github.com/gollum/gollum/
# Supposedly the "gollum" is the GitHub official wiki rendering engine.
# As of 2025_11_xx it has also been packaged as Java WAR file:
# https://github.com/gollum/gollum/releases/download/v6.1.0/gollum.war
# func_angervaks_gem_install "gollum" \
#     "2383b937-6407-49f1-85e5-b122a0f0b9e7"
# # The abouve 2 lines have been commented out, because the
# gem form of "gollum" is unstable, flimsy.

#--------------------------------------------------------------------------
#::::someting::to::do::with::mmmv_devel_tools::optional::dependencies::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "bond" \
    "492082c1-9baa-4813-92e5-b122a0f0b9e7"

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
    "bb6af84b-70e4-4aca-91e5-b122a0f0b9e7"
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
#     "6bfd3a56-befb-4af8-a3e5-b122a0f0b9e7"

# DBF gem is just file format support, but
# it's closelyrelated to databases.
func_angervaks_gem_install "dbf" \
    "b9b7b713-fdc5-4f0b-81e5-b122a0f0b9e7"

# The mysql2 gem fail to compile on old openSUSE Linux.
# func_angervaks_gem_install "mysql2" \
#     "f71dfd51-4992-4800-92e5-b122a0f0b9e7"

# func_angervaks_gem_install "mongodb" \
#     "c23e2338-cc27-429e-92e5-b122a0f0b9e7"

# func_angervaks_gem_install "neo4j" \
#     "7ed29a26-dc02-424b-91e5-b122a0f0b9e7"

# func_angervaks_gem_install "postgresql" \
#     "1147fb8d-b40b-44d3-82e5-b122a0f0b9e7"

# func_angervaks_gem_install "rethinkdb" \
#     "d150b956-a0af-495c-a5e5-b122a0f0b9e7"

# func_angervaks_gem_install "sqlite3 --version 1.4.1" \
#     "d0320739-c197-4abb-95e5-b122a0f0b9e7"

func_angervaks_gem_install "sqlite3" \
    "4e2a4963-4dba-4a5e-bee5-b122a0f0b9e7"

#--------------------------------------------------------------------------
#::::::Classifiers::and::Artificial::Intelligence::related::gems:::::::::::
#--------------------------------------------------------------------------

# https://github.com/jedld/tensor_stream
func_angervaks_gem_install "tensor_stream" \
    "5631b11b-f773-4740-83e5-b122a0f0b9e7"

# https://github.com/irfansharif/cerebrum
func_angervaks_gem_install "cerebrum" \
    "7e2db2a8-26c9-41a7-b5e5-b122a0f0b9e7"

# https://github.com/tangledpath/ruby-fann
# func_angervaks_gem_install "ruby-fann" \
#     "3cee6149-3ab6-429f-83e5-b122a0f0b9e7"
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
    "20dd9341-b48c-48c2-b5e5-b122a0f0b9e7"

# Agoo is a HTTP server for Ruby web applications.
#     https://github.com/ohler55/agoo
func_angervaks_gem_install "agoo" \
    "30ed3364-7189-4d9c-b4e5-b122a0f0b9e7"

# Thin is a HTTP server for Ruby web applications.
#     https://github.com/macournoyer/thin
# func_angervaks_gem_install "thin" \
#     "d507d22b-3915-45c2-b5e5-b122a0f0b9e7"
# # The above 2 lines are outcommented, because
# there was some sort of collision between the "thin" and the "gollum".

# Thin is a HTTP server for Ruby web applications.
#     https://github.com/boazsegev/iodine
func_angervaks_gem_install "iodine" \
    "dde41013-912d-49a6-b1d5-b122a0f0b9e7"

#--------------------------------------------------------------------------
#::::::::::::::::::::::script_data_section:::end:::::::::::::::::::::::::::
#--------------------------------------------------------------------------
cd "$S_FP_ORIG"
exit 0 # no errors occurred
#==========================================================================
# S_VERSION_OF_THIS_FILE="df8afa18-56e2-47a7-85d5-b122a0f0b9e7"
#==========================================================================
