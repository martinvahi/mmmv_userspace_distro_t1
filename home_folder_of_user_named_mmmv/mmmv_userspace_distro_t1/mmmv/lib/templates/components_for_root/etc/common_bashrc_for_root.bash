#!/usr/bin/env bash
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
#
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#
# This script is meant to be part of the
#
#     /root/.bashrc
#
# by
#
# #--------------------------------------------------------------------------
# S_FP_0="/root/mmmv_userspace_distro_t1_components_for_root/etc/common_bashrc_for_root.bash"
# if [ -e "$S_FP_0" ]; then
#     if [ -h "$S_FP_0" ]; then
#         echo ""
#         echo "The "
#         echo ""
#         echo "    $S_FP_0"
#         echo ""
#         echo "is a symlink, but for safety reasons a file is expected."
#         echo "GUID=='2be78501-64e4-46f2-8014-e072107179e7'"
#         echo ""
#     else
#         if [ -d "$S_FP_0" ]; then
#                 echo ""
#                 echo "The "
#                 echo ""
#                 echo "    $S_FP_0"
#                 echo ""
#                 echo "is a folder, but a file is expected."
#                 echo "GUID=='e7769d62-9439-4984-9c54-e072107179e7'"
#                 echo ""
#         else
#             source "$S_FP_0"
#         fi
#     fi
# else
#     echo ""
#     echo "The "
#     echo ""
#     echo "    $S_FP_0"
#     echo ""
#     if [ -h "$S_FP_0" ]; then
#         echo "is a broken symlink, but a file is expected."
#     else
#         echo "is missing."
#     fi
#     echo "GUID=='52deed23-8375-49f3-a454-e072107179e7'"
#     echo ""
# fi
# #--------------------------------------------------------------------------
#
# TODO: A lot of the code in this file is currently Linux specific.
#       Split this file into multiple files and add/copy
#       operating system detection code from
#       the userspace side.
#
#==========================================================================
S_FP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#--------------------------------------------------------------------------
# Configuration:
#--------------------------------------------------------------------------

# For some reason the "-mtune=native" fails on
# Raspberry Pi 3, Raspbian.
#     https://bugs.ruby-lang.org/issues/13509
#     (archival copy: https://archive.is/llUWb )

MMMV_CFLAGS_COMMON=" -ftree-vectorize -O3 "

# The "mainstream" approach:
#
#     # Includes binary code for both, the current and for the older CPUs:
#         #MMMV_CFLAGS_TEMPLATE=" -mtune=native $MMMV_CFLAGS_COMMON "
#     # No backwards compatibility support, smaller binaries, current CPU only:
          MMMV_CFLAGS_TEMPLATE=" -march=native -mtune=native $MMMV_CFLAGS_COMMON "
#
# The ARM specific approach:
#
#     # According to the
#     #     https://www.raspberrypi.com/products/raspberry-pi-4-model-b/specifications/
#     #     archival copy: https://archive.ph/njYdE
#     # The CPU type of the Raspberry_Pi_4 and Raspberry_Pi_400 is:
#     #     "Broadcom BCM2711, Quad core Cortex-A72 (ARM v8) 64-bit SoC @ 1.8GHz"
#     # A citation from
#     #     https://stackoverflow.com/questions/42718572/gcc-mtune-vs-march-vs-mcpu
#     #     archival copy: https://archive.ph/DW1sy
#     #     ----------citation----start-------------
#     #     -mcpu unfortunately has different
#     #     semantics for different targets. It's
#     #     deprecated for x86 (being a synonym for
#     #     -mtune) but not for ARM, where it's a
#     #     sum of -march and -mtune.
#     #
#     #     So to answer your question - on
#     #     ARM, always use -mcpu for best
#     #     performance, unless you care for
#     #     backwards compatibility.
#     #     ----------citation----end---------------
#     MMMV_CFLAGS_TEMPLATE=" -march=native -mtune=native -mcpu=cortex-a72 $MMMV_CFLAGS_COMMON "
#     #
#     #
#     #

if [ "$CFLAGS" == "" ]; then
    export CFLAGS=" $MMMV_CFLAGS_TEMPLATE "
fi
if [ "$CXXFLAGS" == "" ]; then
    export CXXFLAGS=" $MMMV_CFLAGS_TEMPLATE "
fi

# The clang and clang++ seem to introduce
# linking problems on Raspberry Pi 3, Raspbian.
# A general rule is that binaries produced by
# different C/C++ compilers can not be linked together.
#     # export CC="clang"
#     # export CXX="clang++"
if [ "$CC" == "" ]; then
    export CC="gcc"
fi
if [ "$CXX" == "" ]; then
    export CXX="g++"
fi

#--------------------------------------------------------------------------
# Implementation
#--------------------------------------------------------------------------
if [ "`whoami`" != "root" ]; then
    echo ""
    echo "This script is meant to be executed only by the root user."
    echo "GUID=='b3510012-204c-4786-8914-e072107179e7'"
    echo ""
