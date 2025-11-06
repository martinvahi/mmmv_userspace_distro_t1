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
        echo "GUID=='f28e89e5-58ee-48ed-a03a-c003d060b9e7'"
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
        echo "GUID=='d55421f7-c4fe-44b9-963a-c003d060b9e7'"
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
        echo "GUID=='524b0941-8011-4beb-824a-c003d060b9e7'"
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
    echo "GUID=='a52b2ca5-654b-4685-912a-c003d060b9e7'"
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
        echo "GUID=='da43e2ec-595e-44b2-809a-c003d060b9e7'"
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
        echo "GUID=='3cc143f1-f87d-4b0b-995a-c003d060b9e7'"
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
        echo "GUID=='05875156-8257-444f-b2ca-c003d060b9e7'"
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
        echo "GUID=='1184ba75-ad6a-40c7-ba59-c003d060b9e7'"
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
        echo "GUID=='e124a7dc-3dee-4996-8c49-c003d060b9e7'"
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
            echo "GUID=='648b36a3-b94d-406f-af39-c003d060b9e7'"
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
            echo "GUID=='056995d3-4ab6-4408-af59-c003d060b9e7'"
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
            echo "GUID=='4a2acb65-e17f-4bd1-be29-c003d060b9e7'"
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
        echo "GUID=='5e2bc6e3-c67e-4493-a929-c003d060b9e7'"
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
            echo "GUID=='40ce97d2-dc70-4d69-8a19-c003d060b9e7'"
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
            echo "GUID=='13cee482-3ed0-456f-92e9-c003d060b9e7'"
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
            echo "GUID=='f3af24da-62d8-4172-8839-c003d060b9e7'"
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
        "214f8092-5867-4f10-863a-c003d060b9e7" \
        "The environment variable GEM_HOME is not set."
else
    func_mmmv_assert_folder_exists_t1 \
        "$GEM_HOME" "450937aa-e4e4-4dc7-8e4a-c003d060b9e7"
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
    "a23529ac-6599-4226-9c1a-c003d060b9e7"

#--------------------------------------------------------------------------
func_angervaks_gem_install "hdf5 --version 0.3.5" \
    "5fd9bf63-9a3d-4ade-ae5a-c003d060b9e7"

func_angervaks_gem_install "hdf5" \
    "2be4f515-f1f6-42d8-a82a-c003d060b9e7"

#--------------------------------------------------------------------------
func_angervaks_gem_install "json --version 2.2.0" \
    "59a7d781-6788-42f7-ab1a-c003d060b9e7"

func_angervaks_gem_install "json" \
    "2f23e0e5-1c7c-4665-8449-c003d060b9e7"

#--------------------------------------------------------------------------
func_angervaks_gem_install "narray --version 0.6.1.2" \
    "726bf547-9d75-4dbb-9149-c003d060b9e7"

func_angervaks_gem_install "narray" \
    "4d76e8c5-139e-458b-a359-c003d060b9e7"

#--------------------------------------------------------------------------

func_angervaks_gem_install "rdf" \
    "63946692-88d5-46c0-b329-c003d060b9e7"

func_angervaks_gem_install "test-unit" \
    "713abc8d-2a51-4547-b629-c003d060b9e7"

#--------------------------------------------------------------------------
#::::::::::::::::Gems::created::by::Martin.Vahi@softf1.com:::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "kibuvits_ruby_library_krl171bt4_" \
    "25129f5c-1688-430a-8079-c003d060b9e7"

#--------------------------------------------------------------------------
#::::::::::::::::::::::Encoding::related::gems:::::::::::::::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "cgi" \
    "5294e045-1f96-4c17-8d29-c003d060b9e7"

func_angervaks_gem_install "uri" \
    "13d6065c-aa0c-4f63-8819-c003d060b9e7"

#--------------------------------------------------------------------------
#::::::::::::::Plotting::and::Mathematics::related::gems:::::::::::::::::::
#--------------------------------------------------------------------------

