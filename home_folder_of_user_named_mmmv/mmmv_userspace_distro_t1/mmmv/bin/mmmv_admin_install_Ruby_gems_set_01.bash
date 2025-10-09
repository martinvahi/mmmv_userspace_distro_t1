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
        echo "GUID=='c9c325ec-2b5b-48f2-ac2c-0332e090a9e7'"
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
        echo "GUID=='8e52ecfc-6fae-45d3-a73c-0332e090a9e7'"
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
        echo "GUID=='1d57a055-6d60-4a70-981c-0332e090a9e7'"
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
    echo "GUID=='55133661-4c50-4fce-bd1c-0332e090a9e7'"
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
        echo "GUID=='32a586b5-f85d-4a8b-a45c-0332e090a9e7'"
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
        echo "GUID=='a28d1bd7-41dc-4158-8deb-0332e090a9e7'"
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
        echo "GUID=='117b5ef8-a448-43d0-ad9b-0332e090a9e7'"
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
        echo "GUID=='275ea794-8771-4d02-ab3b-0332e090a9e7'"
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
        echo "GUID=='15842d62-13e1-49df-b53b-0332e090a9e7'"
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
            echo "GUID=='3ba21f65-e4af-4813-be2b-0332e090a9e7'"
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
            echo "GUID=='2cdf93d3-a87c-401f-b81b-0332e090a9e7'"
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
            echo "GUID=='bafb14e4-c9ce-41a1-8abb-0332e090a9e7'"
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
        echo "GUID=='3146f380-6c6e-46b8-945b-0332e090a9e7'"
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
            echo "GUID=='b2c86a47-02c0-4980-952b-0332e090a9e7'"
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
            echo "GUID=='5644ada3-510b-4634-ac3b-0332e090a9e7'"
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
            echo "GUID=='932c2295-493f-4c94-b44b-0332e090a9e7'"
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
        "91c2d23a-8dcf-467d-915c-0332e090a9e7" \
        "The environment variable GEM_HOME is not set."
else
    func_mmmv_assert_folder_exists_t1 \
        "$GEM_HOME" "a3f409b6-a9cf-45ba-8b3c-0332e090a9e7"
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
    "49f110c3-49ff-41df-823c-0332e090a9e7"

#--------------------------------------------------------------------------
func_angervaks_gem_install "hdf5 --version 0.3.5" \
    "b23ea3c8-3080-44e4-994c-0332e090a9e7"

func_angervaks_gem_install "hdf5" \
    "61542319-5671-4249-a07c-0332e090a9e7"

#--------------------------------------------------------------------------
func_angervaks_gem_install "json --version 2.2.0" \
    "5ac48482-14a4-4e89-8d3b-0332e090a9e7"

func_angervaks_gem_install "json" \
    "1499a653-2a2e-42e0-9b1b-0332e090a9e7"

#--------------------------------------------------------------------------
func_angervaks_gem_install "narray --version 0.6.1.2" \
    "5575d295-65f0-463b-952b-0332e090a9e7"

func_angervaks_gem_install "narray" \
    "a22c14e6-8da9-44dd-bd6b-0332e090a9e7"

#--------------------------------------------------------------------------

func_angervaks_gem_install "rdf" \
    "2856cd65-7536-40ed-894b-0332e090a9e7"

func_angervaks_gem_install "test-unit" \
    "1f9e0462-261b-4c0c-bd5b-0332e090a9e7"

#--------------------------------------------------------------------------
#::::::::::::::::Gems::created::by::Martin.Vahi@softf1.com:::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "kibuvits_ruby_library_krl171bt4_" \
    "e2e6b2a0-b268-4b0e-822b-0332e090a9e7"

#--------------------------------------------------------------------------
#::::::::::::::::::::::Encoding::related::gems:::::::::::::::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "cgi" \
    "642b5413-ef42-450b-8a3b-0332e090a9e7"

func_angervaks_gem_install "uri" \
    "a3415deb-e831-4771-bb5b-0332e090a9e7"

