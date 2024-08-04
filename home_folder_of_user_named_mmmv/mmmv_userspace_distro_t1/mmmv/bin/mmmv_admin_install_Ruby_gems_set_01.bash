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
        echo "GUID=='4f77ee4e-b449-4276-8759-b140804088e7'"
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
        echo "GUID=='19d1ef75-1fb3-4ad0-8819-b140804088e7'"
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
        echo "GUID=='55b85ab5-d843-4de7-8d39-b140804088e7'"
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
    echo "GUID=='112dd4ec-1e6a-42c2-9139-b140804088e7'"
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
        echo "GUID=='4eb3c3b4-b1f0-453b-ab49-b140804088e7'"
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
        echo "GUID=='163f6be4-06f2-4b6d-8c59-b140804088e7'"
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
        echo "GUID=='61eb678d-5685-4df1-8a49-b140804088e7'"
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
        echo "GUID=='483eb472-1008-4fb7-be49-b140804088e7'"
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
        echo "GUID=='d5d93b2a-6516-4c50-8919-b140804088e7'"
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
            echo "GUID=='15aac06e-01ff-4b11-b228-b140804088e7'"
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
            echo "GUID=='61917e3c-fbb5-4f8f-9658-b140804088e7'"
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
            echo "GUID=='05aaf63a-a133-4250-94d8-b140804088e7'"
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
        echo "GUID=='ba3e0445-4dbd-48ce-9758-b140804088e7'"
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
            echo "GUID=='d844c0c2-5173-44b0-af18-b140804088e7'"
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
            echo "GUID=='4cf6c5f5-d5c4-4214-ad48-b140804088e7'"
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
            echo "GUID=='953fccd3-0cad-474d-a428-b140804088e7'"
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
        "1756dc82-2047-4dfb-8739-b140804088e7" \
        "The environment variable GEM_HOME is not set."
else
    func_mmmv_assert_folder_exists_t1 \
        "$GEM_HOME" "33ecc221-32e9-495f-9239-b140804088e7"
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
    "a15ea4d9-9b67-459d-96c9-b140804088e7"

#--------------------------------------------------------------------------
func_angervaks_gem_install "hdf5 --version 0.3.5" \
    "1dc17024-67cb-4364-a819-b140804088e7"

func_angervaks_gem_install "hdf5" \
    "15535aa2-11d9-4f15-9819-b140804088e7"

#--------------------------------------------------------------------------
func_angervaks_gem_install "json --version 2.2.0" \
    "941feab9-5852-42eb-84d9-b140804088e7"

func_angervaks_gem_install "json" \
    "fbe0bd51-ba38-47be-8149-b140804088e7"

#--------------------------------------------------------------------------
func_angervaks_gem_install "narray --version 0.6.1.2" \
    "d282187b-df14-44a7-a5a9-b140804088e7"

func_angervaks_gem_install "narray" \
    "863cb5f2-3627-4d89-ac39-b140804088e7"

#--------------------------------------------------------------------------
func_angervaks_gem_install "net" \
    "13236ba1-8e25-4735-8928-b140804088e7"

func_angervaks_gem_install "net-ssh" \
    "2b472c25-9122-4bb4-9428-b140804088e7"

func_angervaks_gem_install "mail" \
    "21a5b404-1591-4ec7-a518-b140804088e7"

func_angervaks_gem_install "bitmessage" \
    "5106fcf3-fdab-4dc2-8628-b140804088e7"

func_angervaks_gem_install "rdf" \
    "55788e31-2c64-48c5-9638-b140804088e7"

func_angervaks_gem_install "test-unit" \
    "29ea5da5-1e2e-4bf4-8748-b140804088e7"

#--------------------------------------------------------------------------
#::::::::::::::::Gems::created::by::Martin.Vahi@softf1.com:::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "kibuvits_ruby_library_krl171bt4_" \
    "5e58bf35-f1ac-4b02-a618-b140804088e7"

#--------------------------------------------------------------------------
#::::::::::::::::::::::Encoding::related::gems:::::::::::::::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "cgi" \
    "240bf578-905b-424b-ab48-b140804088e7"

