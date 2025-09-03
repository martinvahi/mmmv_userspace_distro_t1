#!/usr/bin/env bash
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
#
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#==========================================================================
S_FP_DIR_TMP_0="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [ "$MMMV_USERSPACE_DISTRO_T1_HOME" == "" ]; then
    MMMV_USERSPACE_DISTRO_T1_HOME="`cd $S_FP_DIR_TMP_0/../../../../../; pwd`"
fi
#--------------------------------------------------------------------------
if [ "$MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1" != "mode_ok_to_load" ]; then
    S_ERR_CODE="1"
    echo ""
    echo "This script is expected to be a sub-part of the "
    #--------------------
    echo "$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/common_bashrc/common_bashrc_main.bash"
    #--------------------
    if [ "$MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1" != "" ]; then
        echo ""
        echo "    MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1==$MMMV_USERSPACE_DISTRO_T1_BASHRC_PREFIX_LOAD_MODE_T1"
        echo ""
    fi
    echo -e "\e[31mExiting with an error code $S_ERR_CODE . \e[39m"
    echo "GUID=='642585c1-f88d-4d6c-9356-8312503099e7'"
    echo ""
    exit $S_ERR_CODE # exit with an error
fi
#==========================================================================
func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
    "$SB_OPERATINGSYSTEM_LINUX" "SB_OPERATINGSYSTEM_LINUX" \
    "34ccdb04-3950-443d-8646-8312503099e7"
#------------------------------------------
func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
    "$SB_OPERATINGSYSTEM_LINUX_WSL" "SB_OPERATINGSYSTEM_LINUX_WSL" \
    "2f772651-9606-4cb9-a116-8312503099e7"
#------------------------------------------
func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
    "$SB_OPERATINGSYSTEM_LINUX_ANDROID" "SB_OPERATINGSYSTEM_LINUX_ANDROID" \
    "20232f55-d8cc-41b6-b736-8312503099e7"
#------------------------------------------
func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
    "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" "SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" \
    "4f0c8d92-a4c3-4ecc-a326-8312503099e7"
#------------------------------------------
func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
    "$SB_OPERATINGSYSTEM_BSD" "SB_OPERATINGSYSTEM_BSD" \
    "9158c458-082a-4596-a625-8312503099e7"
#------------------------------------------
func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
    "$SB_OPERATINGSYSTEM_BSD_FREEBSD" "SB_OPERATINGSYSTEM_BSD_FREEBSD" \
    "314306c2-7914-44d2-b135-8312503099e7"