fi
#--------------------------------------------------------------------------
SB_OPERATINGSYSTEM_BSD="f"                    # domain: {"f","t"}
SB_OPERATINGSYSTEM_BSD_FREEBSD="f"            # domain: {"f","t"}
SB_OPERATINGSYSTEM_LINUX="f"                  # domain: {"f","t"}
SB_OPERATINGSYSTEM_LINUX_WSL="f"              # domain: {"f","t"}
SB_OPERATINGSYSTEM_LINUX_ANDROID="f"          # domain: {"f","t"}
SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX="f"   # domain: {"f","t"}
#------------------------------------------
S_UNAME_A="`uname -a `"
S_TMP_0="`echo \"$S_UNAME_A\" | grep -i Linux`"
if [ "$S_TMP_0" != "" ]; then
    SB_OPERATINGSYSTEM_LINUX="t"
    S_TMP_1="`echo \"$S_UNAME_A\" | grep -i -E '(Microsoft|Windows)' `"
    if [ "$S_TMP_1" != "" ]; then
        SB_OPERATINGSYSTEM_LINUX_WSL="t"
    else
        S_TMP_0="`echo \"$S_UNAME_A\" | grep -i Android `"
        if [ "$S_TMP_0" != "" ]; then
            #--------------------
            SB_OPERATINGSYSTEM_LINUX_ANDROID="t"
            #--------------------
            # https://www.reddit.com/r/termux/comments/voultk/safe_way_to_detect_if_inside_termux/
            # archival copy: https://archive.ph/Twy3q
            if [ "$TERMUX_VERSION" != "" ]; then
                SB_PKG_EXISTS_ON_PATH="f"
                if [ "`which pkg 2> /dev/null`" != "" ]; then
                    SB_PKG_EXISTS_ON_PATH="t"
                    S_TMP_1="`echo \"$PREFIX\" | grep -i 'termux' `"
                    if [ "$S_TMP_1" != "" ]; then
                        SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX="t" # one hopes
                    fi
                fi
            fi
            #--------------------
        fi
    fi
else
    #----------------------------------------------------------------------
    S_TMP_0="`echo \"$S_UNAME_A\" | grep -i BSD `"
    if [ "$S_TMP_0" != "" ]; then
        SB_OPERATINGSYSTEM_BSD="t"
        S_TMP_1="`echo \"$S_UNAME_A\" | grep -i 'FreeBSD' `"
        if [ "$S_TMP_1" != "" ]; then
            SB_OPERATINGSYSTEM_BSD_FREEBSD="t"
        fi
    else
        echo ""
        echo -e "\e[31mThe operating system is neither Linux, nor BSD. \e[39m"
        echo "The mmmv aliases are probably not tested "
        echo "with the current operating system."
        echo "GUID=='5e533764-7ce0-4b66-b644-e072107179e7'"
        echo ""
    fi
    #----------------------------------------------------------------------
fi
#--------------------------------------------------------------------------
func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1(){
    local S_CONSOLE_PROGRAM_NAME="$1"
    local S_GUID_CANDIDATE="$2"
    #--------------------
    if [ "$S_GUID_CANDIDATE" == "" ]; then
        echo ""
        echo -e "\e[31mThe value of the S_GUID_CANDIDATE is an empty string\e[39m,"
        echo "but it is expected to be a GUID."
        echo "GUID=='3df3d651-a1ff-41bc-b514-e072107179e7'"
        echo ""
    fi
    #--------------------
    echo ""
    if [ "$S_CONSOLE_PROGRAM_NAME" != "" ]; then
        echo -e "The console program \"\e[31m$S_CONSOLE_PROGRAM_NAME\e[39m\" is missing form PATH."
        if [ "$S_GUID_CANDIDATE" != "" ]; then
            echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        fi
        echo "GUID=='109bba52-61f5-496d-9914-e072107179e7'"
    else
        echo -e "\e[31mThe value of the S_CONSOLE_PROGRAM_NAME is an empty string\e[39m,"
        echo "but it is expected to be a console program name, which "
        echo "can not be an empty string."
        if [ "$S_GUID_CANDIDATE" != "" ]; then
            echo "S_GUID_CANDIDATE=='$S_GUID_CANDIDATE'"
        fi
        echo "GUID=='19bdc5b5-cb29-45ba-a523-e072107179e7'"
    fi
    echo ""
    #--------------------
} # func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1
#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
       alias mmmv_cp_f_R_preserve_file_attributes_t1="nice -n 14 cp -f -R --preserve=all --no-dereference "
    fi
fi
#--------------------------------------------------------------------------
SB_BASHRC_SUBPART_FUNC_CORE_T1_FOR_ROOT_LOADED="f"
S_FP_0="/root/mmmv_userspace_distro_t1_components_for_root/lib/_bashrc_subpart_func_core_t1_for_root"
if [ -e "$S_FP_0" ]; then
    if [ -d "$S_FP_0" ]; then
        echo ""
        echo "/root/.bashrc subpart, the "
        echo ""
        echo "    $S_FP_0"
        echo ""
        if [ -h "$S_FP_0" ]; then
            echo "is a symlink to a folder, but a file is expected."
        else
            echo "is a folder, but a file is expected."
        fi
        echo "GUID=='4b51f6a2-3f34-4206-ad13-e072107179e7'"
        echo ""
    else
        if [ -h "$S_FP_0" ]; then
            echo ""
            echo "/root/.bashrc subpart, the "
            echo ""
            echo "    $S_FP_0"
            echo ""
            echo "is a symlink to a file, but for safety reasons a file is expected."
            echo "GUID=='36d16934-2ec0-4a8d-aa33-e072107179e7'"
            echo ""
        else
            # The value of the SB_BASHRC_SUBPART_FUNC_CORE_T1_FOR_ROOT_LOADED is
            # meant to be upgraded at the
            source "$S_FP_0"
            if [ "$SB_BASHRC_SUBPART_FUNC_CORE_T1_FOR_ROOT_LOADED" != "t" ]; then
                echo ""
                echo "There's a flaw in the "
                echo ""
                echo "    $S_FP_0"
                echo ""
                echo "    SB_BASHRC_SUBPART_FUNC_CORE_T1_FOR_ROOT_LOADED==\"$SB_BASHRC_SUBPART_FUNC_CORE_T1_FOR_ROOT_LOADED\""
                echo ""
                echo "but it is expected to be \"t\"."
                echo "GUID=='26e189a4-ec28-4791-9853-e072107179e7'"
                echo ""
            fi
        fi
    fi
else
    echo ""
    echo "/root/.bashrc subpart, the "
    echo ""
    echo "    $S_FP_0"
    echo ""
    if [ -h "$S_FP_0" ]; then
        echo "is a broken symlink."
    else
        echo "is missing."
    fi
    echo "GUID=='242863c5-2a93-4521-ad33-e072107179e7'"
    echo ""