# http://sciruby.com/docs/
# https://github.com/clbustos/distribution
func_angervaks_gem_install "distribution" \
    "3c852884-05c5-4760-8939-c003d060b9e7"

func_angervaks_gem_install "graphviz" \
    "734a075e-7e58-405d-b329-c003d060b9e7"

# http://sciruby.com/docs/
# https://github.com/clbustos/integration
func_angervaks_gem_install "integration" \
    "41a8a996-685e-4488-9939-c003d060b9e7"

# miniKanren is a form of logic programming.
# http://minikanren.org/
func_angervaks_gem_install "micro_kanren" \
    "3daa6f14-c844-4721-8959-c003d060b9e7"

# http://sciruby.com/docs/
# https://github.com/clbustos/minimization
func_angervaks_gem_install "minimization" \
    "18555c72-1c46-433a-aa19-c003d060b9e7"

#--------------------
# http://sciruby.com/docs/
# https://github.com/SciRuby/nmatrix/wiki/Installation
# Unfortunately the
#     func_angervaks_gem_install "nmatrix" \
#         "4e40e753-efdf-491b-9419-c003d060b9e7"
# tends to fail to compile its native part.
# The nmatrix-Foo gems fail to compile on old openSUSE Linux.
#
#     # http://sciruby.com/docs/
#     # https://github.com/SciRuby/nmatrix/wiki/Installation
#     func_angervaks_gem_install "nmatrix-atlas" \
#         "34110074-75d8-4c20-9b49-c003d060b9e7"
#
#     # http://sciruby.com/docs/
#     # https://github.com/SciRuby/nmatrix/wiki/Installation
#     func_angervaks_gem_install "nmatrix-lapacke" \
#         "a339455b-aa5c-49c7-be29-c003d060b9e7"
#--------------------

# http://sciruby.com/docs/
# https://github.com/zuhao/plotrb
func_angervaks_gem_install "plotrb" \
    "ee300da1-7a0a-4b25-bd39-c003d060b9e7"

# http://sciruby.com/docs/
# https://github.com/clbustos/statsample
func_angervaks_gem_install "statsample" \
    "84995875-94cc-4283-9e19-c003d060b9e7"

# https://rubygems.org/gems/statistics2
func_angervaks_gem_install "statistics2" \
    "51da4584-6923-4a6d-9c19-c003d060b9e7"

# https://github.com/red-data-tools/YouPlot
# Bash command line example:
#
#      printf 'X axis name,Y axis name \n -5,20 \n 0,25 \n 10,-5\n' | \
#      uplot scatter -H -d, -t IRIS -w 70 -h 20 --xlim -10,20  --ylim -10,30  --title "This is a title"
#
func_angervaks_gem_install "youplot" \
    "8a5414c1-ddfb-4d54-8019-c003d060b9e7"

#--------------------------------------------------------------------------
#::::::::::::::::::::::::Ruby::related::gems:::::::::::::::::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "bundler" \
    "3553f8a1-0465-4159-8ec9-c003d060b9e7"

func_angervaks_gem_install "geminabox" \
    "5bd9d7f2-06cd-445c-9359-c003d060b9e7"

func_angervaks_gem_install "gemirro" \
    "44270b5d-f032-4432-a4a8-c003d060b9e7"

func_angervaks_gem_install "gemstash" \
    "51270793-dd71-4273-bc58-c003d060b9e7"

func_angervaks_gem_install "iruby" \
    "1afa3a63-bfae-4b68-a658-c003d060b9e7"

func_angervaks_gem_install "rake"  \
    "a20230e5-893b-4e22-a118-c003d060b9e7"

func_angervaks_gem_install "rdoc" \
    "fe54d628-85d2-44b9-91f8-c003d060b9e7"

func_angervaks_gem_install "rspec" \
    "5db582e4-922a-4964-8d18-c003d060b9e7"

# https://sorbet.org/
# https://github.com/sorbet/
# Dependencies on Debian like operating systems:
#     apt-get install bazel autoconf coreutils parallel
func_angervaks_gem_install "sorbet" \
    "b65b4764-9f12-4877-9218-c003d060b9e7"