#--------------------------------------------------------------------------
#::::::::::::::Plotting::and::Mathematics::related::gems:::::::::::::::::::
#--------------------------------------------------------------------------

# http://sciruby.com/docs/
# https://github.com/clbustos/distribution
func_angervaks_gem_install "distribution" \
    "1a11e694-e30d-419d-af4b-0332e090a9e7"

func_angervaks_gem_install "graphviz" \
    "476d1494-1a83-4354-8c5b-0332e090a9e7"

# http://sciruby.com/docs/
# https://github.com/clbustos/integration
func_angervaks_gem_install "integration" \
    "9b71c1fa-67c1-45d4-a6eb-0332e090a9e7"

# miniKanren is a form of logic programming.
# http://minikanren.org/
func_angervaks_gem_install "micro_kanren" \
    "1377b1c2-7566-480b-a54b-0332e090a9e7"

# http://sciruby.com/docs/
# https://github.com/clbustos/minimization
func_angervaks_gem_install "minimization" \
    "4eb59e10-9f2c-4ad6-ad1b-0332e090a9e7"

#--------------------
# http://sciruby.com/docs/
# https://github.com/SciRuby/nmatrix/wiki/Installation
# Unfortunately the
#     func_angervaks_gem_install "nmatrix" \
#         "cea5d4f2-5de9-4b75-9a4b-0332e090a9e7"
# tends to fail to compile its native part.
# The nmatrix-Foo gems fail to compile on old openSUSE Linux.
#
#     # http://sciruby.com/docs/
#     # https://github.com/SciRuby/nmatrix/wiki/Installation
#     func_angervaks_gem_install "nmatrix-atlas" \
#         "4c7ef7f1-9dd4-4b46-932b-0332e090a9e7"
#
#     # http://sciruby.com/docs/
#     # https://github.com/SciRuby/nmatrix/wiki/Installation
#     func_angervaks_gem_install "nmatrix-lapacke" \
#         "33aa0443-1cba-4d85-985b-0332e090a9e7"
#--------------------

# http://sciruby.com/docs/
# https://github.com/zuhao/plotrb
func_angervaks_gem_install "plotrb" \
    "38c33895-23a8-4033-942b-0332e090a9e7"

# http://sciruby.com/docs/
# https://github.com/clbustos/statsample
func_angervaks_gem_install "statsample" \
    "e39da482-02f9-4701-bc1b-0332e090a9e7"

# https://rubygems.org/gems/statistics2
func_angervaks_gem_install "statistics2" \
    "327ef9a8-3909-42c6-a95b-0332e090a9e7"

# https://github.com/red-data-tools/YouPlot
# Bash command line example:
#
#      printf 'X axis name,Y axis name \n -5,20 \n 0,25 \n 10,-5\n' | \
#      uplot scatter -H -d, -t IRIS -w 70 -h 20 --xlim -10,20  --ylim -10,30  --title "This is a title"
#
func_angervaks_gem_install "youplot" \
    "2df9d9a4-eeb6-4305-b71b-0332e090a9e7"

#--------------------------------------------------------------------------
#::::::::::::::::::::::::Ruby::related::gems:::::::::::::::::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "bundler" \
    "130349c4-5c37-444e-9c1b-0332e090a9e7"

func_angervaks_gem_install "geminabox" \
    "4059caf3-9eee-457b-9c4a-0332e090a9e7"

func_angervaks_gem_install "gemirro" \
    "73f8e77d-82c2-44ef-8caa-0332e090a9e7"

func_angervaks_gem_install "gemstash" \
    "159a0fc3-58f7-46f1-8b2a-0332e090a9e7"

func_angervaks_gem_install "iruby" \
    "b322097f-851a-4999-904a-0332e090a9e7"

func_angervaks_gem_install "rake"  \
    "e31c8db2-2e62-4a7c-b22a-0332e090a9e7"

func_angervaks_gem_install "rdoc" \
    "17adb352-11f3-403c-a11a-0332e090a9e7"

func_angervaks_gem_install "rspec" \
    "4a326103-5c40-4959-a44a-0332e090a9e7"