func_angervaks_gem_install "uri" \
    "15928c64-8b72-42bd-8548-b140804088e7"

#--------------------------------------------------------------------------
#::::::::::::::Plotting::and::Mathematics::related::gems:::::::::::::::::::
#--------------------------------------------------------------------------

# http://sciruby.com/docs/
# https://github.com/clbustos/distribution
func_angervaks_gem_install "distribution" \
    "b4e9197e-7a7b-4538-8328-b140804088e7"

func_angervaks_gem_install "graphviz" \
    "726b705c-1e09-4402-8668-b140804088e7"

# http://sciruby.com/docs/
# https://github.com/clbustos/integration
func_angervaks_gem_install "integration" \
    "3e115844-73a9-4c18-a218-b140804088e7"

# miniKanren is a form of logic programming.
# http://minikanren.org/
func_angervaks_gem_install "micro_kanren" \
    "437bf073-aa75-409c-a827-b140804088e7"

# http://sciruby.com/docs/
# https://github.com/clbustos/minimization
func_angervaks_gem_install "minimization" \
    "2d258955-34f8-4e6b-9037-b140804088e7"

#--------------------
# http://sciruby.com/docs/
# https://github.com/SciRuby/nmatrix/wiki/Installation
# Unfortunately the 
#     func_angervaks_gem_install "nmatrix" \
#         "7376c365-07ef-4499-9837-b140804088e7"
# tends to fail to compile its native part.
# The nmatrix-Foo gems fail to compile on old openSUSE Linux.
#
#     # http://sciruby.com/docs/
#     # https://github.com/SciRuby/nmatrix/wiki/Installation
#     func_angervaks_gem_install "nmatrix-atlas" \
#         "293a9361-84be-430b-a657-b140804088e7"
#     
#     # http://sciruby.com/docs/
#     # https://github.com/SciRuby/nmatrix/wiki/Installation
#     func_angervaks_gem_install "nmatrix-lapacke" \
#         "385614f2-0023-4ab9-bd57-b140804088e7"
#--------------------

# http://sciruby.com/docs/
# https://github.com/zuhao/plotrb
func_angervaks_gem_install "plotrb" \
    "39de6e61-3662-4c66-9c37-b140804088e7"

# http://sciruby.com/docs/
# https://github.com/clbustos/statsample
func_angervaks_gem_install "statsample" \
    "516d3ce8-1438-4561-8c17-b140804088e7"

# https://rubygems.org/gems/statistics2
func_angervaks_gem_install "statistics2" \
    "33933371-6341-4c50-a127-b140804088e7"

#--------------------------------------------------------------------------
#::::::::::::::::::::::::Ruby::related::gems:::::::::::::::::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "bundler" \
    "e9979471-e5b4-4ec0-9d17-b140804088e7"

func_angervaks_gem_install "geminabox" \
    "40aebfc2-f785-43b8-9847-b140804088e7"

func_angervaks_gem_install "gemirro" \
    "27633932-f815-4a65-ba27-b140804088e7"

func_angervaks_gem_install "gemstash" \
    "84220ca4-8a33-4e22-a427-b140804088e7"

func_angervaks_gem_install "iruby" \
    "4c65e432-7ade-4e7e-8427-b140804088e7"

func_angervaks_gem_install "rake"  \
    "2f14beeb-4da5-4577-aa37-b140804088e7"

func_angervaks_gem_install "rdoc" \
    "b47ee9df-79dc-46fb-be37-b140804088e7"

func_angervaks_gem_install "rspec" \
    "56f62593-1017-47f0-9a37-b140804088e7"

#--------------------------------------------------------------------------
#::::::::::::::::::::::::GUI/UI::related::gems:::::::::::::::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "glimmer-dsl-libui" \
    "6185f3fc-0631-435e-b127-b140804088e7"

#--------------------------------------------------------------------------
#:::::::::::::::::::::::gnuplot::related::gems:::::::::::::::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "awesome_print" \
    "4f191ef3-4c82-4641-9d37-b140804088e7"

func_angervaks_gem_install "cztop" \
    "1342c549-8b2c-42ae-8af7-b140804088e7"

func_angervaks_gem_install "gnuplot" \
    "30ef86a1-c2c2-4b44-a526-b140804088e7"