fi

#--------------------------------------------------------------------------
export MMMV_USERSPACE_DISTRO_T1_ADMIN_ROOT_COMPONENTS_T1_ORIG="/home/mmmv/mmmv_userspace_distro_t1/mmmv/lib/templates/components_for_root"
export MMMV_USERSPACE_DISTRO_T1_ADMIN_ROOT_COMPONENTS_T1_DEST="/root/mmmv_userspace_distro_t1_components_for_root"
if [ "$SB_BASHRC_SUBPART_FUNC_CORE_T1_FOR_ROOT_LOADED" == "t" ]; then
    SB_VERIFICATION_FAILED="t"
    func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
        "$MMMV_USERSPACE_DISTRO_T1_ADMIN_ROOT_COMPONENTS_T1_ORIG" \
        "1a3f3a84-aef4-4eed-9254-e072107179e7"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        alias mmmv_admin_root_overwrite_root_bashrc_subcomponents_t1="\
        if [ \"/root/mmmv_userspace_distro_t1_components_for_root\" != \"$MMMV_USERSPACE_DISTRO_T1_ADMIN_ROOT_COMPONENTS_T1_DEST\" ]; then \
            echo '' ; \
            echo 'This script is flawed.' ; \
            echo \"GUID=='ac953771-a827-44b5-bd23-e072107179e7'\" ; \
            echo '' ; \
        fi ; \
        if [ -e \"$MMMV_USERSPACE_DISTRO_T1_ADMIN_ROOT_COMPONENTS_T1_ORIG\" ]; then \
            sync ; \
            if [ -e /root/mmmv_userspace_distro_t1_components_for_root ]; then \
                mv /root/mmmv_userspace_distro_t1_components_for_root \
                   /root/mmmv_userspace_distro_t1_components_for_root_\`date +%Y\`_\`date +%m\`_\`date +%d\`_T_\`date +%H\`h_\`date +%M\`min_\`date +%S\`s ; \
                sync ; wait ; \
            fi ; \
            cp -f -R $MMMV_USERSPACE_DISTRO_T1_ADMIN_ROOT_COMPONENTS_T1_ORIG $MMMV_USERSPACE_DISTRO_T1_ADMIN_ROOT_COMPONENTS_T1_DEST ; \
            sync ; wait ; \
            chmod -f -R 0700 $MMMV_USERSPACE_DISTRO_T1_ADMIN_ROOT_COMPONENTS_T1_DEST ; \
            chown -f -R root $MMMV_USERSPACE_DISTRO_T1_ADMIN_ROOT_COMPONENTS_T1_DEST ; \
            chmod -f -R 0700 $MMMV_USERSPACE_DISTRO_T1_ADMIN_ROOT_COMPONENTS_T1_DEST ; \
            sync ; wait ; \
        else \
            echo '' ; \
            echo 'The folder with the path of ' ; \
            echo '' ; \
            echo '    $MMMV_USERSPACE_DISTRO_T1_ADMIN_ROOT_COMPONENTS_T1_ORIG ' ; \
            echo '' ; \
            echo 'does not exist.' ; \
            echo \"GUID=='3dc56d94-a5ac-4081-8e53-e072107179e7'\" ; \
            echo '' ; \
        fi "
    fi
fi
#--------------------------------------------------------------------------
# A citation from
#
#     https://www.howtogeek.com/177621/the-beginners-guide-to-iptables-the-linux-firewall/
#
#     ---citation--start-----
#     Even though pinging an external host seems like
#     something that would only need to traverse the
#     output chain, keep in mind that to return the data,
#     the input chain will be used as well.
#     When using iptables to lock down your system,
#     remember that a lot of protocols will require
#     two-way communication, so both the input and
#     output chains will need to be configured properly.
#     SSH is a common protocol that people forget
#     to allow on both chains.
#     ---citation--end-------
#
# Some iptables related links:
#
#     https://www.cyberciti.biz/tips/block-outgoing-network-access-for-a-single-user-from-my-server-using-iptables.html
#     (archival copy: https://archive.is/l8EYe )
#
#     ---citation--start-----
#     #Create a new chain
#     iptables --new-chain chk_apache_user
#
#     # use new chain to process packets generated by apache
#     iptables -A OUTPUT -m owner --uid-owner apache -j chk_apache_user
#     ---citation--end-------
#
#--------------------
if [ "$SB_IPTABLES_EXISTS_ON_PATH" == "" ]; then
    SB_IPTABLES_EXISTS_ON_PATH="f"
    if [ "`which iptables 2> /dev/null`" != "" ]; then
        SB_IPTABLES_EXISTS_ON_PATH="t"
        alias mmmv_admin_firewall_iptables_ls="iptables -L -v " # lists the rules
        alias mmmv_admin_firewall_iptables_create_chain_of_filters="iptables --new-chain " # <chain name>
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "iptables" "839b53ff-759d-4922-ab24-e072107179e7"
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_FIND_EXISTS_ON_PATH" == "" ]; then
    SB_FIND_EXISTS_ON_PATH="f"
    if [ "`which find 2> /dev/null`" != "" ]; then
        SB_FIND_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "find" "69123753-03f4-4e2c-b844-e072107179e7"
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_UFW_EXISTS_ON_PATH" == "" ]; then
    if [ "$SB_IPTABLES_EXISTS_ON_PATH" == "t" ]; then
        #------------------------------------------------------------------
        SB_UFW_EXISTS_ON_PATH="f"
        # https://launchpad.net/ufw
        # ufw is an iptables wrapper.
        # There MIGHT be some further documentation aobut the UFW at
        # $MMMV_USERSPACE_DISTRO_T1_HOME/attic/documentation/third_party_documentation/Linux_and_BSD_administration/Linux_firewalls/UFW
        if [ "`which ufv 2> /dev/null`" != "" ]; then
            SB_UFW_EXISTS_ON_PATH="t"
            alias mmmv_admin_firewall_ufw_ls_status="ufw status "
            alias mmmv_admin_firewall_ufw_start_filtering="ufw enable "
            alias mmmv_admin_firewall_ufw_stop_filtering="ufw disable "
            #--------
            # Equivalent to:
            #     ufw allow 22
            alias mmmv_admin_firewall_ufw_allow_ssh="ufw allow ssh "
            alias mmmv_admin_firewall_ufw_block_ssh="ufw delete allow ssh "
            #--------
            # Equivalent to:
            #     ufw allow 80
            alias mmmv_admin_firewall_ufw_allow_http="ufw allow http "
            alias mmmv_admin_firewall_ufw_block_http="ufw delete allow http "
            #--------
            # Equivalent to:
            #     ufw allow 443
            alias mmmv_admin_firewall_ufw_allow_https="ufw allow https "
            alias mmmv_admin_firewall_ufw_block_https="ufw delete allow https "
            #--------
            if [ "$SB_UFW_EXISTS_ON_PATH" == "" ]; then
                SB_UFW_EXISTS_ON_PATH="f"
                if [ "`which gufw 2> /dev/null`" != "" ]; then
                    SB_UFW_EXISTS_ON_PATH="t"
                else
                    func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                        "gufw" "4cceef52-ccd0-42b4-a154-e072107179e7"
                fi
            fi
            #--------
        else
            func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
                "ufv" "1305247b-0764-4b38-b824-e072107179e7"
        fi
        #------------------------------------------------------------------
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_APT_EXISTS_ON_PATH" == "" ]; then
    SB_APT_EXISTS_ON_PATH="f"
    if [ "`which apt 2> /dev/null`" != "" ]; then
        SB_APT_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "apt" "26f2a2b5-937a-4ba6-bb34-e072107179e7"
    fi