func_angervaks_gem_install "sorbet-runtime" \
    "31b5bedb-e71e-4574-b128-c003d060b9e7"

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
    "cc5612f8-02ca-4e32-ae48-c003d060b9e7"


#--------------------------------------------------------------------------
#::::::::::::::::::::::filesystem::related::gems:::::::::::::::::::::::::::
#--------------------------------------------------------------------------

# Part of standard gem set but here with the naive hope that
# may be with some good dumb luck it is at least some time
# still usable after it is thrown out of the Ruby stdlib:
#     https://github.com/ruby/stringio
func_angervaks_gem_install "stringio" \
    "393caca4-ce10-49f4-9248-c003d060b9e7"

#--------------------------------------------------------------------------
#::::::::::::::::::::::::GUI/UI::related::gems:::::::::::::::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "glimmer-dsl-libui" \
    "193c7dc5-848e-4466-a818-c003d060b9e7"

# https://github.com/mcorino/wxRuby3
func_angervaks_gem_install "wxruby3"
    "c02a7e24-86fc-44b5-8218-c003d060b9e7"

#----------------------------------------------------------------
#    https://www.ruby-toolbox.com/projects/gtk4
#    ------------------citation----start-------------------------
#    Ruby/GTK4 is a Ruby binding of GTK 4.x. It allows Ruby
#    programmers to use the GTK graphics toolkit to make
#    graphical user interfaces for their Ruby scripts.
#    ------------------citation----end---------------------------
func_angervaks_gem_install "gtk4"
    "45120fdb-02b1-4244-8918-c003d060b9e7"

func_angervaks_gem_install "gtk3"
    "1e08a085-8fb1-4085-9238-c003d060b9e7"

#--------------------------------------------------------------------------
#:::::::::::::::::::::::gnuplot::related::gems:::::::::::::::::::::::::::::
#--------------------------------------------------------------------------

# https://github.com/rdp/ruby_gnuplot
func_angervaks_gem_install "gnuplot" \
    "11b130d0-1d7a-4b01-a928-c003d060b9e7"
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
    "41fbae43-502f-4736-b918-c003d060b9e7"

func_angervaks_gem_install "awesome_print" \
    "259de882-932f-481b-b458-c003d060b9e7"

func_angervaks_gem_install "cztop" \
    "f56f28c3-9172-4f98-9b18-c003d060b9e7"

func_angervaks_gem_install "nyaplot" \
    "1d135cc3-f888-4875-bf38-c003d060b9e7"

func_angervaks_gem_install "pry" \
    "10031815-4665-4797-aa28-c003d060b9e7"

func_angervaks_gem_install "pry-doc" \
    "9400589b-b732-422b-9f48-c003d060b9e7"

# http://sciruby.com/docs/
# https://github.com/clbustos/rubyvis
func_angervaks_gem_install "rubyvis" \
    "3847e146-a82e-417f-88c8-c003d060b9e7"

#--------------------------------------------------------------------------
#:::::::::::::::network::and::other::type::of::connectivity::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "net" \
    "31fe3841-78fb-440e-bf18-c003d060b9e7"

func_angervaks_gem_install "net-ssh" \
    "352e6c95-381b-4323-a448-c003d060b9e7"

func_angervaks_gem_install "mail" \
    "c2b7d5a2-d4cc-43d7-ade8-c003d060b9e7"

func_angervaks_gem_install "bitmessage" \
    "519efc32-e05b-4072-9c18-c003d060b9e7"

# Allows plain Ruby to load C DLLs.
# https://github.com/ffi/ffi
func_angervaks_gem_install "ffi" \
    "1123db54-fa12-4ff9-ad28-c003d060b9e7"