func_angervaks_gem_install "nyaplot" \
    "2cf4ad72-4eeb-4d48-a046-b140804088e7"

func_angervaks_gem_install "pry" \
    "c53d614a-316e-4151-8116-b140804088e7"

func_angervaks_gem_install "pry-doc" \
    "4d249e90-3dca-433b-a086-b140804088e7"

# http://sciruby.com/docs/
# https://github.com/clbustos/rubyvis
func_angervaks_gem_install "rubyvis" \
    "81f7ecd0-9e87-41c3-a636-b140804088e7"


# The rbczmq gem installation script fails to build its extensions on 
# Linux nameofthemachine  4.19.0-6-amd64 #1 SMP Debian 4.19.67-2+deb10u2 (2019-11-11) x86_64 GNU/Linux
#func_angervaks_gem_install "rbczmq" \
#    "fb1474e0-6e5e-4119-a6a6-b140804088e7"

#--------------------------------------------------------------------------
#:::::::::::::::::technical::documentation::geneneration:::::::::::::::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "jekyll" \
    "e56986eb-1dbd-437b-be96-b140804088e7"

# Fails to compile/install on 
# Linux hoidla01 4.19.0-10-amd64 #1 SMP Debian 4.19.132-1 (2020-07-24) x86_64 GNU/Linux
#func_angervaks_gem_install "gallium" \
#    "46858772-1103-4260-a526-b140804088e7"

# https://asciidoctor.org/
# https://github.com/asciidoctor
# https://rubygems.org/gems/asciidoctor
func_angervaks_gem_install "asciidoctor" \
    "82c24ea2-3f5c-4c70-b946-b140804088e7"

#--------------------------------------------------------------------------
#::::someting::to::do::with::mmmv_devel_tools::optional::dependencies::::::
#--------------------------------------------------------------------------

func_angervaks_gem_install "bond" \
    "26fd8c01-5255-4551-a326-b140804088e7"

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
    "10b00b24-1053-4703-a946-b140804088e7"
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

func_angervaks_gem_install "couchdb" \
    "4ac40261-311c-417f-9a16-b140804088e7"

# DBF gem is just file format support, but
# it's closelyrelated to databases.
func_angervaks_gem_install "dbf" \
    "34519a03-c9df-4966-bf36-b140804088e7"

# The mysql2 gem fail to compile on old openSUSE Linux.
# func_angervaks_gem_install "mysql2" \
#     "c4ce74c1-88ad-4c5e-9c36-b140804088e7"

func_angervaks_gem_install "mongodb" \
    "20b58555-3aea-4b9b-ba16-b140804088e7"

func_angervaks_gem_install "neo4j" \
    "71032db7-5d32-445c-a326-b140804088e7"

func_angervaks_gem_install "postgresql" \
    "5d5d44a3-dd12-41fe-b756-b140804088e7"

func_angervaks_gem_install "rethinkdb" \
    "4a2ca432-ec6d-4836-a536-b140804088e7"

func_angervaks_gem_install "sqlite3 --version 1.4.1" \
    "5c2ac6f1-9970-45b4-bd16-b140804088e7"

func_angervaks_gem_install "sqlite3" \
    "e4db6032-04af-475b-9016-b140804088e7"

#--------------------------------------------------------------------------
#::::::Classifiers::and::Artificial::Intelligence::related::gems:::::::::::
#--------------------------------------------------------------------------

# https://github.com/jedld/tensor_stream
func_angervaks_gem_install "tensor_stream" \
    "b1bb09c8-236c-45f7-bb15-b140804088e7"

# https://github.com/irfansharif/cerebrum
func_angervaks_gem_install "cerebrum" \
    "2f7a92e1-b993-4ec8-9715-b140804088e7"

#--------------------------------------------------------------------------
#::::::::::::::::::::::script_data_section:::end:::::::::::::::::::::::::::
#--------------------------------------------------------------------------
cd "$S_FP_ORIG"
exit 0 # no errors occurred
#==========================================================================
# S_VERSION_OF_THIS_FILE="45f879a4-e3bf-48e5-af45-b140804088e7"
#==========================================================================