fi
#----------------
if [ "$SB_GREP_EXISTS_ON_PATH" == "" ]; then
    SB_GREP_EXISTS_ON_PATH="f"
    if [ "`which grep 2> /dev/null`" != "" ]; then
        SB_GREP_EXISTS_ON_PATH="t"
        alias grep='grep --color=auto '
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "grep" "b568e900-8082-49ab-b253-e072107179e7"
    fi
fi
#--------------------
if [ "$SB_SED_EXISTS_ON_PATH" == "" ]; then
    SB_SED_EXISTS_ON_PATH="f"
    if [ "`which sed 2> /dev/null`" != "" ]; then
        SB_SED_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "sed" "42edcbb1-225f-4e67-8333-e072107179e7"
    fi
fi
#--------------------
if [ "$SB_GAWK_EXISTS_ON_PATH" == "" ]; then
    SB_GAWK_EXISTS_ON_PATH="f"
    if [ "`which gawk 2> /dev/null`" != "" ]; then
        SB_GAWK_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "gawk" "258a4335-0c0c-4f6c-b353-e072107179e7"
    fi
fi
#--------------------
if [ "$SB_XARGS_EXISTS_ON_PATH" == "" ]; then
    SB_XARGS_EXISTS_ON_PATH="f"
    if [ "`which xargs 2> /dev/null`" != "" ]; then
        SB_XARGS_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "xargs" "2a9c7781-0edd-449a-9033-e072107179e7"
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_APTGET_EXISTS_ON_PATH" == "" ]; then
    SB_APTGET_EXISTS_ON_PATH="f"
    if [ "`which apt-get 2> /dev/null`" != "" ]; then
        SB_APTGET_EXISTS_ON_PATH="t"
        alias mmmv_admin_install="  apt-get install "
        alias mmmv_admin_uninstall="apt-get remove "
        #------------------------------------------------------------------
        if [ "$SB_APT_EXISTS_ON_PATH" == "t" ]; then
            if [ "$SB_SED_EXISTS_ON_PATH" == "t" ]; then
                if [ "$SB_GREP_EXISTS_ON_PATH" == "t" ]; then
                    #--------
                    alias mmmv_admin_uninstall_dbg_packages="apt-get remove \`apt installed 2>/dev/null | grep -E \"[-]dbg/\" | sed -e 's/\\/.\\+//g' | xargs echo\` ; sync; wait; sync; "
                    #--------
                    alias mmmv_admin_uninstall_profiling_packages="apt-get remove \`apt installed 2>/dev/null | grep -E \"[-]prof[/]\" | sed -e 's/\\/.\\+//g' | xargs echo \` ; sync; wait; sync; "
                    #--------
                    alias mmmv_ls_packages_installed_t1="nice -n 10 apt installed 2>/dev/null ; sync ;"
                    # sync is to stay consistent with the other
                    #--------
                    if [ "$SB_GAWK_EXISTS_ON_PATH" == "t" ]; then
                        #--------------------
                        alias mmmv_admin_uninstall_i386_packages="apt-get remove \`apt installed 2>/dev/null | grep -E \" i386 \" | sed -e 's/\\/.\\+//g' | gawk '{s0=\$1; s1=\":i386\"; s2=s0\"\"s1; print s2}' | xargs echo \` ; sync; wait; sync; "
                        #--------------------
                        # Testline:
                        #S_TIMESTAMP="`date +%Y`_`date +%m`_`date +%d`_T_`date +%H`h_`date +%M`min_`date +%S`s" ; S_SUFFIX_PACKAGES="_installed_packages_temporary.txt"; S_FP_INSTALLED_PACKAGES="/tmp/$S_TIMESTAMP$S_SUFFIX_PACKAGES"; S_SUFFIX_I386="_i386_package_names_temporary.txt" ; S_FP_I386_PACKAGE_NAMES="/tmp/$S_TIMESTAMP$S_SUFFIX_I386" ; apt installed 2>/dev/null > $S_FP_INSTALLED_PACKAGES ; chmod 0700 $S_FP_INSTALLED_PACKAGES ; sync ; wait ; sync ; cat $S_FP_INSTALLED_PACKAGES | grep -E " i386 " | sed -e 's/\/.\+//g' | gawk '{s0=$1; s1=":i386"; s2=s0""s1; print s2}' | xargs echo > $S_FP_I386_PACKAGE_NAMES ; sync; wait; sync; cat $S_FP_INSTALLED_PACKAGES | grep -E "[-](prof|dbg)[/]" | sed -e 's/\/.\+//g' | xargs echo  >> $S_FP_I386_PACKAGE_NAMES ; sync ; wait ; sync ; cat $S_FP_I386_PACKAGE_NAMES | sed -e 's/$/ /g' | tr -d "\n" ; wait ; rm -f $S_FP_I386_PACKAGE_NAMES ; rm -f $S_FP_INSTALLED_PACKAGES ;
                        #--------------------
                        alias mmmv_admin_uninstall_unused_types_of_packages_dbg_i386_prof="apt-get remove \`S_TIMESTAMP=\"\\\`date +%Y\\\`_\\\`date +%m\\\`_\\\`date +%d\\\`_T_\\\`date +%H\\\`h_\\\`date +%M\\\`min_\\\`date +%S\\\`s\" ; S_SUFFIX_PACKAGES=\"_installed_packages_temporary.txt\" ; S_FP_INSTALLED_PACKAGES=\"/tmp/\$S_TIMESTAMP\$S_SUFFIX_PACKAGES\" ; S_SUFFIX_I386=\"_i386_package_names_temporary.txt\" ; S_FP_I386_PACKAGE_NAMES=\"/tmp/\$S_TIMESTAMP\$S_SUFFIX_I386\" ; apt installed 2>/dev/null > \$S_FP_INSTALLED_PACKAGES ; chmod 0700 \$S_FP_INSTALLED_PACKAGES ; sync ; wait ; sync ; cat \$S_FP_INSTALLED_PACKAGES | grep -E \" i386 \" | sed -e 's/\\/.\\+//g' | gawk '{s0=\$1; s1=\":i386\"; s2=s0\"\"s1; print s2}' | xargs echo > \$S_FP_I386_PACKAGE_NAMES ; chmod 0700 \$S_FP_I386_PACKAGE_NAMES ; sync ; wait ; sync ; cat \$S_FP_INSTALLED_PACKAGES | grep -E \"[-](prof|dbg)[/]\" | sed -e 's/\\/.\\+//g' | xargs echo  >> \$S_FP_I386_PACKAGE_NAMES ; sync ; wait ; sync ; cat \$S_FP_I386_PACKAGE_NAMES | sed -e 's/\$/ /g' | tr -d \"\\n\" ; wait ; rm -f \$S_FP_I386_PACKAGE_NAMES ; rm -f \$S_FP_INSTALLED_PACKAGES ;\`"
                        #--------------------
                    fi
                    #--------
                fi
            fi
        fi
        #------------------------------------------------------------------
        # The
        alias mmmv_admin_install_c_cpp_valgrind_t1="apt-get install valgrind valgrind-mpi "
        # is useful, because the deinstallation of dbg packages also uninstalls
        #     libc6-dbg
        #     valgrind-dbg
        # and everything that depend on them, including the valgrind.
        #------------------------------------------------------------------
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "apt-get" "dc2793e0-c606-439a-af13-e072107179e7"
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_APTITUDE_EXISTS_ON_PATH" == "" ]; then
    SB_APTITUDE_EXISTS_ON_PATH="f"
    if [ "`which aptitude 2> /dev/null`" != "" ]; then
        SB_APTITUDE_EXISTS_ON_PATH="t"
        alias mmmv_aptitude_search="nice -n 2 aptitude search "
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "aptitude" "04a1cb24-b4f7-4f9e-8413-e072107179e7"
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_SERVICE_EXISTS_ON_PATH" == "" ]; then
    SB_SERVICE_EXISTS_ON_PATH="f"
    if [ "`which service 2> /dev/null`" != "" ]; then
        SB_SERVICE_EXISTS_ON_PATH="t"
        alias mmmv_ls_daemons_Linux_service_t1="nice -n 4 service --status-all  "
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "service" "5642d583-ff05-443c-9233-e072107179e7"
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_SYSTEMCTL_EXISTS_ON_PATH" == "" ]; then
    SB_SYSTEMCTL_EXISTS_ON_PATH="f"
    if [ "`which systemctl 2> /dev/null`" != "" ]; then
    #----------------
        SB_SYSTEMCTL_EXISTS_ON_PATH="t"
        alias mmmv_ls_daemons_Linux_systemctl_t2="nice -n 4 systemctl list-units --type=service "
        #----------------
        # https://unix.stackexchange.com/questions/529471/debian-10-adjust-sleep-settings-via-command-line
        alias mmmv_admin_sleep_disable_t1="sudo systemctl mask   sleep.target suspend.target hibernate.target hybrid-sleep.target"
        alias mmmv_admin_sleep_enable_t1=" sudo systemctl unmask sleep.target suspend.target hibernate.target hybrid-sleep.target"
        #----------------
        # else
        #     func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
        #         "systemctl" "58e7d224-814f-4cf3-8f13-e072107179e7"
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_DU_EXISTS_ON_PATH" == "" ]; then
    SB_DU_EXISTS_ON_PATH="f"
    if [ "`which du 2> /dev/null`" != "" ]; then
        SB_DU_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "du" "251fedb2-22b4-4e21-9923-e072107179e7"
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
    if [ "$SB_DU_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_lssize_recursive_t1_Linux="nice -n 5 du  --human-readable --summarize ./ "
    fi
    if [ "`which restart 2> /dev/null`" == "" ]; then
        alias restart="reboot " # in Windows world the rebooting is called "restarting the computer"
    fi
fi
if [ "$SB_OPERATINGSYSTEM_BSD" == "t" ]; then
    alias mmmv_ls_BKMG="nice -n 2 ls -lh "
    if [ "$SB_DU_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_lssize_recursive_t1_BSD="nice -n 5 du -sh ./ "
    fi
fi
#--------------------------------------------------------------------------
if [ "$EDITOR" == "" ]; then
    #S_TMP_0="`which mcedit 2> /dev/null`" # a more primitive choice
    S_TMP_0="`which vim 2> /dev/null`"
    if [ "$S_TMP_0" != "" ]; then
        export EDITOR="$S_TMP_0"
    fi
fi
#--------------------------------------------------------------------------
# Value examples for the
#
#     cat /sys/block/sda/queue/scheduler
#
# are
#
#     noop deadline [cfq]
#
# and
#
#     [mq-deadline] none
#
# A command like
#
#     echo "thatdoesnotpossiblyexist" > /sys/block/sda/queue/scheduler
#
# will keep the existing scheduling mode and it will give an error messge.
# To keep the root ~/.bashrc as fast and robust as possible, the use of
# console programs during the execution of the ~/.bashrc
# tends to be avoided here.
#----------------
S_TMP_0="/sys/block/sda/queue/scheduler"
if [ -e "$S_TMP_0" ]; then
    alias mmmv_ls_scheduler_sda="nice -n 5 cat $S_TMP_0 "
    alias mmmv_admin_set_sda_scheduler_adios="echo \"adios\" > $S_TMP_0 "
    alias mmmv_admin_set_sda_scheduler_bfq="echo \"bfq\" > $S_TMP_0 "
    alias mmmv_admin_set_sda_scheduler_cfq="echo  \"cfq\"  > $S_TMP_0 "
    alias mmmv_admin_set_sda_scheduler_deadline="echo \"deadline\" > $S_TMP_0 "
    alias mmmv_admin_set_sda_scheduler_kyber="echo \"kyber\" > $S_TMP_0 "
    alias mmmv_admin_set_sda_scheduler_mqdeadline="echo \"mq-deadline\" > $S_TMP_0 "
    alias mmmv_admin_set_sda_scheduler_none="echo \"none\" > $S_TMP_0 "
    alias mmmv_admin_set_sda_scheduler_noop="echo \"noop\" > $S_TMP_0 "
fi
#----------------
S_TMP_0="/sys/block/sdb/queue/scheduler"
if [ -e "$S_TMP_0" ]; then
    alias mmmv_ls_scheduler_sdb="nice -n 5 cat $S_TMP_0 " # noop deadline [cfq]
    alias mmmv_admin_set_sdb_scheduler_adios="echo \"adios\" > $S_TMP_0 "
    alias mmmv_admin_set_sdb_scheduler_bfq="echo \"bfq\" > $S_TMP_0 "
    alias mmmv_admin_set_sdb_scheduler_cfq="echo  \"cfq\"  > $S_TMP_0 "
    alias mmmv_admin_set_sdb_scheduler_deadline="echo \"deadline\" > $S_TMP_0 "
    alias mmmv_admin_set_sdb_scheduler_kyber="echo \"kyber\" > $S_TMP_0 "
    alias mmmv_admin_set_sdb_scheduler_mqdeadline="echo \"mq-deadline\" > $S_TMP_0 "
    alias mmmv_admin_set_sdb_scheduler_none="echo \"none\" > $S_TMP_0 "
    alias mmmv_admin_set_sdb_scheduler_noop="echo \"noop\" > $S_TMP_0 "
fi
#----------------
S_TMP_0="/sys/block/sdc/queue/scheduler"
if [ -e "$S_TMP_0" ]; then
    alias mmmv_ls_scheduler_sdc="nice -n 5 cat $S_TMP_0 " # noop deadline [cfq]
    alias mmmv_admin_set_sdc_scheduler_adios="echo \"adios\" > $S_TMP_0 "
    alias mmmv_admin_set_sdc_scheduler_bfq="echo \"bfq\" > $S_TMP_0 "
    alias mmmv_admin_set_sdc_scheduler_cfq="echo  \"cfq\"  > $S_TMP_0 "
    alias mmmv_admin_set_sdc_scheduler_deadline="echo \"deadline\" > $S_TMP_0 "
    alias mmmv_admin_set_sdc_scheduler_kyber="echo \"kyber\" > $S_TMP_0 "
    alias mmmv_admin_set_sdc_scheduler_mqdeadline="echo \"mq-deadline\" > $S_TMP_0 "
    alias mmmv_admin_set_sdc_scheduler_none="echo \"none\" > $S_TMP_0 "
    alias mmmv_admin_set_sdc_scheduler_noop="echo \"noop\" > $S_TMP_0 "
fi
#----------------
S_TMP_0="/sys/block/sdd/queue/scheduler"
if [ -e "$S_TMP_0" ]; then
    alias mmmv_ls_scheduler_sdd="nice -n 5 cat $S_TMP_0 " # noop deadline [cfq]
    alias mmmv_admin_set_sdd_scheduler_adios="echo \"adios\" > $S_TMP_0 "
    alias mmmv_admin_set_sdd_scheduler_bfq="echo \"bfq\" > $S_TMP_0 "
    alias mmmv_admin_set_sdd_scheduler_cfq="echo  \"cfq\"  > $S_TMP_0 "
    alias mmmv_admin_set_sdd_scheduler_deadline="echo \"deadline\" > $S_TMP_0 "
    alias mmmv_admin_set_sdd_scheduler_kyber="echo \"kyber\" > $S_TMP_0 "
    alias mmmv_admin_set_sdd_scheduler_mqdeadline="echo \"mq-deadline\" > $S_TMP_0 "
    alias mmmv_admin_set_sdd_scheduler_none="echo \"none\" > $S_TMP_0 "
    alias mmmv_admin_set_sdd_scheduler_noop="echo \"noop\" > $S_TMP_0 "
fi
#----------------
S_TMP_0="/sys/block/sde/queue/scheduler"
if [ -e "$S_TMP_0" ]; then
    alias mmmv_ls_scheduler_sde="nice -n 5 cat $S_TMP_0 " # noop deadline [cfq]
    alias mmmv_admin_set_noop_scheduler_adios="echo \"adios\" > $S_TMP_0 "
    alias mmmv_admin_set_noop_scheduler_bfq="echo \"bfq\" > $S_TMP_0 "
    alias mmmv_admin_set_noop_scheduler_kyber="echo \"kyber\" > $S_TMP_0 "
    alias mmmv_admin_set_sde_scheduler_cfq="echo  \"cfq\"  > $S_TMP_0 "
    alias mmmv_admin_set_sde_scheduler_deadline="echo \"deadline\" > $S_TMP_0 "
    alias mmmv_admin_set_sde_scheduler_mqdeadline="echo \"mq-deadline\" > $S_TMP_0 "
    alias mmmv_admin_set_sde_scheduler_none="echo \"none\" > $S_TMP_0 "
    alias mmmv_admin_set_sde_scheduler_noop="echo \"noop\" > $S_TMP_0 "
fi
#----------------
S_TMP_0="/sys/block/sdf/queue/scheduler"
if [ -e "$S_TMP_0" ]; then
    alias mmmv_ls_scheduler_sdf="nice -n 5 cat $S_TMP_0 " # noop deadline [cfq]
    alias mmmv_admin_set_sdf_scheduler_adios="echo \"adios\" > $S_TMP_0 "
    alias mmmv_admin_set_sdf_scheduler_bfq="echo \"bfq\" > $S_TMP_0 "
    alias mmmv_admin_set_sdf_scheduler_cfq="echo  \"cfq\"  > $S_TMP_0 "
    alias mmmv_admin_set_sdf_scheduler_deadline="echo \"deadline\" > $S_TMP_0 "
    alias mmmv_admin_set_sdf_scheduler_kyber="echo \"kyber\" > $S_TMP_0 "
    alias mmmv_admin_set_sdf_scheduler_mqdeadline="echo \"mq-deadline\" > $S_TMP_0 "
    alias mmmv_admin_set_sdf_scheduler_none="echo \"none\" > $S_TMP_0 "
    alias mmmv_admin_set_sdf_scheduler_noop="echo \"noop\" > $S_TMP_0 "
fi
#----------------
S_TMP_0="/sys/block/sdg/queue/scheduler"
if [ -e "$S_TMP_0" ]; then
    alias mmmv_ls_scheduler_sdg="nice -n 5 cat $S_TMP_0 " # noop deadline [cfq]
    alias mmmv_admin_set_sdg_scheduler_adios="echo \"adios\" > $S_TMP_0 "
    alias mmmv_admin_set_sdg_scheduler_bfq="echo \"bfq\" > $S_TMP_0 "
    alias mmmv_admin_set_sdg_scheduler_cfq="echo  \"cfq\"  > $S_TMP_0 "
    alias mmmv_admin_set_sdg_scheduler_deadline="echo \"deadline\" > $S_TMP_0 "
    alias mmmv_admin_set_sdg_scheduler_kyber="echo \"kyber\" > $S_TMP_0 "
    alias mmmv_admin_set_sdg_scheduler_mqdeadline="echo \"mq-deadline\" > $S_TMP_0 "
    alias mmmv_admin_set_sdg_scheduler_none="echo \"none\" > $S_TMP_0 "
    alias mmmv_admin_set_sdg_scheduler_noop="echo \"noop\" > $S_TMP_0 "
fi
#----------------
S_TMP_0="/sys/block/sdh/queue/scheduler"
if [ -e "$S_TMP_0" ]; then
    alias mmmv_ls_scheduler_sdh="nice -n 5 cat $S_TMP_0 " # noop deadline [cfq]
    alias mmmv_admin_set_sdh_scheduler_adios="echo \"adios\" > $S_TMP_0 "
    alias mmmv_admin_set_sdh_scheduler_bfq="echo \"bfq\" > $S_TMP_0 "
    alias mmmv_admin_set_sdh_scheduler_cfq="echo  \"cfq\"  > $S_TMP_0 "
    alias mmmv_admin_set_sdh_scheduler_deadline="echo \"deadline\" > $S_TMP_0 "
    alias mmmv_admin_set_sdh_scheduler_kyber="echo \"kyber\" > $S_TMP_0 "
    alias mmmv_admin_set_sdh_scheduler_mqdeadline="echo \"mq-deadline\" > $S_TMP_0 "
    alias mmmv_admin_set_sdh_scheduler_none="echo \"none\" > $S_TMP_0 "
    alias mmmv_admin_set_sdh_scheduler_noop="echo \"noop\" > $S_TMP_0 "
fi
#----------------
S_TMP_0="/sys/block/sdi/queue/scheduler"
if [ -e "$S_TMP_0" ]; then
    alias mmmv_ls_scheduler_sdi="nice -n 5 cat $S_TMP_0 " # noop deadline [cfq]
    alias mmmv_admin_set_sdi_scheduler_adios="echo \"adios\" > $S_TMP_0 "
    alias mmmv_admin_set_sdi_scheduler_bfq="echo \"bfq\" > $S_TMP_0 "
    alias mmmv_admin_set_sdi_scheduler_cfq="echo  \"cfq\"  > $S_TMP_0 "
    alias mmmv_admin_set_sdi_scheduler_deadline="echo \"deadline\" > $S_TMP_0 "
    alias mmmv_admin_set_sdi_scheduler_kyber="echo \"kyber\" > $S_TMP_0 "
    alias mmmv_admin_set_sdi_scheduler_mqdeadline="echo \"mq-deadline\" > $S_TMP_0 "
    alias mmmv_admin_set_sdi_scheduler_none="echo \"none\" > $S_TMP_0 "
    alias mmmv_admin_set_sdi_scheduler_noop="echo \"noop\" > $S_TMP_0 "
fi
#----------------
S_TMP_0="/sys/block/sdj/queue/scheduler"
if [ -e "$S_TMP_0" ]; then
    alias mmmv_ls_scheduler_sdj="nice -n 5 cat $S_TMP_0 " # noop deadline [cfq]
    alias mmmv_admin_set_sdj_scheduler_adios="echo \"adios\" > $S_TMP_0 "
    alias mmmv_admin_set_sdj_scheduler_bfq="echo \"bfq\" > $S_TMP_0 "
    alias mmmv_admin_set_sdj_scheduler_cfq="echo  \"cfq\"  > $S_TMP_0 "
    alias mmmv_admin_set_sdj_scheduler_deadline="echo \"deadline\" > $S_TMP_0 "
    alias mmmv_admin_set_sdj_scheduler_kyber="echo \"kyber\" > $S_TMP_0 "
    alias mmmv_admin_set_sdj_scheduler_mqdeadline="echo \"mq-deadline\" > $S_TMP_0 "
    alias mmmv_admin_set_sdj_scheduler_none="echo \"none\" > $S_TMP_0 "
    alias mmmv_admin_set_sdj_scheduler_noop="echo \"noop\" > $S_TMP_0 "
fi
#----------------
S_TMP_0="/sys/block/mmcblk0/queue/scheduler"
if [ -e "$S_TMP_0" ]; then
    alias mmmv_ls_scheduler_mmcblk0="nice -n 5 cat $S_TMP_0 " # noop deadline [cfq]
    alias mmmv_admin_set_mmcblk0_scheduler_adios="echo \"adios\" > $S_TMP_0 "
    alias mmmv_admin_set_mmcblk0_scheduler_bfq="echo \"bfq\" > $S_TMP_0 "
    alias mmmv_admin_set_mmcblk0_scheduler_cfq="echo  \"cfq\"  > $S_TMP_0 "
    alias mmmv_admin_set_mmcblk0_scheduler_deadline="echo \"deadline\" > $S_TMP_0 "
    alias mmmv_admin_set_mmcblk0_scheduler_kyber="echo \"kyber\" > $S_TMP_0 "
    alias mmmv_admin_set_mmcblk0_scheduler_mqdeadline="echo \"mq-deadline\" > $S_TMP_0 "
    alias mmmv_admin_set_mmcblk0_scheduler_none="echo \"none\" > $S_TMP_0 "
    alias mmmv_admin_set_mmcblk0_scheduler_noop="echo \"noop\" > $S_TMP_0 "
fi
#----------------
S_TMP_0="/sys/block/mmcblk1/queue/scheduler"
if [ -e "$S_TMP_0" ]; then
    alias mmmv_ls_scheduler_mmcblk1="nice -n 5 cat $S_TMP_0 " # noop deadline [cfq]
    alias mmmv_admin_set_mmcblk1_scheduler_adios="echo \"adios\" > $S_TMP_0 "
    alias mmmv_admin_set_mmcblk1_scheduler_bfq="echo \"bfq\" > $S_TMP_0 "
    alias mmmv_admin_set_mmcblk1_scheduler_cfq="echo  \"cfq\"  > $S_TMP_0 "
    alias mmmv_admin_set_mmcblk1_scheduler_deadline="echo \"deadline\" > $S_TMP_0 "
    alias mmmv_admin_set_mmcblk1_scheduler_kyber="echo \"kyber\" > $S_TMP_0 "
    alias mmmv_admin_set_mmcblk1_scheduler_mqdeadline="echo \"mq-deadline\" > $S_TMP_0 "
    alias mmmv_admin_set_mmcblk1_scheduler_none="echo \"none\" > $S_TMP_0 "
    alias mmmv_admin_set_mmcblk1_scheduler_noop="echo \"noop\" > $S_TMP_0 "
fi
#--------------------------------------------------------------------------
alias mmmv_admin_mount_noatime_nodiratime_t1="mount -o noatime,nodiratime "
#--------
S_TMP_0="mount -t ext4 -o "
S_TMP_1="noatime,nodiratime,user_xattr,acl,errors=remount-ro,barrier=1,journal_checksum,data=journal,commit=2"
alias mmmv_admin_mount_ext4_t1="$S_TMP_0 $S_TMP_1 " # at least one space at the end is necessary
S_TMP_2=",ro"
alias mmmv_admin_mount_ext4_readonly_t1="$S_TMP_0 $S_TMP_1$S_TMP_2 " # at least one space at the end is necessary
#--------
alias mmmv_admin_mount_exFAT_case_insensitive_t1="mount -t exfat -o rw,noatime,iocharset=utf8,errors=remount-ro "
#--------------------------------------------------------------------------
alias ls="ls --color " # works on both, Linux and FreeBSD
#--------------------------------------------------------------------------
# export MMMV_SP_MAGNET_01_MOUNTFOLDER="/home/librarian_01/salvestusseadmed/magnet_01_indeksid"
# export MMMV_CMD_MAGNET_01_UNMOUNTING="umount $MMMV_SP_MAGNET_01_MOUNTFOLDER ; "
# alias mmmv_admin_mount_magnet_01_readonly="$MMMV_CMD_MAGNET_01_UNMOUNTING \
#     mount -o ro,noatime --uuid ec7405f6-92a9-47a1-9b28-8e8d72bd8b91 $MMMV_SP_MAGNET_01_MOUNTFOLDER ; "
#
# alias mmmv_admin_mount_magnet_01="$MMMV_CMD_MAGNET_01_UNMOUNTING \
#     mount -o noatime    --uuid ec7405f6-92a9-47a1-9b28-8e8d72bd8b91 $MMMV_SP_MAGNET_01_MOUNTFOLDER ; "
#
# alias mmmv_admin_unmount_magnet_01="$MMMV_CMD_MAGNET_01_UNMOUNTING "
#
#==========================================================================
# S_VERSION_OF_THIS_FILE="32bddd34-8c9f-48be-a033-e072107179e7"
#==========================================================================