# https://sorbet.org/
# https://github.com/sorbet/
# Dependencies on Debian like operating systems:
#     apt-get install bazel autoconf coreutils parallel
func_angervaks_gem_install "sorbet" \
    "22f90c63-daac-428c-874a-0332e090a9e7"
func_angervaks_gem_install "sorbet-runtime" \
    "7c55e2f1-13d5-4d57-8a1a-0332e090a9e7"

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
    "43bd5511-e53e-4861-8f1a-0332e090a9e7"


#--------------------------------------------------------------------------
#::::::::::::::::::::::filesystem::related::gems:::::::::::::::::::::::::::
#--------------------------------------------------------------------------

# Part of standard gem set but here with the naive hope that
# may be with some good dumb luck it is at least some time
# still usable after it is thrown out of the Ruby stdlib:
#     https://github.com/ruby/stringio
func_angervaks_gem_install "stringio" \
    "348901b2-95bc-4596-842a-0332e090a9e7"

#--------------------------------------------------------------------------
#::::::::::::::::::::::::GUI/UI::related::gems:::::::::::::::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "glimmer-dsl-libui" \
    "6586cf05-f9a2-431d-8faa-0332e090a9e7"

# https://github.com/mcorino/wxRuby3
func_angervaks_gem_install "wxruby3"
    "51b72ad2-16c6-4b59-bc1a-0332e090a9e7"

#----------------------------------------------------------------
#    https://www.ruby-toolbox.com/projects/gtk4
#    ------------------citation----start-------------------------
#    Ruby/GTK4 is a Ruby binding of GTK 4.x. It allows Ruby
#    programmers to use the GTK graphics toolkit to make
#    graphical user interfaces for their Ruby scripts.
#    ------------------citation----end---------------------------
func_angervaks_gem_install "gtk4"
    "d204d39e-bf4c-4719-b53a-0332e090a9e7"

func_angervaks_gem_install "gtk3"
    "1c5cd805-5a06-4bab-903a-0332e090a9e7"

#--------------------------------------------------------------------------
#:::::::::::::::::::::::gnuplot::related::gems:::::::::::::::::::::::::::::
#--------------------------------------------------------------------------

# https://github.com/rdp/ruby_gnuplot
func_angervaks_gem_install "gnuplot" \
    "440326a1-4460-4780-bd4a-0332e090a9e7"
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
    "c5359e6c-4654-4ffc-afca-0332e090a9e7"

func_angervaks_gem_install "awesome_print" \
    "85374079-afcb-413a-915a-0332e090a9e7"

func_angervaks_gem_install "cztop" \
    "4d3c2ee2-4a48-4489-841a-0332e090a9e7"

func_angervaks_gem_install "nyaplot" \
    "f62540d3-4465-4ce2-8cca-0332e090a9e7"

func_angervaks_gem_install "pry" \
    "52e84d52-9e94-4704-9a5a-0332e090a9e7"

func_angervaks_gem_install "pry-doc" \
    "8b432773-edc6-44b3-8c1a-0332e090a9e7"

# http://sciruby.com/docs/
# https://github.com/clbustos/rubyvis
func_angervaks_gem_install "rubyvis" \
    "926cf414-b900-42f0-9e2a-0332e090a9e7"

#--------------------------------------------------------------------------
#:::::::::::::::network::and::other::type::of::connectivity::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "net" \
    "18075812-23d4-4635-ae5a-0332e090a9e7"

func_angervaks_gem_install "net-ssh" \
    "5448f4d1-823a-40f9-992a-0332e090a9e7"

func_angervaks_gem_install "mail" \
    "348a47a2-1aa8-4a58-aa1a-0332e090a9e7"

func_angervaks_gem_install "bitmessage" \
    "306c0313-7979-4dd5-b15a-0332e090a9e7"

# Allows plain Ruby to load C DLLs.
# https://github.com/ffi/ffi
func_angervaks_gem_install "ffi" \
    "af02efbe-df87-4f95-b31a-0332e090a9e7"