#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_LINUX" == "f" ]; then
    if [ "$SB_OPERATINGSYSTEM_LINUX_WSL" == "t" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo -e "\e[31mThe code of this Bash file is flawed.\e[39m"
            echo "GUID=='a19c2790-ff36-45c7-a446-8312503099e7'"
            echo ""
        fi
    fi
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID" == "t" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo -e "\e[31mThe code of this Bash file is flawed.\e[39m"
            echo "GUID=='ceb5fbe3-7c54-466b-b836-8312503099e7'"
            echo ""
        fi
    fi
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "t" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo -e "\e[31mThe code of this Bash file is flawed.\e[39m"
            echo "GUID=='478d02b4-43d4-42fe-a836-8312503099e7'"
            echo ""
        fi
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID" == "f" ]; then
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "t" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo -e "\e[31mThe code of this Bash file is flawed.\e[39m"
            echo "GUID=='1ebb4da1-029a-4b4d-a945-8312503099e7'"
            echo ""
        fi
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_BSD_FREEBSD" == "t" ]; then
    if [ "$SB_OPERATINGSYSTEM_BSD" == "f" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo -e "\e[31mThe code of this Bash file is flawed.\e[39m"
            echo "GUID=='05aaaa71-0a24-43fa-8de5-8312503099e7'"
            echo ""
        fi
    fi
fi
#--------------------------------------------------------------------------
alias mmmv_pwd_2_S_0="S_0=\"\`pwd\`\""
alias mmmv_pwd_2_S_1="S_1=\"\`pwd\`\""
alias mmmv_pwd_2_S_2="S_2=\"\`pwd\`\""
alias mmmv_pwd_2_S_3="S_3=\"\`pwd\`\""
#--------------------------------------------------------------------------
alias chmR0777="S_PERMISSIONS=\"0777\" ; $S_FP_NICE -n 1 chmod -f -R \$S_PERMISSIONS \`pwd\` ; S_ERR=\"\$?\" ; wait ; sync ; wait ; if [ \"\$S_ERR\" != \"0\" ]; then  echo \"\" ; echo \"Recursive changing of access permissions to\" ; echo -e \"\\e[31m\$S_PERMISSIONS failed\\e[39m for \" ; echo \"    \`pwd\` \" ; echo \"\" ; else  echo \"\" ; echo \"Recursive changing of access permissions to\" ; echo -e \"\\e[32m\$S_PERMISSIONS succeeded\\e[39m for \" ; echo \"    \`pwd\` \" ; echo \"\" ; fi "
alias chmR0770="S_PERMISSIONS=\"0770\" ; $S_FP_NICE -n 1 chmod -f -R \$S_PERMISSIONS \`pwd\` ; S_ERR=\"\$?\" ; wait ; sync ; wait ; if [ \"\$S_ERR\" != \"0\" ]; then  echo \"\" ; echo \"Recursive changing of access permissions to\" ; echo -e \"\\e[31m\$S_PERMISSIONS failed\\e[39m for \" ; echo \"    \`pwd\` \" ; echo \"\" ; else  echo \"\" ; echo \"Recursive changing of access permissions to\" ; echo -e \"\\e[32m\$S_PERMISSIONS succeeded\\e[39m for \" ; echo \"    \`pwd\` \" ; echo \"\" ; fi "
alias chmR0755="S_PERMISSIONS=\"0755\" ; $S_FP_NICE -n 1 chmod -f -R \$S_PERMISSIONS \`pwd\` ; S_ERR=\"\$?\" ; wait ; sync ; wait ; if [ \"\$S_ERR\" != \"0\" ]; then  echo \"\" ; echo \"Recursive changing of access permissions to\" ; echo -e \"\\e[31m\$S_PERMISSIONS failed\\e[39m for \" ; echo \"    \`pwd\` \" ; echo \"\" ; else  echo \"\" ; echo \"Recursive changing of access permissions to\" ; echo -e \"\\e[32m\$S_PERMISSIONS succeeded\\e[39m for \" ; echo \"    \`pwd\` \" ; echo \"\" ; fi "
alias chmR0750="S_PERMISSIONS=\"0750\" ; $S_FP_NICE -n 1 chmod -f -R \$S_PERMISSIONS \`pwd\` ; S_ERR=\"\$?\" ; wait ; sync ; wait ; if [ \"\$S_ERR\" != \"0\" ]; then  echo \"\" ; echo \"Recursive changing of access permissions to\" ; echo -e \"\\e[31m\$S_PERMISSIONS failed\\e[39m for \" ; echo \"    \`pwd\` \" ; echo \"\" ; else  echo \"\" ; echo \"Recursive changing of access permissions to\" ; echo -e \"\\e[32m\$S_PERMISSIONS succeeded\\e[39m for \" ; echo \"    \`pwd\` \" ; echo \"\" ; fi "
alias chmR0700="S_PERMISSIONS=\"0700\" ; $S_FP_NICE -n 1 chmod -f -R \$S_PERMISSIONS \`pwd\` ; S_ERR=\"\$?\" ; wait ; sync ; wait ; if [ \"\$S_ERR\" != \"0\" ]; then  echo \"\" ; echo \"Recursive changing of access permissions to\" ; echo -e \"\\e[31m\$S_PERMISSIONS failed\\e[39m for \" ; echo \"    \`pwd\` \" ; echo \"\" ; else  echo \"\" ; echo \"Recursive changing of access permissions to\" ; echo -e \"\\e[32m\$S_PERMISSIONS succeeded\\e[39m for \" ; echo \"    \`pwd\` \" ; echo \"\" ; fi "
#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
    #----------------------------------------------------------------------
    func_general_Linux_userspace_specific_declarations
    #----------------------------------------------------------------------
    if [ "$SB_OPERATINGSYSTEM_LINUX_WSL" == "t" ]; then
        #------------------------------------------------------------------
        # https://askubuntu.com/questions/1116200/how-can-i-access-my-usb-drive-from-my-windows-subsystem-for-linux-ubuntu-dist
        # archival copy: https://archive.ph/jhxcu
        #----------------
        S_TMP_0="/mnt/c"
        S_TMP_1="C:"
        alias mmmv_admin_mount_drive_C="if [ -e \"$S_TMP_0\" ]; then if [ -d \"$S_TMP_0\" ]; then sudo mount -t drvfs $S_TMP_1 $S_TMP_0 ; S_ERR=\"\$?\" ; if [ \"\$S_ERR\" != \"0\" ]; then echo \"Mounting $S_TMP_1 to $S_TMP_0 failed with exit code \$S_ERR .\" ; fi ; else echo \"$S_TMP_0 exists, but it is not a folder. \"; fi ; else echo \"$S_TMP_0 is missing.\" ; fi "
        #----------------
        S_TMP_0="/mnt/d"
        S_TMP_1="D:"
        alias mmmv_admin_mount_drive_D="if [ -e \"$S_TMP_0\" ]; then if [ -d \"$S_TMP_0\" ]; then sudo mount -t drvfs $S_TMP_1 $S_TMP_0 ; S_ERR=\"\$?\" ; if [ \"\$S_ERR\" != \"0\" ]; then echo \"Mounting $S_TMP_1 to $S_TMP_0 failed with exit code \$S_ERR .\" ; fi ; else echo \"$S_TMP_0 exists, but it is not a folder. \"; fi ; else echo \"$S_TMP_0 is missing.\" ; fi "
        #----------------
        S_TMP_0="/mnt/e"
        S_TMP_1="E:"
        alias mmmv_admin_mount_drive_E="if [ -e \"$S_TMP_0\" ]; then if [ -d \"$S_TMP_0\" ]; then sudo mount -t drvfs $S_TMP_1 $S_TMP_0 ; S_ERR=\"\$?\" ; if [ \"\$S_ERR\" != \"0\" ]; then echo \"Mounting $S_TMP_1 to $S_TMP_0 failed with exit code \$S_ERR .\" ; fi ; else echo \"$S_TMP_0 exists, but it is not a folder. \"; fi ; else echo \"$S_TMP_0 is missing.\" ; fi "
        #----------------
        S_TMP_0="/mnt/f"
        S_TMP_1="F:"
        alias mmmv_admin_mount_drive_F="if [ -e \"$S_TMP_0\" ]; then if [ -d \"$S_TMP_0\" ]; then sudo mount -t drvfs $S_TMP_1 $S_TMP_0 ; S_ERR=\"\$?\" ; if [ \"\$S_ERR\" != \"0\" ]; then echo \"Mounting $S_TMP_1 to $S_TMP_0 failed with exit code \$S_ERR .\" ; fi ; else echo \"$S_TMP_0 exists, but it is not a folder. \"; fi ; else echo \"$S_TMP_0 is missing.\" ; fi "
        #----------------
        S_TMP_0="/mnt/g"
        S_TMP_1="G:"
        alias mmmv_admin_mount_drive_G="if [ -e \"$S_TMP_0\" ]; then if [ -d \"$S_TMP_0\" ]; then sudo mount -t drvfs $S_TMP_1 $S_TMP_0 ; S_ERR=\"\$?\" ; if [ \"\$S_ERR\" != \"0\" ]; then echo \"Mounting $S_TMP_1 to $S_TMP_0 failed with exit code \$S_ERR .\" ; fi ; else echo \"$S_TMP_0 exists, but it is not a folder. \"; fi ; else echo \"$S_TMP_0 is missing.\" ; fi "
        #----------------
        S_TMP_0="/mnt/h"
        S_TMP_1="H:"
        alias mmmv_admin_mount_drive_H="if [ -e \"$S_TMP_0\" ]; then if [ -d \"$S_TMP_0\" ]; then sudo mount -t drvfs $S_TMP_1 $S_TMP_0 ; S_ERR=\"\$?\" ; if [ \"\$S_ERR\" != \"0\" ]; then echo \"Mounting $S_TMP_1 to $S_TMP_0 failed with exit code \$S_ERR .\" ; fi ; else echo \"$S_TMP_0 exists, but it is not a folder. \"; fi ; else echo \"$S_TMP_0 is missing.\" ; fi "
        #----------------
        S_TMP_0="/mnt/i"
        S_TMP_1="I:"
        alias mmmv_admin_mount_drive_I="if [ -e \"$S_TMP_0\" ]; then if [ -d \"$S_TMP_0\" ]; then sudo mount -t drvfs $S_TMP_1 $S_TMP_0 ; S_ERR=\"\$?\" ; if [ \"\$S_ERR\" != \"0\" ]; then echo \"Mounting $S_TMP_1 to $S_TMP_0 failed with exit code \$S_ERR .\" ; fi ; else echo \"$S_TMP_0 exists, but it is not a folder. \"; fi ; else echo \"$S_TMP_0 is missing.\" ; fi "
        #----------------
        S_TMP_0="/mnt/j"
        S_TMP_1="J:"
        alias mmmv_admin_mount_drive_J="if [ -e \"$S_TMP_0\" ]; then if [ -d \"$S_TMP_0\" ]; then sudo mount -t drvfs $S_TMP_1 $S_TMP_0 ; S_ERR=\"\$?\" ; if [ \"\$S_ERR\" != \"0\" ]; then echo \"Mounting $S_TMP_1 to $S_TMP_0 failed with exit code \$S_ERR .\" ; fi ; else echo \"$S_TMP_0 exists, but it is not a folder. \"; fi ; else echo \"$S_TMP_0 is missing.\" ; fi "
        #----------------
        S_TMP_0="/mnt/k"
        S_TMP_1="K:"
        alias mmmv_admin_mount_drive_K="if [ -e \"$S_TMP_0\" ]; then if [ -d \"$S_TMP_0\" ]; then sudo mount -t drvfs $S_TMP_1 $S_TMP_0 ; S_ERR=\"\$?\" ; if [ \"\$S_ERR\" != \"0\" ]; then echo \"Mounting $S_TMP_1 to $S_TMP_0 failed with exit code \$S_ERR .\" ; fi ; else echo \"$S_TMP_0 exists, but it is not a folder. \"; fi ; else echo \"$S_TMP_0 is missing.\" ; fi "
        #----------------
        S_TMP_0="/mnt/l"
        S_TMP_1="L:"
        alias mmmv_admin_mount_drive_L="if [ -e \"$S_TMP_0\" ]; then if [ -d \"$S_TMP_0\" ]; then sudo mount -t drvfs $S_TMP_1 $S_TMP_0 ; S_ERR=\"\$?\" ; if [ \"\$S_ERR\" != \"0\" ]; then echo \"Mounting $S_TMP_1 to $S_TMP_0 failed with exit code \$S_ERR .\" ; fi ; else echo \"$S_TMP_0 exists, but it is not a folder. \"; fi ; else echo \"$S_TMP_0 is missing.\" ; fi "
        #----------------
        S_TMP_0="/mnt/m"
        S_TMP_1="M:"
        alias mmmv_admin_mount_drive_M="if [ -e \"$S_TMP_0\" ]; then if [ -d \"$S_TMP_0\" ]; then sudo mount -t drvfs $S_TMP_1 $S_TMP_0 ; S_ERR=\"\$?\" ; if [ \"\$S_ERR\" != \"0\" ]; then echo \"Mounting $S_TMP_1 to $S_TMP_0 failed with exit code \$S_ERR .\" ; fi ; else echo \"$S_TMP_0 exists, but it is not a folder. \"; fi ; else echo \"$S_TMP_0 is missing.\" ; fi "
        #----------------
        S_TMP_0="/mnt/n"
        S_TMP_1="N:"
        alias mmmv_admin_mount_drive_N="if [ -e \"$S_TMP_0\" ]; then if [ -d \"$S_TMP_0\" ]; then sudo mount -t drvfs $S_TMP_1 $S_TMP_0 ; S_ERR=\"\$?\" ; if [ \"\$S_ERR\" != \"0\" ]; then echo \"Mounting $S_TMP_1 to $S_TMP_0 failed with exit code \$S_ERR .\" ; fi ; else echo \"$S_TMP_0 exists, but it is not a folder. \"; fi ; else echo \"$S_TMP_0 is missing.\" ; fi "
        #------------------------------------------------------------------
    else
        if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID" == "f" ]; then
            # The formatted version of the
            alias mmmv_admin_create_symlink_to_cupspdf_t1="S_FP_LINK=\"\$HOME/CUPS_PDF\" ; S_FP_CUPSPDF_OUTPUT_DIR_0=\"/var/spool/cups-pdf/ANONYMOUS\" ; S_FP_CUPSPDF_OUTPUT_DIR_X=\"\$S_FP_CUPSPDF_OUTPUT_DIR_0\" ; S_FP_CUPSPDF_OUTPUT_DIR_1=\"/var/spool/cups-pdf/\`whoami\`\" ; if [ -e \"\$S_FP_CUPSPDF_OUTPUT_DIR_1\" ]; then S_FP_CUPSPDF_OUTPUT_DIR_X=\"\$S_FP_CUPSPDF_OUTPUT_DIR_1\" ; fi ; if [ -e \"\$S_FP_CUPSPDF_OUTPUT_DIR_X\" ]; then if [ -d \"\$S_FP_CUPSPDF_OUTPUT_DIR_X\" ]; then if [ -e \"\$S_FP_LINK\" ]; then echo \"\" ; echo \"Something with the path of \" ; echo \"    \$S_FP_LINK\" ; echo -e \"\e[31malready exists.\e[39m Doing nothing.\" ; echo \"GUID=='22c49bb1-f55d-4085-b425-8312503099e7'\" ; echo \"\" ; else if [ -h \"\$S_FP_LINK\" ]; then echo \"\" ; echo \"A broken symlink with the path of \" ; echo \"    \$S_FP_LINK\" ; echo -e \"\e[31malready exists.\e[39m Doing nothing.\" ; echo \"GUID=='19934191-9b87-40b0-aa35-8312503099e7'\" ; echo \"\" ; else ln -s \"\$S_FP_CUPSPDF_OUTPUT_DIR_X\" \"\$S_FP_LINK\" ; sync; wait; sync ;  if [ ! -e \"\$S_FP_LINK\" ]; then echo \"\" ; echo -e \"\e[31mFailed to create symlink \e[39m\" ; echo \"    \$S_FP_LINK\" ; echo \"    -->\" ; echo \"    \$S_FP_CUPSPDF_OUTPUT_DIR_X\" ; echo \"GUID=='b213c415-2cdf-45f1-8624-8312503099e7'\" ; echo \"\" ; fi ; fi ; fi ; else echo \"\" ; echo \"The \" ; echo \"    \$S_FP_CUPSPDF_OUTPUT_DIR_X\" ; if [ -h \"\$S_FP_CUPSPDF_OUTPUT_DIR_X\" ]; then echo \"is a symlink to a file, but a folder is expected.\" ; else echo \"is a file, but a folder is expected.\" ; fi ; echo \"GUID=='03f99b52-2e53-47f9-8114-8312503099e7'\" ; echo \"\" ; fi ; else echo \"\" ; echo -e \"\e[31mFolder is missing. \e[39m\" ; echo \"    \$S_FP_CUPSPDF_OUTPUT_DIR_X\" ; echo \"It MIGHT be that the cups-pdf has not been installed.\" ; echo \"GUID=='2efa1972-6083-4703-8a14-8312503099e7'\" ; echo \"\" ; fi ;"
            # except the GUIDs, is:
            #     S_FP_LINK="$HOME/CUPS_PDF" ;
            #     S_FP_CUPSPDF_OUTPUT_DIR_0="/var/spool/cups-pdf/ANONYMOUS" ;
            #     S_FP_CUPSPDF_OUTPUT_DIR_X="$S_FP_CUPSPDF_OUTPUT_DIR_0" ;
            #     S_FP_CUPSPDF_OUTPUT_DIR_1="/var/spool/cups-pdf/`whoami`" ;
            #     if [ -e "$S_FP_CUPSPDF_OUTPUT_DIR_1" ]; then
            #         S_FP_CUPSPDF_OUTPUT_DIR_X="$S_FP_CUPSPDF_OUTPUT_DIR_1" ;
            #     fi ;
            #     if [ -e "$S_FP_CUPSPDF_OUTPUT_DIR_X" ]; then
            #         if [ -d "$S_FP_CUPSPDF_OUTPUT_DIR_X" ]; then
            #             if [ -e "$S_FP_LINK" ]; then
            #                 echo "" ;
            #                 echo "Something with the path of " ;
            #                 echo "    $S_FP_LINK" ;
            #                 echo -e "\e[31malready exists.\e[39m Doing nothing." ;
            #                 echo "GUID=='41a38bb1-0a2c-4677-a314-8312503099e7'" ;
            #                 echo "" ;
            #             else
            #                 if [ -h "$S_FP_LINK" ]; then
            #                     echo "" ;
            #                     echo "A broken symlink with the path of " ;
            #                     echo "    $S_FP_LINK" ;
            #                     echo -e "\e[31malready exists.\e[39m Doing nothing." ;
            #                     echo "GUID=='4412d3d1-5d84-436a-8723-8312503099e7'" ;
            #                     echo "" ;
            #                 else
            #                     ln -s "$S_FP_CUPSPDF_OUTPUT_DIR_X" "$S_FP_LINK" ;
            #                     sync; wait; sync ;
            #                     if [ ! -e "$S_FP_LINK" ]; then
            #                         echo "" ;
            #                         echo -e "\e[31mFailed to create symlink \e[39m" ;
            #                         echo "    $S_FP_LINK" ;
            #                         echo "    -->" ;
            #                         echo "    $S_FP_CUPSPDF_OUTPUT_DIR_X" ;
            #                         echo "GUID=='2a491b65-cf47-43e9-84f3-8312503099e7'" ;
            #                         echo "" ;
            #                     fi ;
            #                 fi ;
            #             fi ;
            #         else
            #             echo "" ;
            #             echo "The " ;
            #             echo "    $S_FP_CUPSPDF_OUTPUT_DIR_X" ;
            #             if [ -h "$S_FP_CUPSPDF_OUTPUT_DIR_X" ]; then
            #                 echo "is a symlink to a file, but a folder is expected." ;
            #             else
            #                 echo "is a file, but a folder is expected." ;
            #             fi ;
            #             echo "GUID=='23bc8972-0167-42b9-98d3-8312503099e7'" ;
            #             echo "" ;
            #         fi ;
            #     else
            #         echo "" ;
            #         echo -e "\e[31mFolder is missing. \e[39m" ;
            #         echo "    $S_FP_CUPSPDF_OUTPUT_DIR_X" ;
            #         echo "It MIGHT be that the cups-pdf has not been installed." ;
            #         echo "GUID=='0519a546-7931-45bb-a473-8312503099e7'" ;
            #         echo "" ;
            #     fi ;
        fi
    fi
    #----------------------------------------------------------------------
else
    #----------------------------------------------------------------------
    if [ "$SB_OPERATINGSYSTEM_BSD" == "t" ]; then
        func_general_BSD_userspace_specific_declarations
        if [ "$SB_OPERATINGSYSTEM_BSD_FREEBSD" == "t" ]; then
            func_FreeBSD_userspace_specific_declarations
        fi
    else
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo -e "\e[31mThe code of this Bash file is flawed.\e[39m"
            echo "GUID=='20ed7de5-3d03-48a4-9b42-8312503099e7'"
            echo ""
        fi
    fi
    #----------------------------------------------------------------------
fi
#--------------------------------------------------------------------------
MMMV_USERSPACE_DISTRO_T1_TEMPLATES="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/lib/templates"
func_mmmv_declare_template_creation_alias_t1(){
    local S_ALIAS_NAME="$1"
    local S_FN_TEMPLATE="$2"             # Only the file name.
    local S_FN_NEW="$3"                  # Only the file name.
    local S_GUID_CANDIDATE_OPTIONAL="$4"
    local SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL="$5" # domain: {"","t","f"}
                                                     # default: "" -> "t"
    local S_FP_DESTINATION_FOLDER_OPTIONAL="$6" # default: "" -> "`pwd`"
    #----------------------------------------------------------------------
    local SB_OK2ATTEMPT="t"
    local S_FP_TEMPLATE="$MMMV_USERSPACE_DISTRO_T1_TEMPLATES/$S_FN_TEMPLATE"
    #----------------------------------------------------------------------
    local S_TMP_0=""
    local S_FP_NEW=""
    if [ "$S_FP_DESTINATION_FOLDER_OPTIONAL" == "" ]; then
        S_FP_NEW="\$PWD/$S_FN_NEW"
    else
        if [ ! -e "$S_FP_DESTINATION_FOLDER_OPTIONAL" ]; then
            SB_OK2ATTEMPT="f"
        else
            if [ ! -d "$S_FP_DESTINATION_FOLDER_OPTIONAL" ]; then
                SB_OK2ATTEMPT="f"
            fi
        fi
        if [ "$SB_OK2ATTEMPT" == "t" ]; then
            S_TMP_0="`cd $S_FP_DESTINATION_FOLDER_OPTIONAL ; pwd`"
            S_FP_NEW="$S_TMP_0/$S_FN_NEW"
        else
            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                "$S_FP_DESTINATION_FOLDER_OPTIONAL" \
                "82e62042-670a-4a31-b615-8312503099e7" \
                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        fi
    fi
    #----------------------------------------------------------------------
    if [ "$SB_OK2ATTEMPT" == "t" ]; then
        #------------------------------------------------------------------
        local S_ERR_MSG_SUBPART_01=""
        if [ "$S_GUID_CANDIDATE_OPTIONAL" == "" ]; then
            S_GUID_CANDIDATE_OPTIONAL="303d9dd4-d851-4a8c-be24-8312503099e7"
        else
            #S_ERR_MSG_SUBPART_01="echo \"S_GUID_CANDIDATE=='$S_GUID_CANDIDATE_OPTIONAL'\" ; "
            S_ERR_MSG_SUBPART_01="S_GUID_CANDIDATE=='$S_GUID_CANDIDATE_OPTIONAL'"
        fi
        #--------------------
        if [ "$SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL" == "" ]; then
            SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL="t"
        else
            if [ "$SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL" != "t" ]; then
                if [ "$SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL" != "f" ]; then
                    SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL="t"
                    if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                        echo ""
                        echo "A mmmv_userspace_distro_t1 related "
                        echo -e "\e[31msubpart of the ~/.bashrc is flawed\e[39m."
                        echo "    SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL==\"$SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL\""
                        echo "GUID=='3ae0f9f1-35b7-412c-8812-8312503099e7'"
                        echo ""
                    fi
                fi
            fi
        fi
        #------------------------------------------------------------------
        func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
            "$S_FP_TEMPLATE" "$S_GUID_CANDIDATE_OPTIONAL" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
            #--------------------
            # The following Bash code segment
            # #------------------------------
            #local S_ALIAS_BASH_CODE=" \
            #    SB_USE_UPGUID_ON_COPIED_FILE=\"$SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL\"; \
            #    if [ -e \"$S_FP_TEMPLATE\" ]; then \
            #        if [ ! -d \"$S_FP_TEMPLATE\" ]; then \
            #            if [ ! -e \"$S_FP_NEW\" ]; then \
            #                cp $S_FP_TEMPLATE $S_FP_NEW ; \
            #                if [ \"\$?\" == \"0\" ]; then \
            #                    sync; wait; sync; \
            #                    echo \"\"; \
            #                    echo \"Created a new file with the path of \"; \
            #                    echo \"\"; \
            #                    echo -e \"\\e[32m    $S_FP_NEW \\e[39m\"; \
            #                    echo \"\"; \
            #                    if [ \"\$SB_USE_UPGUID_ON_COPIED_FILE\" == \"t\" ]; then \
            #                        if [ \"\`which upguid 2> /dev/null \`\" != \"\" ]; then \
            #                            upguid -f  $S_FP_NEW; sync; wait; sync; \
            #                            chmod 0700 $S_FP_NEW; sync; wait; sync; \
            #                        else \
            #                            echo -e \"Could not find \\e[31mupguid\\e[39m from the PATH.\"; \
            #                            echo \"\"; \
            #                        fi \
            #                    fi \
            #                else \
            #                    echo -e \"\\e[31mFailed to create file \\e[39m \"; \
            #                    echo \"\"; \
            #                    echo \"    $S_FP_NEW \"; \
            #                    echo \"\"; \
            #                    echo \"GUID=='2f071a82-3f5b-4a8d-9b22-8312503099e7'\"; \
            #                    if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then \
            #                        echo \"$S_ERR_MSG_SUBPART_01\"; \
            #                    fi;\
            #                    echo \"\"; \
            #                fi; \
            #            else \
            #                echo \"\"; \
            #                if [ -d \"$S_FP_NEW\" ]; then \
            #                    echo \"A folder with the path of \"; \
            #                else \
            #                    echo \"A file with the path of \"; \
            #                fi; \
            #                echo \"\"; \
            #                echo \"    $S_FP_NEW\"; \
            #                echo \"\"; \
            #                echo -e \"\\e[31malready exists\\e[39m. Not overwriting.\"; \
            #                echo \"GUID=='7214b8c4-1894-4a53-a412-8312503099e7'\"; \
            #                if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then \
            #                    echo \"$S_ERR_MSG_SUBPART_01\"; \
            #                fi;\
            #                echo \"\"; \
            #            fi; \
            #        else \
            #            echo \"\"; \
            #            echo \"The template \"; \
            #            echo \"\"; \
            #            echo \"    $S_FP_TEMPLATE\"; \
            #            echo \"\"; \
            #            if [ -h \"$S_FP_TEMPLATE\" ]; then \
            #                echo -e \"\\e[31mis a symlink to a folder,\\e[39m\"; \
            #            else \
            #                echo -e \"\\e[31mis a folder,\\e[39m\"; \
            #            fi; \
            #            echo -e \"\\e[31mbut a file is expected.\\e[39m\"; \
            #            echo \"Not copying anything.\"; \
            #            echo \"GUID=='e24c1ccb-c055-4189-8ab1-8312503099e7'\"; \
            #            if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then \
            #                echo \"$S_ERR_MSG_SUBPART_01\"; \
            #            fi;\
            #            echo \"\"; \
            #        fi; \
            #    else \
            #        echo \"\"; \
            #        echo \"The template \"; \
            #        echo \"\"; \
            #        echo \"    $S_FP_TEMPLATE\"; \
            #        echo \"\"; \
            #        if [ -h \"$S_FP_TEMPLATE\" ]; then \
            #            echo -e \"\\e[31mis a broken symlink,\\e[39m\"; \
            #        else \
            #            echo -e \"\\e[31mis missing,\\e[39m\"; \
            #        fi; \
            #        echo -e \"\\e[31mbut a file is expected.\\e[39m\"; \
            #        echo \"Not copying anything.\"; \
            #        echo \"GUID=='559a09d4-b4d6-496b-a111-8312503099e7'\"; \
            #        if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then \
            #            echo \"$S_ERR_MSG_SUBPART_01\"; \
            #        fi;\
            #        echo \"\"; \
            #    fi; \
            #    "
            # #------------------------------
            # is meant to be processed with Vim macros for assembling the
            alias $S_ALIAS_NAME=" SB_USE_UPGUID_ON_COPIED_FILE=\"$SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL\"; if [ -e \"$S_FP_TEMPLATE\" ]; then if [ ! -d \"$S_FP_TEMPLATE\" ]; then if [ ! -e \"$S_FP_NEW\" ]; then cp $S_FP_TEMPLATE $S_FP_NEW ; if [ \"\$?\" == \"0\" ]; then sync; wait; sync; echo \"\"; echo \"Created a new file with the path of \"; echo \"\"; echo -e \"\\e[32m    $S_FP_NEW \\e[39m\"; echo \"\"; if [ \"\$SB_USE_UPGUID_ON_COPIED_FILE\" == \"t\" ]; then if [ \"\`which upguid 2> /dev/null \`\" != \"\" ]; then upguid -f  $S_FP_NEW; sync; wait; sync; chmod 0700 $S_FP_NEW; sync; wait; sync; else echo -e \"Could not find \\e[31mupguid\\e[39m from the PATH.\"; echo \"\"; fi fi else echo -e \"\\e[31mFailed to create file \\e[39m \"; echo \"\"; echo \"    $S_FP_NEW \"; echo \"\"; echo \"GUID=='44a8b724-b074-4ae8-bc11-8312503099e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; if [ -d \"$S_FP_NEW\" ]; then echo \"A folder with the path of \"; else echo \"A file with the path of \"; fi; echo \"\"; echo \"    $S_FP_NEW\"; echo \"\"; echo -e \"\\e[31malready exists\\e[39m. Not overwriting.\"; echo \"GUID=='77ed55b4-8bb8-4bce-b810-8312503099e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; echo \"The template \"; echo \"\"; echo \"    $S_FP_TEMPLATE\"; echo \"\"; if [ -h \"$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mis a symlink to a folder,\\e[39m\"; else echo -e \"\\e[31mis a folder,\\e[39m\"; fi; echo -e \"\\e[31mbut a file is expected.\\e[39m\"; echo \"Not copying anything.\"; echo \"GUID=='3ec6fa95-5bad-41bf-af30-8312503099e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; echo \"The template \"; echo \"\"; echo \"    $S_FP_TEMPLATE\"; echo \"\"; if [ -h \"$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mis a broken symlink,\\e[39m\"; else echo -e \"\\e[31mis missing,\\e[39m\"; fi; echo -e \"\\e[31mbut a file is expected.\\e[39m\"; echo \"Not copying anything.\"; echo \"GUID=='16e96062-afff-4844-a350-8312503099e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; "
            #--------------------
            # The following versions are older versions that have been tested to work.
            # alias $S_ALIAS_NAME=" SB_USE_UPGUID_ON_COPIED_FILE=\"$SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL\"; if [ -e \"$S_FP_TEMPLATE\" ]; then if [ ! -d \"$S_FP_TEMPLATE\" ]; then if [ ! -e \"$S_FP_NEW\" ]; then cp $S_FP_TEMPLATE $S_FP_NEW ; if [ \"\$?\" == \"0\" ]; then sync; wait; sync; echo \"\"; echo \"Created a new file with the path of \"; echo \"\"; echo \"    $S_FP_NEW \"; echo \"\"; if [ \"\$SB_USE_UPGUID_ON_COPIED_FILE\" == \"t\" ]; then if [ \"\`which upguid 2> /dev/null \`\" != \"\" ]; then upguid -f  $S_FP_NEW; sync; wait; sync; chmod 0700 $S_FP_NEW; sync; wait; sync; else echo -e \"Could not find \\e[31mupguid\\e[39m from the PATH.\"; echo \"\"; fi fi else echo -e \"\\e[31mFailed to create file \\e[39m \"; echo \"\"; echo \"    $S_FP_NEW \"; echo \"\"; echo \"GUID=='cf8ee871-2240-471b-8120-8312503099e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; if [ -d \"$S_FP_NEW\" ]; then echo \"A folder with the path of \"; else echo \"A file with the path of \"; fi; echo \"\"; echo \"    $S_FP_NEW\"; echo \"\"; echo -e \"\\e[31malready exists\\e[39m. Not overwriting.\"; echo \"GUID=='354bcd8e-4f29-446c-ab5f-8312503099e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; echo \"The template \"; echo \"\"; echo \"    $S_FP_TEMPLATE\"; echo \"\"; if [ -h \"$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mis a symlink to a folder,\\e[39m\"; else echo -e \"\\e[31mis a folder,\\e[39m\"; fi; echo -e \"\\e[31mbut a file is expected.\\e[39m\"; echo \"Not copying anything.\"; echo \"GUID=='da4f38f4-f4d5-45e6-b11f-8312503099e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; echo \"The template \"; echo \"\"; echo \"    $S_FP_TEMPLATE\"; echo \"\"; if [ -h \"$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mis a broken symlink,\\e[39m\"; else echo -e \"\\e[31mis missing,\\e[39m\"; fi; echo -e \"\\e[31mbut a file is expected.\\e[39m\"; echo \"Not copying anything.\"; echo \"GUID=='48f32444-0293-42c7-b95f-8312503099e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; "
            #--------------------
        fi
        #------------------------------------------------------------------
    fi
    #----------------------------------------------------------------------
} # func_mmmv_declare_template_creation_alias_t1

#--------------------------------------------------------------------------
# For template creation alias declarations, where the original template
# file name matches with the template copy file name.
func_mmmv_declare_template_creation_alias_t2(){
    local S_ALIAS_NAME="$1"
    local S_FN_TEMPLATE="$2"             # Only the file name.
    local S_GUID_CANDIDATE_OPTIONAL="$3"
    #----------------------------------------------------------------------
    func_mmmv_declare_template_creation_alias_t1 \
        "$S_ALIAS_NAME" "$S_FN_TEMPLATE" "$S_FN_TEMPLATE" \
        "$S_GUID_CANDIDATE_OPTIONAL"
    #----------------------------------------------------------------------
} # func_mmmv_declare_template_creation_alias_t2

#--------------------------------------------------------------------------
func_mmmv_declare_template_creation_alias_tar_gz_t1(){
    local S_ALIAS_NAME="$1"
    local S_FN_TEMPLATE="$2"             # Only the file name.
    local S_FN_NEW="$3"                  # Only the file name.
    local S_GUID_CANDIDATE_OPTIONAL="$4"
    #----------------------------------------------------------------------
    local S_FP_TEMPLATE="$MMMV_USERSPACE_DISTRO_T1_TEMPLATES/$S_FN_TEMPLATE"
    local S_FP_NEW="\$PWD/$S_FN_NEW"
    #--------------------
    local S_ERR_MSG_SUBPART_01=""
    if [ "$S_GUID_CANDIDATE_OPTIONAL" == "" ]; then
        S_GUID_CANDIDATE_OPTIONAL="3ee635d4-4c2e-4d90-b954-8312503099e7"
    else
        #S_ERR_MSG_SUBPART_01="echo \"S_GUID_CANDIDATE=='$S_GUID_CANDIDATE_OPTIONAL'\" ; "
        S_ERR_MSG_SUBPART_01="S_GUID_CANDIDATE=='$S_GUID_CANDIDATE_OPTIONAL'"
    fi
    #----------------------------------------------------------------------
    func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
        "$S_FP_TEMPLATE" "$S_GUID_CANDIDATE_OPTIONAL" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        #--------------------
        # Sample:
        # alias mmmv_cre_image_length_limiter_t1="$S_FP_NICE -n 10 tar -xzf $MMMV_USERSPACE_DISTRO_T1_TEMPLATES/image_edge_length_limiter_t1.tar.gz ./ "
        # The following Bash code segment
        # #------------------------------
        #local S_FOO="\
        #    if [ -e \"$S_FP_TEMPLATE\" ]; then \
        #        if [ ! -d \"$S_FP_TEMPLATE\" ]; then \
        #            if [ ! -e \"$S_FP_NEW\" ]; then \
        #                $S_FP_NICE -n 10 tar -xzf $S_FP_TEMPLATE ./ ; \
        #                if [ \"\$?\" == \"0\" ]; then \
        #                    sync; wait; \
        #                    echo \"\"; \
        #                    if [ -d \"$S_FP_NEW\" ]; then \
        #                        if [ -h \"$S_FP_NEW\" ]; then \
        #                            echo \"Created a new symlink to a folder with the path of \"; \
        #                        else \
        #                            echo \"Created a new folder with the path of \"; \
        #                        fi; \
        #                    else \
        #                        if [ -h \"$S_FP_NEW\" ]; then \
        #                            echo \"Created a new symlink to a file with the path of \"; \
        #                        else \
        #                            echo \"Created a new file with the path of \"; \
        #                        fi; \
        #                    fi; \
        #                    echo \"\"; \
        #                    echo \"    $S_FP_NEW \"; \
        #                    echo \"\"; \
        #                else \
        #                    echo -e \"\\e[31mFailed to create \\e[39m \"; \
        #                    echo \"\"; \
        #                    echo \"    $S_FP_NEW \"; \
        #                    echo \"\"; \
        #                    echo \"GUID=='58119295-2e1a-4bec-953f-8312503099e7'\"; \
        #                    if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then \
        #                        echo \"$S_ERR_MSG_SUBPART_01\"; \
        #                    fi;\
        #                    echo \"\"; \
        #                fi; \
        #            else \
        #                echo \"\"; \
        #                if [ -d \"$S_FP_NEW\" ]; then \
        #                    echo \"A folder with the path of \"; \
        #                else \
        #                    echo \"A file with the path of \"; \
        #                fi; \
        #                echo \"\"; \
        #                echo \"    $S_FP_NEW\"; \
        #                echo \"\"; \
        #                echo -e \"\\e[31malready exists\\e[39m. Not overwriting.\"; \
        #                echo \"GUID=='1e43fcdc-f140-4595-93ae-8312503099e7'\"; \
        #                if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then \
        #                    echo \"$S_ERR_MSG_SUBPART_01\"; \
        #                fi;\
        #                echo \"\"; \
        #            fi; \
        #        else \
        #            echo \"\"; \
        #            echo \"The template \"; \
        #            echo \"\"; \
        #            echo \"    $S_FP_TEMPLATE\"; \
        #            echo \"\"; \
        #            if [ -h \"$S_FP_TEMPLATE\" ]; then \
        #                echo -e \"\\e[31mis a symlink to a folder,\\e[39m\"; \
        #            else \
        #                echo -e \"\\e[31mis a folder,\\e[39m\"; \
        #            fi; \
        #            echo -e \"\\e[31mbut a file is expected.\\e[39m\"; \
        #            echo \"Not copying anything.\"; \
        #            echo \"GUID=='334c0ba2-be54-413a-bb2e-8312503099e7'\"; \
        #            if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then \
        #                echo \"$S_ERR_MSG_SUBPART_01\"; \
        #            fi;\
        #            echo \"\"; \
        #        fi; \
        #    else \
        #        echo \"\"; \
        #        echo \"The template \"; \
        #        echo \"\"; \
        #        echo \"    $S_FP_TEMPLATE\"; \
        #        echo \"\"; \
        #        if [ -h \"$S_FP_TEMPLATE\" ]; then \
        #            echo -e \"\\e[31mis a broken symlink,\\e[39m\"; \
        #        else \
        #            echo -e \"\\e[31mis missing,\\e[39m\"; \
        #        fi; \
        #        echo -e \"\\e[31mbut a file is expected.\\e[39m\"; \
        #        echo \"Not copying anything.\"; \
        #        echo \"GUID=='62f9071a-c7bf-42ff-854e-8312503099e7'\"; \
        #        if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then \
        #            echo \"$S_ERR_MSG_SUBPART_01\"; \
        #        fi;\
        #        echo \"\"; \
        #    fi; \
        #    "
        # #------------------------------
        # is meant to be processed with Vim macros for assembling the
        alias $S_ALIAS_NAME="if [ -e \"$S_FP_TEMPLATE\" ]; then if [ ! -d \"$S_FP_TEMPLATE\" ]; then if [ ! -e \"$S_FP_NEW\" ]; then $S_FP_NICE -n 10 tar -xzf $S_FP_TEMPLATE ./ ; if [ \"\$?\" == \"0\" ]; then sync; wait; echo \"\"; if [ -d \"$S_FP_NEW\" ]; then if [ -h \"$S_FP_NEW\" ]; then echo \"Created a new symlink to a folder with the path of \"; else echo \"Created a new folder with the path of \"; fi; else if [ -h \"$S_FP_NEW\" ]; then echo \"Created a new symlink to a file with the path of \"; else echo \"Created a new file with the path of \"; fi; fi; echo \"\"; echo \"    $S_FP_NEW \"; echo \"\"; else echo -e \"\\e[31mFailed to create \\e[39m \"; echo \"\"; echo \"    $S_FP_NEW \"; echo \"\"; echo \"GUID=='1eaada62-14dc-4b51-a75d-8312503099e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; if [ -d \"$S_FP_NEW\" ]; then echo \"A folder with the path of \"; else echo \"A file with the path of \"; fi; echo \"\"; echo \"    $S_FP_NEW\"; echo \"\"; echo -e \"\\e[31malready exists\\e[39m. Not overwriting.\"; echo \"GUID=='c1dfbe76-2d3c-4157-b97d-8312503099e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; echo \"The template \"; echo \"\"; echo \"    $S_FP_TEMPLATE\"; echo \"\"; if [ -h \"$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mis a symlink to a folder,\\e[39m\"; else echo -e \"\\e[31mis a folder,\\e[39m\"; fi; echo -e \"\\e[31mbut a file is expected.\\e[39m\"; echo \"Not copying anything.\"; echo \"GUID=='1f5bdc01-f7e4-4b1a-b43d-8312503099e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; echo \"The template \"; echo \"\"; echo \"    $S_FP_TEMPLATE\"; echo \"\"; if [ -h \"$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mis a broken symlink,\\e[39m\"; else echo -e \"\\e[31mis missing,\\e[39m\"; fi; echo -e \"\\e[31mbut a file is expected.\\e[39m\"; echo \"Not copying anything.\"; echo \"GUID=='a3c36ac3-e118-4ab6-bd1d-8312503099e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; "
        #--------------------
    fi
    #----------------------------------------------------------------------
} # func_mmmv_declare_template_creation_alias_tar_gz_t1


#--------------------------------------------------------------------------
func_mmmv_declare_template_creation_alias_zip_t1(){
    local S_ALIAS_NAME="$1"
    local S_FN_TEMPLATE="$2"             # Only the file name.
    local S_FN_NEW="$3"                  # Only the file name.
    local S_GUID_CANDIDATE_OPTIONAL="$4"
    #----------------------------------------------------------------------
    local S_FP_TEMPLATE="$MMMV_USERSPACE_DISTRO_T1_TEMPLATES/$S_FN_TEMPLATE"
    local S_FP_NEW="\$PWD/$S_FN_NEW"
    #--------------------
    local S_ERR_MSG_SUBPART_01=""
    if [ "$S_GUID_CANDIDATE_OPTIONAL" == "" ]; then
        S_GUID_CANDIDATE_OPTIONAL="4f85bb85-4809-49f9-8424-8312503099e7"
    else
        #S_ERR_MSG_SUBPART_01="echo \"S_GUID_CANDIDATE=='$S_GUID_CANDIDATE_OPTIONAL'\" ; "
        S_ERR_MSG_SUBPART_01="S_GUID_CANDIDATE=='$S_GUID_CANDIDATE_OPTIONAL'"
    fi
    #----------------------------------------------------------------------
    func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
        "$S_FP_TEMPLATE" "$S_GUID_CANDIDATE_OPTIONAL" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        #--------------------
        # Sample:
        # alias mmmv_cre_image_length_limiter_t1="$S_FP_NICE -n 10 tar -xzf $MMMV_USERSPACE_DISTRO_T1_TEMPLATES/image_edge_length_limiter_t1.tar.gz ./ "
        # The following Bash code segment
        # #------------------------------
        # local S_FOO="\
        #     if [ -e \"\$S_FP_TEMPLATE\" ]; then \
        #         if [ ! -d \"\$S_FP_TEMPLATE\" ]; then \
        #             $S_FP_NICE -n 10 zip --test \"\$S_FP_TEMPLATE\" ;\
        #             if [ \"\$?\" == \"0\" ]; then \
        #                 if [ ! -e \"\$S_FP_NEW\" ]; then \
        #                     $S_FP_NICE -n 10 unzip \$S_FP_TEMPLATE ; \
        #                     if [ \"\$?\" == \"0\" ]; then \
        #                         sync; wait; \
        #                         echo \"\"; \
        #                         if [ -d \"\$S_FP_NEW\" ]; then \
        #                             if [ -h \"\$S_FP_NEW\" ]; then \
        #                                 echo \"Created a new symlink to a folder with the path of \"; \
        #                             else \
        #                                 echo \"Created a new folder with the path of \"; \
        #                             fi; \
        #                         else \
        #                             if [ -h \"\$S_FP_NEW\" ]; then \
        #                                 echo \"Created a new symlink to a file with the path of \"; \
        #                             else \
        #                                 echo \"Created a new file with the path of \"; \
        #                             fi; \
        #                         fi; \
        #                         echo \"\"; \
        #                         echo \"    \$S_FP_NEW \"; \
        #                         echo \"\"; \
        #                     else \
        #                         echo -e \"\\e[31mFailed to create \\e[39m \"; \
        #                         echo \"\"; \
        #                         echo \"    \$S_FP_NEW \"; \
        #                         echo \"\"; \
        #                         echo \"GUID=='460c8b45-3750-4f37-a75c-8312503099e7'\"; \
        #                         if [ \"\$S_ERR_MSG_SUBPART_01\" != \"\" ]; then \
        #                             echo \"\$S_ERR_MSG_SUBPART_01\"; \
        #                         fi;\
        #                         echo \"\"; \
        #                     fi; \
        #                 else \
        #                     echo \"\"; \
        #                     if [ -d \"\$S_FP_NEW\" ]; then \
        #                         echo \"A folder with the path of \"; \
        #                     else \
        #                         echo \"A file with the path of \"; \
        #                     fi; \
        #                     echo \"\"; \
        #                     echo \"    \$S_FP_NEW\"; \
        #                     echo \"\"; \
        #                     echo -e \"\\e[31malready exists\\e[39m. Not overwriting.\"; \
        #                     echo \"GUID=='6934dfb5-0c76-4182-812c-8312503099e7'\"; \
        #                     if [ \"\$S_ERR_MSG_SUBPART_01\" != \"\" ]; then \
        #                         echo \"\$S_ERR_MSG_SUBPART_01\"; \
        #                     fi;\
        #                     echo \"\"; \
        #                 fi; \
        #             else\
        #                 echo -e \"The zip file \"; \
        #                 echo \"\"; \
        #                 echo \"    \$S_FP_TEMPLATE \"; \
        #                 echo \"\"; \
        #                 echo -e \"\\e[31mis corrupted\\e[39m or it is not a zip file.\"; \
        #                 echo \"GUID=='3caffd35-47e5-4b75-8a5c-8312503099e7'\"; \
        #             fi\
        #         else \
        #             echo \"\"; \
        #             echo \"The template \"; \
        #             echo \"\"; \
        #             echo \"    \$S_FP_TEMPLATE\"; \
        #             echo \"\"; \
        #             if [ -h \"\$S_FP_TEMPLATE\" ]; then \
        #                 echo -e \"\\e[31mis a symlink to a folder,\\e[39m\"; \
        #             else \
        #                 echo -e \"\\e[31mis a folder,\\e[39m\"; \
        #             fi; \
        #             echo -e \"\\e[31mbut a file is expected.\\e[39m\"; \
        #             echo \"Not copying anything.\"; \
        #             echo \"GUID=='a5c561bd-76c1-4652-b2ec-8312503099e7'\"; \
        #             if [ \"\$S_ERR_MSG_SUBPART_01\" != \"\" ]; then \
        #                 echo \"\$S_ERR_MSG_SUBPART_01\"; \
        #             fi;\
        #             echo \"\"; \
        #         fi; \
        #     else \
        #         echo \"\"; \
        #         echo \"The template \"; \
        #         echo \"\"; \
        #         echo \"    \$S_FP_TEMPLATE\"; \
        #         echo \"\"; \
        #         if [ -h \"\$S_FP_TEMPLATE\" ]; then \
        #             echo -e \"\\e[31mis a broken symlink,\\e[39m\"; \
        #         else \
        #             echo -e \"\\e[31mis missing,\\e[39m\"; \
        #         fi; \
        #         echo -e \"\\e[31mbut a file is expected.\\e[39m\"; \
        #         echo \"Not copying anything.\"; \
        #         echo \"GUID=='3d0fc853-3295-4fd6-9a1b-8312503099e7'\"; \
        #         if [ \"\$S_ERR_MSG_SUBPART_01\" != \"\" ]; then \
        #             echo \"\$S_ERR_MSG_SUBPART_01\"; \
        #         fi;\
        #         echo \"\"; \
        #     fi; \
        #    "
        # #------------------------------
        # is meant to be processed with Vim macros for assembling the
        alias $S_ALIAS_NAME="if [ -e \"$S_FP_TEMPLATE\" ]; then if [ ! -d \"$S_FP_TEMPLATE\" ]; then $S_FP_NICE -n 10 zip --test \"$S_FP_TEMPLATE\" ; if [ \"\$?\" == \"0\" ]; then if [ ! -e \"$S_FP_NEW\" ]; then $S_FP_NICE -n 10 unzip $S_FP_TEMPLATE ; if [ \"\$?\" == \"0\" ]; then sync; wait; echo \"\"; if [ -d \"$S_FP_NEW\" ]; then if [ -h \"$S_FP_NEW\" ]; then echo \"Created a new symlink to a folder with the path of \"; else echo \"Created a new folder with the path of \"; fi; else if [ -h \"$S_FP_NEW\" ]; then echo \"Created a new symlink to a file with the path of \"; else echo \"Created a new file with the path of \"; fi; fi; echo \"\"; echo \"    $S_FP_NEW \"; echo \"\"; else echo -e \"\\e[31mFailed to create \\e[39m \"; echo \"\"; echo \"    $S_FP_NEW \"; echo \"\"; echo \"GUID=='f37dc5d2-acfe-42f3-bd3b-8312503099e7'\"; if [ \"\$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"\$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; if [ -d \"$S_FP_NEW\" ]; then echo \"A folder with the path of \"; else echo \"A file with the path of \"; fi; echo \"\"; echo \"    $S_FP_NEW\"; echo \"\"; echo -e \"\\e[31malready exists\\e[39m. Not overwriting.\"; echo \"GUID=='457cd961-a6d9-4d6f-942b-8312503099e7'\"; if [ \"\$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"\$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo -e \"The zip file \"; echo \"\"; echo \"    $S_FP_TEMPLATE \"; echo \"\"; echo -e \"\\e[31mis corrupted\\e[39m or it is not a zip file.\"; echo \"GUID=='253e1023-5359-4422-901b-8312503099e7'\"; fi else echo \"\"; echo \"The template \"; echo \"\"; echo \"    $S_FP_TEMPLATE\"; echo \"\"; if [ -h \"$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mis a symlink to a folder,\\e[39m\"; else echo -e \"\\e[31mis a folder,\\e[39m\"; fi; echo -e \"\\e[31mbut a file is expected.\\e[39m\"; echo \"Not copying anything.\"; echo \"GUID=='e263e9c8-a967-421e-8a4b-8312503099e7'\"; if [ \"\$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"\$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; echo \"The template \"; echo \"\"; echo \"    $S_FP_TEMPLATE\"; echo \"\"; if [ -h \"$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mis a broken symlink,\\e[39m\"; else echo -e \"\\e[31mis missing,\\e[39m\"; fi; echo -e \"\\e[31mbut a file is expected.\\e[39m\"; echo \"Not copying anything.\"; echo \"GUID=='1022b932-b165-4bac-875b-8312503099e7'\"; if [ \"\$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"\$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; "
        #--------------------
    fi
    #----------------------------------------------------------------------
} # func_mmmv_declare_template_creation_alias_zip_t1


#--------------------------------------------------------------------------
S_TMP_CMD_CRE_GIT_CLONE=" if [ ! -e \"./pull_new_version_from_git_repository.bash\" ]; then cp $MMMV_USERSPACE_DISTRO_T1_TEMPLATES/pull_new_version_from_git_repository.bash ./ ; sync; wait; sync; chmod 0700 ./pull_new_version_from_git_repository.bash ; sync; wait; sync; fi ; if [ ! -e \"./the_repository_clones\" ]; then mkdir -p ./the_repository_clones ; sync; wait; sync; chmod -f -R 0700 ./the_repository_clones ; sync; wait; sync; fi ; "
alias mmmv_cre_git_clone="$S_TMP_CMD_CRE_GIT_CLONE"

# The next line
S_TMP_FP_0="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin/mmmv_github_repos_2_clonescript_bash_t1.rb"
# uses a full path, because at this line the
#    $MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin
# is only on the Z_PATH, not yet on PATH.

func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
    "$S_TMP_FP_0" "96174cf9-f052-4aae-8614-8312503099e7" \
    "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
    if [ "$SB_RUBY_EXISTS_ON_PATH" == "t" ]; then
        S_TMP_0="mkdir -p ./src_from_GitHub ; sync ; wait ; cd ./src_from_GitHub ; $S_TMP_CMD_CRE_GIT_CLONE cd ./the_repository_clones ; wait ; echo \"\" ; echo \"The working directory shifted to\" ; echo \"\" ; echo \"    ./src_from_GitHub/the_repository_clones\" ; "
        alias mmmv_cre_git_clone_collection_from_GitHub_t1="$S_TMP_0 ruby -e 's_username=ARGV[0]; s_cmd=\"$S_TMP_FP_0 https://github.com/\"+s_username ; exec(s_cmd) ' "
        alias mmmv_cre_git_clone_collection_from_GitHub_t2="$S_TMP_0 $S_TMP_FP_0 "
    fi
fi
#--------------------------------------------------------------------------

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_bashrc_minimalistic_template_01" \
    "_bashrc_minimalistic_template_01" \
    "5bf74782-a183-4a36-8024-8312503099e7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_disassembly_and_reassembly_script_t1" \
    "disassembly_and_reassembly_t1.bash" \
    "42dcce7c-3a76-4451-b043-8312503099e7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_download_files_with_wget_template_01" \
    "download_files_with_wget_template_01.bash" \
    "48e7d401-a99d-4826-a813-8312503099e7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_Fossil_wiki_page_HTML_expimp_template_01" \
    "download_and_upload_Fossil_wiki_HTML.bash" \
    "f3e0326c-c108-4e8a-a253-8312503099e7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_fossil_clone" \
    "mmmv_Fossil_operator_t1.bash" \
    "ed20f530-a3d0-4906-9a52-8312503099e7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_ruby_console_application_t3" \
    "ruby_console_application_template_t3.rb" \
    "e77ee96a-466a-443e-8652-8312503099e7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_SQL_dump_script" \
    "create_backup_from_MySQL_db.bash" \
    "82c280fe-c027-4431-8d12-8312503099e7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_SSH_config_template" \
    "_ssh_config_template.txt" \
    "04eacc12-11c7-42e8-bf12-8312503099e7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_SSH_tunnel_creation_script_template_t1" \
    "ssh_tunnel_t1.bash" \
    "286a2223-89a3-4074-9321-8312503099e7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_WARC_Tools" \
    "2016_12_xx_WARC_tools.tar.xz" \
    "d388ed06-c841-451c-9921-8312503099e7"

#------------
if [ "$SB_TAR_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_GUNZIP_EXISTS_ON_PATH" == "t" ]; then
        S_TMP_0="$S_FP_NICE -n 10 tar -xzf $MMMV_USERSPACE_DISTRO_T1_TEMPLATES/rsync_based_backups_creator.tar.gz ./ "
        if [ "$SB_RSYNC_EXISTS_ON_PATH" == "t" ]; then
            alias mmmv_cre_rsync_based_backups_creator="$S_TMP_0"
        else
            if [ "$SB_RSYNC_EXISTS_ON_PATH" != "f" ]; then
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo -e "\e[31mThe ~/.bashrc or some subpart of it is flawed.\e[39m"
                    echo "GUID=='a9dcdb7f-0114-44ac-b85b-8312503099e7'"
                fi
            fi
            alias mmmv_cre_rsync_based_backups_creator="echo \"\" ; echo \"The \\\"rsync\\\" is not on PATH.\" ; echo \"GUID=='d4077ead-203c-4e33-803a-8312503099e7'\" ; echo \"\" ; $S_TMP_0"
        fi
  fi
fi
#--------------------------------------------------------------------------
if [ "$SB_ZIP_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_UNZIP_EXISTS_ON_PATH" == "t" ]; then
        #------------------------------------------------------------------
        func_mmmv_declare_template_creation_alias_zip_t1 \
            "mmmv_cre_web_server_http_wappskafander_t2_2023_07_26" \
            "2023_07_26_wappskafander_t2.zip" \
            "wappskafander_t2" \
            "11ad29c1-9bc9-4123-b051-8312503099e7"
        #------------------------------------------------------------------
        func_mmmv_declare_template_creation_alias_zip_t1 \
            "mmmv_cre_bash_boilerplate_t5_2023_12_24" \
            "2023_12_24_mmmv_bash_boilerplate_t5.zip" \
            "2023_12_24_mmmv_bash_boilerplate_t5" \
            "56a8f9f1-b988-42a5-a141-8312503099e7"
        #------------------------------------------------------------------
        # Unfortunately the CivetWeb server has some sort of flaw that
        # if the URL becomes too long, then it hangs. The
        #     2025_04_06_CivetWeb_http_server_v_1_16_with_modifications_01.zip
        # contains an updated version, where some constants were changed
        # to extend the possible accepted path name, but it did not
        # have the desired effect, still only too short paths are accepted.
        # TODO: create a 2. modification of the CivetWeb http server, where
        #       the path shortness related flaw/bug has been removed.
        #       The hope for such a bugfix is also, why the following 2
        #       alias declarations and the related zip-files
        #       have not been removed from mmmv_userspace_distro_t1.
        #----
        # func_mmmv_declare_template_creation_alias_zip_t1 \
        #     "mmmv_cre_web_server_http_CivetWeb_v_1_16" \
        #     "2023_04_10_CivetWeb_v_1_16.zip" \
        #     "CivetWeb_http_server" \
        #     "7122f87a-ae57-4501-9640-8312503099e7"
        #----
        # func_mmmv_declare_template_creation_alias_zip_t1 \
        #     "mmmv_cre_web_server_http_CivetWeb_v_1_16_with_modifications_01" \
        #     "2025_04_06_CivetWeb_http_server_v_1_16_with_modifications_01.zip" \
        #     "CivetWeb_http_server" \
        #     "32a2fb41-5610-46f4-8410-8312503099e7"
        #------------------------------------------------------------------
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_TAR_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_GUNZIP_EXISTS_ON_PATH" == "t" ]; then
        #----
        func_mmmv_declare_template_creation_alias_tar_gz_t1 \
            "mmmv_cre_bash_boilerplate_t6_copy" \
            "2024_07_13_mmmv_bash_boilerplate_t6.tar.gz" \
            "2024_07_13_mmmv_bash_boilerplate_t6" \
            "3611efe1-a688-4b9b-8b40-8312503099e7"
        #----
        func_mmmv_declare_template_creation_alias_tar_gz_t1 \
            "mmmv_cre_image_length_limiter_t1" \
            "image_edge_length_limiter_t1.tar.gz" \
            "image_edge_length_limiter_t1" \
            "49df0354-848a-4fd6-be4f-8312503099e7"
        #----
        func_mmmv_declare_template_creation_alias_tar_gz_t1 \
            "mmmv_cre_installed_programs_checklist_t1" \
            "2021_02_xx_mmmv_installed_programs_checklist_t1_template.tar.gz" \
            "installed_programs_checklist_t1_template" \
            "5fc06395-2ac5-4ab1-ba2f-8312503099e7"
        #----
        func_mmmv_declare_template_creation_alias_tar_gz_t1 \
            "mmmv_cre_ruby_boilerplate_t6" \
            "2024_01_27_mmmv_ruby_boilerplate_t6.tar.gz" \
            "2024_01_27_mmmv_ruby_boilerplate_t6" \
            "55f40d03-4a9c-4bd4-901f-8312503099e7"
        #----
        func_mmmv_declare_template_creation_alias_tar_gz_t1 \
            "mmmv_cre_ZeroNet_Rev3703_from_mmmv_repackaging" \
            "2018_11_08_ZeroNet_Rev3703_mmmv_repackaging_t2.tar.gz" \
            "2018_11_08_ZeroNet_Rev3703_mmmv_repackaging_t2" \
            "4bf29e35-eada-4801-b84f-8312503099e7"
        #----
        func_mmmv_declare_template_creation_alias_tar_gz_t1 \
            "mmmv_cre_vimwiki_project_wiki_t1" \
            "project_wiki_t1.tar.gz" \
            "project_wiki" \
            "34acab15-a0f5-480f-a34e-8312503099e7"
        #----
        func_mmmv_declare_template_creation_alias_tar_gz_t1 \
            "mmmv_cre_data_collection_t1" \
            "2025_08_09_data_collection_template_01.tar.gz" \
            "data_collection" \
            "43d83a71-05d8-4bdd-b35e-8312503099e7"
        #----
    fi
fi
#--------------------------------------------------------------------------
func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_COMMENTS_txt_t1" \
    "template_of_COMMENTS_txt_t1.txt" \
    "COMMENTS.txt" \
    "d350758e-bb7e-42b4-b82e-8312503099e7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_COMMENTS_txt_t2" \
    "template_of_COMMENTS_txt_t2.txt" \
    "COMMENTS.txt" \
    "3c628834-b8f7-4ba7-8b5d-8312503099e7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_COMMENTS_txt_t3_clone_single_Git_repository" \
    "template_of_COMMENTS_txt_t3_clone_single_Git_repository.txt" \
    "COMMENTS.txt" \
    "29832b44-3f9a-4f3b-bd5d-8312503099e7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_COMMENTS_txt_t4_clone_multiple_repositories_from_a_single_GitHub_account" \
    "template_of_COMMENTS_txt_t4_clone_multiple_repositories_from_a_single_GitHub_account_t1.txt" \
    "COMMENTS.txt" \
    "e3f1fb03-2c9d-44d9-884d-8312503099e7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_COMMENTS_txt_t5_clone_multiple_repositories_from_a_single_GitHub_account" \
    "template_of_COMMENTS_txt_t5_clone_multiple_repositories_from_a_single_GitHub_account_t2.txt" \
    "COMMENTS.txt" \
    "4d640143-1407-40d9-ab3d-8312503099e7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_COMMENTS_txt_t6_clone_multiple_repositories_from_multiple_GitHub_accounts_t1" \
    "template_of_COMMENTS_txt_t6_clone_multiple_repositories_from_multiple_GitHub_accounts_t1.txt" \
    "COMMENTS.txt" \
    "31f506b3-e29c-44eb-b13c-8312503099e7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_CVS_clonescript_t1" \
    "CVS_clonescript_template_01.bash" \
    "CVS_clonescript.bash" \
    "28e06fe3-778e-4889-b81c-8312503099e7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_x_txt_git_pack_Bash_script_t1" \
    "mmmv_git_pack_template_t1.bash" \
    "x.txt" \
    "d203979b-9a35-44ae-992c-8312503099e7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_Rakefile_template_t1" \
    "2022_10_06_Rakefile_template_t1.rb" \
    "Rakefile" \
    "5a5c2b35-36d5-4200-855c-8312503099e7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_product_chooser_t1_template_t1" \
    "2025_03_23_product_chooser_t1_template_t1.rb" \
    "product_chooser.rb" \
    "244a5545-067d-448a-b61b-8312503099e7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_product_chooser_t1_template_t2" \
    "2025_04_03_product_chooser_t1_template_t2.rb" \
    "product_chooser.rb" \
    "a29dfe4a-b692-413e-bf9b-8312503099e7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_bash_switch_to_next_keyboard_layout_t1" \
    "mmmv_ui_switch_to_next_keyboard_layout_t1_template.bash" \
    "mmmv_ui_switch_to_next_keyboard_layout_t1.bash" \
    "2e370145-2f49-4fc3-995b-8312503099e7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_bash_download_t1" \
    "2023_12_20_download_template_t1.bash" \
    "download.bash" \
    "a8c2b554-75d8-4813-935b-8312503099e7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_git_runscript_that_uses_SSH_key_based_authentication" \
    "2024_03_02_run_git_with_SSH_URL_by_authenticating_with_an_SSH_key_t1_template.bash" \
    "run_git_by_authenticating_with_an_SSH_key.bash" \
    "59e8ebb4-aefe-4ae7-a94b-8312503099e7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_ruby_lib_backwards_compatibility_run_2_4_0_code_with_v_3_4_1_interpreter_t1" \
    "Ruby_v_3_4_1_backwards_compatibility_with_v_2_4_0_t1.rb" \
    "Ruby_v_3_4_1_backwards_compatibility_with_v_2_4_0_t1.rb" \
    "95a61792-9ae3-4593-bd1b-8312503099e7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_data_collection_t1_reading_copy_updater_t1" \
    "2025_03_25_update_reading_copy_of_each_of_the_data_collections_t1.bash" \
    "update_all_reading_copies.bash" \
    "34751444-441f-4816-b31b-8312503099e7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_SSH_overwrite_remote_folder_content_with_local_folder_content_by_using_rsync_t2" \
    "template_of_SSH_overwrite_remote_folder_content_with_local_folder_content_by_using_rsync_t2.bash" \
    "overwrite_remote_folder_content_with_local_folder_content_t2.bash" \
    "4a243212-8f10-4c79-9e1b-8312503099e7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_Doxygen_v_1_9_4_configuration_file_for_cpp_t1" \
    "template_of_Doxygen_v_1_9_4_config_file_for_cpp_t1.conf" \
    "doxygen_v_1_9_4_configuration_for_cpp.conf" \
    "52f2df74-14eb-4f68-9a4a-8312503099e7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_Doxygen_v_1_14_0_configuration_file_for_cpp_t1" \
    "template_of_Doxygen_v_1_14_0_config_file_for_cpp_t1.conf" \
    "doxygen_v_1_14_0_configuration_for_cpp.conf" \
    "4bfaae43-3fbb-4074-a42a-8312503099e7"

#------------
SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL="t"
func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_admin_cre_HOME_dot_cargo_config_toml" \
    "HOME_dot_cargo_config.toml.template" \
    "config.toml" \
    "3e486ed5-4efd-44c7-8b3a-8312503099e7" \
    "$SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL" \
    "$HOME/.cargo"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_volume_per_moneyunit_t1" \
    "2025_01_11_template_of_volume_per_moneyunit_t1.rb" \
    "volume_per_moneyunit_t1.rb" \
    "957145b6-5554-42c2-af2a-8312503099e7" \
    "$SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL"

#------------
S_TMP_0="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/lib/mmmv_utilities"
FP_MMMV_PROCESS_EDITOR_BASH="$S_TMP_0/mmmv_process_editor/src/mmmv_process_editor.bash "
if [ "$SB_RUBY_EXISTS_ON_PATH" == "t" ]; then
    alias mmmv_text_processing_lstop_t1="$S_FP_NICE -n 6 ruby $MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/lib/mmmv_text_processing_lstop_t1/mmmv_text_processing_lstop_t1.rb "
    alias mmmv_process_editor="$S_FP_NICE -n 6 bash $FP_MMMV_PROCESS_EDITOR_BASH "
fi
#--------------------------------------------------------------------------
func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_bash_try_to_compile_X_template_t5c" \
    "try_to_compile_X_template_t5c.bash" \
    "try_to_compile_X.bash" \
    "4b5e65c1-75f0-454e-aa2a-8312503099e7"

#--------------------------------------------------------------------------
if [ "$MMMV_BASHRC_CONST_NONFIRST_SESSION_IN_TERMINAL" != "t" ]; then
    if [ -e "$HOME/tmp" ]; then
        if [ -d "$HOME/tmp" ]; then
            cd "$HOME/tmp"
        fi
    else
        if [ -e "$HOME/tmp_" ]; then
            if [ -d "$HOME/tmp_" ]; then
                cd "$HOME/tmp_"
            fi
        fi
    fi
    export MMMV_BASHRC_CONST_NONFIRST_SESSION_IN_TERMINAL="t"
fi
#--------------------------------------------------------------------------
alias mmmv_vim_common_bashrc_main_bash="$S_FP_NICE -n 2 vim $MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/common_bashrc/common_bashrc_main.bash "

# https://unix.stackexchange.com/questions/196098/copy-paste-in-xfce4-terminal-adds-0-and-1
alias mmmv_terminal_fix_copypaste_t1="printf \"\e[?2004l\""
#-----------------------------
if [ "$SB_XMLLINT_EXISTS_ON_PATH" == "t" ]; then
    alias mmmv_format_xml_t1="$S_FP_NICE -n 10 xmllint --format "
fi
if [ "$SB_GPG_EXISTS_ON_PATH" == "t" ]; then
    # The
    #alias mmmv_gpg_rot13_encrypt="$S_FP_NICE -n 17 gpg --symmetric  --force-mdc  --cipher-algo=IDEA --compress-level=0 --pinentry-mode=loopback " # ./letter.txt
    # has been constructed by modifying a command line that was copy-pasted from
    #     https://askubuntu.com/questions/1080204/gpg-problem-with-the-agent-permission-denied
    #     archival copy: https://archive.vn/WnXKX
    # On some Linux systems the "--pinentry-mode=loopback"
    # gives an error message: "gpg: invalid option "--pinentry-mode=loopback"
    # so the
    alias mmmv_gpg_rot13_encrypt="$S_FP_NICE -n 17 gpg --symmetric  --force-mdc  --cipher-algo=TWOFISH --compress-level=0 " # ./letter.txt
    # is without the "--pinentry-mode=loopback". The same with the
    #alias mmmv_gpg_rot13_decrypt_2_console="$S_FP_NICE -n 17 gpg --decrypt --pinentry-mode=loopback " # ./letter.txt.gpg > ./letter.txt
    # versus
    alias mmmv_gpg_rot13_decrypt_2_console="$S_FP_NICE -n 17 gpg --decrypt " # ./letter.txt.gpg > ./letter.txt
    # Supported algorithm names for the "--cipher-algo=...": IDEA, TWOFISH, ...
    # can be listed on console by executing
    #
    #     gpg --version | grep -i algorithms -A 6
    #
    # If letter.txt.gpg is viewed with Vim, then in some circumstances
    # its decrypted version is shown.
    #--------
    mkdir -p ~/.gnupg
    func_mmmv_wait_and_sync_t1
    if [ -e "~/.gnupg" ]; then
        $S_FP_NICE -n 18 chmod -f -R 0700 ~/.gnupg &
    fi
fi
#-----------------------------
if [ "$SB_USERNAME_IS_mmmv" == "t" ]; then

    func_mmmv_userspace_distro_t1_declare_alias_cd_t1 \
        "mmmv_go_common_bashrc_subparts_userspace_distro_specific" \
        "$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/common_bashrc/subparts/mmmv_userspace_distro_t1_specific" \
        "5ba42985-57f8-4e09-8d4a-8312503099e7"

    func_mmmv_userspace_distro_t1_declare_alias_cd_t1 \
        "mmmv_go_common_bashrc_subparts_general" \
        "$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/common_bashrc/subparts/general" \
        "2d016c63-2e3f-433e-b13a-8312503099e7"
else
    func_mmmv_verify_sb_t_f_but_do_not_exit_t1 \
        "$SB_USERNAME_IS_mmmv" \
        "9a010a21-84d2-4774-b12a-8312503099e7"
fi
#--------------------------------------------------------------------------
func_mmmv_userspace_distro_t1_declare_alias_cd_t1 \
    "mmmv_go_mmmv_userspace_distro_t1_mmmv" \
    "$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv" \
    "108d2d42-60ee-4dea-885a-8312503099e7"
#--------------------------------------------------------------------------
if [ "$SB_FFMPEG_EXISTS_ON_PATH" == "t" ]; then
    alias mmmv_ffmpeg_t1="$S_FP_NICE -n 20 ffmpeg -i "
fi
#--------------------------------------------------------------------------
if [ "$SB_XPROP_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_GREP_EXISTS_ON_PATH" == "t" ]; then
        if [ "$SB_SED_EXISTS_ON_PATH" == "t" ]; then
            alias mmmv_admin_show_window_PID_t1="echo \"\"; echo \"Please click on the window to find out its process ID, PID?\"; echo \"\" ; wait; ps -A | grep \$(xprop | grep _NET_WM_PID | $S_CMD_GNU_SED 's/^.\\+= //g')"
        fi
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_RUBY_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_XAUTH_EXISTS_ON_PATH" == "t" ]; then
        alias mmmv_admin_xauthority_add_32_hexdigits_t1="S_TMP_32_HEXDIGITS=\"\`ruby -e \\\"s=''; 32.times{s<<(rand(16).to_s(16))}; printf(s)\\\"\`\" ; xauth -f \"$HOME/.Xauthority\" add \"\$DISPLAY\" . \"\$S_TMP_32_HEXDIGITS\""
    fi
fi
#--------------------------------------------------------------------------
# The execution of the
#
#     source "$MMMV_FP_COMMON_BASHRC_MAIN"
#
# can take about 15s, depending on the machine that executes it.  Any
# console output that is necessary for feedback is likely to interfere
# with the operation of the scp/sftp, because at least some SSH/scp/sftp
# file copying tools consider any ~/.bashrc created stdout output as a
# server-side error and fail to work, if ~/.bashrc prints to stdout.
#
#     https://serverfault.com/questions/485487/use-bashrc-without-breaking-sftp
#     archival copy: https://archive.vn/pxmm1
#     https://web.archive.org/web/20201029162511/https://serverfault.com/questions/485487/use-bashrc-without-breaking-sftp
#
# A workaround to both of those problems is
# to switch on the mmmv environment manually by executing
alias mmmv_environment="$S_FP_NICE -n 2 bash --rcfile \"$MMMV_FP_COMMON_BASHRC_MAIN\" "
#
# Reformatted citation from the ssh man page and the following page:
# https://unix.stackexchange.com/questions/120080/what-are-ssh-tty-and-ssh-connection
# archival copy: https://archive.vn/2y2EF
#
#     SSH_TTY    This is set to the name of the tty (path to the device)
#                associated with the current shell or command.
#                If the current session has no tty, this variable is not set.
#
#     SSH_CONNECTION    Identifies the client and server ends of the connection.
#                       The variable contains four space-separated values:
#                       client IP address, client port number, server IP address,
#                       and server port number.
#
SB_LOGGED_IN_OVER_SSH="f" # domain: {"t","f"}
if [ "$SSH_CONNECTION" != "" ]; then # SSH session exists
    SB_LOGGED_IN_OVER_SSH="t"
    #if [ "$SSH_TTY" == "" ]; then # the SSH session is not a terminal session.
    #fi
fi
#--------------------------------------------------------------------------
# That test pattern is useful for testing console fonts.  As of
# 2021_06_xx my(Martin Vahi) subjective preference for a console font is
# that the fonti is some monospace font, characters are easy to recognize
# and easily distinguishable from eachother.
alias mmmv_ls_character_testpatterns_t1="echo \"\" ; echo \"adad bdbd ftft lIlI oaoa ococ oqoq aeae ecec qgqg 3535 3737 1717 4747 4141 8686 rnrn hnhn yvyv uvuv yuyu pgpg jiji IiIi l|l| I|I| QOQO 0Q0Q 0o0o OoOo O0O0 OCOC 0C0C 8080 lJlJ IJIJ jJjJ RKRK GCGC G6G6 !|!| ß8ß8 ß8ß8 1234567890 abcdefghijklmnoprstuvwxyzõäöüžš ABCDEFGHIJKLMNOPRSTUVWXYZÕÄÖÜŽŠ .:,; _- ?! ^~ [](){} $€ |/\\\\ \\\"'\\\`\" ; echo \"\""
#--------------------
# Fonts for terminals:
#     Perfect or nearly perfect:
#         JetBrains Mono
#             https://www.jetbrains.com/lp/mono/
#             https://github.com/JetBrains/JetBrainsMono
#         Monospace
#         Liberation Mono
#     Good:
#         Lucida Console
#     Compromise versions:
#         Fira Mono
#         DEC Terminal
#         PT Mono
#         DejaVu Sans Mono
#         Efont Fixed
#         Courier_New/Cousine
alias mmmv_ls_doc_fonts_for_terminals_t1='echo ""; echo " Fonts for terminals:"; echo "     Perfect or nearly perfect:"; echo "         JetBrains Mono " ; echo "             https://www.jetbrains.com/lp/mono/ " ; echo "             https://github.com/JetBrains/JetBrainsMono " ; echo "         Monospace"; echo "         Liberation Mono"; echo "     Good:"; echo "         Lucida Console"; echo "     Compromise versions:"; echo "         Fira Mono"; echo "         DEC Terminal"; echo "         PT Mono"; echo "         DejaVu Sans Mono"; echo "         Efont Fixed"; echo "         Courier_New/Cousine " ; echo "";'
#--------------------------------------------------------------------------
if [ "$DISPLAY" == "" ]; then
    # If the Windows Linux layer, the Windows Subsystem for Linux (WSL),
    # is used with the VcXsrv
    #
    #     https://sourceforge.net/p/vcxsrv/
    #
    # then in the case of WSL 1.x the
    if [ "$SB_OPERATINGSYSTEM_LINUX_WSL" == "t" ]; then
        export DISPLAY=":0"
    else
        export DISPLAY="localhost:0" # for openSUSE Linux
    fi
    # is needed. In the case of WSL 2.x the IP-address is needed, like
    #
    #     export DISPLAY="<here comes the IP-address>:0"
    #
    # As of 2020 the alternatives for the VcXsrv might be
    #
    #     https://sourceforge.net/projects/xming/
    #     https://x.cygwin.com/
    #
    # As of 2020_11 one of the requirements for using GUI applicatons
    # on the WSL Debian distribution is
    #
    #     apt-get install x11-apps
    #
    # The testing might be done by executing
    #
    #     xeyes
    #
    # which, if properly executing, should be listed at the Windows task-bar.
    # On Debian Linux systems
    #
    #     xauth list
    #
    # might sometimes give some ideas, what to use as a value
    # for the DISPLAY environment variable.
fi

# According to the
# https://unix.stackexchange.com/questions/203844/how-to-find-out-the-current-active-xserver-display-number
# achival copy: https://archive.vn/0Bpdr
# The way to find out, which display number the current session uses, is
#
#     loginctl list-sessions
#     # and after obtaining the session IDs from there, run
#     loginctl show-session -p Display -p Active <session ID>
#
#--------------------------------------------------------------------------

# Sample that works:
# S_FP_0="`mmmv_cre_temporary_file_t1 --max_file_size_64KiB `" ; rm -f "$S_FP_0" ; wait ; sync ; S_FP_2="" ; S_BASH_0=" wget --output-document=$S_FP_0 " ; S_BASH_1="` printf \"https://bford.info/packrat/ /tmp/uhuu.txt\" | sed -e 's/\([^[:blank:]]\+\)[[:blank:]]\+\([^[:blank:]]\+\)/\1 ; S_FP_2=\"\\2\" ; /g' `" ; S_BASH_2="$S_BASH_0$S_BASH_1" ; eval ${S_BASH_2} ; wait ; sync ;  S_FP_1="`mmmv_HTMLfile_2_list_of_a_tag_URLs_pdf_t1.bash $S_FP_0 `" ; wait ; sync ; if [ "$S_FP_2" != "" ]; then cp -f "$S_FP_1" "$S_FP_2" ; fi ; $EDITOR $S_FP_1 ; wait ; rm -f $S_FP_1 ;
#
# # Sample that works:
# mmmv_polish_ABC_2_ACB_t1    'S_FP_0="`mmmv_cre_temporary_file_t1 --max_file_size_64KiB `" ; rm -f "$S_FP_0" ; wait ; sync ; S_FP_2="" ; S_BASH_0=" wget --output-document=$S_FP_0 " ; S_BASH_1="` printf \"'       '\" | sed -e '"'"'s/\([^[:blank:]]\+\)[[:blank:]]\+\([^[:blank:]]\+\)/\1 ; S_FP_2=\"\\2\" ; /g'"'"' `" ; S_BASH_2="$S_BASH_0$S_BASH_1" ; eval ${S_BASH_2} ; wait ; sync ;  S_FP_1="`mmmv_HTMLfile_2_list_of_a_tag_URLs_pdf_t1.bash $S_FP_0 `" ; wait ; sync ; if [ "$S_FP_2" != "" ]; then cp -f "$S_FP_1" "$S_FP_2" ; fi ; $EDITOR $S_FP_1 ; wait ; rm -f $S_FP_1 ; '     'https://bford.info/packrat/ /tmp/uhuu.txt'
#
#
# # Sample that works:
# mmmv_polish_ABC_2_ACB_exec_t1    'S_FP_0="`mmmv_cre_temporary_file_t1 --max_file_size_64KiB `" ; rm -f "$S_FP_0" ; wait ; sync ; S_FP_2="" ; S_BASH_0=" wget --output-document=$S_FP_0 " ; S_BASH_1="` printf \"'       '\" | sed -e '"'"'s/\([^[:blank:]]\+\)[[:blank:]]\+\([^[:blank:]]\+\)/\1 ; S_FP_2=\"\\2\" ; /g'"'"' `" ; S_BASH_2="$S_BASH_0$S_BASH_1" ; eval ${S_BASH_2} ; wait ; sync ;  S_FP_1="`mmmv_HTMLfile_2_list_of_a_tag_URLs_pdf_t1.bash $S_FP_0 `" ; wait ; sync ; if [ "$S_FP_2" != "" ]; then cp -f "$S_FP_1" "$S_FP_2" ; fi ; $EDITOR $S_FP_1 ; wait ; rm -f $S_FP_1 ; '     'https://bford.info/packrat/ /tmp/uhuu.txt'
#
#
# # Sample that works:
# mmmv_polish_ABC_2_ACB_exec_t1    'S_FP_0="`mmmv_cre_temporary_file_t1 --max_file_size_64KiB `" ; rm -f "$S_FP_0" ; wait ; sync ; S_FP_2="" ; S_BASH_0=" wget --output-document=$S_FP_0 " ; S_BASH_1="` printf \"'       '\" | sed -e '"'"'s/\([^[:blank:]]\+\)[[:blank:]]\+\([^[:blank:]]\+\)/\1 ; S_FP_2=\"\\2\" ; /g'"'"' `" ; S_BASH_2="$S_BASH_0$S_BASH_1" ; eval ${S_BASH_2} ; wait ; sync ;  S_FP_1="`mmmv_HTMLfile_2_list_of_a_tag_URLs_pdf_t1.bash $S_FP_0 `" ; wait ; sync ; if [ "$S_FP_2" != "" ]; then cp -f "$S_FP_1" "$S_FP_2" ; fi ; $EDITOR $S_FP_1 ; wait ; rm -f $S_FP_1 ; '     https://bford.info/packrat/
#
#
if [ "$SB_WGET_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_SED_OR_GSED_EXISTS_ON_PATH" == "t" ]; then
        if [ "$SB_GREP_EXISTS_ON_PATH" == "t" ]; then
            if [ "$SB_TR_EXISTS_ON_PATH" == "t" ]; then
                if [ "$SB_SORT_EXISTS_ON_PATH" == "t" ]; then
                    if [ "$SB_PRINTF_EXISTS_ON_PATH" == "t" ]; then
                        if [ "$SB_CAT_EXISTS_ON_PATH" == "t" ]; then
                            if [ "`which mmmv_cre_temporary_file_t1 2> /dev/null`" != "" ]; then
                                #------------------------------------------
                                if [ "`which mmmv_HTMLfile_2_list_of_a_tag_URLs_pdf_t1.bash 2> /dev/null`" != "" ]; then
                                    alias mmmv_HTML_URL_2_list_of_PDF_URLs_t1="mmmv_polish_ABC_2_ACB_exec_t1    'S_FP_0=\"\`mmmv_cre_temporary_file_t1 --max_file_size_64KiB \`\" ; rm -f \"\$S_FP_0\" ; wait ; sync ; S_FP_2=\"\" ; S_BASH_0=\" wget --output-document=\$S_FP_0 \" ; S_BASH_1=\"\` printf \\\"'       '\\\" | $S_CMD_GNU_SED -e '\"'\"'s/\\([^[:blank:]]\\+\\)[[:blank:]]\\+\\([^[:blank:]]\\+\\)/\\1 ; S_FP_2=\\\"\\\\2\\\" ; /g'\"'\"' \`\" ; S_BASH_2=\"\$S_BASH_0\$S_BASH_1\" ; eval \${S_BASH_2} ; wait ; sync ;  S_FP_1=\"\`mmmv_HTMLfile_2_list_of_a_tag_URLs_pdf_t1.bash \$S_FP_0 \`\" ; wait ; sync ; if [ \"\$S_FP_2\" != \"\" ]; then cp -f \"\$S_FP_1\" \"\$S_FP_2\" ; fi ; \$EDITOR \$S_FP_1 ; wait ; rm -f \$S_FP_1 ; rm -f \$S_FP_0 ;' "
                                fi
                                #------------------------------------------
                                if [ "`which mmmv_HTMLfile_2_list_of_a_tag_URLs_file_set_01.bash 2> /dev/null`" != "" ]; then
                                    alias mmmv_HTML_URL_2_list_of_URLs_file_set_01_t1="mmmv_polish_ABC_2_ACB_exec_t1    'S_FP_0=\"\`mmmv_cre_temporary_file_t1 --max_file_size_64KiB \`\" ; rm -f \"\$S_FP_0\" ; wait ; sync ; S_FP_2=\"\" ; S_BASH_0=\" wget --output-document=\$S_FP_0 \" ; S_BASH_1=\"\` printf \\\"'       '\\\" | $S_CMD_GNU_SED -e '\"'\"'s/\\([^[:blank:]]\\+\\)[[:blank:]]\\+\\([^[:blank:]]\\+\\)/\\1 ; S_FP_2=\\\"\\\\2\\\" ; /g'\"'\"' \`\" ; S_BASH_2=\"\$S_BASH_0\$S_BASH_1\" ; eval \${S_BASH_2} ; wait ; sync ;  S_FP_1=\"\`mmmv_HTMLfile_2_list_of_a_tag_URLs_file_set_01.bash \$S_FP_0 \`\" ; wait ; sync ; if [ \"\$S_FP_2\" != \"\" ]; then cp -f \"\$S_FP_1\" \"\$S_FP_2\" ; fi ; \$EDITOR \$S_FP_1 ; wait ; rm -f \$S_FP_1 ; rm -f \$S_FP_0 ; ' "
                                fi
                                #------------------------------------------
                            fi
                        fi
                    fi
                fi
            fi
        fi
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_SED_OR_GSED_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_GREP_EXISTS_ON_PATH" == "t" ]; then
        if [ "$SB_SORT_EXISTS_ON_PATH" == "t" ]; then
            if [ "$SB_PRINTF_EXISTS_ON_PATH" == "t" ]; then
                alias mmmv_cre_HTML_ls_t1_folders_and_files_sorted_alphabetically=" printf '<!DOCTYPE HTML>\\n<html>\\n<head>\\n<title>ls</title>\\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\\n</head>\\n<body id=\"the_document_body\">\\n<h1>ls</h1>\\n<ul>\\n    <li>\\n        <a href=\"./../\">..</a>\\n    </li>\\n' > ./index.html ; sync ; wait ; ls -1 | sort | grep -i -v 'index.html' | $S_CMD_GNU_SED -e 's/\\(^.\\+\$\\)/    <li><a href=\".\\/\\1\">\\1<\\/a><\\/li>/g' >> ./index.html ; sync ; wait ; printf '</ul>\\n</body>\\n</html>\\n' >> ./index.html ; sync ; wait ; chmod 0700 ./index.html ; sync ; wait ; "
                if [ "$SB_FIND_EXISTS_ON_PATH" == "t" ]; then
                    #------------------------------------------------------
                    alias mmmv_cre_HTML_ls_t2_folders_first_then_files="printf '<!DOCTYPE HTML>\\n<html>\\n<head>\\n<title>ls</title>\\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\\n</head>\\n<body id=\"the_document_body\">\\n<h1>ls</h1>\\n<ul>\\n    <li>\\n        <a href=\"./../\">..</a>\\n    </li>\\n' > ./index.html ; sync ; wait ; find . -maxdepth 1  -type d | grep -v -E '^[.]\$' | $S_CMD_GNU_SED -e 's/^[.][\\/]//g' | sort | $S_CMD_GNU_SED -e 's/\\(^.\\+\$\\)/    <li><a href=\".\\/\\1\\/\">\\1\\/<\\/a><\\/li>/g' >> ./index.html ; sync ; wait ; find . -maxdepth 1 -type f | grep -i -v 'index.html' | $S_CMD_GNU_SED -e 's/^[.][\\/]//g' | sort | $S_CMD_GNU_SED -e 's/\\(^.\\+\$\\)/    <li><a href=\".\\/\\1\">\\1<\\/a><\\/li>/g' >> ./index.html ; sync ; wait ; printf '</ul>\\n</body>\\n</html>\\n' >> ./index.html ; sync ; wait ; chmod 0700 ./index.html ; sync ; wait ; "
                    #------------------------------------------------------
                    alias mmmv_cre_HTML_ls_t3_recursively_folders_first_then_files="S_FP=\"\`pwd\`/recursive_list_of_files_and_folders.html\" ; printf '<!DOCTYPE HTML>\\n<html>\\n<head>\\n<title>Recurive list of Files and Folders</title>\\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\\n</head>\\n<body id=\"the_document_body\">\\n<h1>Recurive list of Files and Folders</h1>\\n<ul>\\n    <li>\\n        <a href=\"./../\">..</a>\\n    </li>\\n' > \$S_FP ; sync ; wait ; find . -type d | grep -v -E '^[.]\$' | $S_CMD_GNU_SED -e 's/^[.][\\/]//g' | sort | $S_CMD_GNU_SED -e 's/\\(^.\\+\$\\)/    <li><a href=\".\\/\\1\\/\">\\1\\/<\\/a><\\/li>/g' >> \$S_FP ; sync ; wait ; find . -type f | $S_CMD_GNU_SED -e 's/^[.][\\/]//g' | sort | $S_CMD_GNU_SED -e 's/\\(^.\\+\$\\)/    <li><a href=\".\\/\\1\">\\1<\\/a><\\/li>/g' >> \$S_FP ; sync ; wait ; printf '</ul>\\n</body>\\n</html>\\n' >> \$S_FP ; sync ; wait ; chmod 0700 \$S_FP ; sync ; wait ; "
                    #------------------------------------------------------
                fi
            fi
        fi
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_TOR_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_CURL_EXISTS_ON_PATH" == "t" ]; then
        # https://stackoverflow.com/questions/67941677/torify-torsocks-ssh-only-working-from-device-itself-and-not-from-other-devices
        # archival copy: https://archive.is/5DUNa
        alias mmmv_curl_download_through_tor_SOCKS5_at_127_0_0_1_port_9050_t1="curl --socks5 localhost:9050 --socks5-hostname 127.0.0.1:9050  "
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_SORT_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_FIND_EXISTS_ON_PATH" == "t" ]; then
        #------------------------------------------------------------------
        alias mmmv_cre_txt_list_of_files_t1="S_FP=\"\`pwd\`/list_of_files.txt\" ; if [ ! -e \"\$S_FP\" ]; then find . -type f | sort  > \$S_FP ; sync ; wait ; chmod 0700 \$S_FP ; sync ; wait ; else echo \"\" ; echo \"A file or a folder with the path of \" ; echo \"\" ; echo \"    \$S_FP\" ; echo \"\" ; echo -e \"\\e[31malready exists\\e[39m. Not overwriting it.\" ; echo \"\" ; fi "
        alias mmmv_cre_txt_list_of_symlinks_t1="S_FP=\"\`pwd\`/list_of_symlinks.txt\" ; if [ ! -e \"\$S_FP\" ]; then find . -type l | sort  > \$S_FP ; sync ; wait ; chmod 0700 \$S_FP ; sync ; wait ; else echo \"\" ; echo \"A file or a folder with the path of \" ; echo \"\" ; echo \"    \$S_FP\" ; echo \"\" ; echo -e \"\\e[31malready exists\\e[39m. Not overwriting it.\" ; echo \"\" ; fi "
        #------------------------------------------------------------------
        # Testline with GNU sed:
        #
        #    printf 'first\nsecond' | sed -e 's/\(^.\+$\)/                <li><a href="\1">\1<\/a><\/li>/g' | sed -e '1{s/^/<!DOCTYPE HTML>\n<html>\n    <head>\n        <title>List of Files<\/title>\n        <meta http-equiv="Content-Type" content="text\/html; charset=UTF-8">\n    <\/head>\n    <body id="the_document_body">\n        <h1>List of Files<\/h1>\n            <ul>\n/g}' | sed -e '${s/$/\n            <\/ul>\n            <\/br><\/br>\n    <\/body>\n<\/html>\n/g}'
        #
        #---------------
        if [ "$SB_SED_OR_GSED_EXISTS_ON_PATH" == "t" ]; then
            alias mmmv_cre_HTML_ls_t4_recursive_list_of_files="S_FP=\"\`pwd\`/recursive_list_of_files.html\" ; if [ ! -e \"\$S_FP\" ]; then find . -type f | sort | $S_CMD_GNU_SED -e 's/\\(^.\\+\$\\)/                <li><a href=\"\\1\">\\1<\\/a><\\/li>/g' | $S_CMD_GNU_SED -e '1{s/^/<!DOCTYPE HTML>\\n<html>\\n    <head>\\n        <title>Recursive list of Files<\\/title>\\n        <meta http-equiv=\"Content-Type\" content=\"text\\/html; charset=UTF-8\">\\n    <\\/head>\\n    <body id=\"the_document_body\">\\n        <h1>List of Files<\\/h1>\\n            <ul>\\n/g}' | $S_CMD_GNU_SED -e '\${s/\$/\\n            <\\/ul>\\n            <\\/br><\\/br>\\n    <\\/body>\\n<\\/html>\\n/g}' > \$S_FP ; sync ; wait ; chmod 0700 \$S_FP ; sync ; else echo \"\" ; echo \"A file or a folder with the path of \" ; echo \"\" ; echo \"    \$S_FP\" ; echo \"\" ; echo -e \"\\e[31malready exists\\e[39m. Not overwriting it.\" ; echo \"\" ; fi "
        fi
        #------------------------------------------------------------------
        if [ "$SB_GREP_EXISTS_ON_PATH" == "t" ]; then
            #---------------
            # "find . -type d " lists the parent folder,
            # the ".", as one of the directories.
            alias mmmv_cre_txt_list_of_folders_t1="S_FP=\"\`pwd\`/list_of_folders.txt\" ; if [ ! -e \"\$S_FP\" ]; then find . -type d | grep -E -v '^[.]\$' | sort  > \$S_FP ; sync ; wait ; chmod 0700 \$S_FP ; sync ; wait ; else echo \"\" ; echo \"A file or a folder with the path of \" ; echo \"\" ; echo \"    \$S_FP\" ; echo \"\" ; echo -e \"\\e[31malready exists\\e[39m. Not overwriting it.\" ; echo \"\" ; fi "
            #---------------
            alias mmmv_cre_HTML_ls_t5_recursive_list_of_folders="S_FP=\"\`pwd\`/recursive_list_of_folders.html\" ; if [ ! -e \"\$S_FP\" ]; then find . -type d | grep -E -v '^[.]\$' | sort | $S_CMD_GNU_SED -e 's/\\(^.\\+\$\\)/                <li><a href=\"\\1\">\\1<\\/a><\\/li>/g' | $S_CMD_GNU_SED -e '1{s/^/<!DOCTYPE HTML>\\n<html>\\n    <head>\\n        <title>Recursive list of Folders<\\/title>\\n        <meta http-equiv=\"Content-Type\" content=\"text\\/html; charset=UTF-8\">\\n    <\\/head>\\n    <body id=\"the_document_body\">\\n        <h1>List of Folders<\\/h1>\\n            <ul>\\n/g}' | $S_CMD_GNU_SED -e '\${s/\$/\\n            <\\/ul>\\n            <\\/br><\\/br>\\n    <\\/body>\\n<\\/html>\\n/g}' > \$S_FP ; sync ; wait ; chmod 0700 \$S_FP ; sync ; else echo \"\" ; echo \"A file or a folder with the path of \" ; echo \"\" ; echo \"    \$S_FP\" ; echo \"\" ; echo -e \"\\e[31malready exists\\e[39m. Not overwriting it.\" ; echo \"\" ; fi "
            #---------------
            alias mmmv_cre_txt_list_of_folders_t2="S_FP=\"\`pwd\`/list_of_folders.txt\" ; if [ ! -e \"\$S_FP\" ]; then find . -type d | grep -E -v '^[.]\$' | grep -v '[/]par2_based_error_correction_files' | sort  > \$S_FP ; sync ; wait ; chmod 0700 \$S_FP ; sync ; wait ; else echo \"\" ; echo \"A file or a folder with the path of \" ; echo \"\" ; echo \"    \$S_FP\" ; echo \"\" ; echo -e \"\\e[31malready exists\\e[39m. Not overwriting it.\" ; echo \"\" ; fi "
            #---------------
            alias mmmv_cre_HTML_ls_t6_recursive_list_of_folders="S_FP=\"\`pwd\`/recursive_list_of_folders.html\" ; if [ ! -e \"\$S_FP\" ]; then find . -type d | grep -E -v '^[.]\$' | grep -v '[/]par2_based_error_correction_files' | sort | $S_CMD_GNU_SED -e 's/\\(^.\\+\$\\)/                <li><a href=\"\\1\">\\1<\\/a><\\/li>/g' | $S_CMD_GNU_SED -e '1{s/^/<!DOCTYPE HTML>\\n<html>\\n    <head>\\n        <title>Recursive list of Folders<\\/title>\\n        <meta http-equiv=\"Content-Type\" content=\"text\\/html; charset=UTF-8\">\\n    <\\/head>\\n    <body id=\"the_document_body\">\\n        <h1>List of Folders<\\/h1>\\n            <ul>\\n/g}' | $S_CMD_GNU_SED -e '\${s/\$/\\n            <\\/ul>\\n            <\\/br><\\/br>\\n    <\\/body>\\n<\\/html>\\n/g}' > \$S_FP ; sync ; wait ; chmod 0700 \$S_FP ; sync ; else echo \"\" ; echo \"A file or a folder with the path of \" ; echo \"\" ; echo \"    \$S_FP\" ; echo \"\" ; echo -e \"\\e[31malready exists\\e[39m. Not overwriting it.\" ; echo \"\" ; fi "
            #---------------
            # The grep regex with "xsl" at the next line
            alias mmmv_cre_txt_list_of_files_t2="S_FP=\"\`pwd\`/list_of_files.txt\" ; if [ ! -e \"\$S_FP\" ]; then find . -type f | grep -v -i -E '[.]par2' | grep -v -i -E '([.](css|js|xsl|dtd)|([0-9abcdef]{6}))\$' | grep -v '[/]par2_based_error_correction_files[/]' | sort  > \$S_FP ; sync ; wait ; chmod 0700 \$S_FP ; sync ; wait ; else echo \"\" ; echo \"A file or a folder with the path of \" ; echo \"\" ; echo \"    \$S_FP\" ; echo \"\" ; echo -e \"\\e[31malready exists\\e[39m. Not overwriting it.\" ; echo \"\" ; fi "
            # has been tested to work on FreeBSD.
            #---------------
            if [ "$SB_SED_OR_GSED_EXISTS_ON_PATH" == "t" ]; then
                #---------------
                alias mmmv_cre_HTML_ls_t7_recursive_list_of_files_without_css_js_xsl_dtd_extentionlesshex="S_FP=\"\`pwd\`/partial_recursive_list_of_files.html\" ; if [ ! -e \"\$S_FP\" ]; then find . -type f | grep -v -i -E '[.]par2' | grep -v -i -E '([.](css|js|xsl|dtd)|([0-9abcdef]{6}))\$' | grep -v '[/]par2_based_error_correction_files[/]' | sort | $S_CMD_GNU_SED -e 's/\\(^.\\+\$\\)/                <li><a href=\"\\1\">\\1<\\/a><\\/li>/g' | $S_CMD_GNU_SED -e '1{s/^/<!DOCTYPE HTML>\\n<html>\\n    <head>\\n        <title>Recursive list of Files with CSS, XSL, DTD and some Other Files Omitted<\\/title>\\n        <meta http-equiv=\"Content-Type\" content=\"text\\/html; charset=UTF-8\">\\n    <\\/head>\\n    <body id=\"the_document_body\">\\n        <h1>List of Files<\\/h1>\\n            <ul>\\n/g}' | $S_CMD_GNU_SED -e '\${s/\$/\\n            <\\/ul>\\n            <\\/br><\\/br>\\n    <\\/body>\\n<\\/html>\\n/g}' > \$S_FP ; sync ; wait ; chmod 0700 \$S_FP ; sync ; else echo \"\" ; echo \"A file or a folder with the path of \" ; echo \"\" ; echo \"    \$S_FP\" ; echo \"\" ; echo -e \"\\e[31malready exists\\e[39m. Not overwriting it.\" ; echo \"\" ; fi "
                #------------------------------------------------------------------
                # The Ruby code below is for generating a grep sub-regex for
                # some of the mmmv_cre_HTML_ls_... aliases.
                #------------------------------------------------------------------
                # #!/usr/bin/env ruby
                #
                # def s_grep_subregex_from(ar_file_extentions=Array.new)
                #    #--------
                #    func_char_to_regex_chargroup=lambda do |s_char| # "a" -> "[aA]"; "2" -> "[2]"
                #       s_a0=s_char.downcase
                #       s_a1=s_char.upcase
                #       s_a2=nil
                #       if s_a0 != s_a1
                #          s_a2=("["+s_a0)+(s_a1+"]")
                #       else
                #          s_a2="["+s_a0+"]"
                #       end # if
                #       return s_a2
                #    end # func_char_to_regex_chargroup
                #    #--------
                #    rgx_0=/./
                #    func_file_extention_to_subregex=lambda do |s_file_extention| # "ps" -> "([pP][sS])"
                #       s_b0=s_file_extention.downcase
                #       ar_chars_0=s_b0.scan(rgx_0)
                #       i_len_ar_chars_0=ar_chars_0.size
                #       s_b1="("
                #       ix=nil
                #       i_len_ar_chars_0.times do |ix_char|
                #          s_b1<<(func_char_to_regex_chargroup.call(ar_chars_0[ix_char]))
                #       end # loop
                #       s_b1<<")"
                #       return s_b1
                #    end # func_file_extention_to_subregex
                #    #--------
                #    i_ar_file_extentions_len=ar_file_extentions.size
                #    s_extention=nil
                #    s_rgx=""
                #    i_ar_file_extentions_len.times do |ix_extention|
                #       s_extention=ar_file_extentions[ix_extention]
                #       s_rgx<<"|" if 0 < ix_extention
                #       s_rgx<<(func_file_extention_to_subregex.call(s_extention))
                #    end # loop
                #    return s_rgx
                # end # s_grep_subregex_from
                #
                # ar=["mp4","mp3","mp2","avi","mov","mpg","webm","ogg","ova","zip","jar","gz","tgz","xz","txz","bz2","tbz2","lz","tlz","rar","arj","7z","t7z","tar"]
                # s_0=s_grep_subregex_from(ar)
                # puts(s_0)
                #
                #----------------------------------------------------------------------
                alias mmmv_cre_HTML_ls_t8_recursive_list_of_files_doc_pdf_ps_xls_and_alike_including_txt_md_dbf_csv_dot="S_FP=\"\`pwd\`/partial_recursive_list_of_files.html\" ; if [ ! -e \"\$S_FP\" ]; then find . -type f | grep  -E '[.](([pP][sS])|([dD][oO][cC]([xX]|[mM])?)|([pP][dD][fF])|([oO][dD]([sS]|[fF]|[tT]))|([dD][oO][tT][xX]?)|([oO][tT][tT])|([rR][tT][fF])|([mM][dD])|([tT][xX][tT])|([uU][oO]([tT]|[sS]))|([fF][oO][dD][tT])|([xX][lL][sS]([xX]|[mM])?)|([xX][lL][tT][xX]?)|([oO][tT][sS])|[dD][iI][fF]|([sS][lL][kK])|([cC][sS][vV])|([dD][bB][fF])|([fF][oO][dD][sS]))\$' | sort | $S_CMD_GNU_SED -e 's/\\(^.\\+\$\\)/                <li><a href=\"\\1\">\\1<\\/a><\\/li>/g' | $S_CMD_GNU_SED -e '1{s/^/<!DOCTYPE HTML>\\n<html>\\n    <head>\\n        <title>Recursive list of Files: PDF, PS, DOC, ODT, XLS and alike.<\\/title>\\n        <meta http-equiv=\"Content-Type\" content=\"text\\/html; charset=UTF-8\">\\n    <\\/head>\\n    <body id=\"the_document_body\">\\n        <h1>List of Files<\\/h1>\\n            <ul>\\n/g}' | $S_CMD_GNU_SED -e '\${s/\$/\\n            <\\/ul>\\n            <\\/br><\\/br>\\n    <\\/body>\\n<\\/html>\\n/g}' > \$S_FP ; sync ; wait ; chmod 0700 \$S_FP ; sync ; else echo \"\" ; echo \"A file or a folder with the path of \" ; echo \"\" ; echo \"    \$S_FP\" ; echo \"\" ; echo -e \"\\e[31malready exists\\e[39m. Not overwriting it.\" ; echo \"\" ; fi "
                #---------------
                alias mmmv_cre_HTML_ls_t9_recursive_list_of_files_doc_pdf_ps_xls_and_alike_including_txt_md_dbf_csv_dot_mp4_webm_zip_tar="S_FP=\"\`pwd\`/partial_recursive_list_of_files.html\" ; if [ ! -e \"\$S_FP\" ]; then find . -type f | grep  -E '[.](([pP][sS])|([dD][oO][cC]([xX]|[mM])?)|([pP][dD][fF])|([oO][dD]([sS]|[fF]|[tT]))|([dD][oO][tT][xX]?)|([oO][tT][tT])|([rR][tT][fF])|([mM][dD])|([tT][xX][tT])|([uU][oO]([tT]|[sS]))|([fF][oO][dD][tT])|([xX][lL][sS]([xX]|[mM])?)|([xX][lL][tT][xX]?)|([oO][tT][sS])|[dD][iI][fF]|([sS][lL][kK])|([cC][sS][vV])|([dD][bB][fF])|([fF][oO][dD][sS])|([mM][pP][4])|([mM][pP][3])|([mM][pP][2])|([aA][vV][iI])|([mM][oO][vV])|([mM][pP][gG])|([wW][eE][bB][mM])|([oO][gG][gG])|([oO][vV][aA])|([zZ][iI][pP])|([jJ][aA][rR])|([gG][zZ])|([tT][gG][zZ])|([xX][zZ])|([tT][xX][zZ])|([bB][zZ][2])|([tT][bB][zZ][2])|([lL][zZ])|([tT][lL][zZ])|([rR][aA][rR])|([aA][rR][jJ])|([7][zZ])|([tT][7][zZ])|([tT][aA][rR]))\$' | sort | $S_CMD_GNU_SED -e 's/\\(^.\\+\$\\)/                <li><a href=\"\\1\">\\1<\\/a><\\/li>/g' | $S_CMD_GNU_SED -e '1{s/^/<!DOCTYPE HTML>\\n<html>\\n    <head>\\n        <title>Recursive list of Files: PDF, PS, DOC, ODT, XLS and alike.<\\/title>\\n        <meta http-equiv=\"Content-Type\" content=\"text\\/html; charset=UTF-8\">\\n    <\\/head>\\n    <body id=\"the_document_body\">\\n        <h1>List of Files<\\/h1>\\n            <ul>\\n/g}' | $S_CMD_GNU_SED -e '\${s/\$/\\n            <\\/ul>\\n            <\\/br><\\/br>\\n    <\\/body>\\n<\\/html>\\n/g}' > \$S_FP ; sync ; wait ; chmod 0700 \$S_FP ; sync ; else echo \"\" ; echo \"A file or a folder with the path of \" ; echo \"\" ; echo \"    \$S_FP\" ; echo \"\" ; echo -e \"\\e[31malready exists\\e[39m. Not overwriting it.\" ; echo \"\" ; fi "
                #------------------------------------------------------------------
            fi
            #---------------
        fi
        #------------------------------------------------------------------
        if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
            alias mmmv_cre_txt_list_of_named_pipes_t1="S_FP=\"\`pwd\`/list_of_named_pipes.txt\" ; if [ ! -e \"\$S_FP\" ]; then find . -type p | sort  > \$S_FP ; sync ; wait ; chmod 0700 \$S_FP ; sync ; wait ; else echo \"\" ; echo \"A file or a folder with the path of \" ; echo \"\" ; echo \"    \$S_FP\" ; echo \"\" ; echo -e \"\\e[31malready exists\\e[39m. Not overwriting it.\" ; echo \"\" ; fi "
            alias mmmv_cre_txt_list_of_socketfiles_t1="S_FP=\"\`pwd\`/list_of_socketfiles.txt\" ; if [ ! -e \"\$S_FP\" ]; then find . -type s | sort  > \$S_FP ; sync ; wait ; chmod 0700 \$S_FP ; sync ; wait ; else echo \"\" ; echo \"A file or a folder with the path of \" ; echo \"\" ; echo \"    \$S_FP\" ; echo \"\" ; echo -e \"\\e[31malready exists\\e[39m. Not overwriting it.\" ; echo \"\" ; fi "
        fi
        #------------------------------------------------------------------
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_GLIMPSEINDEX_EXISTS_ON_PATH" == "t" ]; then
    # The
    alias mmmv_se_glimpse_index_t1="SI_MAX_NUMBER_OF_MiB_DURING_INDEXING=\"20\" ; $S_FP_NICE -n 5 glimpseindex -M \$SI_MAX_NUMBER_OF_MiB_DURING_INDEXING -n -B -b -f -s -H " # $FULL_PATH_TO_FOLDER_WITH_INDICES  $FULL_PATH_OF_THE_FOLDER_WITH_INDEXABLE_DOCUMENTS
    # creates index files that have a path of
    # $FULL_PATH_TO_FOLDER_WITH_INDICES/.glimpse_Foo
    #
    # For scripts the following code might be useful:
    #
    #     rm $FULL_PATH_TO_FOLDER_WITH_INDICES/.glimpse_*
    #     wait
    #     SI_MAX_NUMBER_OF_MiB_DURING_INDEXING="20"
    #     glimpseindex -M $SI_MAX_NUMBER_OF_MiB_DURING_INDEXING \
    #         -n -B -b -f -s -H $FULL_PATH_TO_FOLDER_WITH_INDICES \
    #         $FULL_PATH_OF_THE_FOLDER_WITH_INDEXABLE_DOCUMENTS
    #
fi
if [ "$SB_GLIMPSE_EXISTS_ON_PATH" == "t" ]; then
    alias mmmv_se_glimpse_search_t1="$S_FP_NICE -n 2 glimpse -y -H " # $FULL_PATH_TO_FOLDER_WITH_INDICES <the rest of the parameters> searchstrng
    # Examples:
    #
    #     # Case insensitive search from subparts of words:
    #     glimpse -y -H $FULL_PATH_TO_FOLDER_WITH_INDICES -i searchstring
    #
    #     # Case insensitive search with a requirement that
    #     # the match must match a whole word.
    #     glimpse -y -H $FULL_PATH_TO_FOLDER_WITH_INDICES -i -w searchstring
    #
    #     # The same as above, but at most 77 search results are displayed.
    #     glimpse -y -H $FULL_PATH_TO_FOLDER_WITH_INDICES -i -w -L 77 searchstring
    #
    #     # Fuzzy search with a maximum number of mismaching characters of 2.
    #     # The "-i" and "-w" options do not work with fuzzy search.
    #     glimpse -y -H $FULL_PATH_TO_FOLDER_WITH_INDICES -2 searchstring
    #
fi
#--------------------------------------------------------------------------
# According to the
#
#     https://vim.fandom.com/wiki/Using_vim_as_a_man-page_viewer_under_Unix
#     archival copies:
#         https://archive.vn/DaYZK
#         https://web.archive.org/web/20210810075503/https://vim.fandom.com/wiki/Using_vim_as_a_man-page_viewer_under_Unix
#
# the
#
#     let $PAGER=''
#
# in the ~/.vimrc combined with the
#
#     export PAGER="/bin/sh -c \"unset PAGER;col -b -x |  vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>'  -c 'map <SPACE> <C-D>' -c 'map b <C-U>'  -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""
#
# in the ~/.bashrc should make sure that
# the Vim is used for displaying man pages.
#----------------------------------------
if [ "$SB_SH_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_COL_EXISTS_ON_PATH" == "t" ]; then
        if [ "$SB_VIM_EXISTS_ON_PATH" == "t" ]; then
            #export PAGER="/bin/sh -c \"unset PAGER;col -b -x |  vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>'  -c 'map <SPACE> <C-D>' -c 'map b <C-U>'  -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""
            export MMMV_USERSPACE_DISTRO_T1_BASHRC_MANPAGEREADER_VIM_T1="export PAGER=\"/bin/sh -c \\\"unset PAGER;col -b -x |  vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>'  -c 'map <SPACE> <C-D>' -c 'map b <C-U>'  -c 'nmap K :Man <C-R>=expand(\\\\\\\"<cword>\\\\\\\")<CR><CR>' -\\\"\""
            alias mmmv_ui_manpagereader_Vim_t1="$MMMV_USERSPACE_DISTRO_T1_BASHRC_MANPAGEREADER_VIM_T1"
        fi
    fi
fi
#----------------------------------------
# The idea for displaying man pages in Emacs
# originates from
#     https://stackoverflow.com/questions/10644163/how-to-view-man-pages-using-emacs-when-invoking-man-command-in-command-line
#     archival copy: https://archive.ph/oxghe
#
func_mmmv_userspace_distro_t1_display_man_page_with_emacs_t1(){
    local S_SEARCHSTRING="$1"
    #----------------------------------------------------------------------
    if [ "$SB_EMACS_EXISTS_ON_PATH" == "t" ]; then
        $S_FP_NICE -n 5 emacs -eval "(woman \"$S_SEARCHSTRING\")";
        func_mmmv_wait_and_sync_t1
    else
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo -e "\e[31mThe ~/.bashrc or some subpart of it is flawed.\e[39m"
            echo "This function should never be called if "
            echo "the Emacs is missing from PATH."
            echo "GUID=='2ea3ca32-e471-4cca-a65a-8312503099e7'"
            echo ""
        fi
    fi
} # func_mmmv_userspace_distro_t1_display_man_page_with_emacs_t1

if [ "$SB_EMACS_EXISTS_ON_PATH" == "t" ]; then
    export MMMV_USERSPACE_DISTRO_T1_BASHRC_MANPAGEREADER_EMACS_T1="export PAGER=\"func_mmmv_userspace_distro_t1_display_man_page_with_emacs_t1 \""
    alias mmmv_ui_manpagereader_Emacs_t1="$MMMV_USERSPACE_DISTRO_T1_BASHRC_MANPAGEREADER_EMACS_T1"
fi
#--------------------------------------------------------------------------
S_FP_0="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/lib/templates"
S_FP_1a="$S_FP_0/_bashrc_optional_extra_00.bash.template"
S_FP_1b="$HOME/m_local/etc/_bashrc_optional_extra_00.bash"
S_FP_2a="$S_FP_0/_bashrc_optional_extra_00_bash_subpart_01.rb.template"
S_FP_2b="$HOME/m_local/etc/_bashrc_optional_extra_00_bash_subpart_01.rb"
func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
    "$S_FP_1a" "22d0ac38-0936-4198-9d2a-8312503099e7" \
    "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
    func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
        "$S_FP_2a" "b2e3cdb0-51c6-4467-be9a-8312503099e7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        alias mmmv_admin_cre_bashrc_optional_extra_00="if [ -e \"$S_FP_1b\" ]; then echo \"$S_FP_1b already exists\" ; else if [ -e \"$S_FP_2b\" ]; then echo \"$S_FP_2b already exists\" ; else cp $S_FP_1a $S_FP_1b ; cp $S_FP_2a $S_FP_2b ; sync ; wait ; fi fi "
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "t" ]; then
    #--------------------
    S_TMP_0="/sdcard"
    # It might be that the Android device does not have an
    # sdcard installed in it or for some reason the "/sdcard"
    # is a file or a symlink to a file.
    SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING="f"
    func_mmmv_userspace_distro_t1_declare_alias_cd_t1 \
        "mmmv_go_sdcard" "$S_TMP_0" \
        "42d9ed63-3315-46b6-9129-8312503099e7" \
        "$SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        S_TMP_0="/sdcard/Download"
        func_mmmv_userspace_distro_t1_declare_alias_cd_t1 \
            "mmmv_go_Download" "$S_TMP_0" \
            "43b66ab3-88c2-445c-a559-8312503099e7" \
            "$SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING"
        S_TMP_0="/sdcard/download"
        func_mmmv_userspace_distro_t1_declare_alias_cd_t1 \
            "mmmv_go_download" "$S_TMP_0" \
            "25fb1de1-420d-4de3-bc19-8312503099e7" \
            "$SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING"
    fi
    #--------------------
fi
#--------------------------------------------------------------------------
#--------------------------------------------------------------------------
#alias mmmv_visudo="visudo -f /etc/sudoers.d/mmmv_sudoers_seadistus "
#--------------------------------------------------------------------------
if [ "$SQLITE_LIMIT_LENGTH" == "" ]; then
    # According to the
    #     https://www.sqlite.org/c3ref/c_limit_attached.html#sqlitelimitlength
    # the
    export SQLITE_LIMIT_LENGTH="4294967295" # number of bytes
    #export SQLITE_LIMIT_LENGTH="104294967295" # number of bytes
    # is, a citation: "The maximum size of any string or
    # BLOB or table row, in bytes."
fi
#--------------------------------------------------------------------------
S_FP_0="$HOME/mmff_$S_WHOAMI"
if [ -e "$S_FP_0" ]; then
    if [ -d "$S_FP_0" ]; then
        alias mmmv_go_mmff="cd $S_FP_0"
    fi
fi
S_FP_1="$S_FP_0/m_local"
if [ -e $S_FP_1/bin ]; then
    if [ -d $S_FP_1/bin ]; then
        Z_PATH="$S_FP_1/bin:$Z_PATH"
    fi
fi
#--------
S_FP_0="$HOME/mmff/m_local"
if [ -e $S_FP_0/bin ]; then
    if [ -d $S_FP_0/bin ]; then
        Z_PATH="$S_FP_0/bin:$Z_PATH"
    fi
fi
S_FP_0="$HOME/m_local"
if [ -e $S_FP_0/bin ]; then
    if [ -d $S_FP_0/bin ]; then
        Z_PATH="$S_FP_0/bin:$Z_PATH"
    fi
fi
#--------------------------------------------------------------------------
FP_MMMV="$HOME/.mmmv"
FP_MMMV_BASHRC="$FP_MMMV/mmmv_bashrc"
FP_MMMV_USERSPECIFIC_SUBPART_OF_VIMRC="$FP_MMMV/_vimrc_userspecific_subpart_that_will_be_overwritten_automatically.vim"
FP_MMMV_USERSPECIFIC_SUBPART_OF_VIMRC_TEMPLATE="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/lib/templates/_vimrc_userspecific_subpart_that_will_be_overwritten_automatically_template.vim"
FP_MMMV_BASHRC_DYNAMIC_SYMLINKS_ON_PATH="$FP_MMMV_BASHRC/dynamic_symlinks_on_PATH"
SB_MMMV_BASHRC_DYNAMIC_SYMLINKS_ON_PATH_EXISTS="f"
#--------------------------------------------------------------------------
if [ ! -e "$FP_MMMV" ]; then
    mkdir -p $FP_MMMV
    func_mmmv_wait_and_sync_t1
    func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
        "$FP_MMMV" "05e2a467-ea44-4e5c-ab99-8312503099e7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
fi
#--------------------------------------------------------------------------
if [ ! -e "$FP_MMMV_BASHRC" ]; then
    mkdir -p $FP_MMMV_BASHRC
    func_mmmv_wait_and_sync_t1
    func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
        "$FP_MMMV_BASHRC" "1f492d15-629f-4d4e-9759-8312503099e7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
fi
#--------------------------------------------------------------------------
if [ -e "$FP_MMMV" ]; then
    if [ -d "$FP_MMMV" ]; then
        #------------------------------------------------------------------
        if [ ! -e "$FP_MMMV_USERSPECIFIC_SUBPART_OF_VIMRC" ]; then
            cp "$FP_MMMV_USERSPECIFIC_SUBPART_OF_VIMRC_TEMPLATE" \
                "$FP_MMMV_USERSPECIFIC_SUBPART_OF_VIMRC"
            func_mmmv_wait_and_sync_t1
            chmod 0700 "$FP_MMMV_USERSPECIFIC_SUBPART_OF_VIMRC"
            func_mmmv_wait_and_sync_t1
        fi
        func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
            "$FP_MMMV_USERSPECIFIC_SUBPART_OF_VIMRC" \
            "5922d654-2840-440f-af49-8312503099e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        #------------------------------------------------------------------
        if [ -e "$FP_MMMV_BASHRC" ]; then
            if [ -d "$FP_MMMV_BASHRC" ]; then
                #----------------------------------------------------------
                if [ ! -e "$FP_MMMV_BASHRC_DYNAMIC_SYMLINKS_ON_PATH" ]; then
                    mkdir -p $FP_MMMV_BASHRC_DYNAMIC_SYMLINKS_ON_PATH
                    func_mmmv_wait_and_sync_t1
                fi
                func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                    "$FP_MMMV_BASHRC_DYNAMIC_SYMLINKS_ON_PATH" \
                    "10a327e3-2639-4fd2-9f29-8312503099e7" \
                    "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
                if [ -e "$FP_MMMV_BASHRC_DYNAMIC_SYMLINKS_ON_PATH" ]; then
                    if [ -d "$FP_MMMV_BASHRC_DYNAMIC_SYMLINKS_ON_PATH" ]; then
                        SB_MMMV_BASHRC_DYNAMIC_SYMLINKS_ON_PATH_EXISTS="t"
                    fi
                fi
                #----------------------------------------------------------
            fi
        fi
        #------------------------------------------------------------------
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_MMMV_BASHRC_DYNAMIC_SYMLINKS_ON_PATH_EXISTS" == "t" ]; then
    Z_PATH="$FP_MMMV_BASHRC_DYNAMIC_SYMLINKS_ON_PATH:$Z_PATH"
fi
#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
    # The following 2 aliases work also on WSL.
    alias mmmv_ls_processes_t1=" ps -ef "
    alias mmmv_ls_processes_t1_grep=" ps -ef | grep " # <grep parameters, including the process name, come here>
fi
#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID" == "f" ]; then
        if [ "$SB_XDGMIME_EXISTS_ON_PATH" == "t" ]; then
            #--------------------------------------------------------------
            S_FP_0="/usr/share/applications/"
            # Line for testing the default HTML browser setting:
            #     xdg-open ./index.html
            #--------------------------------------------------------------
            if [ "$SB_FALKON_EXISTS_ON_PATH" == "t" ]; then
                S_FP_1="org.kde.falkon.desktop"
                S_FP_2="$S_FP_0$S_FP_1"
                if [ -e "$S_FP_2" ]; then
                    if [ ! -d "$S_FP_2" ]; then
                        alias mmmv_admin_set_default_HTML_browser_Falkon="xdg-mime default $S_FP_1 text/html"
                        alias mmmv_admin_set_default_PDF_viewer_Falkon="xdg-mime default $S_FP_1 application/pdf"
                    fi
                fi
            fi
            #--------------------------------------------------------------
            if [ "$SB_FIREFOX_EXISTS_ON_PATH" == "t" ]; then
                S_FP_1="firefox.desktop"
                S_FP_2="$S_FP_0$S_FP_1"
                if [ -e "$S_FP_2" ]; then
                    if [ ! -d "$S_FP_2" ]; then
                        alias mmmv_admin_set_default_HTML_browser_Firefox="xdg-mime default $S_FP_1 text/html"
                        alias mmmv_admin_set_default_PDF_viewer_Firefox="xdg-mime default $S_FP_1 application/pdf"
                    fi
                fi
            fi
            #--------------------------------------------------------------
            if [ "$SB_CHROMIUM_EXISTS_ON_PATH" == "t" ]; then
                S_FP_1="chromium.desktop"
                S_FP_2="$S_FP_0$S_FP_1"
                if [ -e "$S_FP_2" ]; then
                    if [ ! -d "$S_FP_2" ]; then
                        alias mmmv_admin_set_default_HTML_browser_Chromium="xdg-mime default $S_FP_1 text/html"
                        alias mmmv_admin_set_default_PDF_viewer_Chromium="xdg-mime default $S_FP_1 application/pdf"
                    fi
                fi
            fi
            #--------------------------------------------------------------
            if [ "$SB_DILLO_EXISTS_ON_PATH" == "t" ]; then
                S_FP_1="dillo.desktop"
                S_FP_2="$S_FP_0$S_FP_1"
                if [ -e "$S_FP_2" ]; then
                    if [ ! -d "$S_FP_2" ]; then
                        alias mmmv_admin_set_default_HTML_browser_Dillo="xdg-mime default $S_FP_1 text/html"
                    fi
                fi
            fi
            #--------------------------------------------------------------
            if [ "$SB_MIDORI_EXISTS_ON_PATH" == "t" ]; then
                S_FP_1="midori.desktop" # TODO: check, if that's the most common .desktop file name for Midori
                S_FP_2="$S_FP_0$S_FP_1"
                if [ -e "$S_FP_2" ]; then
                    if [ ! -d "$S_FP_2" ]; then
                        alias mmmv_admin_set_default_HTML_browser_Midori="xdg-mime default $S_FP_1 text/html"
                    fi
                fi
            fi
            #--------------------------------------------------------------
            if [ "$SB_NETSURF_EXISTS_ON_PATH" == "t" ]; then
                S_FP_1="netsurf-gtk.desktop"
                S_FP_2="$S_FP_0$S_FP_1"
                if [ -e "$S_FP_2" ]; then
                    if [ ! -d "$S_FP_2" ]; then
                        alias mmmv_admin_set_default_HTML_browser_NetSurf="xdg-mime default $S_FP_1 text/html"
                    fi
                fi
            fi
            #--------------------------------------------------------------
            if [ "$SB_QUTEBROWSER_EXISTS_ON_PATH" == "t" ]; then
                S_FP_1="org.qutebrowser.qutebrowser.desktop"
                S_FP_2="$S_FP_0$S_FP_1"
                if [ -e "$S_FP_2" ]; then
                    if [ ! -d "$S_FP_2" ]; then
                        alias mmmv_admin_set_default_HTML_browser_qutebrowser="xdg-mime default $S_FP_1 text/html"
                    fi
                fi
            fi
            #--------------------------------------------------------------
            if [ "$SB_EVINCE_EXISTS_ON_PATH" == "t" ]; then
                S_FP_1="org.gnome.Evince.desktop"
                S_FP_2="$S_FP_0$S_FP_1"
                if [ -e "$S_FP_2" ]; then
                    if [ ! -d "$S_FP_2" ]; then
                        alias mmmv_admin_set_default_PDF_viewer_Evnice="xdg-mime default $S_FP_1 application/pdf"
                    fi
                fi
            fi
            #--------------------------------------------------------------
            if [ "$SB_XPDF_EXISTS_ON_PATH" == "t" ]; then
                S_FP_1="xpdf.desktop"
                S_FP_2="$S_FP_0$S_FP_1"
                if [ -e "$S_FP_2" ]; then
                    if [ ! -d "$S_FP_2" ]; then
                        alias mmmv_admin_set_default_PDF_viewer_Xpdf="xdg-mime default $S_FP_1 application/pdf"
                    fi
                fi
            fi
            #--------------------------------------------------------------
            if [ "$SB_EOG_EXISTS_ON_PATH" == "t" ]; then
                S_FP_1="org.gnome.eog.desktop"
                S_FP_2="$S_FP_0$S_FP_1"
                if [ -e "$S_FP_2" ]; then
                    if [ ! -d "$S_FP_2" ]; then
                        alias mmmv_admin_set_default_photo_viewer_eog="xdg-mime default $S_FP_1 image/jpeg ; xdg-mime default $S_FP_1 image/pjpeg ; xdg-mime default $S_FP_1 image/bmp ; xdg-mime default $S_FP_1 image/gif ; xdg-mime default $S_FP_1 image/png "
                    fi
                fi
            fi
            #--------------------------------------------------------------
            if [ "$SB_FEH_EXISTS_ON_PATH" == "t" ]; then
                S_FP_1="feh.desktop"
                S_FP_2="$S_FP_0$S_FP_1"
                if [ -e "$S_FP_2" ]; then
                    if [ ! -d "$S_FP_2" ]; then
                        alias mmmv_admin_set_default_photo_viewer_feh="xdg-mime default $S_FP_1 image/jpeg ; xdg-mime default $S_FP_1 image/pjpeg ; xdg-mime default $S_FP_1 image/bmp ; xdg-mime default $S_FP_1 image/gif ; xdg-mime default $S_FP_1 image/png "
                    fi
                fi
            fi
            #--------------------------------------------------------------
            if [ "$SB_GEEQIE_EXISTS_ON_PATH" == "t" ]; then
                S_FP_1="geeqie.desktop"
                S_FP_2="$S_FP_0$S_FP_1"
                if [ -e "$S_FP_2" ]; then
                    if [ ! -d "$S_FP_2" ]; then
                        alias mmmv_admin_set_default_photo_viewer_Geeqie="xdg-mime default $S_FP_1 image/jpeg ; xdg-mime default $S_FP_1 image/pjpeg ; xdg-mime default $S_FP_1 image/bmp ; xdg-mime default $S_FP_1 image/gif ; xdg-mime default $S_FP_1 image/png "
                    fi
                fi
            fi
            #--------------------------------------------------------------
            if [ "$SB_GTHUMB_EXISTS_ON_PATH" == "t" ]; then
                S_FP_1="org.gnome.gThumb.desktop"
                S_FP_2="$S_FP_0$S_FP_1"
                if [ -e "$S_FP_2" ]; then
                    if [ ! -d "$S_FP_2" ]; then
                        alias mmmv_admin_set_default_photo_viewer_gThumb="xdg-mime default $S_FP_1 image/jpeg ; xdg-mime default $S_FP_1 image/pjpeg ; xdg-mime default $S_FP_1 image/bmp ; xdg-mime default $S_FP_1 image/gif ; xdg-mime default $S_FP_1 image/png "
                    fi
                fi
            fi
            #--------------------------------------------------------------
            if [ "$SB_GWENVIEW_EXISTS_ON_PATH" == "t" ]; then
                S_FP_1="org.kde.gwenview.desktop"
                S_FP_2="$S_FP_0$S_FP_1"
                if [ -e "$S_FP_2" ]; then
                    if [ ! -d "$S_FP_2" ]; then
                        alias mmmv_admin_set_default_photo_viewer_Gwenview="xdg-mime default $S_FP_1 image/jpeg ; xdg-mime default $S_FP_1 image/pjpeg ; xdg-mime default $S_FP_1 image/bmp ; xdg-mime default $S_FP_1 image/gif ; xdg-mime default $S_FP_1 image/png "
                    fi
                fi
            fi
            #--------------------------------------------------------------
            if [ "$SB_RISTRETTO_EXISTS_ON_PATH" == "t" ]; then
                S_FP_1="org.xfce.ristretto.desktop"
                S_FP_2="$S_FP_0$S_FP_1"
                if [ -e "$S_FP_2" ]; then
                    if [ ! -d "$S_FP_2" ]; then
                        alias mmmv_admin_set_default_photo_viewer_ristretto="xdg-mime default $S_FP_1 image/jpeg ; xdg-mime default $S_FP_1 image/pjpeg ; xdg-mime default $S_FP_1 image/bmp ; xdg-mime default $S_FP_1 image/gif ; xdg-mime default $S_FP_1 image/png "
                    fi
                fi
            fi
            #--------------------------------------------------------------
            if [ "$SB_VIEWNIOR_EXISTS_ON_PATH" == "t" ]; then
                S_FP_1="viewnior.desktop"
                S_FP_2="$S_FP_0$S_FP_1"
                if [ -e "$S_FP_2" ]; then
                    if [ ! -d "$S_FP_2" ]; then
                        alias mmmv_admin_set_default_photo_viewer_Viewnior="xdg-mime default $S_FP_1 image/jpeg ; xdg-mime default $S_FP_1 image/pjpeg ; xdg-mime default $S_FP_1 image/bmp ; xdg-mime default $S_FP_1 image/gif ; xdg-mime default $S_FP_1 image/png "
                    fi
                fi
            fi
            #--------------------------------------------------------------
        fi
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
    #----------------------------------------------------------------------
    if [ "$SB_SYSTEMDRUN_EXISTS_ON_PATH" == "t" ]; then
        if [ "$S_FP_NICE" != "" ]; then
            #--------------------------------------------------------------
            # The "systemd-run" requires root privileges, which it can get by
            # asking for root user password, unless the "--user" command line
            # argument is given, in which case it will run without prompting
            # for the root password.
            S_CMD_SYSTEMDRUN="systemd-run --user --scope "
            #--------------------------------------------------------------
            if [ "$SB_FALKON_EXISTS_ON_PATH" == "t" ]; then
                if [ "$S_FP_FALKON" != "" ]; then # just in case
                    #------------------------------------------------------
                    # According to a 2025_06_05 answer from morphic.sh chatbot if
                    # the CPU has exactly 4 cores that all have 2 hardware threads,
                    # then the
                    #     systemd-run --property=CPUAffinity=0,1,2 falkon
                    #     systemd-run --property=CPUQuota=37%      falkon
                    # both allow the "falkon" to run on at most 3 hardware threads, but
                    # in practice on Linux one hardware thread is seen as 100% CPU, so
                    # 3 hardware threads would be 300% CPU.
                    S_TMP_0="$S_CMD_SYSTEMDRUN --scope -p MemoryLimit=4096M -p CPUQuota=100% $S_CMD_NICE_WEBBROWSER $S_FP_FALKON "
                    alias mmmv_run_Falkon_with_Linux_kernel_based_limits_enforcement_RAM_4GiB_CPU_100percent="$S_TMP_0"
                    alias mmmv_run_webbrowser_Falkon_with_Linux_kernel_based_limits_enforcement_RAM_4GiB_CPU_100percent="$S_TMP_0"
                    alias mmmv_webbrowser_Falkon_with_Linux_kernel_based_limits_enforcement_RAM_4GiB_CPU_100percent="$S_TMP_0"
                    #------------------------------------------------------
                    S_TMP_0="$S_CMD_SYSTEMDRUN -p MemoryLimit=1024M -p CPUQuota=50% $S_CMD_NICE_WEBBROWSER $S_FP_FALKON "
                    alias mmmv_run_Falkon_with_Linux_kernel_based_limits_enforcement_RAM_1GiB_CPU_50percent="$S_TMP_0"
                    alias mmmv_run_webbrowser_Falkon_with_Linux_kernel_based_limits_enforcement_RAM_1GiB_CPU_50percent="$S_TMP_0"
                    alias mmmv_webbrowser_Falkon_with_Linux_kernel_based_limits_enforcement_RAM_1GiB_CPU_50percent="$S_TMP_0"
                    #------------------------------------------------------
                    S_TMP_0="$S_CMD_SYSTEMDRUN -p MemoryLimit=1024M -p CPUQuota=100% $S_CMD_NICE_WEBBROWSER $S_FP_FALKON "
                    alias mmmv_run_Falkon_with_Linux_kernel_based_limits_enforcement_RAM_1GiB_CPU_100percent="$S_TMP_0"
                    alias mmmv_run_webbrowser_Falkon_with_Linux_kernel_based_limits_enforcement_RAM_1GiB_CPU_100percent="$S_TMP_0"
                    alias mmmv_webbrowser_Falkon_with_Linux_kernel_based_limits_enforcement_RAM_1GiB_CPU_100percent="$S_TMP_0"
                    #------------------------------------------------------
                    # For Raspberry_Pi 3, which has 4 CPU-cores, 1GiB GPU-shared RAM.
                    S_TMP_0="$S_CMD_SYSTEMDRUN -p MemoryLimit=400M -p CPUQuota=100% $S_CMD_NICE_WEBBROWSER $S_FP_FALKON "
                    alias mmmv_run_Falkon_with_Linux_kernel_based_limits_enforcement_RAM_400MiB_CPU_100percent="$S_TMP_0"
                    alias mmmv_run_webbrowser_Falkon_with_Linux_kernel_based_limits_enforcement_RAM_400MiB_CPU_100percent="$S_TMP_0"
                    alias mmmv_webbrowser_Falkon_with_Linux_kernel_based_limits_enforcement_RAM_400MiB_CPU_100percent="$S_TMP_0"
                    #------------------------------------------------------
                else
                    if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                        echo ""
                        echo "A mmmv_userspace_distro_t1 related "
                        echo -e "\e[31msubpart of the ~/.bashrc is probably flawed\e[39m."
                        echo "At this point the S_FP_FALKON should not "
                        echo "have the value of an empty string."
                        echo "GUID=='c02ba3ed-5f12-4d3d-b55a-8312503099e7'"
                        echo ""
                    fi
                fi
            fi
            #--------------------------------------------------------------
            if [ "$SB_CHROMIUM_EXISTS_ON_PATH" == "t" ]; then
                if [ "$S_FP_CHROMIUM" != "" ]; then # just in case
                    #------------------------------------------------------
                    S_TMP_0="$S_CMD_SYSTEMDRUN -p MemoryLimit=1024M -p CPUQuota=100% $S_CMD_NICE_WEBBROWSER $S_FP_CHROMIUM "
                    alias mmmv_run_Chromium_with_Linux_kernel_based_limits_enforcement_RAM_1GiB_CPU_100percent="$S_TMP_0"
                    alias mmmv_run_webbrowser_Chromium_with_Linux_kernel_based_limits_enforcement_RAM_1GiB_CPU_100percent="$S_TMP_0"
                    alias mmmv_webbrowser_Chromium_with_Linux_kernel_based_limits_enforcement_RAM_1GiB_CPU_100percent="$S_TMP_0"
                    #------------------------------------------------------
                    S_TMP_0="$S_CMD_SYSTEMDRUN -p MemoryLimit=2048M -p CPUQuota=100% $S_CMD_NICE_WEBBROWSER $S_FP_CHROMIUM "
                    alias mmmv_run_Chromium_with_Linux_kernel_based_limits_enforcement_RAM_2GiB_CPU_100percent="$S_TMP_0"
                    alias mmmv_run_webbrowser_Chromium_with_Linux_kernel_based_limits_enforcement_RAM_2GiB_CPU_100percent="$S_TMP_0"
                    alias mmmv_webbrowser_Chromium_with_Linux_kernel_based_limits_enforcement_RAM_2GiB_CPU_100percent="$S_TMP_0"
                    #------------------------------------------------------
                    S_TMP_0="$S_CMD_SYSTEMDRUN -p MemoryLimit=6144M -p CPUQuota=200% $S_CMD_NICE_WEBBROWSER $S_FP_CHROMIUM "
                    alias mmmv_run_Chromium_with_Linux_kernel_based_limits_enforcement_RAM_6GiB_CPU_200percent="$S_TMP_0"
                    alias mmmv_run_webbrowser_Chromium_with_Linux_kernel_based_limits_enforcement_RAM_6GiB_CPU_200percent="$S_TMP_0"
                    alias mmmv_webbrowser_Chromium_with_Linux_kernel_based_limits_enforcement_RAM_6GiB_CPU_200percent="$S_TMP_0"
                    #------------------------------------------------------
                    S_TMP_0="$S_CMD_SYSTEMDRUN -p MemoryLimit=8192M -p CPUQuota=300% $S_CMD_NICE_WEBBROWSER $S_FP_CHROMIUM "
                    alias mmmv_run_Chromium_with_Linux_kernel_based_limits_enforcement_RAM_8GiB_CPU_300percent="$S_TMP_0"
                    alias mmmv_run_webbrowser_Chromium_with_Linux_kernel_based_limits_enforcement_RAM_8GiB_CPU_300percent="$S_TMP_0"
                    alias mmmv_webbrowser_Chromium_with_Linux_kernel_based_limits_enforcement_RAM_8GiB_CPU_300percent="$S_TMP_0"
                    #------------------------------------------------------
                else
                    if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                        echo ""
                        echo "A mmmv_userspace_distro_t1 related "
                        echo -e "\e[31msubpart of the ~/.bashrc is probably flawed\e[39m."
                        echo "At this point the S_FP_CHROMIUM should not "
                        echo "have the value of an empty string."
                        echo "GUID=='862d8275-22ef-4da6-8c4a-8312503099e7'"
                        echo ""
                    fi
                fi
            fi
            #--------------------------------------------------------------
            if [ "$SB_QUTEBROWSER_EXISTS_ON_PATH" == "t" ]; then
                if [ "$S_FP_QUTEBROWSER" != "" ]; then # just in case
                    #------------------------------------------------------
                    S_TMP_0="$S_CMD_SYSTEMDRUN -p MemoryLimit=4096M -p CPUQuota=25% $S_CMD_NICE_WEBBROWSER $S_FP_QUTEBROWSER "
                    alias mmmv_run_qutebrowser_with_Linux_kernel_based_limits_enforcement_RAM_4GiB_CPU_25percent="$S_TMP_0"
                    alias mmmv_run_webbrowser_qutebrowser_with_Linux_kernel_based_limits_enforcement_RAM_4GiB_CPU_25percent="$S_TMP_0"
                    alias mmmv_webbrowser_qutebrowser_with_Linux_kernel_based_limits_enforcement_RAM_4GiB_CPU_25percent="$S_TMP_0"
                    #------------------------------------------------------
                    S_TMP_0="$S_CMD_SYSTEMDRUN -p MemoryLimit=512M -p CPUQuota=100% $S_CMD_NICE_WEBBROWSER $S_FP_QUTEBROWSER "
                    alias mmmv_run_qutebrowser_with_Linux_kernel_based_limits_enforcement_RAM_512MiB_CPU_100percent="$S_TMP_0"
                    alias mmmv_run_webbrowser_qutebrowser_with_Linux_kernel_based_limits_enforcement_RAM_512MiB_CPU_100percent="$S_TMP_0"
                    alias mmmv_webbrowser_qutebrowser_with_Linux_kernel_based_limits_enforcement_RAM_512MiB_CPU_100percent="$S_TMP_0"
                    #------------------------------------------------------
                    S_TMP_0="$S_CMD_SYSTEMDRUN -p MemoryLimit=1024M -p CPUQuota=100% $S_CMD_NICE_WEBBROWSER $S_FP_QUTEBROWSER "
                    alias mmmv_run_qutebrowser_with_Linux_kernel_based_limits_enforcement_RAM_1GiB_CPU_100percent="$S_TMP_0"
                    alias mmmv_run_webbrowser_qutebrowser_with_Linux_kernel_based_limits_enforcement_RAM_1GiB_CPU_100percent="$S_TMP_0"
                    alias mmmv_webbrowser_qutebrowser_with_Linux_kernel_based_limits_enforcement_RAM_1GiB_CPU_100percent="$S_TMP_0"
                    #------------------------------------------------------
                else
                    if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                        echo ""
                        echo "A mmmv_userspace_distro_t1 related "
                        echo -e "\e[31msubpart of the ~/.bashrc is probably flawed\e[39m."
                        echo "At this point the S_FP_QUTEBROWSER should not "
                        echo "have the value of an empty string."
                        echo "GUID=='53930481-0b73-4d45-a81a-8312503099e7'"
                        echo ""
                    fi
                fi
            fi
            #--------------------------------------------------------------
            if [ "$SB_REKONQ_EXISTS_ON_PATH" == "t" ]; then
                if [ "$S_FP_REKONQ" != "" ]; then # just in case
                    S_TMP_0="$S_CMD_SYSTEMDRUN -p MemoryLimit=2048M -p CPUQuota=25% $S_CMD_NICE_WEBBROWSER $S_FP_REKONQ "
                    alias mmmv_run_Rekonq_with_Linux_kernel_based_limits_enforcement_RAM_2GiB_CPU_25percent="$S_TMP_0"
                    alias mmmv_run_webbrowser_Rekonq_with_Linux_kernel_based_limits_enforcement_RAM_2GiB_CPU_25percent="$S_TMP_0"
                    alias mmmv_webbrowser_Rekonq_with_Linux_kernel_based_limits_enforcement_RAM_2GiB_CPU_25percent="$S_TMP_0"
                    #------------------------------------------------------
                    S_TMP_0="$S_CMD_SYSTEMDRUN -p MemoryLimit=1024M -p CPUQuota=60% $S_CMD_NICE_WEBBROWSER $S_FP_REKONQ "
                    alias mmmv_run_Rekonq_with_Linux_kernel_based_limits_enforcement_RAM_1GiB_CPU_60percent="$S_TMP_0"
                    alias mmmv_run_webbrowser_Rekonq_with_Linux_kernel_based_limits_enforcement_RAM_1GiB_CPU_60percent="$S_TMP_0"
                    alias mmmv_webbrowser_Rekonq_with_Linux_kernel_based_limits_enforcement_RAM_1GiB_CPU_60percent="$S_TMP_0"
                    #------------------------------------------------------
                    # For Raspberry_Pi 3, which has 4 CPU-cores, 1GiB GPU-shared RAM.
                    S_TMP_0="$S_CMD_SYSTEMDRUN -p MemoryLimit=400M -p CPUQuota=100% $S_CMD_NICE_WEBBROWSER $S_FP_REKONQ "
                    alias mmmv_run_Rekonq_with_Linux_kernel_based_limits_enforcement_RAM_400MiB_CPU_100percent="$S_TMP_0"
                    alias mmmv_run_webbrowser_Rekonq_with_Linux_kernel_based_limits_enforcement_RAM_400MiB_CPU_100percent="$S_TMP_0"
                    alias mmmv_webbrowser_Rekonq_with_Linux_kernel_based_limits_enforcement_RAM_400MiB_CPU_100percent="$S_TMP_0"
                    #------------------------------------------------------
                else
                    if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                        echo ""
                        echo "A mmmv_userspace_distro_t1 related "
                        echo -e "\e[31msubpart of the ~/.bashrc is probably flawed\e[39m."
                        echo "At this point the S_FP_REKONQ should not "
                        echo "have the value of an empty string."
                        echo "GUID=='0203a856-5dcf-4b91-933a-8312503099e7'"
                        echo ""
                    fi
                fi
            fi
            #--------------------------------------------------------------
            if [ "$SB_NETSURF_EXISTS_ON_PATH" == "t" ]; then
                if [ "$S_FP_NETSURF" != "" ]; then # just in case
                    #------------------------------------------------------
                    # Raspberry_Pi 1 Zero W has
                    # 1 1GHz CPU-core, 512MiB GPU-shared RAM.
                    #------------------------------------------------------
                    S_TMP_0="$S_CMD_SYSTEMDRUN -p MemoryLimit=100M -p CPUQuota=50% $S_CMD_NICE_WEBBROWSER $S_FP_NETSURF "
                    alias mmmv_run_NetSurf_with_Linux_kernel_based_limits_enforcement_RAM_100MiB_CPU_50percent="$S_TMP_0"
                    alias mmmv_run_webbrowser_NetSurf_with_Linux_kernel_based_limits_enforcement_RAM_100MiB_CPU_50percent="$S_TMP_0"
                    alias mmmv_webbrowser_NetSurf_with_Linux_kernel_based_limits_enforcement_RAM_100MiB_CPU_50percent="$S_TMP_0"
                    #------------------------------------------------------
                    S_TMP_0="$S_CMD_SYSTEMDRUN -p MemoryLimit=200M -p CPUQuota=50% $S_CMD_NICE_WEBBROWSER $S_FP_NETSURF "
                    alias mmmv_run_NetSurf_with_Linux_kernel_based_limits_enforcement_RAM_200MiB_CPU_50percent="$S_TMP_0"
                    alias mmmv_run_webbrowser_NetSurf_with_Linux_kernel_based_limits_enforcement_RAM_200MiB_CPU_50percent="$S_TMP_0"
                    alias mmmv_webbrowser_NetSurf_with_Linux_kernel_based_limits_enforcement_RAM_200MiB_CPU_50percent="$S_TMP_0"
                    #------------------------------------------------------
                else
                    if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                        echo ""
                        echo "A mmmv_userspace_distro_t1 related "
                        echo -e "\e[31msubpart of the ~/.bashrc is probably flawed\e[39m."
                        echo "At this point the S_FP_NETSURF should not "
                        echo "have the value of an empty string."
                        echo "GUID=='6e137d4c-90eb-4e3e-b45a-8312503099e7'"
                        echo ""
                    fi
                fi
            fi
            #--------------------------------------------------------------
            if [ "$SB_DILLO_EXISTS_ON_PATH" == "t" ]; then
                if [ "$S_FP_DILLO" != "" ]; then # just in case
                    #------------------------------------------------------
                    # Raspberry_Pi 1 Zero W has
                    # 1 1GHz CPU-core, 512MiB GPU-shared RAM.
                    #------------------------------------------------------
                    S_TMP_0="$S_CMD_SYSTEMDRUN -p MemoryLimit=60M  -p CPUQuota=50% $S_CMD_NICE_WEBBROWSER $S_FP_DILLO "
                    alias mmmv_run_Dillo_with_Linux_kernel_based_limits_enforcement_RAM_60MiB_CPU_50percent="$S_TMP_0"
                    alias mmmv_run_webbrowser_Dillo_with_Linux_kernel_based_limits_enforcement_RAM_60MiB_CPU_50percent="$S_TMP_0"
                    alias mmmv_webbrowser_Dillo_with_Linux_kernel_based_limits_enforcement_RAM_60MiB_CPU_50percent="$S_TMP_0"
                    #------------------------------------------------------
                    S_TMP_0="$S_CMD_SYSTEMDRUN -p MemoryLimit=100M -p CPUQuota=50% $S_CMD_NICE_WEBBROWSER $S_FP_DILLO "
                    alias mmmv_run_Dillo_with_Linux_kernel_based_limits_enforcement_RAM_100MiB_CPU_50percent="$S_TMP_0"
                    alias mmmv_run_webbrowser_Dillo_with_Linux_kernel_based_limits_enforcement_RAM_100MiB_CPU_50percent="$S_TMP_0"
                    alias mmmv_webbrowser_Dillo_with_Linux_kernel_based_limits_enforcement_RAM_100MiB_CPU_50percent="$S_TMP_0"
                    #------------------------------------------------------
                    S_TMP_0="$S_CMD_SYSTEMDRUN -p MemoryLimit=200M -p CPUQuota=50% $S_CMD_NICE_WEBBROWSER $S_FP_DILLO "
                    alias mmmv_run_Dillo_with_Linux_kernel_based_limits_enforcement_RAM_200MiB_CPU_50percent="$S_TMP_0"
                    alias mmmv_run_webbrowser_Dillo_with_Linux_kernel_based_limits_enforcement_RAM_200MiB_CPU_50percent="$S_TMP_0"
                    alias mmmv_webbrowser_Dillo_with_Linux_kernel_based_limits_enforcement_RAM_200MiB_CPU_50percent="$S_TMP_0"
                    #------------------------------------------------------
                else
                    if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                        echo ""
                        echo "A mmmv_userspace_distro_t1 related "
                        echo -e "\e[31msubpart of the ~/.bashrc is probably flawed\e[39m."
                        echo "At this point the S_FP_DILLO should not "
                        echo "have the value of an empty string."
                        echo "GUID=='32e20c75-0e42-4edf-ae4a-8312503099e7'"
                        echo ""
                    fi
                fi
            fi
            #--------------------------------------------------------------
            if [ "$SB_DILLOPLUS_EXISTS_ON_PATH" == "t" ]; then
                if [ "$S_FP_DILLOPLUS" != "" ]; then # just in case
                    #------------------------------------------------------
                    # Raspberry_Pi 1 Zero W has
                    # 1 1GHz CPU-core, 512MiB GPU-shared RAM.
                    #------------------------------------------------------
                    S_TMP_0="$S_CMD_SYSTEMDRUN -p MemoryLimit=60M  -p CPUQuota=50% $S_CMD_NICE_WEBBROWSER $S_FP_DILLOPLUS "
                    alias mmmv_run_DilloPlus_with_Linux_kernel_based_limits_enforcement_RAM_60MiB_CPU_50percent="$S_TMP_0"
                    alias mmmv_run_webbrowser_DilloPlus_with_Linux_kernel_based_limits_enforcement_RAM_60MiB_CPU_50percent="$S_TMP_0"
                    alias mmmv_webbrowser_DilloPlus_with_Linux_kernel_based_limits_enforcement_RAM_60MiB_CPU_50percent="$S_TMP_0"
                    #------------------------------------------------------
                    S_TMP_0="$S_CMD_SYSTEMDRUN -p MemoryLimit=100M -p CPUQuota=50% $S_CMD_NICE_WEBBROWSER $S_FP_DILLOPLUS "
                    alias mmmv_run_DilloPlus_with_Linux_kernel_based_limits_enforcement_RAM_100MiB_CPU_50percent="$S_TMP_0"
                    alias mmmv_run_webbrowser_DilloPlus_with_Linux_kernel_based_limits_enforcement_RAM_100MiB_CPU_50percent="$S_TMP_0"
                    alias mmmv_webbrowser_DilloPlus_with_Linux_kernel_based_limits_enforcement_RAM_100MiB_CPU_50percent="$S_TMP_0"
                    #------------------------------------------------------
                    S_TMP_0="$S_CMD_SYSTEMDRUN -p MemoryLimit=200M -p CPUQuota=50% $S_CMD_NICE_WEBBROWSER $S_FP_DILLOPLUS "
                    alias mmmv_run_DilloPlus_with_Linux_kernel_based_limits_enforcement_RAM_200MiB_CPU_50percent="$S_TMP_0"
                    alias mmmv_run_webbrowser_DilloPlus_with_Linux_kernel_based_limits_enforcement_RAM_200MiB_CPU_50percent="$S_TMP_0"
                    alias mmmv_webbrowser_DilloPlus_with_Linux_kernel_based_limits_enforcement_RAM_200MiB_CPU_50percent="$S_TMP_0"
                    #------------------------------------------------------
                else
                    if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                        echo ""
                        echo "A mmmv_userspace_distro_t1 related "
                        echo -e "\e[31msubpart of the ~/.bashrc is probably flawed\e[39m."
                        echo "At this point the S_FP_DILLOPLUS should not "
                        echo "have the value of an empty string."
                        echo "GUID=='5d0c61e3-c5fc-44d5-963a-8312503099e7'"
                        echo ""
                    fi
                fi
            fi
            #--------------------------------------------------------------
        fi
    fi
    #----------------------------------------------------------------------
fi
#--------------------------------------------------------------------------
S_FP_0="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin/mmmv_polish_ABC_2_A_C_B_exec_t1"
if [ -e "$S_FP_0" ]; then
    if [ ! -d "$S_FP_0" ]; then
        if [ "$SB_SED_OR_GSED_EXISTS_ON_PATH" == "t" ]; then
            #--------------------------------------------------------------
            if [ "$SB_REV_EXISTS_ON_PATH" == "t" ]; then
                if [ "$SB_TR_EXISTS_ON_PATH" == "t" ]; then
                    #------------------------------------------------------
                    # Sample Bash line:
                    #
                    #     cat ./text_with_linebreaks.txt | rev | sed -e 's/^/ /g' | rev | tr --delete '\n\r'
                    #
                    #     mmmv_polish_ABC_2_A_C_B_exec_t1 \
                    #         " cat " \
                    #         " | rev | sed -e 's/^/ /g' | rev | tr --delete '\n\r' " \
                    #         ./text_with_linebreaks.txt
                    #
                    # The sed command at the above example makes
                    # sure that a word at the end of one line is not
                    # concatenated to the word at the start of the next
                    # line. As the very last line in a textfile never has
                    # an ending linebreak, the sed command also makes
                    # sure that the very last non-space character at
                    # the very last line of the textfile does not get deleted.
                    #
                    alias mmmv_textfilter_f2c_remove_linebreaks_t1="$S_FP_0 \" cat \" \" | rev | $S_CMD_GNU_SED -e 's/^/ /g' | rev | tr --delete '\n\r' \" "
                    #------------------------------------------------------
                fi
            fi
            #--------------------------------------------------------------
            if [ "$SB_TRAFILATURA_EXISTS_ON_PATH" == "t" ]; then
                if [ "$SB_JQ_EXISTS_ON_PATH" == "t" ]; then
                    if [ "$SB_RUBY_EXISTS_ON_PATH" == "t" ]; then
                        #--------------------------------------------------
                        # The "python2 -m json.tool" is a JSON source formatter.
                        # The trafilatura is a Python3 application.
                        #alias mmmv_HTML_body_2_txt_from_URL_t1="$S_FP_NICE -n 2 mmmv_polish_ABC_2_A_C_B_exec_t1  \" trafilatura --precision --no-comments --json --URL \" \" | python2 -m json.tool | jq '.[\\\"raw_text\\\"]' | $S_CMD_GNU_SED -e 's/^\\\"//g' | $S_CMD_GNU_SED -e 's/\\\"\\$//g' \" "
                        alias mmmv_HTML_body_2_txt_from_URL_t1="$S_FP_NICE -n 2 mmmv_polish_ABC_2_A_C_B_exec_t1  \" trafilatura --precision --no-comments --json --URL \" \" | jq '.[\\\"raw_text\\\"]' | $S_CMD_GNU_SED -e 's/^\\\"//g' | $S_CMD_GNU_SED -e 's/\\\"\\$//g' \" "
                        alias mmmv_HTML_body_2_txt_from_file_t1="$S_FP_NICE -n 2 mmmv_polish_ABC_2_A_C_B_exec_t1  \" trafilatura --precision --no-comments --json --input-file \" \" | jq '.[\\\"raw_text\\\"]' | $S_CMD_GNU_SED -e 's/^\\\"//g' | $S_CMD_GNU_SED -e 's/\\\"\\$//g' \" "
                        #--------------------------------------------------
                    fi
                fi
            fi
            #--------------------------------------------------------------
        else
            #--------------------------------------------------------------
            func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
                "$S_FP_0" "142bbef3-3eea-455a-9d39-8312503099e7" \
                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
            #--------------------------------------------------------------
        fi
    fi
fi
#--------------------------------------------------------------------------
S_FP_0="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin/mmmv_polish_ABC_2_ACB_exec_t1"
if [ -e "$S_FP_0" ]; then
    if [ ! -d "$S_FP_0" ]; then
        if [ "$SB_RUBY_EXISTS_ON_PATH" == "t" ]; then # Halve-overkill here, but
                                                      # it alleviates the situation
                                                      # a bit at some corner cases.
            #--------------------------------------------------------------
            if [ "$SB_LOCALECTL_EXISTS_ON_PATH" == "t" ]; then
                if [ "$SB_TR_EXISTS_ON_PATH" == "t" ]; then
                    #------------------------------------------------------
                    S_TMP_1=""
                    if [ "$SB_SORT_EXISTS_ON_PATH" == "t" ]; then
                        # alias mmmv_ls_keyboard_layout_names_t1="localectl list-x11-keymap-layouts | sort | tr '\n\r' ' ' "
                        S_TMP_1="` localectl list-x11-keymap-layouts | sort | tr '\n\r' ' ' `"
                        alias mmmv_ls_keyboard_layout_names_t1="echo $S_TMP_1 "
                    else
                        #alias mmmv_ls_keyboard_layout_names_t2="localectl list-x11-keymap-layouts | tr '\n\r' ' ' "
                        S_TMP_1="` localectl list-x11-keymap-layouts | tr '\n\r' ' ' `"
                        alias mmmv_ls_keyboard_layout_names_t2="echo $S_TMP_1 "
                    fi
                    #------------------------------------------------------
                    if [ "$SB_GREP_EXISTS_ON_PATH" == "t" ]; then
                        if [ "$SB_PRINTF_EXISTS_ON_PATH" == "t" ]; then
                            #----------------------------------------------
                            # Test-Bash-line:
                            #
                            #     S_KEYBOARD_LAYOUT='ru' ; printf "\n ` localectl list-x11-keymap-variants $S_KEYBOARD_LAYOUT | tr '\n\r' ' ' ` \n\n"
                            #
                            #alias mmmv_ui_display_keyboard_layout_variants_ru="S_KEYBOARD_LAYOUT='ru' ; printf \"\n \` localectl list-x11-keymap-variants \$S_KEYBOARD_LAYOUT | tr '\n\r' ' ' \` \n\n\" "
                            S_TMP_2=" printf \"\\\\n \` localectl list-x11-keymap-variants \\\$S_KEYBOARD_LAYOUT | tr '\\\\n\\\\r' ' ' \` \\\\n\\\\n\" "
                            # The following has been generated by using the list at
                            #
                            #     https://unix.stackexchange.com/questions/43976/list-all-valid-kbd-layouts-variants-and-toggle-options-to-use-with-setxkbmap
                            #     archival_copy: https://archive.is/FB1gh
                            #
                            if [ "`printf \"$S_TMP_1\" | grep \"us\" `" != "" ]; then
                                #  us              English_USA
                                alias mmmv_ls_keyboard_layout_variants_English_USA_X11_keyboard_name_us="S_KEYBOARD_LAYOUT='us' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"ad\" `" != "" ]; then
                                #  ad              Andorra
                                alias mmmv_ls_keyboard_layout_variants_Andorra_X11_keyboard_name_ad="S_KEYBOARD_LAYOUT='ad' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"af\" `" != "" ]; then
                                #  af              Afghanistan
                                alias mmmv_ls_keyboard_layout_variants_Afghanistan_X11_keyboard_name_af="S_KEYBOARD_LAYOUT='af' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"ara\" `" != "" ]; then
                                #  ara             Arabic
                                alias mmmv_ls_keyboard_layout_variants_Arabic_X11_keyboard_name_ara="S_KEYBOARD_LAYOUT='ara' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"al\" `" != "" ]; then
                                #  al              Albania
                                alias mmmv_ls_keyboard_layout_variants_Albania_X11_keyboard_name_al="S_KEYBOARD_LAYOUT='al' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"am\" `" != "" ]; then
                                #  am              Armenia
                                alias mmmv_ls_keyboard_layout_variants_Armenia_X11_keyboard_name_am="S_KEYBOARD_LAYOUT='am' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"az\" `" != "" ]; then
                                #  az              Azerbaijan
                                alias mmmv_ls_keyboard_layout_variants_Azerbaijan_X11_keyboard_name_az="S_KEYBOARD_LAYOUT='az' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"by\" `" != "" ]; then
                                #  by              Belarus
                                alias mmmv_ls_keyboard_layout_variants_Belarus_X11_keyboard_name_by="S_KEYBOARD_LAYOUT='by' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"be\" `" != "" ]; then
                                #  be              Belgium
                                alias mmmv_ls_keyboard_layout_variants_Belgium_X11_keyboard_name_be="S_KEYBOARD_LAYOUT='be' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"bd\" `" != "" ]; then
                                #  bd              Bangladesh
                                alias mmmv_ls_keyboard_layout_variants_Bangladesh_X11_keyboard_name_bd="S_KEYBOARD_LAYOUT='bd' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"in\" `" != "" ]; then
                                #  in              India
                                alias mmmv_ls_keyboard_layout_variants_India_X11_keyboard_name_in="S_KEYBOARD_LAYOUT='in' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"ba\" `" != "" ]; then
                                #  ba              Bosnia_and_Herzegovina
                                alias mmmv_ls_keyboard_layout_variants_Bosnia_and_Herzegovina_X11_keyboard_name_ba="S_KEYBOARD_LAYOUT='ba' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"br\" `" != "" ]; then
                                #  br              Brazil
                                alias mmmv_ls_keyboard_layout_variants_Brazil_X11_keyboard_name_br="S_KEYBOARD_LAYOUT='br' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"bg\" `" != "" ]; then
                                #  bg              Bulgaria
                                alias mmmv_ls_keyboard_layout_variants_Bulgaria_X11_keyboard_name_bg="S_KEYBOARD_LAYOUT='bg' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"ma\" `" != "" ]; then
                                #  ma              Morocco
                                alias mmmv_ls_keyboard_layout_variants_Morocco_X11_keyboard_name_ma="S_KEYBOARD_LAYOUT='ma' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"mm\" `" != "" ]; then
                                #  mm              Myanmar
                                alias mmmv_ls_keyboard_layout_variants_Myanmar_X11_keyboard_name_mm="S_KEYBOARD_LAYOUT='mm' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"ca\" `" != "" ]; then
                                #  ca              Canada
                                alias mmmv_ls_keyboard_layout_variants_Canada_X11_keyboard_name_ca="S_KEYBOARD_LAYOUT='ca' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"cd\" `" != "" ]; then
                                #  cd              Congo
                                alias mmmv_ls_keyboard_layout_variants_Congo_X11_keyboard_name_cd="S_KEYBOARD_LAYOUT='cd' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"cn\" `" != "" ]; then
                                #  cn              China
                                alias mmmv_ls_keyboard_layout_variants_China_X11_keyboard_name_cn="S_KEYBOARD_LAYOUT='cn' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"hr\" `" != "" ]; then
                                #  hr              Croatia
                                alias mmmv_ls_keyboard_layout_variants_Croatia_X11_keyboard_name_hr="S_KEYBOARD_LAYOUT='hr' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"cz\" `" != "" ]; then
                                #  cz              Czechia
                                alias mmmv_ls_keyboard_layout_variants_Czechia_X11_keyboard_name_cz="S_KEYBOARD_LAYOUT='cz' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"dk\" `" != "" ]; then
                                #  dk              Denmark
                                alias mmmv_ls_keyboard_layout_variants_Denmark_X11_keyboard_name_dk="S_KEYBOARD_LAYOUT='dk' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"nl\" `" != "" ]; then
                                #  nl              Netherlands
                                alias mmmv_ls_keyboard_layout_variants_Netherlands_X11_keyboard_name_nl="S_KEYBOARD_LAYOUT='nl' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"bt\" `" != "" ]; then
                                #  bt              Bhutan
                                alias mmmv_ls_keyboard_layout_variants_Bhutan_X11_keyboard_name_bt="S_KEYBOARD_LAYOUT='bt' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"ee\" `" != "" ]; then
                                #  ee              Estonia
                                alias mmmv_ls_keyboard_layout_variants_Estonia_X11_keyboard_name_ee="S_KEYBOARD_LAYOUT='ee' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"ir\" `" != "" ]; then
                                #  ir              Iran
                                alias mmmv_ls_keyboard_layout_variants_Iran_X11_keyboard_name_ir="S_KEYBOARD_LAYOUT='ir' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"iq\" `" != "" ]; then
                                #  iq              Iraq
                                alias mmmv_ls_keyboard_layout_variants_Iraq_X11_keyboard_name_iq="S_KEYBOARD_LAYOUT='iq' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"fo\" `" != "" ]; then
                                #  fo              Faroe_Islands
                                alias mmmv_ls_keyboard_layout_variants_Faroe_Islands_X11_keyboard_name_fo="S_KEYBOARD_LAYOUT='fo' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"fi\" `" != "" ]; then
                                #  fi              Finland
                                alias mmmv_ls_keyboard_layout_variants_Finland_X11_keyboard_name_fi="S_KEYBOARD_LAYOUT='fi' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"fr\" `" != "" ]; then
                                #  fr              France
                                alias mmmv_ls_keyboard_layout_variants_France_X11_keyboard_name_fr="S_KEYBOARD_LAYOUT='fr' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"gh\" `" != "" ]; then
                                #  gh              Ghana
                                alias mmmv_ls_keyboard_layout_variants_Ghana_X11_keyboard_name_gh="S_KEYBOARD_LAYOUT='gh' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"gn\" `" != "" ]; then
                                #  gn              Guinea
                                alias mmmv_ls_keyboard_layout_variants_Guinea_X11_keyboard_name_gn="S_KEYBOARD_LAYOUT='gn' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"ge\" `" != "" ]; then
                                #  ge              Georgia
                                alias mmmv_ls_keyboard_layout_variants_Georgia_X11_keyboard_name_ge="S_KEYBOARD_LAYOUT='ge' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"de\" `" != "" ]; then
                                #  de              Germany
                                alias mmmv_ls_keyboard_layout_variants_Germany_X11_keyboard_name_de="S_KEYBOARD_LAYOUT='de' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"gr\" `" != "" ]; then
                                #  gr              Greece
                                alias mmmv_ls_keyboard_layout_variants_Greece_X11_keyboard_name_gr="S_KEYBOARD_LAYOUT='gr' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"hu\" `" != "" ]; then
                                #  hu              Hungary
                                alias mmmv_ls_keyboard_layout_variants_Hungary_X11_keyboard_name_hu="S_KEYBOARD_LAYOUT='hu' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"is\" `" != "" ]; then
                                #  is              Iceland
                                alias mmmv_ls_keyboard_layout_variants_Iceland_X11_keyboard_name_is="S_KEYBOARD_LAYOUT='is' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"il\" `" != "" ]; then
                                #  il              Israel
                                alias mmmv_ls_keyboard_layout_variants_Israel_X11_keyboard_name_il="S_KEYBOARD_LAYOUT='il' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"it\" `" != "" ]; then
                                #  it              Italy
                                alias mmmv_ls_keyboard_layout_variants_Italy_X11_keyboard_name_it="S_KEYBOARD_LAYOUT='it' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"jp\" `" != "" ]; then
                                #  jp              Japan
                                alias mmmv_ls_keyboard_layout_variants_Japan_X11_keyboard_name_jp="S_KEYBOARD_LAYOUT='jp' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"kg\" `" != "" ]; then
                                #  kg              Kyrgyzstan
                                alias mmmv_ls_keyboard_layout_variants_Kyrgyzstan_X11_keyboard_name_kg="S_KEYBOARD_LAYOUT='kg' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"kh\" `" != "" ]; then
                                #  kh              Cambodia
                                alias mmmv_ls_keyboard_layout_variants_Cambodia_X11_keyboard_name_kh="S_KEYBOARD_LAYOUT='kh' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"kz\" `" != "" ]; then
                                #  kz              Kazakhstan
                                alias mmmv_ls_keyboard_layout_variants_Kazakhstan_X11_keyboard_name_kz="S_KEYBOARD_LAYOUT='kz' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"la\" `" != "" ]; then
                                #  la              Laos
                                alias mmmv_ls_keyboard_layout_variants_Laos_X11_keyboard_name_la="S_KEYBOARD_LAYOUT='la' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"latam\" `" != "" ]; then
                                #  latam           Latin_American
                                alias mmmv_ls_keyboard_layout_variants_Latin_American_X11_keyboard_name_latam="S_KEYBOARD_LAYOUT='latam' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"lt\" `" != "" ]; then
                                #  lt              Lithuania
                                alias mmmv_ls_keyboard_layout_variants_Lithuania_X11_keyboard_name_lt="S_KEYBOARD_LAYOUT='lt' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"lv\" `" != "" ]; then
                                #  lv              Latvia
                                alias mmmv_ls_keyboard_layout_variants_Latvia_X11_keyboard_name_lv="S_KEYBOARD_LAYOUT='lv' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"mao\" `" != "" ]; then
                                #  mao             Maori
                                alias mmmv_ls_keyboard_layout_variants_Maori_X11_keyboard_name_mao="S_KEYBOARD_LAYOUT='mao' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"me\" `" != "" ]; then
                                #  me              Montenegro
                                alias mmmv_ls_keyboard_layout_variants_Montenegro_X11_keyboard_name_me="S_KEYBOARD_LAYOUT='me' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"mk\" `" != "" ]; then
                                #  mk              Macedonia
                                alias mmmv_ls_keyboard_layout_variants_Macedonia_X11_keyboard_name_mk="S_KEYBOARD_LAYOUT='mk' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"mt\" `" != "" ]; then
                                #  mt              Malta
                                alias mmmv_ls_keyboard_layout_variants_Malta_X11_keyboard_name_mt="S_KEYBOARD_LAYOUT='mt' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"mn\" `" != "" ]; then
                                #  mn              Mongolia
                                alias mmmv_ls_keyboard_layout_variants_Mongolia_X11_keyboard_name_mn="S_KEYBOARD_LAYOUT='mn' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"no\" `" != "" ]; then
                                #  no              Norway
                                alias mmmv_ls_keyboard_layout_variants_Norway_X11_keyboard_name_no="S_KEYBOARD_LAYOUT='no' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"pl\" `" != "" ]; then
                                #  pl              Poland
                                alias mmmv_ls_keyboard_layout_variants_Poland_X11_keyboard_name_pl="S_KEYBOARD_LAYOUT='pl' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"pt\" `" != "" ]; then
                                #  pt              Portugal
                                alias mmmv_ls_keyboard_layout_variants_Portugal_X11_keyboard_name_pt="S_KEYBOARD_LAYOUT='pt' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"ro\" `" != "" ]; then
                                #  ro              Romania
                                alias mmmv_ls_keyboard_layout_variants_Romania_X11_keyboard_name_ro="S_KEYBOARD_LAYOUT='ro' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"ru\" `" != "" ]; then
                                #  ru              Russia
                                alias mmmv_ls_keyboard_layout_variants_Russia_X11_keyboard_name_ru="S_KEYBOARD_LAYOUT='ru' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"rs\" `" != "" ]; then
                                #  rs              Serbia
                                alias mmmv_ls_keyboard_layout_variants_Serbia_X11_keyboard_name_rs="S_KEYBOARD_LAYOUT='rs' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"si\" `" != "" ]; then
                                #  si              Slovenia
                                alias mmmv_ls_keyboard_layout_variants_Slovenia_X11_keyboard_name_si="S_KEYBOARD_LAYOUT='si' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"sk\" `" != "" ]; then
                                #  sk              Slovakia
                                alias mmmv_ls_keyboard_layout_variants_Slovakia_X11_keyboard_name_sk="S_KEYBOARD_LAYOUT='sk' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"es\" `" != "" ]; then
                                #  es              Spain
                                alias mmmv_ls_keyboard_layout_variants_Spain_X11_keyboard_name_es="S_KEYBOARD_LAYOUT='es' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"se\" `" != "" ]; then
                                #  se              Sweden
                                alias mmmv_ls_keyboard_layout_variants_Sweden_X11_keyboard_name_se="S_KEYBOARD_LAYOUT='se' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"ch\" `" != "" ]; then
                                #  ch              Switzerland
                                alias mmmv_ls_keyboard_layout_variants_Switzerland_X11_keyboard_name_ch="S_KEYBOARD_LAYOUT='ch' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"sy\" `" != "" ]; then
                                #  sy              Syria
                                alias mmmv_ls_keyboard_layout_variants_Syria_X11_keyboard_name_sy="S_KEYBOARD_LAYOUT='sy' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"tj\" `" != "" ]; then
                                #  tj              Tajikistan
                                alias mmmv_ls_keyboard_layout_variants_Tajikistan_X11_keyboard_name_tj="S_KEYBOARD_LAYOUT='tj' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"lk\" `" != "" ]; then
                                #  lk              Sri_Lanka
                                alias mmmv_ls_keyboard_layout_variants_Sri_Lanka_X11_keyboard_name_lk="S_KEYBOARD_LAYOUT='lk' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"th\" `" != "" ]; then
                                #  th              Thailand
                                alias mmmv_ls_keyboard_layout_variants_Thailand_X11_keyboard_name_th="S_KEYBOARD_LAYOUT='th' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"tr\" `" != "" ]; then
                                #  tr              Turkey
                                alias mmmv_ls_keyboard_layout_variants_Turkey_X11_keyboard_name_tr="S_KEYBOARD_LAYOUT='tr' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"tw\" `" != "" ]; then
                                #  tw              Taiwan
                                alias mmmv_ls_keyboard_layout_variants_Taiwan_X11_keyboard_name_tw="S_KEYBOARD_LAYOUT='tw' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"ua\" `" != "" ]; then
                                #  ua              Ukraine
                                alias mmmv_ls_keyboard_layout_variants_Ukraine_X11_keyboard_name_ua="S_KEYBOARD_LAYOUT='ua' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"gb\" `" != "" ]; then
                                #  gb              English_United_Kingdom
                                alias mmmv_ls_keyboard_layout_variants_English_United_Kingdom_X11_keyboard_name_gb="S_KEYBOARD_LAYOUT='gb' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"uz\" `" != "" ]; then
                                #  uz              Uzbekistan
                                alias mmmv_ls_keyboard_layout_variants_Uzbekistan_X11_keyboard_name_uz="S_KEYBOARD_LAYOUT='uz' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"vn\" `" != "" ]; then
                                #  vn              Vietnam
                                alias mmmv_ls_keyboard_layout_variants_Vietnam_X11_keyboard_name_vn="S_KEYBOARD_LAYOUT='vn' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"kr\" `" != "" ]; then
                                #  kr              Korea
                                alias mmmv_ls_keyboard_layout_variants_Korea_X11_keyboard_name_kr="S_KEYBOARD_LAYOUT='kr' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"vndr\" `" != "" ]; then
                                #  nec_vndr        Japan_PC_98xx_Series
                                alias mmmv_ls_keyboard_layout_variants_nec_Japan_PC_98xx_Series_X11_keyboard_name_vndr="S_KEYBOARD_LAYOUT='vndr' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"ie\" `" != "" ]; then
                                #  ie              Ireland
                                alias mmmv_ls_keyboard_layout_variants_Ireland_X11_keyboard_name_ie="S_KEYBOARD_LAYOUT='ie' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"pk\" `" != "" ]; then
                                #  pk              Pakistan
                                alias mmmv_ls_keyboard_layout_variants_Pakistan_X11_keyboard_name_pk="S_KEYBOARD_LAYOUT='pk' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"mv\" `" != "" ]; then
                                #  mv              Maldives
                                alias mmmv_ls_keyboard_layout_variants_Maldives_X11_keyboard_name_mv="S_KEYBOARD_LAYOUT='mv' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"za\" `" != "" ]; then
                                #  za              South_Africa
                                alias mmmv_ls_keyboard_layout_variants_South_Africa_X11_keyboard_name_za="S_KEYBOARD_LAYOUT='za' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"epo\" `" != "" ]; then
                                #  epo             Esperanto
                                alias mmmv_ls_keyboard_layout_variants_Esperanto_X11_keyboard_name_epo="S_KEYBOARD_LAYOUT='epo' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"np\" `" != "" ]; then
                                #  np              Nepal
                                alias mmmv_ls_keyboard_layout_variants_Nepal_X11_keyboard_name_np="S_KEYBOARD_LAYOUT='np' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"ng\" `" != "" ]; then
                                #  ng              Nigeria
                                alias mmmv_ls_keyboard_layout_variants_Nigeria_X11_keyboard_name_ng="S_KEYBOARD_LAYOUT='ng' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"et\" `" != "" ]; then
                                #  et              Ethiopia
                                alias mmmv_ls_keyboard_layout_variants_Ethiopia_X11_keyboard_name_et="S_KEYBOARD_LAYOUT='et' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"sn\" `" != "" ]; then
                                #  sn              Senegal
                                alias mmmv_ls_keyboard_layout_variants_Senegal_X11_keyboard_name_sn="S_KEYBOARD_LAYOUT='sn' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"brai\" `" != "" ]; then
                                #  brai            Braille
                                alias mmmv_ls_keyboard_layout_variants_Braille_X11_keyboard_name_brai="S_KEYBOARD_LAYOUT='brai' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"tm\" `" != "" ]; then
                                #  tm              Turkmenistan
                                alias mmmv_ls_keyboard_layout_variants_Turkmenistan_X11_keyboard_name_tm="S_KEYBOARD_LAYOUT='tm' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"ml\" `" != "" ]; then
                                #  ml              Mali
                                alias mmmv_ls_keyboard_layout_variants_Mali_X11_keyboard_name_ml="S_KEYBOARD_LAYOUT='ml' ; $S_TMP_2 "
                            fi
                            if [ "`printf \"$S_TMP_1\" | grep \"tz\" `" != "" ]; then
                                #  tz              Tanzania
                                alias mmmv_ls_keyboard_layout_variants_Tanzania_X11_keyboard_name_tz="S_KEYBOARD_LAYOUT='tz' ; $S_TMP_2 "
                            fi
                            #----------------------------------------------
                        fi
                    fi
                else # $SB_TR_EXISTS_ON_PATH" != "t"
                    #------------------------------------------------------
                    if [ "$SB_SORT_EXISTS_ON_PATH" == "t" ]; then
                        alias mmmv_ls_keyboard_layout_names_t3="localectl list-x11-keymap-layouts | sort "
                    else
                        alias mmmv_ls_keyboard_layout_names_t4="localectl list-x11-keymap-layouts "
                    fi
                    #------------------------------------------------------
                fi
            fi
            #--------------------------------------------------------------
            if [ "$SB_GREP_EXISTS_ON_PATH" == "t" ]; then
                # A related configuration file is the
                #
                #     /etc/security/limits.conf
                #
                # which gets reloaded by restarting a session, id est
                # its new values take effect at initial login. Testline:
                #
                #      mmmv_polish_ABC_2_ACB_exec_t1 " SI_RAM_BYTES=\"" "\" ; ulimit -v \$SI_RAM_BYTES ; ulimit -m \$SI_RAM_BYTES ; wait ; ulimit -a | grep --color memory " 50000000000
                #
                alias mmmv_ui_set_session_RAM_limit_in_bytes_t1="mmmv_polish_ABC_2_ACB_exec_t1 \" SI_RAM_BYTES=\\\"\" \"\\\" ; ulimit -v \\\$SI_RAM_BYTES ; ulimit -m \\\$SI_RAM_BYTES ; wait ; ulimit -a | grep --color memory \" " # 50000000000
            fi
            #--------------------------------------------------------------
        fi
    else
        #------------------------------------------------------------------
        func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
            "$S_FP_0" "530613e3-52c6-44ca-8459-8312503099e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        #------------------------------------------------------------------
    fi