# The rbczmq gem installation script fails to build its extensions on
# Linux nameofthemachine  4.19.0-6-amd64 #1 SMP Debian 4.19.67-2+deb10u2 (2019-11-11) x86_64 GNU/Linux
#func_angervaks_gem_install "rbczmq" \
#    "402b2d43-048e-4f1c-8b48-c003d060b9e7"
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
#    "14aa9973-4785-45dd-8328-c003d060b9e7"
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
    "24c17ae2-7ffb-45ff-9b38-c003d060b9e7"

#--------------------------------------------------------------------------
#:::::::::::::::::technical::documentation::geneneration:::::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "jekyll" \
    "402ea64c-0860-4d9f-b218-c003d060b9e7"

# Fails to compile/install on
# Linux hoidla01 4.19.0-10-amd64 #1 SMP Debian 4.19.132-1 (2020-07-24) x86_64 GNU/Linux
#func_angervaks_gem_install "gallium" \
#    "49a70cc3-605d-4c5a-9e47-c003d060b9e7"

# https://asciidoctor.org/
# https://github.com/asciidoctor
# https://rubygems.org/gems/asciidoctor
func_angervaks_gem_install "asciidoctor" \
    "97e78741-a090-4c2b-bf17-c003d060b9e7"

#--------------------------------------------------------------------------
#::::someting::to::do::with::mmmv_devel_tools::optional::dependencies::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "bond" \
    "53d00d54-98c3-4b9a-ba27-c003d060b9e7"

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
    "1d2f14b2-bcd0-4110-9317-c003d060b9e7"
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
#     "d4513549-b43c-43cc-8737-c003d060b9e7"

# DBF gem is just file format support, but
# it's closelyrelated to databases.
func_angervaks_gem_install "dbf" \
    "82ba6657-9500-43c7-81c7-c003d060b9e7"

# The mysql2 gem fail to compile on old openSUSE Linux.
# func_angervaks_gem_install "mysql2" \
#     "51310d93-397f-4ebf-9c57-c003d060b9e7"

# func_angervaks_gem_install "mongodb" \
#     "4328cf62-5f40-4b03-a827-c003d060b9e7"

# func_angervaks_gem_install "neo4j" \
#     "26075981-885f-4f3e-8e27-c003d060b9e7"

# func_angervaks_gem_install "postgresql" \
#     "2f110a44-8d57-4cee-9237-c003d060b9e7"

# func_angervaks_gem_install "rethinkdb" \
#     "229fba91-f554-4494-a357-c003d060b9e7"

# func_angervaks_gem_install "sqlite3 --version 1.4.1" \
#     "52363da8-65cd-47d5-a727-c003d060b9e7"

func_angervaks_gem_install "sqlite3" \
    "219ef315-a230-496e-a737-c003d060b9e7"

#--------------------------------------------------------------------------
#::::::Classifiers::and::Artificial::Intelligence::related::gems:::::::::::
#--------------------------------------------------------------------------

# https://github.com/jedld/tensor_stream
func_angervaks_gem_install "tensor_stream" \
    "51110c92-77bb-4ffe-a237-c003d060b9e7"

# https://github.com/irfansharif/cerebrum
func_angervaks_gem_install "cerebrum" \
    "190e5122-44ee-4ce5-be47-c003d060b9e7"

# https://github.com/tangledpath/ruby-fann
# func_angervaks_gem_install "ruby-fann" \
#     "3aa85df3-1b65-488d-b237-c003d060b9e7"
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
    "47e7d595-6bbd-4967-8927-c003d060b9e7"

# Agoo is a HTTP server for Ruby web applications.
#     https://github.com/ohler55/agoo
func_angervaks_gem_install "agoo" \
    "3c4b9373-8d0c-45ac-bb47-c003d060b9e7"

#--------------------------------------------------------------------------
#::::::::::::::::::::::script_data_section:::end:::::::::::::::::::::::::::
#--------------------------------------------------------------------------
cd "$S_FP_ORIG"
exit 0 # no errors occurred
#==========================================================================
# S_VERSION_OF_THIS_FILE="82c87a58-3916-4116-b737-c003d060b9e7"
#==========================================================================
