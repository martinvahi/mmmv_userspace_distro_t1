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
    echo "GUID=='5c304964-2cc0-4f85-8e31-03a230708ae7'"
    echo ""
    exit $S_ERR_CODE # exit with an error
fi
#==========================================================================
func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
    "$SB_OPERATINGSYSTEM_LINUX" "SB_OPERATINGSYSTEM_LINUX" \
    "50addf13-011b-4116-9331-03a230708ae7"
#------------------------------------------
func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
    "$SB_OPERATINGSYSTEM_LINUX_WSL" "SB_OPERATINGSYSTEM_LINUX_WSL" \
    "eedc8b2d-8877-4cf9-8531-03a230708ae7"
#------------------------------------------
func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
    "$SB_OPERATINGSYSTEM_LINUX_ANDROID" "SB_OPERATINGSYSTEM_LINUX_ANDROID" \
    "cf00f020-a674-44aa-9231-03a230708ae7"
#------------------------------------------
func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
    "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" "SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" \
    "7dc6b551-b089-482c-b121-03a230708ae7"
#------------------------------------------
func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
    "$SB_OPERATINGSYSTEM_BSD" "SB_OPERATINGSYSTEM_BSD" \
    "1494a269-9852-45a2-b121-03a230708ae7"
#------------------------------------------
func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
    "$SB_OPERATINGSYSTEM_BSD_FREEBSD" "SB_OPERATINGSYSTEM_BSD_FREEBSD" \
    "a0a3d146-16f2-449e-9521-03a230708ae7"