fi
#--------------------------------------------------------------------------
S_FP_0="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin/mmmv_polish_ABC_2_ACB_t2_C_is_optional_exec_bash.rb"
if [ -e "$S_FP_0" ]; then
    if [ ! -d "$S_FP_0" ]; then
        if [ "$SB_RUBY_EXISTS_ON_PATH" == "t" ]; then # Halve-overkill here, but
                                                      # it alleviates the situation
                                                      # a bit at some corner cases.
            #--------------------------------------------------------------
            if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
                if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "f" ]; then
                    if [ "$SB_FLATPAK_EXISTS_ON_PATH" == "t" ]; then
                        if [ "$S_CMD_FLATPAK_USER" != "" ]; then
                            if [ "$SB_GREP_EXISTS_ON_PATH" == "t" ]; then
                                if [ "$SB_GSED_EXISTS_ON_PATH" == "t" ]; then
                                    #--------------------------------------
                                    S_FP_1="/tmp"
                                    if [ "$S_FP_FLATPAK_JAILBREAK_FOLDER" != "" ]; then
                                        #----------------------------------
                                        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                                            "$S_FP_FLATPAK_JAILBREAK_FOLDER" \
                                            "01261146-ca3e-4197-a828-8312503099e7" \
                                            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
                                        if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
                                            S_FP_1="$S_FP_FLATPAK_JAILBREAK_FOLDER"
                                        fi
                                        #----------------------------------
                                    else
                                        #----------------------------------
                                        S_FP_2="$HOME/tmp_" # does not have to exist,
                                                            # hence the lack of warning if it does not exist.
                                        if [ -e "$S_FP_2" ]; then
                                            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                                                "$S_FP_2" \
                                                "106b43d1-23fd-4085-b348-8312503099e7" \
                                                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
                                            if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
                                                S_FP_1="$S_FP_2"
                                            fi
                                        fi
                                        #----------------------------------
                                    fi
                                    #--------------------------------------
                                    # flatpak --user --filesystem=$HOME/tmp_ run  foo.something.bar # starts the installed program
                                    # alias mmmv_run_flatpak="$S_CMD_FLATPAK_USER --filesystem=$S_FP_1  run  "
                                    # Testscript:
                                    #
                                    #     S_PROGRAMNAME="$1" ; if [ "$S_PROGRAMNAME" != "" ]; then       S_1="" ; if [ "`printf "$S_PROGRAMNAME" | grep -E '[.]' `" != "" ]; then S_1="$S_PROGRAMNAME" ; else S_1="`flatpak --user list | grep "$S_PROGRAMNAME" | gsed -e 's/^[^[:blank:]]\+[[:blank:]]\+//g' | gsed -e 's/[[:blank:]]\+.\+$//g' `" ; fi ; nice -n 6 flatpak --user --filesystem=$S_FP_1 run $S_1 ;       else echo "" ; echo -e "\e[31m Program name missing. \e[39m" ; echo -e "Program names MIGHT be listed by executing" ; echo -e "    \"flatpak --user list \"." ; echo -e "GUID=='f871e3f3-3a8a-421a-885a-8312503099e7'" ; echo "" ; fi
                                    #
                                    # alias mmmv_run_flatpak="mmmv_polish_ABC_2_ACB_exec_t1 \"S_PROGRAMNAME=\\\"\"  \"\\\" ; if [ \\\"\\\$S_PROGRAMNAME\\\" != \\\"\\\" ]; then       S_1=\\\"\\\" ; if [ \\\"\\\`printf \\\"\\\$S_PROGRAMNAME\\\" | grep -E '[.]' \\\`\\\" != \\\"\\\" ]; then S_1=\\\"\\\$S_PROGRAMNAME\\\" ; else S_1=\\\"\\\`$S_CMD_FLATPAK_USER list | grep \\\"\\\$S_PROGRAMNAME\\\" | gsed -e 's/^[^[:blank:]]\\\\+[[:blank:]]\\\\+//g' | gsed -e 's/[[:blank:]]\\\\+.\\\\+\\\$//g' \\\`\\\" ; fi ; $S_CMD_FLATPAK_USER  --filesystem=$S_FP_1 run \\\$S_1 ;       else echo \\\"\\\" ; echo -e \\\"\\\\e[31m Program name missing. \\\\e[39m\\\" ; echo -e \\\"Program names MIGHT be listed by executing\\\" ; echo -e \\\"    \\\\\\\"flatpak --user list \\\\\\\".\\\" ; echo -e \\\"GUID=='681172cc-e225-4de1-8f2a-8312503099e7'\\\" ; echo \\\"\\\" ; fi \" "
                                    #
                                    #alias mmmv_run_flatpak="mmmv_polish_ABC_2_ACB_t2_C_is_optional_exec_bash \"S_PROGRAMNAME=\\\"\"  \"\\\" ; if [ \\\"\\\$S_PROGRAMNAME\\\" != \\\"\\\" ]; then       S_1=\\\"\\\" ; if [ \\\"\\\`printf \\\"\\\$S_PROGRAMNAME\\\" | grep -E '[.]' \\\`\\\" != \\\"\\\" ]; then S_1=\\\"\\\$S_PROGRAMNAME\\\" ; else S_1=\\\"\\\`$S_CMD_FLATPAK_USER list | grep \\\"\\\$S_PROGRAMNAME\\\" | gsed -e 's/^[^[:blank:]]\\\\+[[:blank:]]\\\\+//g' | gsed -e 's/[[:blank:]]\\\\+.\\\\+\\\$//g' \\\`\\\" ; fi ; $S_CMD_FLATPAK_USER  --filesystem=$S_FP_1 run \\\$S_1 ;       else echo \\\"\\\" ; echo -e \\\"\\\\e[31mProgram name missing. \\\\e[39m\\\" ; echo -e \\\"Program names MIGHT be listed by executing\\\" ; echo -e \\\"    \\\\\\\"flatpak --user list \\\\\\\".\\\" ; echo -e \\\"GUID=='530e1b95-38e0-49fa-a759-8312503099e7'\\\" ; echo \\\"\\\" ; fi \" "
                                    #
                                    alias mmmv_run_flatpak="mmmv_polish_ABC_2_ACB_t2_C_is_optional_exec_bash.rb \"S_PROGRAMNAME=\\\"\"  \"\\\" ; if [ \\\"\\\$S_PROGRAMNAME\\\" != \\\"\\\" ]; then       S_1=\\\"\\\" ; if [ \\\"\\\`printf \\\"\\\$S_PROGRAMNAME\\\" | grep -E '[.]' \\\`\\\" != \\\"\\\" ]; then S_1=\\\"\\\$S_PROGRAMNAME\\\" ; else S_1=\\\"\\\`$S_CMD_FLATPAK_USER list | grep \\\"\\\$S_PROGRAMNAME\\\" | gsed -e 's/^[^[:blank:]]\\\\+[[:blank:]]\\\\+//g' | gsed -e 's/[[:blank:]]\\\\+.\\\\+\\\$//g' \\\`\\\" ; fi ; $S_CMD_FLATPAK_USER  --filesystem=$S_FP_1 run \\\$S_1 ;       else echo \\\"\\\" ; echo -e \\\"\\\\e[31mProgram name missing. \\\\e[39m\\\" ; echo -e \\\"Program names MIGHT be listed by executing\\\" ; echo -e \\\"    \\\\\\\"flatpak --user list \\\\\\\".\\\" ; echo -e \\\"GUID=='3562bd53-a3d3-4127-ae59-8312503099e7'\\\" ; echo \\\"\\\" ; fi \" "
                                    #--------------------------------------
                                else
                                    #--------------------------------------
                                    if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                                        echo ""
                                        echo -e "\e[31mgsed is missing from PATH\e[39m."
                                        echo "GUID=='84f90dc6-6ab6-4bde-b239-8312503099e7'"
                                        echo ""
                                    fi
                                    #--------------------------------------
                                fi
                            fi
                            #----------------------------------------------
                        else
                            #----------------------------------------------
                            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                                echo ""
                                echo -e "\e[31mThe code at some subpart of the $HOME/.bashrc is flawed.\e[39m"
                                echo "The file that defines the S_CMD_FLATPAK_USER"
                                echo "should be run/included/sourced before the file"
                                echo "that outputs this error message."
                                echo "GUID=='5bcabf72-3f95-403f-9c29-8312503099e7'"
                                echo ""
                            fi
                            #----------------------------------------------
                        fi
                    fi
                fi
            fi
            #--------------------------------------------------------------
        fi
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
    if [ "$SB_SED_EXISTS_ON_PATH" == "t" ]; then # is the GNU Sed on Linux
        if [ "$SB_MMMV_CRE_TEMPORARY_FILE_T1_EXISTS_ON_PATH" == "t" ]; then
            if [ "$SB_HDPARM_EXISTS_ON_PATH" == "t" ]; then
                if [ "$SB_LSBLK_EXISTS_ON_PATH" == "t" ]; then
                    if [ "$SB_GREP_EXISTS_ON_PATH" == "t" ]; then
                        # Bash testing line:
                        #
                        #      S_FP_TEMPORARY_FILE_MMMV_LS_hdd_TEMPERATURE_T1="`mmmv_cre_temporary_file_t1 --max_file_size_64KiB `" ; wait ; sync ; wait ; lsblk | grep -E '^sd' | sed -e 's/[[:blank:]].\+$//g' | grep -E '^sd.$' | sed -e 's/\(^sd.\)/sudo hdparm -H \/dev\/\1 ; /g' > $S_FP_TEMPORARY_FILE_MMMV_LS_hdd_TEMPERATURE_T1 ; wait ; sync ; wait ; bash "$S_FP_TEMPORARY_FILE_MMMV_LS_hdd_TEMPERATURE_T1" ; wait ;  rm "$S_FP_TEMPORARY_FILE_MMMV_LS_hdd_TEMPERATURE_T1"
                        #
                        # One of the assumptions is that if the operating
                        # system user name is "foousername", without the
                        # quatation marks, then the file editable by root
                        # user with the command "visudo", contains a line
                        # similar to
                        #
                        #     foousername ALL=(ALL) NOPASSWD: /usr/sbin/hdparm -H /dev/sda
                        #
                        # for all storage devices that reside at that computer.
                        #
                        alias mmmv_ls_HDD_temperature_t1="S_FP_TEMPORARY_FILE_MMMV_LS_hdd_TEMPERATURE_T1=\"\`mmmv_cre_temporary_file_t1 --max_file_size_64KiB \`\" ; wait ; sync ; wait ; lsblk | grep -E '^sd' | sed -e 's/[[:blank:]].\\+\$//g' | grep -E '^sd.\$' | sed -e 's/\\(^sd.\\)/sudo hdparm -H \\/dev\\/\\1 ; /g' > \$S_FP_TEMPORARY_FILE_MMMV_LS_hdd_TEMPERATURE_T1 ; wait ; sync ; wait ; bash \"\$S_FP_TEMPORARY_FILE_MMMV_LS_hdd_TEMPERATURE_T1\" ; wait ;  rm \"\$S_FP_TEMPORARY_FILE_MMMV_LS_hdd_TEMPERATURE_T1\" "
                    fi
                fi
            fi
        fi
    fi