# The rbczmq gem installation script fails to build its extensions on
# Linux nameofthemachine  4.19.0-6-amd64 #1 SMP Debian 4.19.67-2+deb10u2 (2019-11-11) x86_64 GNU/Linux
#func_angervaks_gem_install "rbczmq" \
#    "c5bd6067-8406-43ce-8d8a-0332e090a9e7"
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
#    "e5646bdc-0f67-44a4-a15a-0332e090a9e7"
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
    "f02bda85-207b-4a26-ab19-0332e090a9e7"

#--------------------------------------------------------------------------
#:::::::::::::::::technical::documentation::geneneration:::::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "jekyll" \
    "5cc46923-a556-42c8-a029-0332e090a9e7"

# Fails to compile/install on
# Linux hoidla01 4.19.0-10-amd64 #1 SMP Debian 4.19.132-1 (2020-07-24) x86_64 GNU/Linux
#func_angervaks_gem_install "gallium" \
#    "6d21f966-1cfc-4490-9f79-0332e090a9e7"

# https://asciidoctor.org/
# https://github.com/asciidoctor
# https://rubygems.org/gems/asciidoctor
func_angervaks_gem_install "asciidoctor" \
    "4da45532-1965-431f-8f29-0332e090a9e7"

#--------------------------------------------------------------------------
#::::someting::to::do::with::mmmv_devel_tools::optional::dependencies::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "bond" \
    "5a3ebd51-8e52-4f6f-8e49-0332e090a9e7"

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
    "15e841a2-d561-41f8-a629-0332e090a9e7"
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
#     "1c478fcc-c8de-449c-8239-0332e090a9e7"

# DBF gem is just file format support, but
# it's closelyrelated to databases.
func_angervaks_gem_install "dbf" \
    "521c3fc6-34d2-4ae9-9849-0332e090a9e7"

# The mysql2 gem fail to compile on old openSUSE Linux.
# func_angervaks_gem_install "mysql2" \
#     "851dbf0c-0978-4581-b989-0332e090a9e7"

# func_angervaks_gem_install "mongodb" \
#     "295c6c05-dde2-446b-ac49-0332e090a9e7"

# func_angervaks_gem_install "neo4j" \
#     "2fd952d2-708a-4050-9b19-0332e090a9e7"

# func_angervaks_gem_install "postgresql" \
#     "1c67ca43-151e-4a67-8359-0332e090a9e7"

# func_angervaks_gem_install "rethinkdb" \
#     "42f69225-0257-45bb-ad19-0332e090a9e7"

# func_angervaks_gem_install "sqlite3 --version 1.4.1" \
#     "57debe65-a849-4aef-8929-0332e090a9e7"

func_angervaks_gem_install "sqlite3" \
    "25996a72-0ff7-4ee3-a859-0332e090a9e7"

#--------------------------------------------------------------------------
#::::::Classifiers::and::Artificial::Intelligence::related::gems:::::::::::
#--------------------------------------------------------------------------

# https://github.com/jedld/tensor_stream
func_angervaks_gem_install "tensor_stream" \
    "5f750355-3efe-471f-9a29-0332e090a9e7"

# https://github.com/irfansharif/cerebrum
func_angervaks_gem_install "cerebrum" \
    "8b7c55e5-88c7-4c2a-ab29-0332e090a9e7"

# https://github.com/tangledpath/ruby-fann
# func_angervaks_gem_install "ruby-fann" \
#     "4916b844-23fc-472e-a459-0332e090a9e7"
# is a Ruby wrapper to the LGPL licensed
# Fast Artificial Neural Network (FANN) Library
# https://github.com/libfann/fann
# Unfortunately there can sometimes be a mismatch between the
# version of the FANN library that is available from Linux
# distribution standard package collection and the version of
# the FANN library that this Ruby gem requires.

#--------------------------------------------------------------------------
#::::::::::::::::::::::script_data_section:::end:::::::::::::::::::::::::::
#--------------------------------------------------------------------------
cd "$S_FP_ORIG"
exit 0 # no errors occurred
#==========================================================================
# S_VERSION_OF_THIS_FILE="262299e3-1000-4e34-a219-0332e090a9e7"
#==========================================================================