#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_LINUX" == "f" ]; then
    if [ "$SB_OPERATINGSYSTEM_LINUX_WSL" == "t" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo -e "\e[31mThe code of this Bash file is flawed.\e[39m"
            echo "GUID=='0cdce52e-952e-445a-b231-03a230708ae7'"
            echo ""
        fi
    fi
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID" == "t" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo -e "\e[31mThe code of this Bash file is flawed.\e[39m"
            echo "GUID=='3c6a0661-e471-4601-8431-03a230708ae7'"
            echo ""
        fi
    fi
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "t" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo -e "\e[31mThe code of this Bash file is flawed.\e[39m"
            echo "GUID=='314d2207-4e8e-4af7-9621-03a230708ae7'"
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
            echo "GUID=='6f372110-37e3-4e20-8121-03a230708ae7'"
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
            echo "GUID=='3d9b1df2-0f6b-4766-a921-03a230708ae7'"
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
alias chmR0555="S_PERMISSIONS=\"0555\" ; $S_FP_NICE -n 1 chmod -f -R \$S_PERMISSIONS \`pwd\` ; S_ERR=\"\$?\" ; wait ; sync ; wait ; if [ \"\$S_ERR\" != \"0\" ]; then  echo \"\" ; echo \"Recursive changing of access permissions to\" ; echo -e \"\\e[31m\$S_PERMISSIONS failed\\e[39m for \" ; echo \"    \`pwd\` \" ; echo \"\" ; else  echo \"\" ; echo \"Recursive changing of access permissions to\" ; echo -e \"\\e[32m\$S_PERMISSIONS succeeded\\e[39m for \" ; echo \"    \`pwd\` \" ; echo \"\" ; fi "
alias chmR0550="S_PERMISSIONS=\"0550\" ; $S_FP_NICE -n 1 chmod -f -R \$S_PERMISSIONS \`pwd\` ; S_ERR=\"\$?\" ; wait ; sync ; wait ; if [ \"\$S_ERR\" != \"0\" ]; then  echo \"\" ; echo \"Recursive changing of access permissions to\" ; echo -e \"\\e[31m\$S_PERMISSIONS failed\\e[39m for \" ; echo \"    \`pwd\` \" ; echo \"\" ; else  echo \"\" ; echo \"Recursive changing of access permissions to\" ; echo -e \"\\e[32m\$S_PERMISSIONS succeeded\\e[39m for \" ; echo \"    \`pwd\` \" ; echo \"\" ; fi "
alias chmR0500="S_PERMISSIONS=\"0500\" ; $S_FP_NICE -n 1 chmod -f -R \$S_PERMISSIONS \`pwd\` ; S_ERR=\"\$?\" ; wait ; sync ; wait ; if [ \"\$S_ERR\" != \"0\" ]; then  echo \"\" ; echo \"Recursive changing of access permissions to\" ; echo -e \"\\e[31m\$S_PERMISSIONS failed\\e[39m for \" ; echo \"    \`pwd\` \" ; echo \"\" ; else  echo \"\" ; echo \"Recursive changing of access permissions to\" ; echo -e \"\\e[32m\$S_PERMISSIONS succeeded\\e[39m for \" ; echo \"    \`pwd\` \" ; echo \"\" ; fi "
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
            alias mmmv_admin_create_symlink_to_cupspdf_t1="S_FP_LINK=\"\$HOME/CUPS_PDF\" ; S_FP_CUPSPDF_OUTPUT_DIR_0=\"/var/spool/cups-pdf/ANONYMOUS\" ; S_FP_CUPSPDF_OUTPUT_DIR_X=\"\$S_FP_CUPSPDF_OUTPUT_DIR_0\" ; S_FP_CUPSPDF_OUTPUT_DIR_1=\"/var/spool/cups-pdf/\`whoami\`\" ; if [ -e \"\$S_FP_CUPSPDF_OUTPUT_DIR_1\" ]; then S_FP_CUPSPDF_OUTPUT_DIR_X=\"\$S_FP_CUPSPDF_OUTPUT_DIR_1\" ; fi ; if [ -e \"\$S_FP_CUPSPDF_OUTPUT_DIR_X\" ]; then if [ -d \"\$S_FP_CUPSPDF_OUTPUT_DIR_X\" ]; then if [ -e \"\$S_FP_LINK\" ]; then echo \"\" ; echo \"Something with the path of \" ; echo \"    \$S_FP_LINK\" ; echo -e \"\e[31malready exists.\e[39m Doing nothing.\" ; echo \"GUID=='38e3554f-7096-449f-a421-03a230708ae7'\" ; echo \"\" ; else if [ -h \"\$S_FP_LINK\" ]; then echo \"\" ; echo \"A broken symlink with the path of \" ; echo \"    \$S_FP_LINK\" ; echo -e \"\e[31malready exists.\e[39m Doing nothing.\" ; echo \"GUID=='76ebb74c-5c79-4c05-a321-03a230708ae7'\" ; echo \"\" ; else ln -s \"\$S_FP_CUPSPDF_OUTPUT_DIR_X\" \"\$S_FP_LINK\" ; sync; wait; sync ;  if [ ! -e \"\$S_FP_LINK\" ]; then echo \"\" ; echo -e \"\e[31mFailed to create symlink \e[39m\" ; echo \"    \$S_FP_LINK\" ; echo \"    -->\" ; echo \"    \$S_FP_CUPSPDF_OUTPUT_DIR_X\" ; echo \"GUID=='af93cc5b-549d-4430-8411-03a230708ae7'\" ; echo \"\" ; fi ; fi ; fi ; else echo \"\" ; echo \"The \" ; echo \"    \$S_FP_CUPSPDF_OUTPUT_DIR_X\" ; if [ -h \"\$S_FP_CUPSPDF_OUTPUT_DIR_X\" ]; then echo \"is a symlink to a file, but a folder is expected.\" ; else echo \"is a file, but a folder is expected.\" ; fi ; echo \"GUID=='3d43cd91-70ea-465b-8211-03a230708ae7'\" ; echo \"\" ; fi ; else echo \"\" ; echo -e \"\e[31mFolder is missing. \e[39m\" ; echo \"    \$S_FP_CUPSPDF_OUTPUT_DIR_X\" ; echo \"It MIGHT be that the cups-pdf has not been installed.\" ; echo \"GUID=='5f7b5fd1-ce56-4181-9b11-03a230708ae7'\" ; echo \"\" ; fi ;"
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
            #                 echo "GUID=='32d9b753-9205-4ce8-b611-03a230708ae7'" ;
            #                 echo "" ;
            #             else
            #                 if [ -h "$S_FP_LINK" ]; then
            #                     echo "" ;
            #                     echo "A broken symlink with the path of " ;
            #                     echo "    $S_FP_LINK" ;
            #                     echo -e "\e[31malready exists.\e[39m Doing nothing." ;
            #                     echo "GUID=='29845022-657a-4485-9311-03a230708ae7'" ;
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
            #                         echo "GUID=='2dfb5cda-0077-4269-9511-03a230708ae7'" ;
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
            #             echo "GUID=='eee4644f-e618-40c9-b111-03a230708ae7'" ;
            #             echo "" ;
            #         fi ;
            #     else
            #         echo "" ;
            #         echo -e "\e[31mFolder is missing. \e[39m" ;
            #         echo "    $S_FP_CUPSPDF_OUTPUT_DIR_X" ;
            #         echo "It MIGHT be that the cups-pdf has not been installed." ;
            #         echo "GUID=='52793847-1f2e-474f-b311-03a230708ae7'" ;
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
            echo "GUID=='e899b338-2b7f-42f2-8401-03a230708ae7'"
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
                "f2647911-9c34-429e-a121-03a230708ae7" \
                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        fi
    fi
    #----------------------------------------------------------------------
    if [ "$SB_OK2ATTEMPT" == "t" ]; then
        #------------------------------------------------------------------
        local S_ERR_MSG_SUBPART_01=""
        if [ "$S_GUID_CANDIDATE_OPTIONAL" == "" ]; then
            S_GUID_CANDIDATE_OPTIONAL="02a81d11-ddbf-438c-8511-03a230708ae7"
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
                        echo "GUID=='e9d9454a-6dc8-4c13-a101-03a230708ae7'"
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
            #                    echo \"GUID=='1aaa7b15-b01f-4ce5-9301-03a230708ae7'\"; \
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
            #                echo \"GUID=='1aeb323a-fa7a-48e2-9201-03a230708ae7'\"; \
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
            #            echo \"GUID=='dc850033-e690-4743-9201-03a230708ae7'\"; \
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
            #        echo \"GUID=='46757913-773e-49a5-8101-03a230708ae7'\"; \
            #        if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then \
            #            echo \"$S_ERR_MSG_SUBPART_01\"; \
            #        fi;\
            #        echo \"\"; \
            #    fi; \
            #    "
            # #------------------------------
            # is meant to be processed with Vim macros for assembling the
            alias $S_ALIAS_NAME=" SB_USE_UPGUID_ON_COPIED_FILE=\"$SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL\"; if [ -e \"$S_FP_TEMPLATE\" ]; then if [ ! -d \"$S_FP_TEMPLATE\" ]; then if [ ! -e \"$S_FP_NEW\" ]; then cp $S_FP_TEMPLATE $S_FP_NEW ; if [ \"\$?\" == \"0\" ]; then sync; wait; sync; echo \"\"; echo \"Created a new file with the path of \"; echo \"\"; echo -e \"\\e[32m    $S_FP_NEW \\e[39m\"; echo \"\"; if [ \"\$SB_USE_UPGUID_ON_COPIED_FILE\" == \"t\" ]; then if [ \"\`which upguid 2> /dev/null \`\" != \"\" ]; then upguid -f  $S_FP_NEW; sync; wait; sync; chmod 0700 $S_FP_NEW; sync; wait; sync; else echo -e \"Could not find \\e[31mupguid\\e[39m from the PATH.\"; echo \"\"; fi fi else echo -e \"\\e[31mFailed to create file \\e[39m \"; echo \"\"; echo \"    $S_FP_NEW \"; echo \"\"; echo \"GUID=='4317cca1-fde9-4d18-b601-03a230708ae7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; if [ -d \"$S_FP_NEW\" ]; then echo \"A folder with the path of \"; else echo \"A file with the path of \"; fi; echo \"\"; echo \"    $S_FP_NEW\"; echo \"\"; echo -e \"\\e[31malready exists\\e[39m. Not overwriting.\"; echo \"GUID=='373eb045-bf20-4e2a-b501-03a230708ae7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; echo \"The template \"; echo \"\"; echo \"    $S_FP_TEMPLATE\"; echo \"\"; if [ -h \"$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mis a symlink to a folder,\\e[39m\"; else echo -e \"\\e[31mis a folder,\\e[39m\"; fi; echo -e \"\\e[31mbut a file is expected.\\e[39m\"; echo \"Not copying anything.\"; echo \"GUID=='8b65633c-c103-4286-92f0-03a230708ae7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; echo \"The template \"; echo \"\"; echo \"    $S_FP_TEMPLATE\"; echo \"\"; if [ -h \"$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mis a broken symlink,\\e[39m\"; else echo -e \"\\e[31mis missing,\\e[39m\"; fi; echo -e \"\\e[31mbut a file is expected.\\e[39m\"; echo \"Not copying anything.\"; echo \"GUID=='9d8d874f-a58d-4bb8-b3f0-03a230708ae7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; "
            #--------------------
            # The following versions are older versions that have been tested to work.
            # alias $S_ALIAS_NAME=" SB_USE_UPGUID_ON_COPIED_FILE=\"$SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL\"; if [ -e \"$S_FP_TEMPLATE\" ]; then if [ ! -d \"$S_FP_TEMPLATE\" ]; then if [ ! -e \"$S_FP_NEW\" ]; then cp $S_FP_TEMPLATE $S_FP_NEW ; if [ \"\$?\" == \"0\" ]; then sync; wait; sync; echo \"\"; echo \"Created a new file with the path of \"; echo \"\"; echo \"    $S_FP_NEW \"; echo \"\"; if [ \"\$SB_USE_UPGUID_ON_COPIED_FILE\" == \"t\" ]; then if [ \"\`which upguid 2> /dev/null \`\" != \"\" ]; then upguid -f  $S_FP_NEW; sync; wait; sync; chmod 0700 $S_FP_NEW; sync; wait; sync; else echo -e \"Could not find \\e[31mupguid\\e[39m from the PATH.\"; echo \"\"; fi fi else echo -e \"\\e[31mFailed to create file \\e[39m \"; echo \"\"; echo \"    $S_FP_NEW \"; echo \"\"; echo \"GUID=='cc374632-0a5c-4c16-95f0-03a230708ae7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; if [ -d \"$S_FP_NEW\" ]; then echo \"A folder with the path of \"; else echo \"A file with the path of \"; fi; echo \"\"; echo \"    $S_FP_NEW\"; echo \"\"; echo -e \"\\e[31malready exists\\e[39m. Not overwriting.\"; echo \"GUID=='2a00e439-115f-4492-81f0-03a230708ae7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; echo \"The template \"; echo \"\"; echo \"    $S_FP_TEMPLATE\"; echo \"\"; if [ -h \"$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mis a symlink to a folder,\\e[39m\"; else echo -e \"\\e[31mis a folder,\\e[39m\"; fi; echo -e \"\\e[31mbut a file is expected.\\e[39m\"; echo \"Not copying anything.\"; echo \"GUID=='45b69f23-f7bb-4608-8df0-03a230708ae7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; echo \"The template \"; echo \"\"; echo \"    $S_FP_TEMPLATE\"; echo \"\"; if [ -h \"$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mis a broken symlink,\\e[39m\"; else echo -e \"\\e[31mis missing,\\e[39m\"; fi; echo -e \"\\e[31mbut a file is expected.\\e[39m\"; echo \"Not copying anything.\"; echo \"GUID=='615d6150-d76a-44ff-81f0-03a230708ae7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; "
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
        S_GUID_CANDIDATE_OPTIONAL="e549795f-449c-4f06-9211-03a230708ae7"
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
        #                    echo \"GUID=='ee432b2e-e957-453b-b5f0-03a230708ae7'\"; \
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
        #                echo \"GUID=='5a75a91d-6198-4acc-b3f0-03a230708ae7'\"; \
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
        #            echo \"GUID=='cb5e1715-1394-429c-a5e0-03a230708ae7'\"; \
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
        #        echo \"GUID=='ab8588b3-277d-4a94-b1e0-03a230708ae7'\"; \
        #        if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then \
        #            echo \"$S_ERR_MSG_SUBPART_01\"; \
        #        fi;\
        #        echo \"\"; \
        #    fi; \
        #    "
        # #------------------------------
        # is meant to be processed with Vim macros for assembling the
        alias $S_ALIAS_NAME="if [ -e \"$S_FP_TEMPLATE\" ]; then if [ ! -d \"$S_FP_TEMPLATE\" ]; then if [ ! -e \"$S_FP_NEW\" ]; then $S_FP_NICE -n 10 tar -xzf $S_FP_TEMPLATE ./ ; if [ \"\$?\" == \"0\" ]; then sync; wait; echo \"\"; if [ -d \"$S_FP_NEW\" ]; then if [ -h \"$S_FP_NEW\" ]; then echo \"Created a new symlink to a folder with the path of \"; else echo \"Created a new folder with the path of \"; fi; else if [ -h \"$S_FP_NEW\" ]; then echo \"Created a new symlink to a file with the path of \"; else echo \"Created a new file with the path of \"; fi; fi; echo \"\"; echo \"    $S_FP_NEW \"; echo \"\"; else echo -e \"\\e[31mFailed to create \\e[39m \"; echo \"\"; echo \"    $S_FP_NEW \"; echo \"\"; echo \"GUID=='d3c2d602-f917-4837-8ce0-03a230708ae7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; if [ -d \"$S_FP_NEW\" ]; then echo \"A folder with the path of \"; else echo \"A file with the path of \"; fi; echo \"\"; echo \"    $S_FP_NEW\"; echo \"\"; echo -e \"\\e[31malready exists\\e[39m. Not overwriting.\"; echo \"GUID=='4904bba2-67ad-4bf0-b4e0-03a230708ae7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; echo \"The template \"; echo \"\"; echo \"    $S_FP_TEMPLATE\"; echo \"\"; if [ -h \"$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mis a symlink to a folder,\\e[39m\"; else echo -e \"\\e[31mis a folder,\\e[39m\"; fi; echo -e \"\\e[31mbut a file is expected.\\e[39m\"; echo \"Not copying anything.\"; echo \"GUID=='adab5123-500d-42d2-82e0-03a230708ae7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; echo \"The template \"; echo \"\"; echo \"    $S_FP_TEMPLATE\"; echo \"\"; if [ -h \"$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mis a broken symlink,\\e[39m\"; else echo -e \"\\e[31mis missing,\\e[39m\"; fi; echo -e \"\\e[31mbut a file is expected.\\e[39m\"; echo \"Not copying anything.\"; echo \"GUID=='8ec2172c-63f8-4494-b1e0-03a230708ae7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; "
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
        S_GUID_CANDIDATE_OPTIONAL="0916f452-7e49-4690-b311-03a230708ae7"
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
        #                         echo \"GUID=='8db9ff25-56a2-49d7-a2e0-03a230708ae7'\"; \
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
        #                     echo \"GUID=='d52ff4ab-6290-4d89-b2e0-03a230708ae7'\"; \
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
        #                 echo \"GUID=='bd88df38-1a86-497a-94d0-03a230708ae7'\"; \
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
        #             echo \"GUID=='318a1d74-1b67-4e79-b5d0-03a230708ae7'\"; \
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
        #         echo \"GUID=='9fbf7a1f-c7e2-4d6a-a1d0-03a230708ae7'\"; \
        #         if [ \"\$S_ERR_MSG_SUBPART_01\" != \"\" ]; then \
        #             echo \"\$S_ERR_MSG_SUBPART_01\"; \
        #         fi;\
        #         echo \"\"; \
        #     fi; \
        #    "
        # #------------------------------
        # is meant to be processed with Vim macros for assembling the
        alias $S_ALIAS_NAME="if [ -e \"$S_FP_TEMPLATE\" ]; then if [ ! -d \"$S_FP_TEMPLATE\" ]; then $S_FP_NICE -n 10 zip --test \"$S_FP_TEMPLATE\" ; if [ \"\$?\" == \"0\" ]; then if [ ! -e \"$S_FP_NEW\" ]; then $S_FP_NICE -n 10 unzip $S_FP_TEMPLATE ; if [ \"\$?\" == \"0\" ]; then sync; wait; echo \"\"; if [ -d \"$S_FP_NEW\" ]; then if [ -h \"$S_FP_NEW\" ]; then echo \"Created a new symlink to a folder with the path of \"; else echo \"Created a new folder with the path of \"; fi; else if [ -h \"$S_FP_NEW\" ]; then echo \"Created a new symlink to a file with the path of \"; else echo \"Created a new file with the path of \"; fi; fi; echo \"\"; echo \"    $S_FP_NEW \"; echo \"\"; else echo -e \"\\e[31mFailed to create \\e[39m \"; echo \"\"; echo \"    $S_FP_NEW \"; echo \"\"; echo \"GUID=='64fe9cb9-569b-4eff-95d0-03a230708ae7'\"; if [ \"\$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"\$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; if [ -d \"$S_FP_NEW\" ]; then echo \"A folder with the path of \"; else echo \"A file with the path of \"; fi; echo \"\"; echo \"    $S_FP_NEW\"; echo \"\"; echo -e \"\\e[31malready exists\\e[39m. Not overwriting.\"; echo \"GUID=='9ae0e84d-8bfe-4f6f-91d0-03a230708ae7'\"; if [ \"\$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"\$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo -e \"The zip file \"; echo \"\"; echo \"    $S_FP_TEMPLATE \"; echo \"\"; echo -e \"\\e[31mis corrupted\\e[39m or it is not a zip file.\"; echo \"GUID=='c697c028-8bc8-4b29-83d0-03a230708ae7'\"; fi else echo \"\"; echo \"The template \"; echo \"\"; echo \"    $S_FP_TEMPLATE\"; echo \"\"; if [ -h \"$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mis a symlink to a folder,\\e[39m\"; else echo -e \"\\e[31mis a folder,\\e[39m\"; fi; echo -e \"\\e[31mbut a file is expected.\\e[39m\"; echo \"Not copying anything.\"; echo \"GUID=='a6e6a749-1327-41f0-95d0-03a230708ae7'\"; if [ \"\$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"\$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; echo \"The template \"; echo \"\"; echo \"    $S_FP_TEMPLATE\"; echo \"\"; if [ -h \"$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mis a broken symlink,\\e[39m\"; else echo -e \"\\e[31mis missing,\\e[39m\"; fi; echo -e \"\\e[31mbut a file is expected.\\e[39m\"; echo \"Not copying anything.\"; echo \"GUID=='1431d921-a75b-43e3-a4d0-03a230708ae7'\"; if [ \"\$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"\$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; "
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
    "$S_TMP_FP_0" "7ff18b1d-6edd-4f68-a511-03a230708ae7" \
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
    "993a7415-d82e-46eb-9111-03a230708ae7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_download_files_with_wget_template_01" \
    "download_files_with_wget_template_01.bash" \
    "d35e4261-4322-43dc-8711-03a230708ae7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_Fossil_wiki_page_HTML_expimp_template_01" \
    "download_and_upload_Fossil_wiki_HTML.bash" \
    "575d0103-9fb6-4409-9511-03a230708ae7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_fossil_clone" \
    "mmmv_Fossil_operator_t1.bash" \
    "2e48324a-e7c1-49b1-a211-03a230708ae7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_SQL_dump_script" \
    "create_backup_from_MySQL_db.bash" \
    "54a37a5e-1fed-4217-a201-03a230708ae7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_SSH_config_template" \
    "_ssh_config_template.txt" \
    "0de75b3c-0eb5-4f3f-a501-03a230708ae7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_SSH_tunnel_creation_script_template_t1" \
    "ssh_tunnel_t1.bash" \
    "dfcad93f-92b0-478e-9201-03a230708ae7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_WARC_Tools" \
    "2016_12_xx_WARC_tools.tar.xz" \
    "3187f540-891f-4e1e-a101-03a230708ae7"

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
                    echo "GUID=='971b3151-0f18-4a74-85d0-03a230708ae7'"
                fi
            fi
            alias mmmv_cre_rsync_based_backups_creator="echo \"\" ; echo \"The \\\"rsync\\\" is not on PATH.\" ; echo \"GUID=='214dd41c-6505-4721-b2c0-03a230708ae7'\" ; echo \"\" ; $S_TMP_0"
        fi
  fi
fi
#--------------------------------------------------------------------------
if [ "$SB_ZIP_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_UNZIP_EXISTS_ON_PATH" == "t" ]; then
        #------------------------------------------------------------------
        func_mmmv_declare_template_creation_alias_zip_t1 \
            "mmmv_cre_server_HTTP_wappskafander_t2_2023_07_26" \
            "2023_07_26_wappskafander_t2.zip" \
            "wappskafander_t2" \
            "25146d5e-a984-4ad3-a401-03a230708ae7"
        #------------------------------------------------------------------
        func_mmmv_declare_template_creation_alias_zip_t1 \
            "mmmv_cre_bash_boilerplate_t5_2023_12_24" \
            "2023_12_24_mmmv_bash_boilerplate_t5.zip" \
            "2023_12_24_mmmv_bash_boilerplate_t5" \
            "3290e011-082a-487d-b101-03a230708ae7"
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
        #     "89aef557-88d5-4bd6-a101-03a230708ae7"
        #----
        # func_mmmv_declare_template_creation_alias_zip_t1 \
        #     "mmmv_cre_web_server_http_CivetWeb_v_1_16_with_modifications_01" \
        #     "2025_04_06_CivetWeb_http_server_v_1_16_with_modifications_01.zip" \
        #     "CivetWeb_http_server" \
        #     "1464c885-4495-4954-9201-03a230708ae7"
        #------------------------------------------------------------------
        func_mmmv_declare_template_creation_alias_zip_t1 \
            "mmmv_cre_toggler_template_t1" \
            "2026_04_08_toggler_template_t1.zip" \
            "toggler_template" \
            "05ace635-b5a6-4f15-91f0-03a230708ae7"
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
            "7236414b-f637-4af4-82f0-03a230708ae7"
        #----
        # The .tar.gz at the following alias declaration function call
        func_mmmv_declare_template_creation_alias_tar_gz_t1 \
            "mmmv_cre_image_height_and_width_limiter_t1" \
            "image_edge_length_limiter_t1.tar.gz" \
            "image_edge_length_limiter_t1" \
            "6056cb84-0747-4889-9bf0-03a230708ae7"
        # is intentionally also used at the following alias declaration function calls:
        func_mmmv_declare_template_creation_alias_tar_gz_t1 \
            "mmmv_cre_image_width_and_height_limiter_t1" \
            "image_edge_length_limiter_t1.tar.gz" \
            "image_edge_length_limiter_t1" \
            "9dc26a3a-27b0-45a8-a3f0-03a230708ae7"
        func_mmmv_declare_template_creation_alias_tar_gz_t1 \
            "mmmv_cre_image_edge_length_limiter_t1" \
            "image_edge_length_limiter_t1.tar.gz" \
            "image_edge_length_limiter_t1" \
            "f816ed50-2740-4adb-82f0-03a230708ae7"
        #----
        func_mmmv_declare_template_creation_alias_tar_gz_t1 \
            "mmmv_cre_installed_programs_checklist_t1" \
            "2021_02_xx_mmmv_installed_programs_checklist_t1_template.tar.gz" \
            "installed_programs_checklist_t1_template" \
            "21d821fb-7de4-40f0-a2f0-03a230708ae7"
        #----
        func_mmmv_declare_template_creation_alias_tar_gz_t1 \
            "mmmv_cre_ruby_boilerplate_t6" \
            "2024_01_27_mmmv_ruby_boilerplate_t6.tar.gz" \
            "2024_01_27_mmmv_ruby_boilerplate_t6" \
            "9577861b-1fbb-44f6-b3f0-03a230708ae7"
        #----
        func_mmmv_declare_template_creation_alias_tar_gz_t1 \
            "mmmv_cre_ZeroNet_Rev3703_from_mmmv_repackaging" \
            "2018_11_08_ZeroNet_Rev3703_mmmv_repackaging_t2.tar.gz" \
            "2018_11_08_ZeroNet_Rev3703_mmmv_repackaging_t2" \
            "49f75545-2bf2-4e97-91f0-03a230708ae7"
        #----
        func_mmmv_declare_template_creation_alias_tar_gz_t1 \
            "mmmv_cre_vimwiki_project_wiki_t1" \
            "project_wiki_t1.tar.gz" \
            "project_wiki" \
            "3a926534-0f7d-49d5-92e0-03a230708ae7"
        #----
        func_mmmv_declare_template_creation_alias_tar_gz_t1 \
            "mmmv_cre_data_collection_t1" \
            "2025_08_09_data_collection_template_01.tar.gz" \
            "data_collection" \
            "d1c75c1d-97b8-468d-95e0-03a230708ae7"
        #----
        func_mmmv_declare_template_creation_alias_tar_gz_t1 \
            "mmmv_cre_LaTeX_graph_drawing_example_LuaTeX_Tikz_t1" \
            "2026_04_29_LaTeX_graph_drawing_example_LuaTeX_Tikz.tar.gz" \
            "2026_04_29_LaTeX_graph_drawing_example_LuaTeX_Tikz" \
            "c60b1630-f727-4f28-82e0-03a230708ae7"
        #----
        # The .tar.gz at the following alias declaration function call
        func_mmmv_declare_template_creation_alias_tar_gz_t1 \
            "mmmv_cre_Graphviz_dot_directed_graph_example_t1" \
            "2026_05_xx_mmmv_Graphviz_dot_directed_graph_example_t1.tar.gz" \
            "2026_05_xx_mmmv_Graphviz_dot_directed_graph_example_t1" \
            "a488f853-565f-41eb-85e0-03a230708ae7"
        # is intentionally also used at the following alias declaration function call:
        func_mmmv_declare_template_creation_alias_tar_gz_t1 \
            "mmmv_cre_Makefile_example_GNU_Make_Graphviz_dot_directed_graph_example_t1" \
            "2026_05_xx_mmmv_Graphviz_dot_directed_graph_example_t1.tar.gz" \
            "2026_05_xx_mmmv_Graphviz_dot_directed_graph_example_t1" \
            "3853354d-0b38-4a72-a3e0-03a230708ae7"
        #----
        func_mmmv_declare_template_creation_alias_tar_gz_t1 \
            "mmmv_cre_data_set_filesystem_object_data_set_t1" \
            "filesystem_object_data_set_t1.tar.gz" \
            "filesystem_object_data_set_t1" \
            "bf43af10-31f9-43ea-b4e0-03a230708ae7"
        #----
    fi
fi
#--------------------------------------------------------------------------
func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_COMMENTS_txt_t1" \
    "template_of_COMMENTS_txt_t1.txt" \
    "COMMENTS.txt" \
    "1f7ab6e2-aa27-426f-91e0-03a230708ae7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_COMMENTS_txt_t2" \
    "template_of_COMMENTS_txt_t2.txt" \
    "COMMENTS.txt" \
    "1b49a453-bac3-4e5d-b4e0-03a230708ae7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_COMMENTS_txt_t3_clone_single_Git_repository" \
    "template_of_COMMENTS_txt_t3_clone_single_Git_repository.txt" \
    "COMMENTS.txt" \
    "1acb94a8-866b-424c-b3d0-03a230708ae7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_COMMENTS_txt_t4_clone_multiple_repositories_from_a_single_GitHub_account" \
    "template_of_COMMENTS_txt_t4_clone_multiple_repositories_from_a_single_GitHub_account_t1.txt" \
    "COMMENTS.txt" \
    "29a9aff2-b850-4770-b3d0-03a230708ae7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_COMMENTS_txt_t5_clone_multiple_repositories_from_a_single_GitHub_account" \
    "template_of_COMMENTS_txt_t5_clone_multiple_repositories_from_a_single_GitHub_account_t2.txt" \
    "COMMENTS.txt" \
    "0fcb1556-ec56-4f2f-84d0-03a230708ae7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_COMMENTS_txt_t6_clone_multiple_repositories_from_multiple_GitHub_accounts_t1" \
    "template_of_COMMENTS_txt_t6_clone_multiple_repositories_from_multiple_GitHub_accounts_t1.txt" \
    "COMMENTS.txt" \
    "de6d513a-0539-47be-a1d0-03a230708ae7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_CVS_clonescript_t1" \
    "CVS_clonescript_template_01.bash" \
    "CVS_clonescript.bash" \
    "21729d57-fedc-459f-82d0-03a230708ae7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_x_txt_git_pack_Bash_script_t1" \
    "mmmv_git_pack_template_t1.bash" \
    "x.txt" \
    "832834a9-5788-4870-b3d0-03a230708ae7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_Rakefile_template_t1" \
    "2022_10_06_Rakefile_template_t1.rb" \
    "Rakefile" \
    "67e69a32-5c58-4917-92d0-03a230708ae7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_product_chooser_t1_template_t1" \
    "2025_03_23_product_chooser_t1_template_t1.rb" \
    "product_chooser.rb" \
    "2f657635-dc60-48ec-a2d0-03a230708ae7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_product_chooser_t1_template_t2" \
    "2025_04_03_product_chooser_t1_template_t2.rb" \
    "product_chooser.rb" \
    "36505037-8a02-444b-82d0-03a230708ae7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_bash_switch_to_next_keyboard_layout_t1" \
    "mmmv_ui_switch_to_next_keyboard_layout_t1_template.bash" \
    "mmmv_ui_switch_to_next_keyboard_layout_t1.bash" \
    "58f95dec-4623-45a8-95c0-03a230708ae7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_bash_download_t1" \
    "2023_12_20_download_template_t1.bash" \
    "download.bash" \
    "4905b2b6-bc94-41e0-a2c0-03a230708ae7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_git_runscript_that_uses_SSH_key_based_authentication" \
    "2024_03_02_run_git_with_SSH_URL_by_authenticating_with_an_SSH_key_t1_template.bash" \
    "run_git_by_authenticating_with_an_SSH_key.bash" \
    "2434d570-7132-475d-92c0-03a230708ae7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_ruby_lib_backwards_compatibility_run_2_4_0_code_with_v_3_4_1_interpreter_t1" \
    "Ruby_v_3_4_1_backwards_compatibility_with_v_2_4_0_t1.rb" \
    "Ruby_v_3_4_1_backwards_compatibility_with_v_2_4_0_t1.rb" \
    "adf73552-82b3-4ad6-93c0-03a230708ae7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_data_collection_t1_reading_copy_updater_t1" \
    "2025_03_25_update_reading_copy_of_each_of_the_data_collections_t1.bash" \
    "update_all_reading_copies.bash" \
    "4cce4035-41ba-42af-a5c0-03a230708ae7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_SSH_overwrite_remote_folder_content_with_local_folder_content_by_using_rsync_t2" \
    "template_of_SSH_overwrite_remote_folder_content_with_local_folder_content_by_using_rsync_t2.bash" \
    "overwrite_remote_folder_content_with_local_folder_content_t2.bash" \
    "7360995d-a71b-4beb-82c0-03a230708ae7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_Doxygen_v_1_9_4_configuration_file_for_cpp_t1" \
    "template_of_Doxygen_v_1_9_4_config_file_for_cpp_t1.conf" \
    "doxygen_v_1_9_4_configuration_for_cpp.conf" \
    "83985b19-7f60-422c-a2c0-03a230708ae7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_Doxygen_v_1_14_0_configuration_file_for_cpp_t1" \
    "template_of_Doxygen_v_1_14_0_config_file_for_cpp_t1.conf" \
    "doxygen_v_1_14_0_configuration_for_cpp.conf" \
    "02a2bc22-9cfd-4df8-84c0-03a230708ae7"

#--------------------------------------------------------------------------
SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL="t"
func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_admin_cre_HOME_dot_cargo_config_toml" \
    "HOME_dot_cargo_config.toml.template" \
    "config.toml" \
    "335b37e4-8592-4c7a-b5c0-03a230708ae7" \
    "$SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL" \
    "$HOME/.cargo"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_volume_per_moneyunit_t1" \
    "2025_01_11_template_of_volume_per_moneyunit_t1.rb" \
    "volume_per_moneyunit_t1.rb" \
    "c0d2155c-de79-4d6a-a1c0-03a230708ae7" \
    "$SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL"

SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL="t"
func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_bash_try_to_compile_X_template_t5e" \
    "try_to_compile_X_template_t5e.bash" \
    "try_to_compile_X.bash" \
    "91e86eed-b2cb-46b7-b3b0-03a230708ae7" \
    "$SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_bash_generate_file_lists_HTML_t1" \
    "template_of_generate_file_lists_HTML_t1.bash" \
    "generate_file_lists_HTML.bash" \
    "e60add5a-2922-4687-95b0-03a230708ae7" \
    "$SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_ruby_console_application_t3_selfcontained_with_argparser_krl171bt4" \
    "ruby_console_application_template_t3_selfcontained_with_argparser_krl171bt4.rb" \
    "ruby_console_application.rb" \
    "6dd5a245-126e-45fe-92b0-03a230708ae7" \
    "$SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_ruby_console_application_t4_rubygems_simplistic_krl171bt4" \
    "ruby_console_application_template_t4_rubygems_simplistic_krl171bt4.rb" \
    "ruby_console_application.rb" \
    "fedd5920-7cab-48c1-92b0-03a230708ae7" \
    "$SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_reassembly_script_t1" \
    "disassembly_and_reassembly_t1.bash" \
    "reassembly.bash" \
    "7c68b844-dce7-46f7-a5b0-03a230708ae7" \
    "$SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL"

#--------------------------------------------------------------------------
SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL="f"
func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_testdata_unique_strings_one_per_line_t1" \
    "test_data_in_public_domain_unique_strings_one_per_line_t1.txt" \
    "unique_strings_one_per_line.txt" \
    "0f60c611-ae25-436b-a1b0-03a230708ae7" \
    "$SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL"
#--------------------------------------------------------------------------
S_TMP_0="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/lib/mmmv_utilities"
FP_MMMV_PROCESS_EDITOR_BASH="$S_TMP_0/mmmv_process_editor/src/mmmv_process_editor.bash "
if [ "$SB_RUBY_EXISTS_ON_PATH" == "t" ]; then
    alias mmmv_text_processing_lstop_t1="$S_FP_NICE -n 6 ruby $MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/lib/mmmv_text_processing_lstop_t1/mmmv_text_processing_lstop_t1.rb "
    alias mmmv_process_editor="$S_FP_NICE -n 6 bash $FP_MMMV_PROCESS_EDITOR_BASH "
fi
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
        "a12e4891-da7c-4a68-81b0-03a230708ae7"

    func_mmmv_userspace_distro_t1_declare_alias_cd_t1 \
        "mmmv_go_common_bashrc_subparts_general" \
        "$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/common_bashrc/subparts/general" \
        "36f0f603-49a0-4b92-b3b0-03a230708ae7"
else
    func_mmmv_verify_sb_t_f_but_do_not_exit_t1 \
        "$SB_USERNAME_IS_mmmv" \
        "ec2d8dc5-4d6d-4b65-8390-03a230708ae7"
fi
#--------------------------------------------------------------------------
func_mmmv_userspace_distro_t1_declare_alias_cd_t1 \
    "mmmv_go_mmmv_userspace_distro_t1_mmmv" \
    "$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv" \
    "6bf4ee42-688a-45f6-9180-03a230708ae7"
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
if [ "$SB_RUBY_EXISTS_ON_PATH" == "t" ]; then
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
            echo "GUID=='5175b049-99c1-488a-a2c0-03a230708ae7'"
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
    "$S_FP_1a" "33097405-78e9-425e-a580-03a230708ae7" \
    "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
    func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
        "$S_FP_2a" "537ad6ff-5fb8-4d08-8380-03a230708ae7" \
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
        "1776b301-6871-4608-9670-03a230708ae7" \
        "$SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        S_TMP_0="/sdcard/Download"
        func_mmmv_userspace_distro_t1_declare_alias_cd_t1 \
            "mmmv_go_Download" "$S_TMP_0" \
            "ed5ff949-cc56-4fea-8470-03a230708ae7" \
            "$SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING"
        S_TMP_0="/sdcard/download"
        func_mmmv_userspace_distro_t1_declare_alias_cd_t1 \
            "mmmv_go_download" "$S_TMP_0" \
            "3bd97f25-e30e-4215-a170-03a230708ae7" \
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
        "$FP_MMMV" "0d8ffd12-16b0-4900-a160-03a230708ae7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
fi
#--------------------------------------------------------------------------
if [ ! -e "$FP_MMMV_BASHRC" ]; then
    mkdir -p $FP_MMMV_BASHRC
    func_mmmv_wait_and_sync_t1
    func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
        "$FP_MMMV_BASHRC" "a2bd5137-8654-40e5-ac60-03a230708ae7" \
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
            "584242f5-19c8-4351-8450-03a230708ae7" \
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
                    "e1d62835-5598-422a-b550-03a230708ae7" \
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
    alias mmmv_ls_ps_t1=" ps -ef "
    alias mmmv_ls_ps_t1_grep=" ps -ef | grep " # <grep parameters, including the process name, come here>
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
                        alias mmmv_admin_set_default_image_viewer_eog="xdg-mime default $S_FP_1 image/jpeg ; xdg-mime default $S_FP_1 image/pjpeg ; xdg-mime default $S_FP_1 image/bmp ; xdg-mime default $S_FP_1 image/gif ; xdg-mime default $S_FP_1 image/png "
                    fi
                fi
            fi
            #--------------------------------------------------------------
            if [ "$SB_FEH_EXISTS_ON_PATH" == "t" ]; then
                S_FP_1="feh.desktop"
                S_FP_2="$S_FP_0$S_FP_1"
                if [ -e "$S_FP_2" ]; then
                    if [ ! -d "$S_FP_2" ]; then
                        alias mmmv_admin_set_default_image_viewer_feh="xdg-mime default $S_FP_1 image/jpeg ; xdg-mime default $S_FP_1 image/pjpeg ; xdg-mime default $S_FP_1 image/bmp ; xdg-mime default $S_FP_1 image/gif ; xdg-mime default $S_FP_1 image/png "
                    fi
                fi
            fi
            #--------------------------------------------------------------
            if [ "$SB_GEEQIE_EXISTS_ON_PATH" == "t" ]; then
                S_FP_1="geeqie.desktop"
                S_FP_2="$S_FP_0$S_FP_1"
                if [ -e "$S_FP_2" ]; then
                    if [ ! -d "$S_FP_2" ]; then
                        alias mmmv_admin_set_default_image_viewer_Geeqie="xdg-mime default $S_FP_1 image/jpeg ; xdg-mime default $S_FP_1 image/pjpeg ; xdg-mime default $S_FP_1 image/bmp ; xdg-mime default $S_FP_1 image/gif ; xdg-mime default $S_FP_1 image/png "
                    fi
                fi
            fi
            #--------------------------------------------------------------
            if [ "$SB_GTHUMB_EXISTS_ON_PATH" == "t" ]; then
                S_FP_1="org.gnome.gThumb.desktop"
                S_FP_2="$S_FP_0$S_FP_1"
                if [ -e "$S_FP_2" ]; then
                    if [ ! -d "$S_FP_2" ]; then
                        alias mmmv_admin_set_default_image_viewer_gThumb="xdg-mime default $S_FP_1 image/jpeg ; xdg-mime default $S_FP_1 image/pjpeg ; xdg-mime default $S_FP_1 image/bmp ; xdg-mime default $S_FP_1 image/gif ; xdg-mime default $S_FP_1 image/png "
                    fi
                fi
            fi
            #--------------------------------------------------------------
            if [ "$SB_GWENVIEW_EXISTS_ON_PATH" == "t" ]; then
                S_FP_1="org.kde.gwenview.desktop"
                S_FP_2="$S_FP_0$S_FP_1"
                if [ -e "$S_FP_2" ]; then
                    if [ ! -d "$S_FP_2" ]; then
                        alias mmmv_admin_set_default_image_viewer_Gwenview="xdg-mime default $S_FP_1 image/jpeg ; xdg-mime default $S_FP_1 image/pjpeg ; xdg-mime default $S_FP_1 image/bmp ; xdg-mime default $S_FP_1 image/gif ; xdg-mime default $S_FP_1 image/png "
                    fi
                fi
            fi
            #--------------------------------------------------------------
            if [ "$SB_RISTRETTO_EXISTS_ON_PATH" == "t" ]; then
                S_FP_1="org.xfce.ristretto.desktop"
                S_FP_2="$S_FP_0$S_FP_1"
                if [ -e "$S_FP_2" ]; then
                    if [ ! -d "$S_FP_2" ]; then
                        alias mmmv_admin_set_default_image_viewer_ristretto="xdg-mime default $S_FP_1 image/jpeg ; xdg-mime default $S_FP_1 image/pjpeg ; xdg-mime default $S_FP_1 image/bmp ; xdg-mime default $S_FP_1 image/gif ; xdg-mime default $S_FP_1 image/png "
                    fi
                fi
            fi
            #--------------------------------------------------------------
            if [ "$SB_VIEWNIOR_EXISTS_ON_PATH" == "t" ]; then
                S_FP_1="viewnior.desktop"
                S_FP_2="$S_FP_0$S_FP_1"
                if [ -e "$S_FP_2" ]; then
                    if [ ! -d "$S_FP_2" ]; then
                        alias mmmv_admin_set_default_image_viewer_Viewnior="xdg-mime default $S_FP_1 image/jpeg ; xdg-mime default $S_FP_1 image/pjpeg ; xdg-mime default $S_FP_1 image/bmp ; xdg-mime default $S_FP_1 image/gif ; xdg-mime default $S_FP_1 image/png "
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
                        echo "GUID=='1c477d24-efd7-49fb-92c0-03a230708ae7'"
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
                    #--------
                    # chromium --headless --disable-gpu --dump-dom https://example.com > ./javasdcriptgenerated.html
                    alias mmmv_JavaScript_generated_HTML_2_stdout_Chromium_RAM_1GiB_CPU_100percent_t1="$S_TMP_0 --headless --disable-gpu --dump-dom "
                    #------------------------------------------------------
                    S_TMP_0="$S_CMD_SYSTEMDRUN -p MemoryLimit=2048M -p CPUQuota=100% $S_CMD_NICE_WEBBROWSER $S_FP_CHROMIUM "
                    alias mmmv_run_Chromium_with_Linux_kernel_based_limits_enforcement_RAM_2GiB_CPU_100percent="$S_TMP_0"
                    alias mmmv_run_webbrowser_Chromium_with_Linux_kernel_based_limits_enforcement_RAM_2GiB_CPU_100percent="$S_TMP_0"
                    alias mmmv_webbrowser_Chromium_with_Linux_kernel_based_limits_enforcement_RAM_2GiB_CPU_100percent="$S_TMP_0"
                    #--------
                    # chromium --headless --disable-gpu --dump-dom https://example.com > ./javasdcriptgenerated.html
                    alias mmmv_JavaScript_generated_HTML_2_stdout_Chromium_RAM_2GiB_CPU_100percent="$S_TMP_0 --headless --disable-gpu --dump-dom "
                    #------------------------------------------------------
                    S_TMP_0="$S_CMD_SYSTEMDRUN -p MemoryLimit=6144M -p CPUQuota=200% $S_CMD_NICE_WEBBROWSER $S_FP_CHROMIUM "
                    alias mmmv_run_Chromium_with_Linux_kernel_based_limits_enforcement_RAM_6GiB_CPU_200percent="$S_TMP_0"
                    alias mmmv_run_webbrowser_Chromium_with_Linux_kernel_based_limits_enforcement_RAM_6GiB_CPU_200percent="$S_TMP_0"
                    alias mmmv_webbrowser_Chromium_with_Linux_kernel_based_limits_enforcement_RAM_6GiB_CPU_200percent="$S_TMP_0"
                    #--------
                    # chromium --headless --disable-gpu --dump-dom https://example.com > ./javasdcriptgenerated.html
                    alias mmmv_JavaScript_generated_HTML_2_stdout_Chromium_RAM_6GiB_CPU_200percent="$S_TMP_0 --headless --disable-gpu --dump-dom "
                    #------------------------------------------------------
                    S_TMP_0="$S_CMD_SYSTEMDRUN -p MemoryLimit=8192M -p CPUQuota=300% $S_CMD_NICE_WEBBROWSER $S_FP_CHROMIUM "
                    alias mmmv_run_Chromium_with_Linux_kernel_based_limits_enforcement_RAM_8GiB_CPU_300percent="$S_TMP_0"
                    alias mmmv_run_webbrowser_Chromium_with_Linux_kernel_based_limits_enforcement_RAM_8GiB_CPU_300percent="$S_TMP_0"
                    alias mmmv_webbrowser_Chromium_with_Linux_kernel_based_limits_enforcement_RAM_8GiB_CPU_300percent="$S_TMP_0"
                    #--------
                    # chromium --headless --disable-gpu --dump-dom https://example.com > ./javasdcriptgenerated.html
                    alias mmmv_JavaScript_generated_HTML_2_stdout_Chromium_RAM_8GiB_CPU_300percent="$S_TMP_0 --headless --disable-gpu --dump-dom "
                    #------------------------------------------------------
                else
                    if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                        echo ""
                        echo "A mmmv_userspace_distro_t1 related "
                        echo -e "\e[31msubpart of the ~/.bashrc is probably flawed\e[39m."
                        echo "At this point the S_FP_CHROMIUM should not "
                        echo "have the value of an empty string."
                        echo "GUID=='2f231791-d66c-4d73-83c0-03a230708ae7'"
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
                        echo "GUID=='21819001-13f0-4eeb-b1c0-03a230708ae7'"
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
                        echo "GUID=='0bfa034b-4294-4365-b2c0-03a230708ae7'"
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
                        echo "GUID=='13af46c4-3f38-4383-94c0-03a230708ae7'"
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
                        echo "GUID=='3bf6c528-c668-4a3d-b1c0-03a230708ae7'"
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
                        echo "GUID=='20e0c64d-e04d-44d8-92c0-03a230708ae7'"
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
                "$S_FP_0" "4f8b792c-369a-47fe-a350-03a230708ae7" \
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
            "$S_FP_0" "32daf445-67b0-4aa4-8850-03a230708ae7" \
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
                                            "475361a6-9598-46c3-8340-03a230708ae7" \
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
                                                "10625253-e928-4de8-b140-03a230708ae7" \
                                                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
                                            if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
                                                S_FP_1="$S_FP_2"
                                            fi
                                        fi
                                        #----------------------------------
                                    fi
                                    #--------------------------------------
                                    # flatpak --user --filesystem=$HOME/tmp_ run  foo.something.bar # starts the installed program
                                    #--------
                                    alias mmmv_run_flatpak="mmmv_polish_ABC_2_ACB_t2_C_is_optional_exec_bash.rb \"S_PROGRAMNAME=\\\"\"  \"\\\" ; if [ \\\"\\\$S_PROGRAMNAME\\\" != \\\"\\\" ]; then S_1=\\\"\\\" ; if [ \\\"\\\`printf \\\"\\\$S_PROGRAMNAME\\\" | grep -E '[.]' \\\`\\\" != \\\"\\\" ]; then S_1=\\\"\\\$S_PROGRAMNAME\\\" ; else S_1=\\\"\\\`$S_CMD_FLATPAK_USER list | $S_CMD_GNU_SED -e 's/[.][[:blank:]]/ /g' | $S_CMD_GNU_SED -s 's/^[^.]\\\\+[[:blank:]]/ /g' | $S_CMD_GNU_SED -e 's/^[[:blank:]]//g' | $S_CMD_GNU_SED -e 's/[[:blank:]].\\\\+\\\$//g' | grep \\\"\\\$S_PROGRAMNAME\\\" \\\`\\\" ; fi ; $S_CMD_FLATPAK_USER  --filesystem=$S_FP_1 run \\\$S_1 ;       else echo \\\"\\\" ; echo -e \\\"\\\\e[31mProgram name missing. \\\\e[39m\\\" ; echo -e \\\"Program names MIGHT be listed by executing\\\" ; echo -e \\\"    \\\\\\\"flatpak --user list \\\\\\\".\\\" ; echo -e \\\"GUID=='e0253815-1ac6-4a46-b4c0-03a230708ae7'\\\" ; echo \\\"\\\" ; fi \" "
                                    #--------------------------------------
                                    S_FP_0="$HOME/.local/share/flatpak/app/com.zettlr.Zettlr"
                                    if [ -e "$S_FP_0" ]; then
                                        if [ -d "$S_FP_0" ]; then
                                            if [ ! -h "$S_FP_0" ]; then
                                                S_TMP_0="Zettlr"
                                                alias mmmv_run_Markdown_editor_Zettlr_flatpak_t1="mmmv_polish_ABC_2_ACB_t2_C_is_optional_exec_bash.rb \"S_FP_MARKDOWNFILE=\\\"\"    \"\\\"; S_PROGRAMNAME=\\\"$S_TMP_0\\\" ; if [ \\\"\\\$S_PROGRAMNAME\\\" != \\\"\\\" ]; then S_1=\\\"\\\" ; if [ \\\"\\\`printf \\\"\\\$S_PROGRAMNAME\\\" | grep -E '[.]' \\\`\\\" != \\\"\\\" ]; then S_1=\\\"\\\$S_PROGRAMNAME\\\" ; else S_1=\\\"\\\`$S_CMD_FLATPAK_USER list | $S_CMD_GNU_SED -e 's/[.][[:blank:]]/ /g' | $S_CMD_GNU_SED -s 's/^[^.]\\\\+[[:blank:]]/ /g' | $S_CMD_GNU_SED -e 's/^[[:blank:]]//g' | $S_CMD_GNU_SED -e 's/[[:blank:]].\\\\+\\\$//g' | grep \\\"\\\$S_PROGRAMNAME\\\" \\\`\\\" ; fi ; $S_CMD_FLATPAK_USER  --filesystem=\$S_FP_1 run \\\$S_1  \\\$S_FP_MARKDOWNFILE ;       else echo \\\"\\\" ; echo -e \\\"\\\\e[31mProgram name missing. \\\\e[39m\\\" ; echo -e \\\"Program names MIGHT be listed by executing\\\" ; echo -e \\\"    \\\\\\\"flatpak --user list \\\\\\\".\\\" ; echo -e \\\"GUID=='99161548-b01f-4d74-92b0-03a230708ae7'\\\" ; echo \\\"\\\" ; fi \" "
                                            fi
                                        fi
                                    fi
                                    #--------------------------------------
                                    S_FP_0="$HOME/.local/share/flatpak/app/io.github.nokse22.asciidraw"
                                    if [ -e "$S_FP_0" ]; then
                                        if [ -d "$S_FP_0" ]; then
                                            if [ ! -h "$S_FP_0" ]; then
                                                S_TMP_0="asciidraw"
                                                alias mmmv_texteditor_ASCIIDraw_flatpak_t1="mmmv_polish_ABC_2_ACB_t2_C_is_optional_exec_bash.rb \"S_FP_TEXTFILE=\\\"\"    \"\\\"; S_PROGRAMNAME=\\\"$S_TMP_0\\\" ; if [ \\\"\\\$S_PROGRAMNAME\\\" != \\\"\\\" ]; then S_1=\\\"\\\" ; if [ \\\"\\\`printf \\\"\\\$S_PROGRAMNAME\\\" | grep -E '[.]' \\\`\\\" != \\\"\\\" ]; then S_1=\\\"\\\$S_PROGRAMNAME\\\" ; else S_1=\\\"\\\`$S_CMD_FLATPAK_USER list | $S_CMD_GNU_SED -e 's/[.][[:blank:]]/ /g' | $S_CMD_GNU_SED -s 's/^[^.]\\\\+[[:blank:]]/ /g' | $S_CMD_GNU_SED -e 's/^[[:blank:]]//g' | $S_CMD_GNU_SED -e 's/[[:blank:]].\\\\+\\\$//g' | grep \\\"\\\$S_PROGRAMNAME\\\" \\\`\\\" ; fi ; $S_CMD_FLATPAK_USER  --filesystem=\$S_FP_1 run \\\$S_1  \\\$S_FP_TEXTFILE ;       else echo \\\"\\\" ; echo -e \\\"\\\\e[31mProgram name missing. \\\\e[39m\\\" ; echo -e \\\"Program names MIGHT be listed by executing\\\" ; echo -e \\\"    \\\\\\\"flatpak --user list \\\\\\\".\\\" ; echo -e \\\"GUID=='f57f0750-934b-4ff6-94b0-03a230708ae7'\\\" ; echo \\\"\\\" ; fi \" "
                                            fi
                                        fi
                                    fi
                                    #--------------------------------------
                                    S_FP_0="$HOME/.local/share/flatpak/app/de.haeckerfelix.Shortwave"
                                    if [ -e "$S_FP_0" ]; then
                                        if [ -d "$S_FP_0" ]; then
                                            if [ ! -h "$S_FP_0" ]; then
                                                S_TMP_0="Shortwave"
                                                alias mmmv_internetradio_Shortwave_flatpak_t1="mmmv_polish_ABC_2_ACB_t2_C_is_optional_exec_bash.rb \"S_FP_TEXTFILE=\\\"\"    \"\\\"; S_PROGRAMNAME=\\\"$S_TMP_0\\\" ; if [ \\\"\\\$S_PROGRAMNAME\\\" != \\\"\\\" ]; then S_1=\\\"\\\" ; if [ \\\"\\\`printf \\\"\\\$S_PROGRAMNAME\\\" | grep -E '[.]' \\\`\\\" != \\\"\\\" ]; then S_1=\\\"\\\$S_PROGRAMNAME\\\" ; else S_1=\\\"\\\`$S_CMD_FLATPAK_USER list | $S_CMD_GNU_SED -e 's/[.][[:blank:]]/ /g' | $S_CMD_GNU_SED -s 's/^[^.]\\\\+[[:blank:]]/ /g' | $S_CMD_GNU_SED -e 's/^[[:blank:]]//g' | $S_CMD_GNU_SED -e 's/[[:blank:]].\\\\+\\\$//g' | grep \\\"\\\$S_PROGRAMNAME\\\" \\\`\\\" ; fi ; $S_CMD_FLATPAK_USER  --filesystem=\$S_FP_1 run \\\$S_1  \\\$S_FP_TEXTFILE ;       else echo \\\"\\\" ; echo -e \\\"\\\\e[31mProgram name missing. \\\\e[39m\\\" ; echo -e \\\"Program names MIGHT be listed by executing\\\" ; echo -e \\\"    \\\\\\\"flatpak --user list \\\\\\\".\\\" ; echo -e \\\"GUID=='423d6505-fa26-4d81-b3b0-03a230708ae7'\\\" ; echo \\\"\\\" ; fi \" "
                                            fi
                                        fi
                                    fi
                                    #--------------------------------------
                                    S_FP_0="$HOME/.local/share/flatpak/app/me.iepure.devtoolbox"
                                    if [ -e "$S_FP_0" ]; then
                                        if [ -d "$S_FP_0" ]; then
                                            if [ ! -h "$S_FP_0" ]; then
                                                S_TMP_0="devtoolbox"
                                                alias mmmv_run_DevToolbox_flatpak_t1="mmmv_polish_ABC_2_ACB_t2_C_is_optional_exec_bash.rb \"S_FP_TEXTFILE=\\\"\"    \"\\\"; S_PROGRAMNAME=\\\"$S_TMP_0\\\" ; if [ \\\"\\\$S_PROGRAMNAME\\\" != \\\"\\\" ]; then S_1=\\\"\\\" ; if [ \\\"\\\`printf \\\"\\\$S_PROGRAMNAME\\\" | grep -E '[.]' \\\`\\\" != \\\"\\\" ]; then S_1=\\\"\\\$S_PROGRAMNAME\\\" ; else S_1=\\\"\\\`$S_CMD_FLATPAK_USER list | $S_CMD_GNU_SED -e 's/[.][[:blank:]]/ /g' | $S_CMD_GNU_SED -s 's/^[^.]\\\\+[[:blank:]]/ /g' | $S_CMD_GNU_SED -e 's/^[[:blank:]]//g' | $S_CMD_GNU_SED -e 's/[[:blank:]].\\\\+\\\$//g' | grep \\\"\\\$S_PROGRAMNAME\\\" \\\`\\\" ; fi ; $S_CMD_FLATPAK_USER  --filesystem=\$S_FP_1 run \\\$S_1  \\\$S_FP_TEXTFILE ;       else echo \\\"\\\" ; echo -e \\\"\\\\e[31mProgram name missing. \\\\e[39m\\\" ; echo -e \\\"Program names MIGHT be listed by executing\\\" ; echo -e \\\"    \\\\\\\"flatpak --user list \\\\\\\".\\\" ; echo -e \\\"GUID=='09a35235-f2a0-4709-92b0-03a230708ae7'\\\" ; echo \\\"\\\" ; fi \" "
                                            fi
                                        fi
                                    fi
                                    #--------------------------------------
                                else
                                    #--------------------------------------
                                    if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                                        echo ""
                                        echo -e "\e[31mgsed is missing from PATH\e[39m."
                                        echo "GUID=='903e1e59-9f34-4221-91b0-03a230708ae7'"
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
                                echo "GUID=='5230bd19-f9ca-4799-b2b0-03a230708ae7'"
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
#                         echo -e "GUID=='18e3aa3a-9764-4ed5-a5b0-03a230708ae7'" ;
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
#                     echo -e "GUID=='a936b157-bf48-4d94-93b0-03a230708ae7'" ;
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
#                 echo -e "GUID=='53d4378a-4147-45f1-8390-03a230708ae7'" ;
#             fi ;
#         else
#             if [ -h $S_FP_0 ]; then
#                 echo -e "The origin " ;
#                 echo -e "" ;
#                 echo -e "    $S_FP_0" ;
#                 echo -e "" ;
#                 echo -e "\e[31mis a broken symlink\e[39m." ;
#                 echo -e "GUID=='16175dad-cb75-4e2b-8380-03a230708ae7'" ;
#             else
#                 echo -e "The origin " ;
#                 echo -e "" ;
#                 echo -e "    $S_FP_0" ;
#                 echo -e "" ;
#                 echo -e "\e[31mdoes not exist\e[39m." ;
#                 echo -e "GUID=='d8deff45-3a5d-43bb-b180-03a230708ae7'" ;
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
#         echo -e "GUID=='b48a9311-065b-48f8-9370-03a230708ae7'" ;
#     fi ;
# else
#     if [ -h $S_FP_DESTINATION_FOLDER ]; then
#         echo -e "The destination " ;
#         echo -e "" ;
#         echo -e "    $S_FP_DESTINATION_FOLDER" ;
#         echo -e "" ;
#         echo -e "\e[31mis a broken symlink\e[39m." ;
#         echo -e "GUID=='cc50215c-b718-46c9-9370-03a230708ae7'" ;
#     else
#         echo -e "The destination " ;
#         echo -e "" ;
#         echo -e "    $S_FP_DESTINATION_FOLDER" ;
#         echo -e "" ;
#         echo -e "\e[31mdoes not exist\e[39m." ;
#         echo -e "GUID=='4d662012-d8b8-44dc-a370-03a230708ae7'" ;
#     fi ;
# fi ;
#
if [ "$SB_RUBY_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_PRINTF_EXISTS_ON_PATH" == "t" ]; then
        # The "$S_0" at the "S_FP_DESTINATION_FOLDER=...." needs
        # to be taken from the environment during the runtime of
        # the alias.  The "$S_0" can be assigned a value of <pwd>
        # by executing a Bash alias named "mmmv_pwd_2_S_0".  Even
        # better option might be to use the Midnight Commander,
        # "mc", in stead of this Bash alias here.
        alias mmmv_cp_2_S_0="mmmv_polish_ABC_2_ACB_exec_t1  \"S_FP_0=\\\"\"   \"\\\" ; S_FP_DESTINATION_FOLDER=\\\"\$S_0\\\" ; if [ -e \\\$S_FP_DESTINATION_FOLDER ]; then if [ -d \\\$S_FP_DESTINATION_FOLDER ]; then if [ -e \\\$S_FP_0 ]; then if [ ! -d \\\$S_FP_0 ]; then if [ ! -h \\\$S_FP_0 ]; then nice -n 4 cp \\\"\\\$S_FP_0\\\"  \\\"\\\$S_FP_DESTINATION_FOLDER/\\\" ; if [ \\\"\\\$?\\\" != \\\"0\\\" ]; then echo -e \\\"\\\\e[31mCopying failed\\\\e[39m.\\\" ; echo -e \\\"GUID=='5f8d4517-2132-450f-8560-03a230708ae7'\\\" ; else printf \\\"Copying .. \\\" ; wait ; sync ; wait ; echo -e \\\"\\\\e[32msucceeded\\\\e[39m.\\\" ; fi ; else echo -e \\\"The origin \\\" ; echo -e \\\"\\\" ; echo -e \\\"    \\\$S_FP_0\\\" ; echo -e \\\"\\\" ; echo -e \\\"\\\\e[31mis a symlink to a file\\\\e[39m, but\\\" ; echo -e \\\"a file is expected.\\\" ; echo -e \\\"GUID=='d74fa829-6740-468c-9560-03a230708ae7'\\\" ; fi ; else if [ -h \\\$S_FP_0 ]; then echo -e \\\"The origin \\\" ; echo -e \\\"\\\" ; echo -e \\\"    \\\$S_FP_0\\\" ; echo -e \\\"\\\" ; echo -e \\\"\\\\e[31mis a symlink to a folder\\\\e[39m, but\\\" ; else echo -e \\\"The origin \\\" ; echo -e \\\"\\\" ; echo -e \\\"    \\\$S_FP_0\\\" ; echo -e \\\"\\\" ; echo -e \\\"\\\\e[31mis a folder\\\\e[39m, but\\\" ; fi ; echo -e \\\"a file is expected.\\\" ; echo -e \\\"GUID=='50827855-e964-479c-b860-03a230708ae7'\\\" ; fi ; else if [ -h \\\$S_FP_0 ]; then echo -e \\\"The origin \\\" ; echo -e \\\"\\\" ; echo -e \\\"    \\\$S_FP_0\\\" ; echo -e \\\"\\\" ; echo -e \\\"\\\\e[31mis a broken symlink\\\\e[39m.\\\" ; echo -e \\\"GUID=='8283b93b-69b2-457c-b550-03a230708ae7'\\\" ; else echo -e \\\"The origin \\\" ; echo -e \\\"\\\" ; echo -e \\\"    \\\$S_FP_0\\\" ; echo -e \\\"\\\" ; echo -e \\\"\\\\e[31mdoes not exist\\\\e[39m.\\\" ; echo -e \\\"GUID=='093c1d18-3c54-40e6-8550-03a230708ae7'\\\" ; fi ; fi ; else if [ -h \\\$S_FP_DESTINATION_FOLDER ]; then echo -e \\\"The destination \\\" ; echo -e \\\"\\\" ; echo -e \\\"    \\\$S_FP_DESTINATION_FOLDER\\\" ; echo -e \\\"\\\" ; echo -e \\\"\\\\e[31mis a symlink to a file\\\\e[39m, but\\\" ; else echo -e \\\"The destination \\\" ; echo -e \\\"\\\" ; echo -e \\\"    \\\$S_FP_DESTINATION_FOLDER\\\" ; echo -e \\\"\\\" ; echo -e \\\"\\\\e[31mis a file\\\\e[39m, but\\\" ; fi ; echo -e \\\"a folder or a symlink to a folder is expected.\\\" ; echo -e \\\"GUID=='df8de035-6690-449e-a650-03a230708ae7'\\\" ; fi ; else if [ -h \\\$S_FP_DESTINATION_FOLDER ]; then echo -e \\\"The destination \\\" ; echo -e \\\"\\\" ; echo -e \\\"    \\\$S_FP_DESTINATION_FOLDER\\\" ; echo -e \\\"\\\" ; echo -e \\\"\\\\e[31mis a broken symlink\\\\e[39m.\\\" ; echo -e \\\"GUID=='6bb0331b-f233-4fd8-b540-03a230708ae7'\\\" ; else echo -e \\\"The destination \\\" ; echo -e \\\"\\\" ; echo -e \\\"    \\\$S_FP_DESTINATION_FOLDER\\\" ; echo -e \\\"\\\" ; echo -e \\\"\\\\e[31mdoes not exist\\\\e[39m.\\\" ; echo -e \\\"GUID=='1d269285-e2a5-4bc2-af40-03a230708ae7'\\\" ; fi ; fi ; \" "
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
    # Testline:
    #     ps -eo pid,comm,args --no-header
    # and Thank You to some AI-powered chatbot for that
    # testline and for part of the BSD version further down below.
    alias mmmv_ls_ps_t2_pid_cmdandargs="ps -eo pid,args --no-header "
else
    if [ "$SB_OPERATINGSYSTEM_BSD" == "t" ]; then
        if [ "$SB_SED_OR_GSED_EXISTS_ON_PATH" == "t" ]; then
            alias mmmv_ls_ps_t2_pid_cmdandargs="ps auxww | $S_CMD_GNU_SED -e 's/^[^[:blank:]]\\+//g' | $S_CMD_GNU_SED -e 's/^[[:blank:]]\\+//g' | $S_CMD_GNU_SED -e 's/\\([[:blank:]]\\+[^[:blank:]]\\+\\)\\{8\\}//' | $S_CMD_GNU_SED -e '/PIDX COMMAND/d' "
        fi
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_AG_EXISTS_ON_PATH" == "t" ]; then
    alias mmmv_ag_t1_regex_path="$S_FP_NICE -n 2 ag  --workers 2 --depth \"-1\"  --follow  --ignore-case  --nomultiline  --numbers --workers 2 -B 0 -A 0 --group "
    alias mmmv_ag_t2_fnregex_regex_path="$S_FP_NICE -n 2 ag  --workers 2 --depth \"-1\"  --follow  --ignore-case  --nomultiline  --numbers --workers 2 -B 0 -A 0 --group  -G "
fi
#--------------------------------------------------------------------------
# The Alias script:
#!/usr/bin/env bash
# # S_FP_MAKEFILE="`pwd`/Makefile" ;
# # if [ -e "$S_FP_MAKEFILE" ]; then
# #     echo "" ;
# #     echo -e "\e[31mMakefile already exists\e[39m at path " ;
# #     echo "" ;
# #     echo "    $S_FP_MAKEFILE" ;
# #     echo "" ;
# #     echo "Not doing anything." ;
# #     echo "GUID=='3fdd5573-d797-4836-a240-03a230708ae7'" ;
# #     echo "" ;
# # else
# #     echo "" > ./Makefile ;
# #     nice -n 5 makedepend *.c 2> /dev/null ;
# #     wait ; sync ; wait ;
# #     cat ./Makefile | grep -E '^[^ ]+: ' | sed -e 's/[:]/ /g' | sed -e 's/^/ /g' | sed -e 's/$/ /g' | sed -e 's/ [\/]usr[\/][^ ]\+/ /g' | sed -e 's/[ ]\+/ /g' | sed -e 's/ \+$//g' | sed -e 's/^[ ]\+//g' | grep ' ' | sed -e 's/\([^ ]\+\)/"\1"/g' | sed -e 's/[ ]/ -> /g' | sed -e 's/^/    /g' | sed -e '1{s/^/digraph dependence_graph{\n/g}' | sed -e '${s/$/\n\}/g}'
# # fi
#::::::::
if [ "$SB_MAKEDEPEND_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_GREP_EXISTS_ON_PATH" == "t" ]; then
        if [ "$SB_SED_EXISTS_ON_PATH" == "t" ]; then
            if [ "$SB_CAT_EXISTS_ON_PATH" == "t" ]; then
                alias mmmv_run_makedepend_dot_t1=" S_FP_MAKEFILE=\"\`pwd\`/Makefile\" ; if [ -e \"\$S_FP_MAKEFILE\" ]; then echo \"\" ; echo -e \"\\e[31mMakefile already exists\\e[39m at path \" ; echo \"\" ; echo \"    \$S_FP_MAKEFILE\" ; echo \"\" ; echo \"Not doing anything.\" ; echo \"GUID=='ae024c4e-2e05-4a1b-b130-03a230708ae7'\" ; echo \"\" ; else echo \"\" > ./Makefile ; $S_FP_NICE -n 5 makedepend *.c 2> /dev/null ; wait ; sync ; wait ; cat ./Makefile | grep -E '^[^ ]+: ' | $S_CMD_GNU_SED -e 's/[:]/ /g' | $S_CMD_GNU_SED -e 's/^/ /g' | $S_CMD_GNU_SED -e 's/\$/ /g' | $S_CMD_GNU_SED -e 's/ [\\/]usr[\\/][^ ]\\+/ /g' | $S_CMD_GNU_SED -e 's/[ ]\\+/ /g' | $S_CMD_GNU_SED -e 's/ \\+\$//g' | $S_CMD_GNU_SED -e 's/^[ ]\\+//g' | grep ' ' | $S_CMD_GNU_SED -e 's/\\([^ ]\\+\\)/\"\\1\"/g' | $S_CMD_GNU_SED -e 's/[ ]/ -> /g' | $S_CMD_GNU_SED -e 's/^/    /g' | $S_CMD_GNU_SED -e '1{s/^/digraph dependence_graph{\\n/g}' | $S_CMD_GNU_SED -e '\${s/\$/\\n\\}/g}' ; fi "
            fi
        fi
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_TR_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_RUBY_EXISTS_ON_PATH" == "t" ]; then # Halve-overkill here, but
        if [ "$SB_SED_EXISTS_ON_PATH" == "t" ]; then
            if [ "$SB_GREP_EXISTS_ON_PATH" == "t" ]; then
                if [ "$SB_CAT_EXISTS_ON_PATH" == "t" ]; then
                    # # Sample URL that was good enouhg for testing this alias in 2025_12:
                    #     wget https://ocw.mit.edu/courses/6-041sc-probabilistic-systems-analysis-and-applied-probability-fall-2013/download/
                    # sync ; wait ; sync ;
                    # S_FP="./index.html" ;
                    # if [ -e $S_FP ]; then
                    #     if [ ! -d $S_FP ]; then
                    #         cat $S_FP | tr -d '\n' | sed -e 's/[>]/>\n/g' | grep -i -E '[.](mpeg|mp2|wav|spx|mp3|mP4|webm|mov|ogg)' | sed -e 's/\([.]\([mM][pP][eE][gG]\|[mM][pP]2\|[wW][aA][vV]\|[sS][pP][xX]\|[mM][pP]3\|[mM][pP]4\|[wW][eE][bB][mM]\|[mM][oO][vV]\|[oO][gG][gG]\)\).\+$/\1/g' | sed -e 's/^.\+\(href[[:blank:]]*[=][[:blank:]]*[^=]\+$\)/\1/g' | sed -e 's/^href[^h]\+h/h/g' | sed -e 's/^/wget  /g' | sed -e 's/$/ ; sync ; wait ; sync ; /g' ;
                    #     else
                    #         echo "" ;
                    #         echo "A folder with a path of " ;
                    #         echo "" ;
                    #         echo " $S_FP" ;
                    #         echo "" ;
                    #         echo -e "exists, but a\e[31m file is expected\e[39m." ;
                    #         echo "GUID=='580c5013-c179-4d14-8130-03a230708ae7'" ;
                    #         echo "" ;
                    #     fi
                    # else
                    #     echo "" ;
                    #     echo "A file with a path of " ;
                    #     echo "" ;
                    #     echo " $S_FP" ;
                    #     echo "" ;
                    #     echo -e "\e[31mdoes not exist\e[39m." ;
                    #     echo "GUID=='ffa53e32-023d-4053-9330-03a230708ae7'" ;
                    #     echo "" ;
                    # fi
                    alias mmmv_HTMLfile_2_video_and_audio_download_Bash_script_t1=" mmmv_polish_ABC_2_ACB_exec_t1 \"sync ; wait ; sync ; S_FP=\\\"\"  \"\\\" ; if [ -e \\\$S_FP ]; then if [ ! -d \\\$S_FP ]; then cat \\\$S_FP | tr -d '\\\\n' | $S_CMD_GNU_SED -e 's/[>]/>\\\\n/g' | grep -i -E '[.](mpeg|mp2|wav|spx|mp3|mP4|webm|mov|ogg)' | $S_CMD_GNU_SED -e 's/\\\\([.]\\\\([mM][pP][eE][gG]\\\\|[mM][pP]2\\\\|[wW][aA][vV]\\\\|[sS][pP][xX]\\\\|[mM][pP]3\\\\|[mM][pP]4\\\\|[wW][eE][bB][mM]\\\\|[mM][oO][vV]\\\\|[oO][gG][gG]\\\\)\\\\).\\\\+\\\$/\\\\1/g' | $S_CMD_GNU_SED -e 's/^.\\\\+\\\\(href[[:blank:]]*[=][[:blank:]]*[^=]\\\\+\\\$\\\\)/\\\\1/g' | $S_CMD_GNU_SED -e 's/^href[^h]\\\\+h/h/g' | $S_CMD_GNU_SED -e 's/^/wget  /g' | $S_CMD_GNU_SED -e 's/\\\$/ ; sync ; wait ; sync ; /g' ; else echo \\\"\\\" ; echo \\\"A folder with a path of \\\" ; echo \\\"\\\" ; echo \\\" \\\$S_FP\\\" ; echo \\\"\\\" ; echo -e \\\"exists, but a\\\\e[31m file is expected\\\\e[39m.\\\" ; echo \\\"GUID=='cd89f629-896f-4c04-8330-03a230708ae7'\\\" ; echo \\\"\\\" ; fi ; else echo \\\"\\\" ; echo \\\"A file with a path of \\\" ; echo \\\"\\\" ; echo \\\" \\\$S_FP\\\" ; echo \\\"\\\" ; echo -e \\\"\\\\e[31mdoes not exist\\\\e[39m.\\\" ; echo \\\"GUID=='fc1f7e54-2362-4c83-9330-03a230708ae7'\\\" ; echo \\\"\\\" ; fi \" "
                fi
            fi
        fi
    fi
fi
#--------------------------------------------------------------------------
S_FP="$HOME/.avfs"
if [ -e $S_FP ]; then
    if [ -d $S_FP ]; then
        #------------------------------------------------------------------
        # S_TMP_MMMV_USERSPACE_DISTRO_T1_ALIAS_CDAVFS_01_AVFS="$HOME/.avfs" ;
        # if [ -e $S_TMP_MMMV_USERSPACE_DISTRO_T1_ALIAS_CDAVFS_01_AVFS ]; then
        #     if [ -d $S_TMP_MMMV_USERSPACE_DISTRO_T1_ALIAS_CDAVFS_01_AVFS ]; then
        #         S_TMP_MMMV_USERSPACE_DISTRO_T1_ALIAS_CDAVFS_02_PWD="`pwd`" ;
        #         cd $S_TMP_MMMV_USERSPACE_DISTRO_T1_ALIAS_CDAVFS_01_AVFS/$S_TMP_MMMV_USERSPACE_DISTRO_T1_ALIAS_CDAVFS_02_PWD ;
        #     else
        #         echo "" ;
        #         echo "The path " ;
        #         echo "" ;
        #         echo "    $S_TMP_MMMV_USERSPACE_DISTRO_T1_ALIAS_CDAVFS_01_AVFS" ;
        #         echo "" ;
        #         if [ -h $S_TMP_MMMV_USERSPACE_DISTRO_T1_ALIAS_CDAVFS_01_AVFS ]; then
        #             echo -e "references a symlink to a file, but a\e[31m folder is expected\e[39m." ;
        #         else
        #             echo -e "references a file, but a\e[31m folder is expected\e[39m." ;
        #         fi ;
        #         echo "GUID=='3f4a8e2b-84a0-4dd1-9420-03a230708ae7'" ;
        #         echo "" ;
        #     fi ;
        # else
        #     if [ -h $S_TMP_MMMV_USERSPACE_DISTRO_T1_ALIAS_CDAVFS_01_AVFS ]; then
        #         echo "" ;
        #         echo "The path " ;
        #         echo "" ;
        #         echo "    $S_TMP_MMMV_USERSPACE_DISTRO_T1_ALIAS_CDAVFS_01_AVFS" ;
        #         echo "" ;
        #         echo -e "references a broken symlink, but a\e[31m folder is expected\e[39m." ;
        #         echo "GUID=='2e34ef1a-94ad-4c6e-b120-03a230708ae7'" ;
        #         echo "" ;
        #     else
        #         echo "" ;
        #         echo "There is nothing at the path " ;
        #         echo "" ;
        #         echo "    $S_TMP_MMMV_USERSPACE_DISTRO_T1_ALIAS_CDAVFS_01_AVFS" ;
        #         echo "" ;
        #         echo -e "but a\e[31m folder is expected\e[39m." ;
        #         echo "GUID=='71548c22-3d18-4309-9520-03a230708ae7'" ;
        #         echo "" ;
        #     fi ;
        # fi
        #------------------------------------------------------------------
        # S_TMP_MMMV_USERSPACE_DISTRO_T1_ALIAS_CDAVFS_01_AVFS="$HOME/.avfs" ; if [ -e $S_TMP_MMMV_USERSPACE_DISTRO_T1_ALIAS_CDAVFS_01_AVFS ]; then if [ -d $S_TMP_MMMV_USERSPACE_DISTRO_T1_ALIAS_CDAVFS_01_AVFS ]; then S_TMP_MMMV_USERSPACE_DISTRO_T1_ALIAS_CDAVFS_02_PWD="`pwd`" ; cd $S_TMP_MMMV_USERSPACE_DISTRO_T1_ALIAS_CDAVFS_01_AVFS/$S_TMP_MMMV_USERSPACE_DISTRO_T1_ALIAS_CDAVFS_02_PWD ; else echo "" ; echo "The path " ; echo "" ; echo "    $S_TMP_MMMV_USERSPACE_DISTRO_T1_ALIAS_CDAVFS_01_AVFS" ; echo "" ; if [ -h $S_TMP_MMMV_USERSPACE_DISTRO_T1_ALIAS_CDAVFS_01_AVFS ]; then echo -e "references a symlink to a file, but a\e[31m folder is expected\e[39m." ; else echo -e "references a file, but a\e[31m folder is expected\e[39m." ; fi ; echo "GUID=='c43afc3f-2844-49b5-a220-03a230708ae7'" ; echo "" ; fi ; else if [ -h $S_TMP_MMMV_USERSPACE_DISTRO_T1_ALIAS_CDAVFS_01_AVFS ]; then echo "" ; echo "The path " ; echo "" ; echo "    $S_TMP_MMMV_USERSPACE_DISTRO_T1_ALIAS_CDAVFS_01_AVFS" ; echo "" ; echo -e "references a broken symlink, but a\e[31m folder is expected\e[39m." ; echo "GUID=='aca62c2b-0cbc-47ca-b110-03a230708ae7'" ; echo "" ; else echo "" ; echo "There is nothing at the path " ; echo "" ; echo "    $S_TMP_MMMV_USERSPACE_DISTRO_T1_ALIAS_CDAVFS_01_AVFS" ; echo "" ; echo -e "but a\e[31m folder is expected\e[39m." ; echo "GUID=='974b3512-9462-4d72-a110-03a230708ae7'" ; echo "" ; fi ; fi
        #------------------------------------------------------------------
        S_TMP_0="S_TMP_MMMV_USERSPACE_DISTRO_T1_ALIAS_CDAVFS_01_AVFS=\"$HOME/.avfs\" ; if [ -e \$S_TMP_MMMV_USERSPACE_DISTRO_T1_ALIAS_CDAVFS_01_AVFS ]; then if [ -d \$S_TMP_MMMV_USERSPACE_DISTRO_T1_ALIAS_CDAVFS_01_AVFS ]; then S_TMP_MMMV_USERSPACE_DISTRO_T1_ALIAS_CDAVFS_02_PWD=\"\`pwd\`\" ; cd \$S_TMP_MMMV_USERSPACE_DISTRO_T1_ALIAS_CDAVFS_01_AVFS/\$S_TMP_MMMV_USERSPACE_DISTRO_T1_ALIAS_CDAVFS_02_PWD ; else echo \"\" ; echo \"The path \" ; echo \"\" ; echo \"    \$S_TMP_MMMV_USERSPACE_DISTRO_T1_ALIAS_CDAVFS_01_AVFS\" ; echo \"\" ; if [ -h \$S_TMP_MMMV_USERSPACE_DISTRO_T1_ALIAS_CDAVFS_01_AVFS ]; then echo -e \"references a symlink to a file, but a\\e[31m folder is expected\\e[39m.\" ; else echo -e \"references a file, but a\\e[31m folder is expected\\e[39m.\" ; fi ; echo \"GUID=='c250c12f-62d1-48d8-b110-03a230708ae7'\" ; echo \"\" ; fi ; else if [ -h \$S_TMP_MMMV_USERSPACE_DISTRO_T1_ALIAS_CDAVFS_01_AVFS ]; then echo \"\" ; echo \"The path \" ; echo \"\" ; echo \"    \$S_TMP_MMMV_USERSPACE_DISTRO_T1_ALIAS_CDAVFS_01_AVFS\" ; echo \"\" ; echo -e \"references a broken symlink, but a\\e[31m folder is expected\\e[39m.\" ; echo \"GUID=='7569cd3b-6bf2-4d00-8510-03a230708ae7'\" ; echo \"\" ; else echo \"\" ; echo \"There is nothing at the path \" ; echo \"\" ; echo \"    \$S_TMP_MMMV_USERSPACE_DISTRO_T1_ALIAS_CDAVFS_01_AVFS\" ; echo \"\" ; echo -e \"but a\\e[31m folder is expected\\e[39m.\" ; echo \"GUID=='b3773f4f-67f1-44f4-a110-03a230708ae7'\" ; echo \"\" ; fi ; fi"
        alias cd_avfs="$S_TMP_0"
        alias mmmv_go_AVFS_t1="$S_TMP_0"
        #------------------------------------------------------------------
        # "/home/foo/.avfs/home/foo/bar" -> "/home/foo/bar"
        #     S_11="$(pwd | sed -e 's/^[\/]home[\/]'`whoami`'[\/][.]avfs//')" ; cd $S_11
        S_TMP_0="S_TMP_MMMV_USERSPACE_DISTRO_T1_ALIAS_CDAVFS_01_AVFS=\"$HOME/.avfs\" ; if [ -e \$S_TMP_MMMV_USERSPACE_DISTRO_T1_ALIAS_CDAVFS_01_AVFS ]; then if [ -d \$S_TMP_MMMV_USERSPACE_DISTRO_T1_ALIAS_CDAVFS_01_AVFS ]; then S_TMP_MMMV_USERSPACE_DISTRO_T1_ALIAS_CDAVFS_02_PWD=\"\`pwd\`\" ; S_11=\"\$(pwd | sed -e 's/^[\\/]home[\\/]'\`whoami\`'[\\/][.]avfs//')\" ; cd \$S_11 ; else echo \"\" ; echo \"The path \" ; echo \"\" ; echo \"    \$S_TMP_MMMV_USERSPACE_DISTRO_T1_ALIAS_CDAVFS_01_AVFS\" ; echo \"\" ; if [ -h \$S_TMP_MMMV_USERSPACE_DISTRO_T1_ALIAS_CDAVFS_01_AVFS ]; then echo -e \"references a symlink to a file, but a\\e[31m folder is expected\\e[39m.\" ; else echo -e \"references a file, but a\\e[31m folder is expected\\e[39m.\" ; fi ; echo \"GUID=='71acd08e-d30f-481e-ae10-03a230708ae7'\" ; echo \"\" ; fi ; else if [ -h \$S_TMP_MMMV_USERSPACE_DISTRO_T1_ALIAS_CDAVFS_01_AVFS ]; then echo \"\" ; echo \"The path \" ; echo \"\" ; echo \"    \$S_TMP_MMMV_USERSPACE_DISTRO_T1_ALIAS_CDAVFS_01_AVFS\" ; echo \"\" ; echo -e \"references a broken symlink, but a\\e[31m folder is expected\\e[39m.\" ; echo \"GUID=='da821e20-c07d-485d-8510-03a230708ae7'\" ; echo \"\" ; else echo \"\" ; echo \"There is nothing at the path \" ; echo \"\" ; echo \"    \$S_TMP_MMMV_USERSPACE_DISTRO_T1_ALIAS_CDAVFS_01_AVFS\" ; echo \"\" ; echo -e \"but a\\e[31m folder is expected\\e[39m.\" ; echo \"GUID=='a46f7015-22e8-457d-b400-03a230708ae7'\" ; echo \"\" ; fi ; fi"
        alias cd_avfs_reverse="$S_TMP_0"
        alias mmmv_go_AVFS_t1_reverse="$S_TMP_0"
        #------------------------------------------------------------------
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_VIM_EXISTS_ON_PATH" == "t" ]; then
    if [ "$S_FP_VIM" != "" ]; then
        #--------------------
        S_TMP_0="$HOME/m_local/etc"
        S_TMP_1="$S_TMP_0/list_of_vimwikis.txt"
        if [ -e "$S_TMP_0" ]; then
            if [ -d "$S_TMP_0" ]; then
                alias mmmv_vim_edit_list_of_vimwikis="$S_FP_NICE -n 2 $S_FP_VIM $S_TMP_1 ; "
            fi
        fi
        if [ "$SB_RUBY_EXISTS_ON_PATH" == "t" ]; then
            alias mmmv_admin_update_list_of_vimwikis="mmmv_admin_vimwiki_list_of_wikis_2_vimrc_subpart_t1.rb '--origin=$S_TMP_1'"
        fi
        #--------------------
        # The next line
        S_TMP_0="$HOME/m_local/etc/_bashrc_optional_extra_01"
        # has hardcoded full path by intention.
        if [ -e "$S_TMP_0" ]; then
            if [ ! -d "$S_TMP_0" ]; then
                alias mmmv_vim_edit_bashrc_optional_extra_01="$S_FP_NICE -n 2 $S_FP_VIM $S_TMP_0 ; "
            fi
        fi
        #--------------------
        # The next line
        S_TMP_0="$HOME/m_local/etc/_bashrc_optional_extra_01.bash"
        # has hardcoded full path by intention.
        if [ -e "$S_TMP_0" ]; then
            if [ ! -d "$S_TMP_0" ]; then
                alias mmmv_vim_edit_bashrc_optional_extra_01_bash="$S_FP_NICE -n 2 $S_FP_VIM $S_TMP_0 ; "
            fi
        fi
        #--------------------
        S_TMP_0="$HOME/.config/i3/config"
        if [ -e "$S_TMP_0" ]; then
            if [ ! -d "$S_TMP_0" ]; then
                #----------------------------------------------------------
                # S_ERR="$?" ;
                # if [ "$S_ERR" == "0" ]; then
                #     sync ; wait ; i3-msg reload ;
                #     S_ERR="$?" ;
                #     if [ "$S_ERR" != "0" ]; then
                #         echo "" ;
                #         echo "Reloading of i3 configuration failed." ;
                #         echo -e "i3-msg exited with\e[31m error code $S_ERR\e[39m." ;
                #         echo "GUID=='41438d61-aa55-43f8-8b00-03a230708ae7'" ;
                #         echo "" ;
                #     else
                #         echo "" ;
                #         echo -e "\e[32mi3 window manager configuration reloaded\e[39m." ;
                #         echo "" ;
                #     fi ;
                # else
                #     echo "" ;
                #     echo -e "Vim exited with\e[31m error code $S_ERR\e[39m." ;
                #     echo "Skipping i3 configuration file reloading." ;
                #     echo "GUID=='5250c541-246b-4424-b100-03a230708ae7'" ;
                #     echo "" ;
                # fi ;
                # sync &
                #----------------------------------------------------------
                # $S_FP_NICE -n 2 vim $S_TMP_0 ; wait ; S_ERR="$?" ; if [ "$S_ERR" == "0" ]; then sync ; wait ; i3-msg reload ; S_ERR="$?" ; if [ "$S_ERR" != "0" ]; then echo "" ; echo "Reloading of i3 configuration failed." ; echo -e "i3-msg exited with\e[31m error code $S_ERR\e[39m." ; echo "GUID=='4ad20085-9142-4762-9400-03a230708ae7'" ; echo "" ; else echo "" ; echo -e "\e[32mi3 window manager configuration reloaded\e[39m." ; echo "" ; fi ; else echo "" ; echo -e "Vim exited with\e[31m error code $S_ERR\e[39m." ; echo "Skipping i3 configuration file reloading." ; echo "GUID=='9bf0811a-867e-4375-8500-03a230708ae7'" ; echo "" ; fi ; sync &
                #----------------------------------------------------------
                if [ "$SB_I3MSG_EXISTS_ON_PATH" == "t" ]; then
                    alias mmmv_vim_edit_i3_config_and_reload_it="$S_FP_NICE -n 2 vim $S_TMP_0 ; wait ; S_ERR=\"\$?\" ; if [ \"\$S_ERR\" == \"0\" ]; then sync ; wait ; i3-msg reload ; S_ERR=\"\$?\" ; if [ \"\$S_ERR\" != \"0\" ]; then echo \"\" ; echo \"Reloading of i3 configuration failed.\" ; echo -e \"i3-msg exited with\\e[31m error code \$S_ERR\\e[39m.\" ; echo \"GUID=='e5a8b84a-3af2-4bc3-a400-03a230708ae7'\" ; echo \"\" ; else echo \"\" ; echo -e \"\\e[32mi3 window manager configuration reloaded\\e[39m.\" ; echo \"\" ; fi ; else echo \"\" ; echo -e \"Vim exited with\\e[31m error code \$S_ERR\\e[39m.\" ; echo \"Skipping i3 configuration file reloading.\" ; echo \"GUID=='1e440a16-29b5-46b6-b300-03a230708ae7'\" ; echo \"\" ; fi ; sync &  "
                else
                    alias mmmv_vim_edit_i3_config="$S_FP_NICE -n 2 vim $S_TMP_0 ; wait ; S_ERR=\"\$?\" ; if [ \"\$S_ERR\" != \"0\" ]; then echo \"\" ; echo -e \"Vim exited with\\e[31m error code \$S_ERR\\e[39m.\" ; echo \"GUID=='5e0a3b13-da4a-47eb-a2ff-03a230708ae7'\" ; echo \"\" ; fi ; sync & "
                fi
                #----------------------------------------------------------
            fi
        fi
        #--------------------
        if [ "$SB_USERNAME_IS_mmmv" == "t" ]; then
            #--------------------
            # The next line
            S_TMP_0="/home/mmmv/mmmv_userspace_distro_t1/attic/documentation/application_specific_documentation/vimwiki/notes_set_01/in_vimwiki_format/index.wiki"
            # has hardcoded full path by intention.
            if [ -e "$S_TMP_0" ]; then
                if [ ! -d "$S_TMP_0" ]; then
                    alias mmmv_vimwiki_userspace_distro_t1_notes_set_01="$S_FP_VIM $S_TMP_0 "
                fi
            fi
            #--------------------
            # The next line
            S_TMP_0="/home/mmmv/mmmv_userspace_distro_t1/attic/documentation/development_ideas/arendusideede_vimwiki/index.wiki"
            # has hardcoded full path by intention.
            if [ -e "$S_TMP_0" ]; then
                if [ ! -d "$S_TMP_0" ]; then
                    # "arendusideed" stands for "development ideas" in Estonian.
                    alias mmmv_vimwiki_userspace_distro_t1_arendusideed="$S_FP_VIM $S_TMP_0 "
                fi
            fi
            #--------------------
        fi
        #--------------------
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_PANDOC_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_GSED_EXISTS_ON_PATH" == "t" ]; then
        if [ "$SB_MMMV_CRE_TEMPORARY_FILE_T1_EXISTS_ON_PATH" == "t" ]; then
            if [ "$SB_FIND_EXISTS_ON_PATH" == "t" ]; then
                if [ "$SB_GREP_EXISTS_ON_PATH" == "t" ]; then
                    if [ "$SB_TIDY_EXISTS_ON_PATH" == "t" ]; then
                        #-------------------------------------------------------
                        #sync ; S_FP_TEMPORARY_FILE="`mmmv_cre_temporary_file_t1 --max_file_size_64KiB `" ; wait ; sync ; find . -type f | grep -i -E '[.]md$' | gsed -e 's/\([[:blank:]]\|['"'"'`"]\|[|&;()<>{}\*~?!#$]\|[\[]\|[\x5d]\)/\\\1/g' | gsed -e 's/^\([.][\/].\+\)$/pandoc --from=gfm \1 -o \1.html ; sync ; wait ; tidy -modify -indent -quiet -wrap 80 \1.html 2>\/dev\/null ; sync ; wait ; /g' | gsed -e 's/[.]\([mM][dD]\)[.]html[[:blank:]]/_\1.html /g' > $S_FP_TEMPORARY_FILE ; wait ; sync ; bash $S_FP_TEMPORARY_FILE ; S_ERR="$?" ; echo "" ; if [ "$S_ERR" == "0" ]; then echo -e "\e[32mCreation of HTML files complete\e[39m." ; else echo -e "\e[31mCreation of HTML files failed\e[39m with error code $S_ERR." ; fi ; echo "" ; sync ; wait ; rm -f $S_FP_TEMPORARY_FILE ;
                        # The
                        alias mmmv_cre_HTML_from_Markdown_recursively_at_PWD_t1="sync ; S_FP_TEMPORARY_FILE=\"\`mmmv_cre_temporary_file_t1 --max_file_size_64KiB \`\" ; wait ; sync ; find . -type f | grep -i -E '[.]md\$' | gsed -e 's/\\([[:blank:]]\\|['\"'\"'\`\"]\\|[|&;()<>{}\\*~?!#\$]\\|[\\[]\\|[\\x5d]\\)/\\\\\\1/g' | gsed -e 's/^\\([.][\\/].\\+\\)\$/pandoc --from=gfm \\1 -o \\1.html ; sync ; wait ; tidy -modify -indent -quiet -wrap 80 \\1.html 2>\\/dev\\/null ; sync ; wait ; /g' | gsed -e 's/[.]\\([mM][dD]\\)[.]html[[:blank:]]/_\\1.html /g' > \$S_FP_TEMPORARY_FILE ; wait ; sync ; bash \$S_FP_TEMPORARY_FILE ; S_ERR=\"\$?\" ; echo \"\" ; if [ \"\$S_ERR\" == \"0\" ]; then echo -e \"\\e[32mCreation of HTML files complete\\e[39m.\" ; else echo -e \"\\e[31mCreation of HTML files failed\\e[39m with error code \$S_ERR.\" ; fi ; echo \"\" ; sync ; wait ; rm -f \$S_FP_TEMPORARY_FILE ; "
                        # is the same as the
                        alias mmmv_convert_Markdown_to_HTML_recursively_at_PWD_t1="sync ; S_FP_TEMPORARY_FILE=\"\`mmmv_cre_temporary_file_t1 --max_file_size_64KiB \`\" ; wait ; sync ; find . -type f | grep -i -E '[.]md\$' | gsed -e 's/\\([[:blank:]]\\|['\"'\"'\`\"]\\|[|&;()<>{}\\*~?!#\$]\\|[\\[]\\|[\\x5d]\\)/\\\\\\1/g' | gsed -e 's/^\\([.][\\/].\\+\\)\$/pandoc --from=gfm \\1 -o \\1.html ; sync ; wait ; tidy -modify -indent -quiet -wrap 80 \\1.html 2>\\/dev\\/null ; sync ; wait ; /g' | gsed -e 's/[.]\\([mM][dD]\\)[.]html[[:blank:]]/_\\1.html /g' > \$S_FP_TEMPORARY_FILE ; wait ; sync ; bash \$S_FP_TEMPORARY_FILE ; S_ERR=\"\$?\" ; echo \"\" ; if [ \"\$S_ERR\" == \"0\" ]; then echo -e \"\\e[32mCreation of HTML files complete\\e[39m.\" ; else echo -e \"\\e[31mCreation of HTML files failed\\e[39m with error code \$S_ERR.\" ; fi ; echo \"\" ; sync ; wait ; rm -f \$S_FP_TEMPORARY_FILE ; "
                        # because placing the alias code to a variable requires
                        # something more than just auto-escaping it for double
                        # quotation marks and the current duplicating solution keeps
                        # the code without such manual editing.
                        #-------------------------------------------------------
                    else
                        #-------------------------------------------------------
                        #sync ; S_FP_TEMPORARY_FILE="`mmmv_cre_temporary_file_t1 --max_file_size_64KiB `" ; wait ; sync ; find . -type f | grep -i -E '[.]md$' | gsed -e 's/\([[:blank:]]\|['"'"'`"]\|[|&;()<>{}\*~?!#$]\|[\[]\|[\x5d]\)/\\\1/g' | gsed -e 's/^\([.][\/].\+\)$/pandoc --from=gfm \1 -o \1/g' | gsed -e 's/[.]\([mM][dD]\)$/_\1.html/g' > $S_FP_TEMPORARY_FILE ; wait ; sync ; bash $S_FP_TEMPORARY_FILE ; S_ERR="$?" ; echo "" ; if [ "$S_ERR" == "0" ]; then echo -e "\e[32mCreation of HTML files complete\e[39m." ; else echo -e "\e[31mCreation of HTML files failed\e[39m with error code $S_ERR." ; fi ; echo "" ; sync ; wait ; rm -f $S_FP_TEMPORARY_FILE ;
                        # The
                        alias mmmv_cre_HTML_from_Markdown_recursively_at_PWD_t1="sync ; S_FP_TEMPORARY_FILE=\"\`mmmv_cre_temporary_file_t1 --max_file_size_64KiB \`\" ; wait ; sync ; find . -type f | grep -i -E '[.]md\$' | gsed -e 's/\\([[:blank:]]\\|['\"'\"'\`\"]\\|[|&;()<>{}\\*~?!#\$]\\|[\\[]\\|[\\x5d]\\)/\\\\\\1/g' | gsed -e 's/^\\([.][\\/].\\+\\)\$/pandoc --from=gfm \\1 -o \\1/g' | gsed -e 's/[.]\\([mM][dD]\\)\$/_\\1.html/g' > \$S_FP_TEMPORARY_FILE ; wait ; sync ; bash \$S_FP_TEMPORARY_FILE ; S_ERR=\"\$?\" ; echo \"\" ; if [ \"\$S_ERR\" == \"0\" ]; then echo -e \"\\e[32mCreation of HTML files complete\\e[39m.\" ; else echo -e \"\\e[31mCreation of HTML files failed\\e[39m with error code \$S_ERR.\" ; fi ; echo \"\" ; sync ; wait ; rm -f \$S_FP_TEMPORARY_FILE ; "
                        # is the same as the
                        alias mmmv_convert_Markdown_to_HTML_recursively_at_PWD_t1="sync ; S_FP_TEMPORARY_FILE=\"\`mmmv_cre_temporary_file_t1 --max_file_size_64KiB \`\" ; wait ; sync ; find . -type f | grep -i -E '[.]md\$' | gsed -e 's/\\([[:blank:]]\\|['\"'\"'\`\"]\\|[|&;()<>{}\\*~?!#\$]\\|[\\[]\\|[\\x5d]\\)/\\\\\\1/g' | gsed -e 's/^\\([.][\\/].\\+\\)\$/pandoc --from=gfm \\1 -o \\1/g' | gsed -e 's/[.]\\([mM][dD]\\)\$/_\\1.html/g' > \$S_FP_TEMPORARY_FILE ; wait ; sync ; bash \$S_FP_TEMPORARY_FILE ; S_ERR=\"\$?\" ; echo \"\" ; if [ \"\$S_ERR\" == \"0\" ]; then echo -e \"\\e[32mCreation of HTML files complete\\e[39m.\" ; else echo -e \"\\e[31mCreation of HTML files failed\\e[39m with error code \$S_ERR.\" ; fi ; echo \"\" ; sync ; wait ; rm -f \$S_FP_TEMPORARY_FILE ; "
                        # because placing the alias code to a variable requires
                        # something more than just auto-escaping it for double
                        # quotation marks and the current duplicating solution keeps
                        # the code without such manual editing.
                        #-------------------------------------------------------
                    fi
                fi
            fi
        fi
    fi
fi
#--------------------
if [ "$SB_PANDOC_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_GSED_EXISTS_ON_PATH" == "t" ]; then
        if [ "$SB_RUBY_EXISTS_ON_PATH" == "t" ]; then
            #--------------------
            # The testscript:
            #
            #     #!/usr/bin/env bash
            #
            #     rm -f ./README_md.html   # TESTSCRIPT SPECIFIC ROW
            #     S_FP_TIDY="`which tidy`" # TESTSCRIPT SPECIFIC ROW
            #
            #     S_0="./README.md" ;
            #     sync ;
            #     S_1="`echo \"$S_0\" | gsed -e 's/[.]md\$/_md/' | gsed -e 's/\$/.html/' `" ;
            #     wait ;
            #     pandoc --from=gfm "$S_0" -o "$S_1" ;
            #     if [ "$?" != "0" ]; then
            #         echo -e "\e[31mFailed to convert\e[39m $S_0 to HTML with \"pandoc\"." ;
            #     else
            #         if [ "$S_FP_TIDY" != "" ]; then
            #             sync ; wait ;
            #             tidy -modify -indent -quiet -wrap 80 $S_1 2>/dev/null ;
            #             echo -e "\e[32mCreated\e[39m $S_1 " ;
            #         else
            #             echo -e "\e[32mCreated\n\e[39m    $S_1 \nwith \"pandoc\", but did not format it." ;
            #         fi ;
            #         sync ;
            #     fi ;
            #--------------------
            S_TMP_0="mmmv_polish_ABC_2_ACB_exec_t1   \"S_0=\\\"\"   \"\\\" ; sync ; S_1=\\\"\\\`echo \\\\\\\"\\\$S_0\\\\\\\" | $S_CMD_GNU_SED -e 's/[.]md\\\\\\\$/_md/' | $S_CMD_GNU_SED -e 's/\\\\\\\$/.html/' \\\`\\\" ; wait ; $S_FP_PANDOC --from=gfm \\\"\\\$S_0\\\" -o \\\"\\\$S_1\\\" ; if [ \\\"\\\$?\\\" != \\\"0\\\" ]; then echo -e \\\"\\\\e[31mFailed to convert\\\\e[39m \\\$S_0 to HTML with \\\\\\\"pandoc\\\\\\\".\\\" ; else if [ \\\"$S_FP_TIDY\\\" != \\\"\\\" ]; then sync ; wait ; $S_FP_TIDY -modify -indent -quiet -wrap 80 \\\$S_1 2>/dev/null ; echo -e \\\"\\\\e[32mCreated\\\\e[39m \\\$S_1 \\\" ; else echo -e \\\"\\\\e[32mCreated\\\\n\\\\e[39m    \\\$S_1 \\\\nwith \\\\\\\"pandoc\\\\\\\", but did not format it.\\\" ; fi ; sync ; fi ; \""
            # The
            alias mmmv_cre_HTML_from_Markdown_t2="$S_TMP_0"
            alias mmmv_convert_Markdown_to_HTML_t2="$S_TMP_0"
            # are/is a more primitive version for converting a single .md file.
            #--------------------
        fi
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_ZBARIMG_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_RUBY_EXISTS_ON_PATH" == "t" ]; then
        if [ "$SB_GREP_EXISTS_ON_PATH" == "t" ]; then
            if [ "$SB_GSED_EXISTS_ON_PATH" == "t" ]; then
                # Usage:
                #     zbarimg -q --raw an_image_with_a_QR_code.png
                alias mmmv_QR2txt_zbarimg="mmmv_polish_ABC_2_ACB_exec_t1 \"zbarimg \" \" 2>/dev/null | grep -E '^QR[-]Code[:]' | gsed -e 's/^QR[-]Code[:]//g'\" "
            fi
        fi
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_RUBY_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_GREP_EXISTS_ON_PATH" == "t" ]; then
        if [ "$SB_DIFF_EXISTS_ON_PATH" == "t" ]; then
            #diff ./first.txt ./second.txt | grep -v -E '["'"'"'][0123456789abcdefABCDEF]{8}[-][0123456789abcdefABCDEF]{4}[-][0123456789abcdefABCDEF]{4}[-][0123456789abcdefABCDEF]{4}[-][0123456789abcdefABCDEF]{12}["'"'"']' | grep -v -E '^---$' | grep -v  -E '^[0123456789abcdefABCDEF]+([,][0123456789]+)?$'
            alias mmmv_diff_GUIDfree_t1="mmmv_polish_ABCD_2_A_C_D_B_exec_t1  \" nice -n 3 diff \"   \" | grep -v -E '[\\\"'\\\"'\\\"'][0123456789abcdefABCDEF]{8}[-][0123456789abcdefABCDEF]{4}[-][0123456789abcdefABCDEF]{4}[-][0123456789abcdefABCDEF]{4}[-][0123456789abcdefABCDEF]{12}[\\\"'\\\"'\\\"']' | grep -v -E '^---\\\$' | grep -v  -E '^[0123456789abcdefABCDEF]+([,][0123456789]+)?\\\$'\""  # ./first.txt ./second.txt
        fi
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_RUBY_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_CONVERT_EXISTS_ON_PATH" == "t" ]; then
        if [ "$SB_GSED_EXISTS_ON_PATH" == "t" ]; then
            # According to 2026_05_09 version of Microsoft Bing chatbot
            # the most common monitor dimentsions by pixels are:
            #     1024x768
            #     1280x1024
            #     1280x720
            #     1280x800
            #     1440x900
            #     1600x1200
            #     1600x900
            #     1680x1050
            #     1920x1080
            #     1920x1200
            #     2048x1080
            #     2048x1536
            #     2560x1080
            #     2560x1440
            #     2560x1600
            #     3440x1440
            #     3840x1080
            #     3840x2160
            #     3840x2400
            #     4096x2160
            #     5120x1440
            #     5120x2160
            #     5120x2880
            #     640x480
            #     7680x4320
            #     800x600
            #
            # Alias template, where monitor widht is X and monitor height is Y:
            #     alias mmmv_cre_image_by_converting_an_existing_image_to_an_image_with_background_framecolour_000000_XxY_t1="mmmv_polish_ABC_2_ACB_exec_t1 \"S_FP_INPUT_FILE_PATH=\\\"\"     \"\\\" ; SI_SCREEN_WIDTH=\\\"X\\\"; SI_SCREEN_HEIGHT=\\\"Y\\\"; S_WxH=\\\"\\\$SI_SCREEN_WIDTH\\\"'x'\\\"\\\$SI_SCREEN_HEIGHT\\\" ; S_FP_OUTPUT_FILE_PATH=\\\"\\\`echo \\\$S_FP_INPUT_FILE_PATH | gsed -e 's/\\\\([.][^.]\\\\+\\\\)\\\$/_'\\\$S_WxH'\\\\1/g' \\\`\\\" ; sync ; wait ; convert \\\"\\\$S_FP_INPUT_FILE_PATH\\\"  -resize \\\$S_WxH -background \\\"#000000\\\" -gravity center -extent \\\$S_WxH  \\\"\\\$S_FP_OUTPUT_FILE_PATH\\\"\" "
            #
            # Aliases generated by using Vim macros:
            alias mmmv_cre_image_by_converting_an_existing_image_to_an_image_with_background_framecolour_000000_1024x768_t1="mmmv_polish_ABC_2_ACB_exec_t1 \"S_FP_INPUT_FILE_PATH=\\\"\"     \"\\\" ; SI_SCREEN_WIDTH=\\\"1024\\\"; SI_SCREEN_HEIGHT=\\\"768\\\"; S_WxH=\\\"\\\$SI_SCREEN_WIDTH\\\"'x'\\\"\\\$SI_SCREEN_HEIGHT\\\" ; S_FP_OUTPUT_FILE_PATH=\\\"\\\`echo \\\$S_FP_INPUT_FILE_PATH | gsed -e 's/\\\\([.][^.]\\\\+\\\\)\\\$/_'\\\$S_WxH'\\\\1/g' \\\`\\\" ; sync ; wait ; convert \\\"\\\$S_FP_INPUT_FILE_PATH\\\"  -resize \\\$S_WxH -background \\\"#000000\\\" -gravity center -extent \\\$S_WxH  \\\"\\\$S_FP_OUTPUT_FILE_PATH\\\"\" "
            #--------
            alias mmmv_cre_image_by_converting_an_existing_image_to_an_image_with_background_framecolour_000000_1280x1024_t1="mmmv_polish_ABC_2_ACB_exec_t1 \"S_FP_INPUT_FILE_PATH=\\\"\"     \"\\\" ; SI_SCREEN_WIDTH=\\\"1280\\\"; SI_SCREEN_HEIGHT=\\\"1024\\\"; S_WxH=\\\"\\\$SI_SCREEN_WIDTH\\\"'x'\\\"\\\$SI_SCREEN_HEIGHT\\\" ; S_FP_OUTPUT_FILE_PATH=\\\"\\\`echo \\\$S_FP_INPUT_FILE_PATH | gsed -e 's/\\\\([.][^.]\\\\+\\\\)\\\$/_'\\\$S_WxH'\\\\1/g' \\\`\\\" ; sync ; wait ; convert \\\"\\\$S_FP_INPUT_FILE_PATH\\\"  -resize \\\$S_WxH -background \\\"#000000\\\" -gravity center -extent \\\$S_WxH  \\\"\\\$S_FP_OUTPUT_FILE_PATH\\\"\" "
            #--------
            alias mmmv_cre_image_by_converting_an_existing_image_to_an_image_with_background_framecolour_000000_1280x720_t1="mmmv_polish_ABC_2_ACB_exec_t1 \"S_FP_INPUT_FILE_PATH=\\\"\"     \"\\\" ; SI_SCREEN_WIDTH=\\\"1280\\\"; SI_SCREEN_HEIGHT=\\\"720\\\"; S_WxH=\\\"\\\$SI_SCREEN_WIDTH\\\"'x'\\\"\\\$SI_SCREEN_HEIGHT\\\" ; S_FP_OUTPUT_FILE_PATH=\\\"\\\`echo \\\$S_FP_INPUT_FILE_PATH | gsed -e 's/\\\\([.][^.]\\\\+\\\\)\\\$/_'\\\$S_WxH'\\\\1/g' \\\`\\\" ; sync ; wait ; convert \\\"\\\$S_FP_INPUT_FILE_PATH\\\"  -resize \\\$S_WxH -background \\\"#000000\\\" -gravity center -extent \\\$S_WxH  \\\"\\\$S_FP_OUTPUT_FILE_PATH\\\"\" "
            #--------
            alias mmmv_cre_image_by_converting_an_existing_image_to_an_image_with_background_framecolour_000000_1280x800_t1="mmmv_polish_ABC_2_ACB_exec_t1 \"S_FP_INPUT_FILE_PATH=\\\"\"     \"\\\" ; SI_SCREEN_WIDTH=\\\"1280\\\"; SI_SCREEN_HEIGHT=\\\"800\\\"; S_WxH=\\\"\\\$SI_SCREEN_WIDTH\\\"'x'\\\"\\\$SI_SCREEN_HEIGHT\\\" ; S_FP_OUTPUT_FILE_PATH=\\\"\\\`echo \\\$S_FP_INPUT_FILE_PATH | gsed -e 's/\\\\([.][^.]\\\\+\\\\)\\\$/_'\\\$S_WxH'\\\\1/g' \\\`\\\" ; sync ; wait ; convert \\\"\\\$S_FP_INPUT_FILE_PATH\\\"  -resize \\\$S_WxH -background \\\"#000000\\\" -gravity center -extent \\\$S_WxH  \\\"\\\$S_FP_OUTPUT_FILE_PATH\\\"\" "
            #--------
            alias mmmv_cre_image_by_converting_an_existing_image_to_an_image_with_background_framecolour_000000_1440x900_t1="mmmv_polish_ABC_2_ACB_exec_t1 \"S_FP_INPUT_FILE_PATH=\\\"\"     \"\\\" ; SI_SCREEN_WIDTH=\\\"1440\\\"; SI_SCREEN_HEIGHT=\\\"900\\\"; S_WxH=\\\"\\\$SI_SCREEN_WIDTH\\\"'x'\\\"\\\$SI_SCREEN_HEIGHT\\\" ; S_FP_OUTPUT_FILE_PATH=\\\"\\\`echo \\\$S_FP_INPUT_FILE_PATH | gsed -e 's/\\\\([.][^.]\\\\+\\\\)\\\$/_'\\\$S_WxH'\\\\1/g' \\\`\\\" ; sync ; wait ; convert \\\"\\\$S_FP_INPUT_FILE_PATH\\\"  -resize \\\$S_WxH -background \\\"#000000\\\" -gravity center -extent \\\$S_WxH  \\\"\\\$S_FP_OUTPUT_FILE_PATH\\\"\" "
            #--------
            alias mmmv_cre_image_by_converting_an_existing_image_to_an_image_with_background_framecolour_000000_1600x1200_t1="mmmv_polish_ABC_2_ACB_exec_t1 \"S_FP_INPUT_FILE_PATH=\\\"\"     \"\\\" ; SI_SCREEN_WIDTH=\\\"1600\\\"; SI_SCREEN_HEIGHT=\\\"1200\\\"; S_WxH=\\\"\\\$SI_SCREEN_WIDTH\\\"'x'\\\"\\\$SI_SCREEN_HEIGHT\\\" ; S_FP_OUTPUT_FILE_PATH=\\\"\\\`echo \\\$S_FP_INPUT_FILE_PATH | gsed -e 's/\\\\([.][^.]\\\\+\\\\)\\\$/_'\\\$S_WxH'\\\\1/g' \\\`\\\" ; sync ; wait ; convert \\\"\\\$S_FP_INPUT_FILE_PATH\\\"  -resize \\\$S_WxH -background \\\"#000000\\\" -gravity center -extent \\\$S_WxH  \\\"\\\$S_FP_OUTPUT_FILE_PATH\\\"\" "
            #--------
            alias mmmv_cre_image_by_converting_an_existing_image_to_an_image_with_background_framecolour_000000_1600x900_t1="mmmv_polish_ABC_2_ACB_exec_t1 \"S_FP_INPUT_FILE_PATH=\\\"\"     \"\\\" ; SI_SCREEN_WIDTH=\\\"1600\\\"; SI_SCREEN_HEIGHT=\\\"900\\\"; S_WxH=\\\"\\\$SI_SCREEN_WIDTH\\\"'x'\\\"\\\$SI_SCREEN_HEIGHT\\\" ; S_FP_OUTPUT_FILE_PATH=\\\"\\\`echo \\\$S_FP_INPUT_FILE_PATH | gsed -e 's/\\\\([.][^.]\\\\+\\\\)\\\$/_'\\\$S_WxH'\\\\1/g' \\\`\\\" ; sync ; wait ; convert \\\"\\\$S_FP_INPUT_FILE_PATH\\\"  -resize \\\$S_WxH -background \\\"#000000\\\" -gravity center -extent \\\$S_WxH  \\\"\\\$S_FP_OUTPUT_FILE_PATH\\\"\" "
            #--------
            alias mmmv_cre_image_by_converting_an_existing_image_to_an_image_with_background_framecolour_000000_1680x1050_t1="mmmv_polish_ABC_2_ACB_exec_t1 \"S_FP_INPUT_FILE_PATH=\\\"\"     \"\\\" ; SI_SCREEN_WIDTH=\\\"1680\\\"; SI_SCREEN_HEIGHT=\\\"1050\\\"; S_WxH=\\\"\\\$SI_SCREEN_WIDTH\\\"'x'\\\"\\\$SI_SCREEN_HEIGHT\\\" ; S_FP_OUTPUT_FILE_PATH=\\\"\\\`echo \\\$S_FP_INPUT_FILE_PATH | gsed -e 's/\\\\([.][^.]\\\\+\\\\)\\\$/_'\\\$S_WxH'\\\\1/g' \\\`\\\" ; sync ; wait ; convert \\\"\\\$S_FP_INPUT_FILE_PATH\\\"  -resize \\\$S_WxH -background \\\"#000000\\\" -gravity center -extent \\\$S_WxH  \\\"\\\$S_FP_OUTPUT_FILE_PATH\\\"\" "
            #--------
            alias mmmv_cre_image_by_converting_an_existing_image_to_an_image_with_background_framecolour_000000_1920x1080_t1="mmmv_polish_ABC_2_ACB_exec_t1 \"S_FP_INPUT_FILE_PATH=\\\"\"     \"\\\" ; SI_SCREEN_WIDTH=\\\"1920\\\"; SI_SCREEN_HEIGHT=\\\"1080\\\"; S_WxH=\\\"\\\$SI_SCREEN_WIDTH\\\"'x'\\\"\\\$SI_SCREEN_HEIGHT\\\" ; S_FP_OUTPUT_FILE_PATH=\\\"\\\`echo \\\$S_FP_INPUT_FILE_PATH | gsed -e 's/\\\\([.][^.]\\\\+\\\\)\\\$/_'\\\$S_WxH'\\\\1/g' \\\`\\\" ; sync ; wait ; convert \\\"\\\$S_FP_INPUT_FILE_PATH\\\"  -resize \\\$S_WxH -background \\\"#000000\\\" -gravity center -extent \\\$S_WxH  \\\"\\\$S_FP_OUTPUT_FILE_PATH\\\"\" "
            #--------
            alias mmmv_cre_image_by_converting_an_existing_image_to_an_image_with_background_framecolour_000000_1920x1200_t1="mmmv_polish_ABC_2_ACB_exec_t1 \"S_FP_INPUT_FILE_PATH=\\\"\"     \"\\\" ; SI_SCREEN_WIDTH=\\\"1920\\\"; SI_SCREEN_HEIGHT=\\\"1200\\\"; S_WxH=\\\"\\\$SI_SCREEN_WIDTH\\\"'x'\\\"\\\$SI_SCREEN_HEIGHT\\\" ; S_FP_OUTPUT_FILE_PATH=\\\"\\\`echo \\\$S_FP_INPUT_FILE_PATH | gsed -e 's/\\\\([.][^.]\\\\+\\\\)\\\$/_'\\\$S_WxH'\\\\1/g' \\\`\\\" ; sync ; wait ; convert \\\"\\\$S_FP_INPUT_FILE_PATH\\\"  -resize \\\$S_WxH -background \\\"#000000\\\" -gravity center -extent \\\$S_WxH  \\\"\\\$S_FP_OUTPUT_FILE_PATH\\\"\" "
            #--------
            alias mmmv_cre_image_by_converting_an_existing_image_to_an_image_with_background_framecolour_000000_2048x1080_t1="mmmv_polish_ABC_2_ACB_exec_t1 \"S_FP_INPUT_FILE_PATH=\\\"\"     \"\\\" ; SI_SCREEN_WIDTH=\\\"2048\\\"; SI_SCREEN_HEIGHT=\\\"1080\\\"; S_WxH=\\\"\\\$SI_SCREEN_WIDTH\\\"'x'\\\"\\\$SI_SCREEN_HEIGHT\\\" ; S_FP_OUTPUT_FILE_PATH=\\\"\\\`echo \\\$S_FP_INPUT_FILE_PATH | gsed -e 's/\\\\([.][^.]\\\\+\\\\)\\\$/_'\\\$S_WxH'\\\\1/g' \\\`\\\" ; sync ; wait ; convert \\\"\\\$S_FP_INPUT_FILE_PATH\\\"  -resize \\\$S_WxH -background \\\"#000000\\\" -gravity center -extent \\\$S_WxH  \\\"\\\$S_FP_OUTPUT_FILE_PATH\\\"\" "
            #--------
            alias mmmv_cre_image_by_converting_an_existing_image_to_an_image_with_background_framecolour_000000_2048x1536_t1="mmmv_polish_ABC_2_ACB_exec_t1 \"S_FP_INPUT_FILE_PATH=\\\"\"     \"\\\" ; SI_SCREEN_WIDTH=\\\"2048\\\"; SI_SCREEN_HEIGHT=\\\"1536\\\"; S_WxH=\\\"\\\$SI_SCREEN_WIDTH\\\"'x'\\\"\\\$SI_SCREEN_HEIGHT\\\" ; S_FP_OUTPUT_FILE_PATH=\\\"\\\`echo \\\$S_FP_INPUT_FILE_PATH | gsed -e 's/\\\\([.][^.]\\\\+\\\\)\\\$/_'\\\$S_WxH'\\\\1/g' \\\`\\\" ; sync ; wait ; convert \\\"\\\$S_FP_INPUT_FILE_PATH\\\"  -resize \\\$S_WxH -background \\\"#000000\\\" -gravity center -extent \\\$S_WxH  \\\"\\\$S_FP_OUTPUT_FILE_PATH\\\"\" "
            #--------
            alias mmmv_cre_image_by_converting_an_existing_image_to_an_image_with_background_framecolour_000000_2560x1080_t1="mmmv_polish_ABC_2_ACB_exec_t1 \"S_FP_INPUT_FILE_PATH=\\\"\"     \"\\\" ; SI_SCREEN_WIDTH=\\\"2560\\\"; SI_SCREEN_HEIGHT=\\\"1080\\\"; S_WxH=\\\"\\\$SI_SCREEN_WIDTH\\\"'x'\\\"\\\$SI_SCREEN_HEIGHT\\\" ; S_FP_OUTPUT_FILE_PATH=\\\"\\\`echo \\\$S_FP_INPUT_FILE_PATH | gsed -e 's/\\\\([.][^.]\\\\+\\\\)\\\$/_'\\\$S_WxH'\\\\1/g' \\\`\\\" ; sync ; wait ; convert \\\"\\\$S_FP_INPUT_FILE_PATH\\\"  -resize \\\$S_WxH -background \\\"#000000\\\" -gravity center -extent \\\$S_WxH  \\\"\\\$S_FP_OUTPUT_FILE_PATH\\\"\" "
            #--------
            alias mmmv_cre_image_by_converting_an_existing_image_to_an_image_with_background_framecolour_000000_2560x1440_t1="mmmv_polish_ABC_2_ACB_exec_t1 \"S_FP_INPUT_FILE_PATH=\\\"\"     \"\\\" ; SI_SCREEN_WIDTH=\\\"2560\\\"; SI_SCREEN_HEIGHT=\\\"1440\\\"; S_WxH=\\\"\\\$SI_SCREEN_WIDTH\\\"'x'\\\"\\\$SI_SCREEN_HEIGHT\\\" ; S_FP_OUTPUT_FILE_PATH=\\\"\\\`echo \\\$S_FP_INPUT_FILE_PATH | gsed -e 's/\\\\([.][^.]\\\\+\\\\)\\\$/_'\\\$S_WxH'\\\\1/g' \\\`\\\" ; sync ; wait ; convert \\\"\\\$S_FP_INPUT_FILE_PATH\\\"  -resize \\\$S_WxH -background \\\"#000000\\\" -gravity center -extent \\\$S_WxH  \\\"\\\$S_FP_OUTPUT_FILE_PATH\\\"\" "
            #--------
            alias mmmv_cre_image_by_converting_an_existing_image_to_an_image_with_background_framecolour_000000_2560x1600_t1="mmmv_polish_ABC_2_ACB_exec_t1 \"S_FP_INPUT_FILE_PATH=\\\"\"     \"\\\" ; SI_SCREEN_WIDTH=\\\"2560\\\"; SI_SCREEN_HEIGHT=\\\"1600\\\"; S_WxH=\\\"\\\$SI_SCREEN_WIDTH\\\"'x'\\\"\\\$SI_SCREEN_HEIGHT\\\" ; S_FP_OUTPUT_FILE_PATH=\\\"\\\`echo \\\$S_FP_INPUT_FILE_PATH | gsed -e 's/\\\\([.][^.]\\\\+\\\\)\\\$/_'\\\$S_WxH'\\\\1/g' \\\`\\\" ; sync ; wait ; convert \\\"\\\$S_FP_INPUT_FILE_PATH\\\"  -resize \\\$S_WxH -background \\\"#000000\\\" -gravity center -extent \\\$S_WxH  \\\"\\\$S_FP_OUTPUT_FILE_PATH\\\"\" "
            #--------
            alias mmmv_cre_image_by_converting_an_existing_image_to_an_image_with_background_framecolour_000000_3440x1440_t1="mmmv_polish_ABC_2_ACB_exec_t1 \"S_FP_INPUT_FILE_PATH=\\\"\"     \"\\\" ; SI_SCREEN_WIDTH=\\\"3440\\\"; SI_SCREEN_HEIGHT=\\\"1440\\\"; S_WxH=\\\"\\\$SI_SCREEN_WIDTH\\\"'x'\\\"\\\$SI_SCREEN_HEIGHT\\\" ; S_FP_OUTPUT_FILE_PATH=\\\"\\\`echo \\\$S_FP_INPUT_FILE_PATH | gsed -e 's/\\\\([.][^.]\\\\+\\\\)\\\$/_'\\\$S_WxH'\\\\1/g' \\\`\\\" ; sync ; wait ; convert \\\"\\\$S_FP_INPUT_FILE_PATH\\\"  -resize \\\$S_WxH -background \\\"#000000\\\" -gravity center -extent \\\$S_WxH  \\\"\\\$S_FP_OUTPUT_FILE_PATH\\\"\" "
            #--------
            alias mmmv_cre_image_by_converting_an_existing_image_to_an_image_with_background_framecolour_000000_3840x1080_t1="mmmv_polish_ABC_2_ACB_exec_t1 \"S_FP_INPUT_FILE_PATH=\\\"\"     \"\\\" ; SI_SCREEN_WIDTH=\\\"3840\\\"; SI_SCREEN_HEIGHT=\\\"1080\\\"; S_WxH=\\\"\\\$SI_SCREEN_WIDTH\\\"'x'\\\"\\\$SI_SCREEN_HEIGHT\\\" ; S_FP_OUTPUT_FILE_PATH=\\\"\\\`echo \\\$S_FP_INPUT_FILE_PATH | gsed -e 's/\\\\([.][^.]\\\\+\\\\)\\\$/_'\\\$S_WxH'\\\\1/g' \\\`\\\" ; sync ; wait ; convert \\\"\\\$S_FP_INPUT_FILE_PATH\\\"  -resize \\\$S_WxH -background \\\"#000000\\\" -gravity center -extent \\\$S_WxH  \\\"\\\$S_FP_OUTPUT_FILE_PATH\\\"\" "
            #--------
            alias mmmv_cre_image_by_converting_an_existing_image_to_an_image_with_background_framecolour_000000_3840x2160_t1="mmmv_polish_ABC_2_ACB_exec_t1 \"S_FP_INPUT_FILE_PATH=\\\"\"     \"\\\" ; SI_SCREEN_WIDTH=\\\"3840\\\"; SI_SCREEN_HEIGHT=\\\"2160\\\"; S_WxH=\\\"\\\$SI_SCREEN_WIDTH\\\"'x'\\\"\\\$SI_SCREEN_HEIGHT\\\" ; S_FP_OUTPUT_FILE_PATH=\\\"\\\`echo \\\$S_FP_INPUT_FILE_PATH | gsed -e 's/\\\\([.][^.]\\\\+\\\\)\\\$/_'\\\$S_WxH'\\\\1/g' \\\`\\\" ; sync ; wait ; convert \\\"\\\$S_FP_INPUT_FILE_PATH\\\"  -resize \\\$S_WxH -background \\\"#000000\\\" -gravity center -extent \\\$S_WxH  \\\"\\\$S_FP_OUTPUT_FILE_PATH\\\"\" "
            #--------
            alias mmmv_cre_image_by_converting_an_existing_image_to_an_image_with_background_framecolour_000000_3840x2400_t1="mmmv_polish_ABC_2_ACB_exec_t1 \"S_FP_INPUT_FILE_PATH=\\\"\"     \"\\\" ; SI_SCREEN_WIDTH=\\\"3840\\\"; SI_SCREEN_HEIGHT=\\\"2400\\\"; S_WxH=\\\"\\\$SI_SCREEN_WIDTH\\\"'x'\\\"\\\$SI_SCREEN_HEIGHT\\\" ; S_FP_OUTPUT_FILE_PATH=\\\"\\\`echo \\\$S_FP_INPUT_FILE_PATH | gsed -e 's/\\\\([.][^.]\\\\+\\\\)\\\$/_'\\\$S_WxH'\\\\1/g' \\\`\\\" ; sync ; wait ; convert \\\"\\\$S_FP_INPUT_FILE_PATH\\\"  -resize \\\$S_WxH -background \\\"#000000\\\" -gravity center -extent \\\$S_WxH  \\\"\\\$S_FP_OUTPUT_FILE_PATH\\\"\" "
            #--------
            alias mmmv_cre_image_by_converting_an_existing_image_to_an_image_with_background_framecolour_000000_4096x2160_t1="mmmv_polish_ABC_2_ACB_exec_t1 \"S_FP_INPUT_FILE_PATH=\\\"\"     \"\\\" ; SI_SCREEN_WIDTH=\\\"4096\\\"; SI_SCREEN_HEIGHT=\\\"2160\\\"; S_WxH=\\\"\\\$SI_SCREEN_WIDTH\\\"'x'\\\"\\\$SI_SCREEN_HEIGHT\\\" ; S_FP_OUTPUT_FILE_PATH=\\\"\\\`echo \\\$S_FP_INPUT_FILE_PATH | gsed -e 's/\\\\([.][^.]\\\\+\\\\)\\\$/_'\\\$S_WxH'\\\\1/g' \\\`\\\" ; sync ; wait ; convert \\\"\\\$S_FP_INPUT_FILE_PATH\\\"  -resize \\\$S_WxH -background \\\"#000000\\\" -gravity center -extent \\\$S_WxH  \\\"\\\$S_FP_OUTPUT_FILE_PATH\\\"\" "
            #--------
            alias mmmv_cre_image_by_converting_an_existing_image_to_an_image_with_background_framecolour_000000_5120x1440_t1="mmmv_polish_ABC_2_ACB_exec_t1 \"S_FP_INPUT_FILE_PATH=\\\"\"     \"\\\" ; SI_SCREEN_WIDTH=\\\"5120\\\"; SI_SCREEN_HEIGHT=\\\"1440\\\"; S_WxH=\\\"\\\$SI_SCREEN_WIDTH\\\"'x'\\\"\\\$SI_SCREEN_HEIGHT\\\" ; S_FP_OUTPUT_FILE_PATH=\\\"\\\`echo \\\$S_FP_INPUT_FILE_PATH | gsed -e 's/\\\\([.][^.]\\\\+\\\\)\\\$/_'\\\$S_WxH'\\\\1/g' \\\`\\\" ; sync ; wait ; convert \\\"\\\$S_FP_INPUT_FILE_PATH\\\"  -resize \\\$S_WxH -background \\\"#000000\\\" -gravity center -extent \\\$S_WxH  \\\"\\\$S_FP_OUTPUT_FILE_PATH\\\"\" "
            #--------
            alias mmmv_cre_image_by_converting_an_existing_image_to_an_image_with_background_framecolour_000000_5120x2160_t1="mmmv_polish_ABC_2_ACB_exec_t1 \"S_FP_INPUT_FILE_PATH=\\\"\"     \"\\\" ; SI_SCREEN_WIDTH=\\\"5120\\\"; SI_SCREEN_HEIGHT=\\\"2160\\\"; S_WxH=\\\"\\\$SI_SCREEN_WIDTH\\\"'x'\\\"\\\$SI_SCREEN_HEIGHT\\\" ; S_FP_OUTPUT_FILE_PATH=\\\"\\\`echo \\\$S_FP_INPUT_FILE_PATH | gsed -e 's/\\\\([.][^.]\\\\+\\\\)\\\$/_'\\\$S_WxH'\\\\1/g' \\\`\\\" ; sync ; wait ; convert \\\"\\\$S_FP_INPUT_FILE_PATH\\\"  -resize \\\$S_WxH -background \\\"#000000\\\" -gravity center -extent \\\$S_WxH  \\\"\\\$S_FP_OUTPUT_FILE_PATH\\\"\" "
            #--------
            alias mmmv_cre_image_by_converting_an_existing_image_to_an_image_with_background_framecolour_000000_5120x2880_t1="mmmv_polish_ABC_2_ACB_exec_t1 \"S_FP_INPUT_FILE_PATH=\\\"\"     \"\\\" ; SI_SCREEN_WIDTH=\\\"5120\\\"; SI_SCREEN_HEIGHT=\\\"2880\\\"; S_WxH=\\\"\\\$SI_SCREEN_WIDTH\\\"'x'\\\"\\\$SI_SCREEN_HEIGHT\\\" ; S_FP_OUTPUT_FILE_PATH=\\\"\\\`echo \\\$S_FP_INPUT_FILE_PATH | gsed -e 's/\\\\([.][^.]\\\\+\\\\)\\\$/_'\\\$S_WxH'\\\\1/g' \\\`\\\" ; sync ; wait ; convert \\\"\\\$S_FP_INPUT_FILE_PATH\\\"  -resize \\\$S_WxH -background \\\"#000000\\\" -gravity center -extent \\\$S_WxH  \\\"\\\$S_FP_OUTPUT_FILE_PATH\\\"\" "
            #--------
            alias mmmv_cre_image_by_converting_an_existing_image_to_an_image_with_background_framecolour_000000_640x480_t1="mmmv_polish_ABC_2_ACB_exec_t1 \"S_FP_INPUT_FILE_PATH=\\\"\"     \"\\\" ; SI_SCREEN_WIDTH=\\\"640\\\"; SI_SCREEN_HEIGHT=\\\"480\\\"; S_WxH=\\\"\\\$SI_SCREEN_WIDTH\\\"'x'\\\"\\\$SI_SCREEN_HEIGHT\\\" ; S_FP_OUTPUT_FILE_PATH=\\\"\\\`echo \\\$S_FP_INPUT_FILE_PATH | gsed -e 's/\\\\([.][^.]\\\\+\\\\)\\\$/_'\\\$S_WxH'\\\\1/g' \\\`\\\" ; sync ; wait ; convert \\\"\\\$S_FP_INPUT_FILE_PATH\\\"  -resize \\\$S_WxH -background \\\"#000000\\\" -gravity center -extent \\\$S_WxH  \\\"\\\$S_FP_OUTPUT_FILE_PATH\\\"\" "
            #--------
            alias mmmv_cre_image_by_converting_an_existing_image_to_an_image_with_background_framecolour_000000_7680x4320_t1="mmmv_polish_ABC_2_ACB_exec_t1 \"S_FP_INPUT_FILE_PATH=\\\"\"     \"\\\" ; SI_SCREEN_WIDTH=\\\"7680\\\"; SI_SCREEN_HEIGHT=\\\"4320\\\"; S_WxH=\\\"\\\$SI_SCREEN_WIDTH\\\"'x'\\\"\\\$SI_SCREEN_HEIGHT\\\" ; S_FP_OUTPUT_FILE_PATH=\\\"\\\`echo \\\$S_FP_INPUT_FILE_PATH | gsed -e 's/\\\\([.][^.]\\\\+\\\\)\\\$/_'\\\$S_WxH'\\\\1/g' \\\`\\\" ; sync ; wait ; convert \\\"\\\$S_FP_INPUT_FILE_PATH\\\"  -resize \\\$S_WxH -background \\\"#000000\\\" -gravity center -extent \\\$S_WxH  \\\"\\\$S_FP_OUTPUT_FILE_PATH\\\"\" "
            #--------
            alias mmmv_cre_image_by_converting_an_existing_image_to_an_image_with_background_framecolour_000000_800x600_t1="mmmv_polish_ABC_2_ACB_exec_t1 \"S_FP_INPUT_FILE_PATH=\\\"\"     \"\\\" ; SI_SCREEN_WIDTH=\\\"800\\\"; SI_SCREEN_HEIGHT=\\\"600\\\"; S_WxH=\\\"\\\$SI_SCREEN_WIDTH\\\"'x'\\\"\\\$SI_SCREEN_HEIGHT\\\" ; S_FP_OUTPUT_FILE_PATH=\\\"\\\`echo \\\$S_FP_INPUT_FILE_PATH | gsed -e 's/\\\\([.][^.]\\\\+\\\\)\\\$/_'\\\$S_WxH'\\\\1/g' \\\`\\\" ; sync ; wait ; convert \\\"\\\$S_FP_INPUT_FILE_PATH\\\"  -resize \\\$S_WxH -background \\\"#000000\\\" -gravity center -extent \\\$S_WxH  \\\"\\\$S_FP_OUTPUT_FILE_PATH\\\"\" "
        fi
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_NMAPPLET_EXISTS_ON_PATH" == "t" ]; then
    alias mmmv_ui_networkmanager_nmapplet="nm-applet "
fi
if [ "$SB_NMCLI_EXISTS_ON_PATH" == "t" ]; then
    alias mmmv_ui_networkmanager_nmcli="nmcli "
fi
if [ "$SB_NMTUI_EXISTS_ON_PATH" == "t" ]; then
    alias mmmv_ui_networkmanager_nmtui="nmtui "
fi
#--------------------------------------------------------------------------
if [ "$SB_CALCURSE_EXISTS_ON_PATH" == "t" ]; then
    alias mmmv_calendar_calcurse="calcurse "
fi
if [ "$SB_CAL_EXISTS_ON_PATH" == "" ]; then
    alias mmmv_calendar_cal="cal "
fi
if [ "$SB_NCAL_EXISTS_ON_PATH" == "" ]; then
    alias mmmv_calendar_ncal="ncal "
fi
#--------------------------------------------------------------------------
if [ "$SB_XRANDR_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_GREP_EXISTS_ON_PATH" == "t" ]; then
        S_TMP_0="xrandr | grep '*' "
        alias mmmv_ls_screen_dimensions_t1_xrandr_grep="$S_TMP_0"
        alias mmmv_ls_monitor_parameters_t1_xrandr_grep="$S_TMP_0"
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_TIDY_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_RUBY_EXISTS_ON_PATH" == "t" ]; then
        if [ "$S_FP_TIDY" != "" ]; then
            alias mmmv_format_HTML_with_tidy_t2_hide_warnings="mmmv_polish_ABC_2_ACB_exec_t1 \"S_FP_HTML=\\\"\"   \"\\\" ; $S_FP_TIDY -modify -indent -quiet -wrap 80  \\\$S_FP_HTML 2>/dev/null\" "
        fi
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_REDUPE_EXISTS_ON_PATH" == "t" ]; then
    # The "reundupe" is part of the redupe project.
    alias mmmv_unredupe_t1="$S_FP_NICE -n 5 reundupe "
fi
#--------------------------------------------------------------------------
if [ "$SB_FLATPAK_EXISTS_ON_PATH" == "t" ]; then
    #--------
    # S_FP_0="$HOME/.local/share/flatpak/app/fi.skyjake.Lagrange"
    # if [ -e $S_FP_0 ]; then
    #     if [ -d $S_FP_0 ]; then
    #         alias mmmv_geminibrowser_Lagrange="mmmv_run_flatpak  fi.skyjake.Lagrange "
    #     fi
    # fi
    # Outcommented, because the Lagrange binary from flathub crashed.
    #--------
    S_FP_0="$HOME/.local/share/flatpak/app/com.github.dimkr.gplaces"
    if [ -e $S_FP_0 ]; then
        if [ -d $S_FP_0 ]; then
            alias mmmv_geminibrowser_gplaces="mmmv_run_flatpak  com.github.dimkr.gplaces "
        fi
    fi
    #--------
fi
#--------------------------------------------------------------------------
if [ "$SB_TIME_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
        #------------------------------------------------------------------
        # The S_FP_TIME is used to avoid using possible "time" alias.
        alias mmmv_measure_RAM_usage_maximum_t1="$S_FP_TIME -f \$'\\nMaximum RAM allocation was \\e[36m%M KiB \\e[39m.\\n' " # programname_comes_here
        # Alias usage example:
        #     mmmv_measure_RAM_usage_maximum_t1 ls
        #     mmmv_measure_RAM_usage_maximum_t1 xeyes
        #------------------------------------------------------------------
        alias mmmv_measure_RAM_usage_t2="$S_FP_TIME -v " # programname_comes_here
        #------------------------------------------------------------------
    else
        if [ "$SB_OPERATINGSYSTEM_BSD" == "t" ]; then
            alias mmmv_measure_RAM_usage_t2="$S_FP_TIME -l " # programname_comes_here
        fi
    fi
fi
#--------------------------------------------------------------------------
# Bash testlines:
#     echo "aa,bb,cc" | gsed -e 's/[,]/ /g'
#
#     cat ./lines.txt | gsed -e 's/[,]/ /g' | gsed -e 's/^[[:blank:]]\+//g' | gsed -e 's/[[:blank:]]\+$//g' | gsed -e 's/[[:blank:]]\+/ /g' | `which grep` -E '^.+$' | gsed -s 's/[[:blank:]]*$/, /g' | tr -d '\n\r' | gsed -e 's/[,] $//g'
#
#     mmmv_polish_ABC_2_ACB_exec_t1 "cat "   " | gsed -e 's/[,]/ /g' | gsed -e 's/^[[:blank:]]\\+//g' | gsed -e 's/[[:blank:]]\\+\$//g' | gsed -e 's/[[:blank:]]\\+/ /g' | \`which grep\` -E '^.+\$' | gsed -s 's/[[:blank:]]*\$/, /g' | tr -d '\\n\\r' | gsed -e 's/[,] \$//g' "
#

if [ "$SB_RUBY_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_GSED_EXISTS_ON_PATH" == "t" ]; then
        if [ "$SB_GREP_EXISTS_ON_PATH" == "t" ]; then
            if [ "$SB_TR_EXISTS_ON_PATH" == "t" ]; then
                if [ "$SB_CAT_EXISTS_ON_PATH" == "t" ]; then
                    alias mmmv_text_processing_lines_to_CSV_t1="mmmv_polish_ABC_2_ACB_exec_t1 \"$S_FP_CAT \"   \" | $S_CMD_GNU_SED -e 's/[,]/ /g' | $S_CMD_GNU_SED -e 's/^[[:blank:]]\\\\+//g' | $S_CMD_GNU_SED -e 's/[[:blank:]]\\\\+\\\$//g' | $S_CMD_GNU_SED -e 's/[[:blank:]]\\\\+/ /g' | $S_FP_GREP -E '^.+\\\$' | $S_CMD_GNU_SED -s 's/[[:blank:]]*\\\$/, /g' | $S_FP_TR -d '\\\\n\\\\r' | $S_CMD_GNU_SED -e 's/[,] \\\$//g' \" "  # <input data file path comes here, output goes to stdout>
                fi
            fi
        fi
    fi
fi
#--------------------------------------------------------------------------
# Just for copy-pasting:
#     #----alias---code--template---start----
#     # S_FN_TEMPLATE="template_of_mistral_ai_chat_session_t1.md"
#     # S_FP_TEMPLATE="$HOME/m_local/lib/templates/$S_FN_TEMPLATE"
#     # # The alias is for copying a template file to the working directory
#     # # without overwriting any files.
#     # S_FP_TEMPLATE="$S_FP_TEMPLATE" ;
#     # S_FP_NEW_FILE_CANDIDATE="`pwd`/$S_FN_TEMPLATE" ;
#     # if [ -e "$S_FP_TEMPLATE" ]; then
#     #     if [ ! -d "$S_FP_TEMPLATE" ]; then
#     #         if [ ! -h "$S_FP_TEMPLATE" ]; then
#     #             #---------------------------------------------------
#     #             if [ ! -e "$S_FP_NEW_FILE_CANDIDATE" ]; then
#     #                 if [ ! -h "$S_FP_NEW_FILE_CANDIDATE" ]; then
#     #                     cp $S_FP_TEMPLATE $S_FP_NEW_FILE_CANDIDATE ;
#     #                     if [ "$?" != "0" ]; then
#     #                         echo "" ;
#     #                         echo -e "\e[31mFailed to create file \e[39m" ;
#     #                         echo "    $S_FP_NEW_FILE_CANDIDATE" ;
#     #                         echo "while the template " ;
#     #                         echo "    $S_FP_TEMPLATE" ;
#     #                         echo "is available. " ;
#     #                         echo "GUID=='ffcb9218-0679-4325-b3ff-03a230708ae7'" ;
#     #                         echo "" ;
#     #                     else
#     #                         sync ;
#     #                     fi ;
#     #                 else
#     #                     echo "" ;
#     #                     echo "Broken symlink " ;
#     #                     echo "    $S_FP_NEW_FILE_CANDIDATE " ;
#     #                     echo -e "\e[31malready exists\e[39m." ;
#     #                     echo "Not overwriting it." ;
#     #                     echo "GUID=='ce30a741-979c-49fc-a1ff-03a230708ae7'" ;
#     #                     echo "" ;
#     #                 fi ;
#     #             else
#     #                 echo "" ;
#     #                 if [ -d "$S_FP_NEW_FILE_CANDIDATE" ]; then
#     #                     if [ -h "$S_FP_NEW_FILE_CANDIDATE" ]; then
#     #                         echo "Symlink to a folder" ;
#     #                     else
#     #                         echo "Folder" ;
#     #                     fi ;
#     #                 else
#     #                     if [ -h "$S_FP_NEW_FILE_CANDIDATE" ]; then
#     #                         echo "Symlink to a file" ;
#     #                     else
#     #                         echo "File" ;
#     #                     fi ;
#     #                 fi ;
#     #                 echo "    $S_FP_NEW_FILE_CANDIDATE " ;
#     #                 echo -e "\e[31malready exists\e[39m." ;
#     #                 echo "Not overwriting it." ;
#     #                 echo "GUID=='97fc195d-c747-4c8d-b3ff-03a230708ae7'" ;
#     #                 echo "" ;
#     #             fi ;
#     #             #---------------------------------------------------
#     #         else
#     #             echo "" ;
#     #             echo "The path of a template file" ;
#     #             echo "    $S_FP_TEMPLATE" ;
#     #             echo -e "\e[31mreferences a symlink to a file\e[39m," ;
#     #             echo "but a plain file is expected." ;
#     #             echo "GUID=='620d814c-e7a0-4d82-a4ff-03a230708ae7'" ;
#     #             echo "" ;
#     #         fi ;
#     #     else
#     #         echo "" ;
#     #         echo "The path of a template file" ;
#     #         echo -e "    $S_FP_TEMPLATE" ;
#     #         if [ -h "$S_FP_TEMPLATE" ]; then
#     #             echo -e "\e[31mreferences a symlink to a folder\e[39m," ;
#     #         else
#     #             echo -e "\e[31mreferences a folder\e[39m," ;
#     #         fi ;
#     #         echo "but a plain file is expected." ;
#     #         echo "GUID=='34a2bf10-47cb-4988-85ef-03a230708ae7'" ;
#     #         echo "" ;
#     #     fi ;
#     # else
#     #     echo "" ;
#     #     if [ -h "$S_FP_TEMPLATE" ]; then
#     #         echo "The path of a template file" ;
#     #         echo -e "    $S_FP_TEMPLATE" ;
#     #         echo -e "\e[31mreferences a broken symlink.\e[39m." ;
#     #     else
#     #         echo -e "\e[31mTemplate file\e[39m" ;
#     #         echo -e "    $S_FP_TEMPLATE" ;
#     #         echo -e "\e[31mis missing\e[39m." ;
#     #     fi ;
#     #     echo "GUID=='468b9f4a-09a7-41bd-93ef-03a230708ae7'" ;
#     #     echo "" ;
#     # fi ;
#     # #----alias---code--template---end-----
#     S_FN_TEMPLATE="template_of_mistral_ai_chat_session_t1.md"
#     S_FP_TEMPLATE="$HOME/m_local/lib/templates/$S_FN_TEMPLATE"
#     if [ -e "$S_FP_TEMPLATE" ]; then
#         if [ ! -d "$S_FP_TEMPLATE" ]; then
#             alias mmmv_cre_Mistral_AI_chat_session_template_t1_md="S_FP_TEMPLATE=\"$S_FP_TEMPLATE\" ; S_FP_NEW_FILE_CANDIDATE=\"\`pwd\`/$S_FN_TEMPLATE\" ; if [ -e \"\$S_FP_TEMPLATE\" ]; then if [ ! -d \"\$S_FP_TEMPLATE\" ]; then if [ ! -h \"\$S_FP_TEMPLATE\" ]; then if [ ! -e \"\$S_FP_NEW_FILE_CANDIDATE\" ]; then if [ ! -h \"\$S_FP_NEW_FILE_CANDIDATE\" ]; then cp \$S_FP_TEMPLATE \$S_FP_NEW_FILE_CANDIDATE ; if [ \"\$?\" != \"0\" ]; then echo \"\" ; echo -e \"\\e[31mFailed to create file \\e[39m\" ; echo \"    \$S_FP_NEW_FILE_CANDIDATE\" ; echo \"while the template \" ; echo \"    \$S_FP_TEMPLATE\" ; echo \"is available. \" ; echo \"GUID=='3107831e-2178-4fe7-b3ef-03a230708ae7'\" ; echo \"\" ; else sync ; fi ; else echo \"\" ; echo \"Broken symlink \" ; echo \"    \$S_FP_NEW_FILE_CANDIDATE \" ; echo -e \"\\e[31malready exists\\e[39m.\" ; echo \"Not overwriting it.\" ; echo \"GUID=='64f03a24-85da-4f01-83ef-03a230708ae7'\" ; echo \"\" ; fi ; else echo \"\" ; if [ -d \"\$S_FP_NEW_FILE_CANDIDATE\" ]; then if [ -h \"\$S_FP_NEW_FILE_CANDIDATE\" ]; then echo \"Symlink to a folder\" ; else echo \"Folder\" ; fi ; else if [ -h \"\$S_FP_NEW_FILE_CANDIDATE\" ]; then echo \"Symlink to a file\" ; else echo \"File\" ; fi ; fi ; echo \"    \$S_FP_NEW_FILE_CANDIDATE \" ; echo -e \"\\e[31malready exists\\e[39m.\" ; echo \"Not overwriting it.\" ; echo \"GUID=='3cf6fdb3-318d-4bb9-84ef-03a230708ae7'\" ; echo \"\" ; fi ; else echo \"\" ; echo \"The path of a template file\" ; echo \"    \$S_FP_TEMPLATE\" ; echo -e \"\\e[31mreferences a symlink to a file\\e[39m,\" ; echo \"but a plain file is expected.\" ; echo \"GUID=='7ff9724f-eeb2-403e-a4ef-03a230708ae7'\" ; echo \"\" ; fi ; else echo \"\" ; echo \"The path of a template file\" ; echo -e \"    \$S_FP_TEMPLATE\" ; if [ -h \"\$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mreferences a symlink to a folder\\e[39m,\" ; else echo -e \"\\e[31mreferences a folder\\e[39m,\" ; fi ; echo \"but a plain file is expected.\" ; echo \"GUID=='5cf15741-8df0-405b-83ef-03a230708ae7'\" ; echo \"\" ; fi ; else echo \"\" ; if [ -h \"\$S_FP_TEMPLATE\" ]; then echo \"The path of a template file\" ; echo -e \"    \$S_FP_TEMPLATE\" ; echo -e \"\\e[31mreferences a broken symlink.\\e[39m.\" ; else echo -e \"\\e[31mTemplate file\\e[39m\" ; echo -e \"    \$S_FP_TEMPLATE\" ; echo -e \"\\e[31mis missing\\e[39m.\" ; fi ; echo \"GUID=='5ac7af47-8739-4160-a3df-03a230708ae7'\" ; echo \"\" ; fi ; "
#         fi
#     fi
#     #----------------------------------------------------------------------

#==========================================================================
# S_VERSION_OF_THIS_FILE="c59fb954-148a-43a2-b340-03a230708ae7"
#==========================================================================