fi
#--------------------------------------------------------------------------

#--------------------------------------------------------------------------
# S_FP_0="/tmp/a/file/path42222" ;
# S_FP_DESTINATION_FOLDER="$S_0" ;
# if [ -e $S_FP_DESTINATION_FOLDER ]; then
#     if [ -d $S_FP_DESTINATION_FOLDER ]; then
#         if [ -e $S_FP_0 ]; then
#             if [ ! -d $S_FP_0 ]; then
#                 if [ ! -h $S_FP_0 ]; then
#                     nice -n 4 cp "$S_FP_0"  "$S_FP_DESTINATION_FOLDER/" ;
#                     if [ "$?" != "0" ]; then
#                         echo -e "\e[31mCopying failed\e[39m." ;
#                         echo -e "GUID=='45a0fdaa-f5bd-4603-9029-8312503099e7'" ;
#                     else
#                         printf "Copying .. " ;
#                         wait ; sync ; wait ;
#                         echo -e "\e[32msucceeded\e[39m." ;
#                     fi ;
#                 else
#                     echo -e "The origin " ;
#                     echo -e "" ;
#                     echo -e "    $S_FP_0" ;
#                     echo -e "" ;
#                     echo -e "\e[31mis a symlink to a file\e[39m, but" ;
#                     echo -e "a file is expected." ;
#                     echo -e "GUID=='53acf061-c62d-4ebd-8639-8312503099e7'" ;
#                 fi ;
#             else
#                 if [ -h $S_FP_0 ]; then
#                     echo -e "The origin " ;
#                     echo -e "" ;
#                     echo -e "    $S_FP_0" ;
#                     echo -e "" ;
#                     echo -e "\e[31mis a symlink to a folder\e[39m, but" ;
#                 else
#                     echo -e "The origin " ;
#                     echo -e "" ;
#                     echo -e "    $S_FP_0" ;
#                     echo -e "" ;
#                     echo -e "\e[31mis a folder\e[39m, but" ;
#                 fi ;
#                 echo -e "a file is expected." ;
#                 echo -e "GUID=='c2afa181-300b-42fa-8099-8312503099e7'" ;
#             fi ;
#         else
#             if [ -h $S_FP_0 ]; then
#                 echo -e "The origin " ;
#                 echo -e "" ;
#                 echo -e "    $S_FP_0" ;
#                 echo -e "" ;
#                 echo -e "\e[31mis a broken symlink\e[39m." ;
#                 echo -e "GUID=='99727914-095e-4baf-a849-8312503099e7'" ;
#             else
#                 echo -e "The origin " ;
#                 echo -e "" ;
#                 echo -e "    $S_FP_0" ;
#                 echo -e "" ;
#                 echo -e "\e[31mdoes not exist\e[39m." ;
#                 echo -e "GUID=='57ca3924-e746-48a6-9549-8312503099e7'" ;
#             fi ;
#         fi ;
#     else
#         if [ -h $S_FP_DESTINATION_FOLDER ]; then
#             echo -e "The destination " ;
#             echo -e "" ;
#             echo -e "    $S_FP_DESTINATION_FOLDER" ;
#             echo -e "" ;
#             echo -e "\e[31mis a symlink to a file\e[39m, but" ;
#         else
#             echo -e "The destination " ;
#             echo -e "" ;
#             echo -e "    $S_FP_DESTINATION_FOLDER" ;
#             echo -e "" ;
#             echo -e "\e[31mis a file\e[39m, but" ;
#         fi ;
#         echo -e "a folder or a symlink to a folder is expected." ;
#         echo -e "GUID=='12fef795-7a92-41ca-8028-8312503099e7'" ;
#     fi ;
# else
#     if [ -h $S_FP_DESTINATION_FOLDER ]; then
#         echo -e "The destination " ;
#         echo -e "" ;
#         echo -e "    $S_FP_DESTINATION_FOLDER" ;
#         echo -e "" ;
#         echo -e "\e[31mis a broken symlink\e[39m." ;
#         echo -e "GUID=='4692a139-cf93-432f-9068-8312503099e7'" ;
#     else
#         echo -e "The destination " ;
#         echo -e "" ;
#         echo -e "    $S_FP_DESTINATION_FOLDER" ;
#         echo -e "" ;
#         echo -e "\e[31mdoes not exist\e[39m." ;
#         echo -e "GUID=='dcb88195-5f36-4753-9478-8312503099e7'" ;
#     fi ;
# fi ;
#
#:::::::::::;
if [ "$SB_PRINTF_EXISTS_ON_PATH" == "t" ]; then
    # The "$S_0" at the "S_FP_DESTINATION_FOLDER=...." needs
    # to be taken from the environment during the runtime of
    # the alias.  The "$S_0" can be assigned a value of <pwd>
    # by executing a Bash alias named "mmmv_pwd_2_S_0".  Even
    # better option might be to use the Midnight Commander,
    # "mc", in stead of this Bash alias here.
    alias mmmv_cp_2_S_0="mmmv_polish_ABC_2_ACB_exec_t1  \"S_FP_0=\\\"\"   \"\\\" ; S_FP_DESTINATION_FOLDER=\\\"\$S_0\\\" ; if [ -e \\\$S_FP_DESTINATION_FOLDER ]; then if [ -d \\\$S_FP_DESTINATION_FOLDER ]; then if [ -e \\\$S_FP_0 ]; then if [ ! -d \\\$S_FP_0 ]; then if [ ! -h \\\$S_FP_0 ]; then nice -n 4 cp \\\"\\\$S_FP_0\\\"  \\\"\\\$S_FP_DESTINATION_FOLDER/\\\" ; if [ \\\"\\\$?\\\" != \\\"0\\\" ]; then echo -e \\\"\\\\e[31mCopying failed\\\\e[39m.\\\" ; echo -e \\\"GUID=='22f26791-c535-4e90-a328-8312503099e7'\\\" ; else printf \\\"Copying .. \\\" ; wait ; sync ; wait ; echo -e \\\"\\\\e[32msucceeded\\\\e[39m.\\\" ; fi ; else echo -e \\\"The origin \\\" ; echo -e \\\"\\\" ; echo -e \\\"    \\\$S_FP_0\\\" ; echo -e \\\"\\\" ; echo -e \\\"\\\\e[31mis a symlink to a file\\\\e[39m, but\\\" ; echo -e \\\"a file is expected.\\\" ; echo -e \\\"GUID=='711f1c01-afb4-426a-8f38-8312503099e7'\\\" ; fi ; else if [ -h \\\$S_FP_0 ]; then echo -e \\\"The origin \\\" ; echo -e \\\"\\\" ; echo -e \\\"    \\\$S_FP_0\\\" ; echo -e \\\"\\\" ; echo -e \\\"\\\\e[31mis a symlink to a folder\\\\e[39m, but\\\" ; else echo -e \\\"The origin \\\" ; echo -e \\\"\\\" ; echo -e \\\"    \\\$S_FP_0\\\" ; echo -e \\\"\\\" ; echo -e \\\"\\\\e[31mis a folder\\\\e[39m, but\\\" ; fi ; echo -e \\\"a file is expected.\\\" ; echo -e \\\"GUID=='c71c1bd1-864e-4c8e-8338-8312503099e7'\\\" ; fi ; else if [ -h \\\$S_FP_0 ]; then echo -e \\\"The origin \\\" ; echo -e \\\"\\\" ; echo -e \\\"    \\\$S_FP_0\\\" ; echo -e \\\"\\\" ; echo -e \\\"\\\\e[31mis a broken symlink\\\\e[39m.\\\" ; echo -e \\\"GUID=='a012ba8c-55d2-43e7-a748-8312503099e7'\\\" ; else echo -e \\\"The origin \\\" ; echo -e \\\"\\\" ; echo -e \\\"    \\\$S_FP_0\\\" ; echo -e \\\"\\\" ; echo -e \\\"\\\\e[31mdoes not exist\\\\e[39m.\\\" ; echo -e \\\"GUID=='921ad604-7d4a-4eb2-b728-8312503099e7'\\\" ; fi ; fi ; else if [ -h \\\$S_FP_DESTINATION_FOLDER ]; then echo -e \\\"The destination \\\" ; echo -e \\\"\\\" ; echo -e \\\"    \\\$S_FP_DESTINATION_FOLDER\\\" ; echo -e \\\"\\\" ; echo -e \\\"\\\\e[31mis a symlink to a file\\\\e[39m, but\\\" ; else echo -e \\\"The destination \\\" ; echo -e \\\"\\\" ; echo -e \\\"    \\\$S_FP_DESTINATION_FOLDER\\\" ; echo -e \\\"\\\" ; echo -e \\\"\\\\e[31mis a file\\\\e[39m, but\\\" ; fi ; echo -e \\\"a folder or a symlink to a folder is expected.\\\" ; echo -e \\\"GUID=='d53cd9e9-57d4-4282-8247-8312503099e7'\\\" ; fi ; else if [ -h \\\$S_FP_DESTINATION_FOLDER ]; then echo -e \\\"The destination \\\" ; echo -e \\\"\\\" ; echo -e \\\"    \\\$S_FP_DESTINATION_FOLDER\\\" ; echo -e \\\"\\\" ; echo -e \\\"\\\\e[31mis a broken symlink\\\\e[39m.\\\" ; echo -e \\\"GUID=='b577fa68-73e0-46ca-b817-8312503099e7'\\\" ; else echo -e \\\"The destination \\\" ; echo -e \\\"\\\" ; echo -e \\\"    \\\$S_FP_DESTINATION_FOLDER\\\" ; echo -e \\\"\\\" ; echo -e \\\"\\\\e[31mdoes not exist\\\\e[39m.\\\" ; echo -e \\\"GUID=='556b46d3-2777-46b9-a357-8312503099e7'\\\" ; fi ; fi ; \" "
fi
#:::::::::::

#==========================================================================
# S_VERSION_OF_THIS_FILE="2a1d3144-fc8a-43f7-9048-8312503099e7"
#==========================================================================
