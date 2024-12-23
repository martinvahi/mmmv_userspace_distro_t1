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
    echo "GUID=='169ee349-4017-44ed-bfe8-2163c051c8e7'"
    echo ""
    exit $S_ERR_CODE # exit with an error
fi
#==========================================================================
func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
    "$SB_OPERATINGSYSTEM_LINUX" "SB_OPERATINGSYSTEM_LINUX" \
    "47f7ab55-fba6-4362-95e8-2163c051c8e7"
#------------------------------------------
func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
    "$SB_OPERATINGSYSTEM_LINUX_WSL" "SB_OPERATINGSYSTEM_LINUX_WSL" \
    "24e6dc38-da1e-4e86-b5e8-2163c051c8e7"
#------------------------------------------
func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
    "$SB_OPERATINGSYSTEM_LINUX_ANDROID" "SB_OPERATINGSYSTEM_LINUX_ANDROID" \
    "5bde1564-f694-4db0-81e8-2163c051c8e7"
#------------------------------------------
func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
    "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" "SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" \
    "cfd6af31-1abb-4c22-94e8-2163c051c8e7"
#------------------------------------------
func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
    "$SB_OPERATINGSYSTEM_BSD" "SB_OPERATINGSYSTEM_BSD" \
    "15c40944-7e81-4bc1-a5e8-2163c051c8e7"
#------------------------------------------
func_mmmv_verify_sb_t_f_but_do_not_exit_t2 \
    "$SB_OPERATINGSYSTEM_BSD_FREEBSD" "SB_OPERATINGSYSTEM_BSD_FREEBSD" \
    "d38c015f-0cf4-47e2-92d8-2163c051c8e7"
#--------------------------------------------------------------------------
if [ "$SB_OPERATINGSYSTEM_LINUX" == "f" ]; then
    if [ "$SB_OPERATINGSYSTEM_LINUX_WSL" == "t" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo -e "\e[31mThe code of this Bash file is flawed.\e[39m"
            echo "GUID=='71256bbb-8936-4340-b1e8-2163c051c8e7'"
            echo ""
        fi
    fi
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID" == "t" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo -e "\e[31mThe code of this Bash file is flawed.\e[39m"
            echo "GUID=='2e9fcb92-5a1a-4f58-95e8-2163c051c8e7'"
            echo ""
        fi
    fi
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID_TERMUX" == "t" ]; then
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo -e "\e[31mThe code of this Bash file is flawed.\e[39m"
            echo "GUID=='1ec68f29-6be2-4683-b1e8-2163c051c8e7'"
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
            echo "GUID=='c6a04d4a-5d27-487e-83e8-2163c051c8e7'"
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
            echo "GUID=='490c8627-a582-4516-a4d8-2163c051c8e7'"
            echo ""
        fi
    fi
fi
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
            alias mmmv_admin_create_symlink_to_cupspdf_t1="S_FP_LINK=\"\$HOME/CUPS_PDF\" ; S_FP_CUPSPDF_OUTPUT_DIR_0=\"/var/spool/cups-pdf/ANONYMOUS\" ; S_FP_CUPSPDF_OUTPUT_DIR_X=\"\$S_FP_CUPSPDF_OUTPUT_DIR_0\" ; S_FP_CUPSPDF_OUTPUT_DIR_1=\"/var/spool/cups-pdf/\`whoami\`\" ; if [ -e \"\$S_FP_CUPSPDF_OUTPUT_DIR_1\" ]; then S_FP_CUPSPDF_OUTPUT_DIR_X=\"\$S_FP_CUPSPDF_OUTPUT_DIR_1\" ; fi ; if [ -e \"\$S_FP_CUPSPDF_OUTPUT_DIR_X\" ]; then if [ -d \"\$S_FP_CUPSPDF_OUTPUT_DIR_X\" ]; then if [ -e \"\$S_FP_LINK\" ]; then echo \"\" ; echo \"Something with the path of \" ; echo \"    \$S_FP_LINK\" ; echo -e \"\e[31malready exists.\e[39m Doing nothing.\" ; echo \"GUID=='630f0d55-89f6-457b-b3d8-2163c051c8e7'\" ; echo \"\" ; else if [ -h \"\$S_FP_LINK\" ]; then echo \"\" ; echo \"A broken symlink with the path of \" ; echo \"    \$S_FP_LINK\" ; echo -e \"\e[31malready exists.\e[39m Doing nothing.\" ; echo \"GUID=='87dfc629-fafe-44b4-a5d8-2163c051c8e7'\" ; echo \"\" ; else ln -s \"\$S_FP_CUPSPDF_OUTPUT_DIR_X\" \"\$S_FP_LINK\" ; sync; wait; sync ;  if [ ! -e \"\$S_FP_LINK\" ]; then echo \"\" ; echo -e \"\e[31mFailed to create symlink \e[39m\" ; echo \"    \$S_FP_LINK\" ; echo \"    -->\" ; echo \"    \$S_FP_CUPSPDF_OUTPUT_DIR_X\" ; echo \"GUID=='27fbede4-a211-4080-84d8-2163c051c8e7'\" ; echo \"\" ; fi ; fi ; fi ; else echo \"\" ; echo \"The \" ; echo \"    \$S_FP_CUPSPDF_OUTPUT_DIR_X\" ; if [ -h \"\$S_FP_CUPSPDF_OUTPUT_DIR_X\" ]; then echo \"is a symlink to a file, but a folder is expected.\" ; else echo \"is a file, but a folder is expected.\" ; fi ; echo \"GUID=='0a9c5374-bd1e-40cd-92d8-2163c051c8e7'\" ; echo \"\" ; fi ; else echo \"\" ; echo -e \"\e[31mFolder is missing. \e[39m\" ; echo \"    \$S_FP_CUPSPDF_OUTPUT_DIR_X\" ; echo \"It MIGHT be that the cups-pdf has not been installed.\" ; echo \"GUID=='0a15f312-ff67-41c2-82d8-2163c051c8e7'\" ; echo \"\" ; fi ;"
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
            #                 echo "GUID=='04320944-5966-431f-83d8-2163c051c8e7'" ;
            #                 echo "" ;
            #             else
            #                 if [ -h "$S_FP_LINK" ]; then
            #                     echo "" ;
            #                     echo "A broken symlink with the path of " ;
            #                     echo "    $S_FP_LINK" ;
            #                     echo -e "\e[31malready exists.\e[39m Doing nothing." ;
            #                     echo "GUID=='814bdd17-4d6b-4873-82c8-2163c051c8e7'" ;
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
            #                         echo "GUID=='27e57951-7b13-47bd-82c8-2163c051c8e7'" ;
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
            #             echo "GUID=='b4ba9a2a-1970-4a46-91b8-2163c051c8e7'" ;
            #             echo "" ;
            #         fi ;
            #     else 
            #         echo "" ;
            #         echo -e "\e[31mFolder is missing. \e[39m" ;
            #         echo "    $S_FP_CUPSPDF_OUTPUT_DIR_X" ;
            #         echo "It MIGHT be that the cups-pdf has not been installed." ;
            #         echo "GUID=='dd2f4143-d9e5-4828-85b8-2163c051c8e7'" ;
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
            echo "GUID=='bfe8e116-2d4d-42f2-b5b8-2163c051c8e7'"
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
                "5b729b5d-008e-4348-b4d8-2163c051c8e7" \
                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        fi
    fi
    #----------------------------------------------------------------------
    if [ "$SB_OK2ATTEMPT" == "t" ]; then
        #------------------------------------------------------------------
        local S_ERR_MSG_SUBPART_01=""
        if [ "$S_GUID_CANDIDATE_OPTIONAL" == "" ]; then
            S_GUID_CANDIDATE_OPTIONAL="161b0c49-c12c-4bc8-81d8-2163c051c8e7"
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
                        echo "GUID=='5108c1d2-f89d-4040-b2b8-2163c051c8e7'"
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
            #                    echo \"GUID=='411941d7-a990-4ea6-a2a8-2163c051c8e7'\"; \
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
            #                echo \"GUID=='5adbb0c3-f709-442b-83a8-2163c051c8e7'\"; \
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
            #            echo \"GUID=='33868b69-647c-4ff5-b5a8-2163c051c8e7'\"; \
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
            #        echo \"GUID=='a96c9d39-87d4-4a54-b1a8-2163c051c8e7'\"; \
            #        if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then \
            #            echo \"$S_ERR_MSG_SUBPART_01\"; \
            #        fi;\
            #        echo \"\"; \
            #    fi; \
            #    "
            # #------------------------------
            # is meant to be processed with Vim macros for assembling the 
            alias $S_ALIAS_NAME=" SB_USE_UPGUID_ON_COPIED_FILE=\"$SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL\"; if [ -e \"$S_FP_TEMPLATE\" ]; then if [ ! -d \"$S_FP_TEMPLATE\" ]; then if [ ! -e \"$S_FP_NEW\" ]; then cp $S_FP_TEMPLATE $S_FP_NEW ; if [ \"\$?\" == \"0\" ]; then sync; wait; sync; echo \"\"; echo \"Created a new file with the path of \"; echo \"\"; echo -e \"\\e[32m    $S_FP_NEW \\e[39m\"; echo \"\"; if [ \"\$SB_USE_UPGUID_ON_COPIED_FILE\" == \"t\" ]; then if [ \"\`which upguid 2> /dev/null \`\" != \"\" ]; then upguid -f  $S_FP_NEW; sync; wait; sync; chmod 0700 $S_FP_NEW; sync; wait; sync; else echo -e \"Could not find \\e[31mupguid\\e[39m from the PATH.\"; echo \"\"; fi fi else echo -e \"\\e[31mFailed to create file \\e[39m \"; echo \"\"; echo \"    $S_FP_NEW \"; echo \"\"; echo \"GUID=='66704e59-6c58-4184-85a8-2163c051c8e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; if [ -d \"$S_FP_NEW\" ]; then echo \"A folder with the path of \"; else echo \"A file with the path of \"; fi; echo \"\"; echo \"    $S_FP_NEW\"; echo \"\"; echo -e \"\\e[31malready exists\\e[39m. Not overwriting.\"; echo \"GUID=='6a1e6ee1-8075-4b99-a4a8-2163c051c8e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; echo \"The template \"; echo \"\"; echo \"    $S_FP_TEMPLATE\"; echo \"\"; if [ -h \"$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mis a symlink to a folder,\\e[39m\"; else echo -e \"\\e[31mis a folder,\\e[39m\"; fi; echo -e \"\\e[31mbut a file is expected.\\e[39m\"; echo \"Not copying anything.\"; echo \"GUID=='3b58c215-9954-4f14-b498-2163c051c8e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; echo \"The template \"; echo \"\"; echo \"    $S_FP_TEMPLATE\"; echo \"\"; if [ -h \"$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mis a broken symlink,\\e[39m\"; else echo -e \"\\e[31mis missing,\\e[39m\"; fi; echo -e \"\\e[31mbut a file is expected.\\e[39m\"; echo \"Not copying anything.\"; echo \"GUID=='4fbf0350-8978-4d4e-a598-2163c051c8e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; "
            #--------------------
            # The following versions are older versions that have been tested to work.
            # alias $S_ALIAS_NAME=" SB_USE_UPGUID_ON_COPIED_FILE=\"$SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL\"; if [ -e \"$S_FP_TEMPLATE\" ]; then if [ ! -d \"$S_FP_TEMPLATE\" ]; then if [ ! -e \"$S_FP_NEW\" ]; then cp $S_FP_TEMPLATE $S_FP_NEW ; if [ \"\$?\" == \"0\" ]; then sync; wait; sync; echo \"\"; echo \"Created a new file with the path of \"; echo \"\"; echo \"    $S_FP_NEW \"; echo \"\"; if [ \"\$SB_USE_UPGUID_ON_COPIED_FILE\" == \"t\" ]; then if [ \"\`which upguid 2> /dev/null \`\" != \"\" ]; then upguid -f  $S_FP_NEW; sync; wait; sync; chmod 0700 $S_FP_NEW; sync; wait; sync; else echo -e \"Could not find \\e[31mupguid\\e[39m from the PATH.\"; echo \"\"; fi fi else echo -e \"\\e[31mFailed to create file \\e[39m \"; echo \"\"; echo \"    $S_FP_NEW \"; echo \"\"; echo \"GUID=='f462204d-b14c-46a0-9198-2163c051c8e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; if [ -d \"$S_FP_NEW\" ]; then echo \"A folder with the path of \"; else echo \"A file with the path of \"; fi; echo \"\"; echo \"    $S_FP_NEW\"; echo \"\"; echo -e \"\\e[31malready exists\\e[39m. Not overwriting.\"; echo \"GUID=='9f5a6411-0f20-44f2-8498-2163c051c8e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; echo \"The template \"; echo \"\"; echo \"    $S_FP_TEMPLATE\"; echo \"\"; if [ -h \"$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mis a symlink to a folder,\\e[39m\"; else echo -e \"\\e[31mis a folder,\\e[39m\"; fi; echo -e \"\\e[31mbut a file is expected.\\e[39m\"; echo \"Not copying anything.\"; echo \"GUID=='2cfd47e4-4989-4713-9598-2163c051c8e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; echo \"The template \"; echo \"\"; echo \"    $S_FP_TEMPLATE\"; echo \"\"; if [ -h \"$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mis a broken symlink,\\e[39m\"; else echo -e \"\\e[31mis missing,\\e[39m\"; fi; echo -e \"\\e[31mbut a file is expected.\\e[39m\"; echo \"Not copying anything.\"; echo \"GUID=='37d51d2d-b5e8-4535-b588-2163c051c8e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; "
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
        S_GUID_CANDIDATE_OPTIONAL="ea7c2451-30a5-448e-83d8-2163c051c8e7"
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
        # alias mmmv_cre_image_length_limiter_t1="nice -n 10 tar -xzf $MMMV_USERSPACE_DISTRO_T1_TEMPLATES/image_edge_length_limiter_t1.tar.gz ./ "
        # The following Bash code segment 
        # #------------------------------
        #local S_FOO="\
        #    if [ -e \"$S_FP_TEMPLATE\" ]; then \
        #        if [ ! -d \"$S_FP_TEMPLATE\" ]; then \
        #            if [ ! -e \"$S_FP_NEW\" ]; then \
        #                nice -n 10 tar -xzf $S_FP_TEMPLATE ./ ; \
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
        #                    echo \"GUID=='1be09c94-be15-4614-9288-2163c051c8e7'\"; \
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
        #                echo \"GUID=='5b774d82-b762-4d0e-b588-2163c051c8e7'\"; \
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
        #            echo \"GUID=='a92bf53f-56e0-4483-8388-2163c051c8e7'\"; \
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
        #        echo \"GUID=='45dd252f-e13e-4134-8388-2163c051c8e7'\"; \
        #        if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then \
        #            echo \"$S_ERR_MSG_SUBPART_01\"; \
        #        fi;\
        #        echo \"\"; \
        #    fi; \
        #    "
        # #------------------------------
        # is meant to be processed with Vim macros for assembling the 
        alias $S_ALIAS_NAME="if [ -e \"$S_FP_TEMPLATE\" ]; then if [ ! -d \"$S_FP_TEMPLATE\" ]; then if [ ! -e \"$S_FP_NEW\" ]; then nice -n 10 tar -xzf $S_FP_TEMPLATE ./ ; if [ \"\$?\" == \"0\" ]; then sync; wait; echo \"\"; if [ -d \"$S_FP_NEW\" ]; then if [ -h \"$S_FP_NEW\" ]; then echo \"Created a new symlink to a folder with the path of \"; else echo \"Created a new folder with the path of \"; fi; else if [ -h \"$S_FP_NEW\" ]; then echo \"Created a new symlink to a file with the path of \"; else echo \"Created a new file with the path of \"; fi; fi; echo \"\"; echo \"    $S_FP_NEW \"; echo \"\"; else echo -e \"\\e[31mFailed to create \\e[39m \"; echo \"\"; echo \"    $S_FP_NEW \"; echo \"\"; echo \"GUID=='11cb8d47-1b5a-438c-8388-2163c051c8e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; if [ -d \"$S_FP_NEW\" ]; then echo \"A folder with the path of \"; else echo \"A file with the path of \"; fi; echo \"\"; echo \"    $S_FP_NEW\"; echo \"\"; echo -e \"\\e[31malready exists\\e[39m. Not overwriting.\"; echo \"GUID=='1c8ca63d-99dd-4cd6-a378-2163c051c8e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; echo \"The template \"; echo \"\"; echo \"    $S_FP_TEMPLATE\"; echo \"\"; if [ -h \"$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mis a symlink to a folder,\\e[39m\"; else echo -e \"\\e[31mis a folder,\\e[39m\"; fi; echo -e \"\\e[31mbut a file is expected.\\e[39m\"; echo \"Not copying anything.\"; echo \"GUID=='84a1d5a5-ba1f-454a-9378-2163c051c8e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; else echo \"\"; echo \"The template \"; echo \"\"; echo \"    $S_FP_TEMPLATE\"; echo \"\"; if [ -h \"$S_FP_TEMPLATE\" ]; then echo -e \"\\e[31mis a broken symlink,\\e[39m\"; else echo -e \"\\e[31mis missing,\\e[39m\"; fi; echo -e \"\\e[31mbut a file is expected.\\e[39m\"; echo \"Not copying anything.\"; echo \"GUID=='34e8fa26-aa06-4130-8178-2163c051c8e7'\"; if [ \"$S_ERR_MSG_SUBPART_01\" != \"\" ]; then echo \"$S_ERR_MSG_SUBPART_01\"; fi; echo \"\"; fi; "
        #--------------------
    fi
    #----------------------------------------------------------------------
} # func_mmmv_declare_template_creation_alias_tar_gz_t1

#--------------------------------------------------------------------------
S_TMP_CMD_CRE_GIT_CLONE=" if [ ! -e \"./pull_new_version_from_git_repository.bash\" ]; then cp $MMMV_USERSPACE_DISTRO_T1_TEMPLATES/pull_new_version_from_git_repository.bash ./ ; sync; wait; sync; chmod 0700 ./pull_new_version_from_git_repository.bash ; sync; wait; sync; fi ; if [ ! -e \"./the_repository_clones\" ]; then mkdir -p ./the_repository_clones ; sync; wait; sync; chmod -f -R 0700 ./the_repository_clones ; sync; wait; sync; fi ; " 
alias mmmv_cre_git_clone="$S_TMP_CMD_CRE_GIT_CLONE"

# The next line
S_TMP_FP_0="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin/mmmv_github_repos_2_clonescript_bash_t1.rb"
# uses a full path, because at this line the 
#    $MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/bin
# is only on the Z_PATH, not yet on PATH.

func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
    "$S_TMP_FP_0" "151df273-7b1b-49b2-82d8-2163c051c8e7" \
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
    "65da70f9-bc2b-4ace-93d8-2163c051c8e7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_disassembly_and_reassembly_script_t1" \
    "disassembly_and_reassembly_t1.bash" \
    "d1efaa23-9618-4a14-a1c8-2163c051c8e7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_download_files_with_wget_template_01" \
    "download_files_with_wget_template_01.bash" \
    "9609c640-1582-45c4-a5c8-2163c051c8e7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_Fossil_wiki_page_HTML_expimp_template_01" \
    "download_and_upload_Fossil_wiki_HTML.bash" \
    "58b2ba10-1cc0-4614-93c8-2163c051c8e7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_fossil_clone" \
    "mmmv_Fossil_operator_t1.bash" \
    "25dfb992-3d3d-4cd3-87b8-2163c051c8e7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_ruby_console_application_t2" \
    "ruby_console_application_template_t2.rb" \
    "7316462b-9937-4582-a1b8-2163c051c8e7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_SQL_dump_script" \
    "create_backup_from_MySQL_db.bash" \
    "d7da8138-f337-44ae-b2b8-2163c051c8e7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_SSH_config_template" \
    "_ssh_config_template.txt" \
    "e19deb33-39f6-4634-b2a8-2163c051c8e7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_SSH_tunnel_creation_script_template_t1" \
    "ssh_tunnel_t1.bash" \
    "e0224c5b-693a-47be-a3a8-2163c051c8e7"

func_mmmv_declare_template_creation_alias_t2 \
    "mmmv_cre_WARC_Tools" \
    "2016_12_xx_WARC_tools.tar.xz" \
    "b420f37c-5bda-4520-b3a8-2163c051c8e7"

#------------
if [ "$SB_TAR_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_GUNZIP_EXISTS_ON_PATH" == "t" ]; then
        S_TMP_0="nice -n 10 tar -xzf $MMMV_USERSPACE_DISTRO_T1_TEMPLATES/rsync_based_backups_creator.tar.gz ./ "
        if [ "$SB_RSYNC_EXISTS_ON_PATH" == "t" ]; then
            alias mmmv_cre_rsync_based_backups_creator="$S_TMP_0"
        else
            if [ "$SB_RSYNC_EXISTS_ON_PATH" != "f" ]; then
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo -e "\e[31mThe ~/.bashrc or some subpart of it is flawed.\e[39m"
                    echo "GUID=='315abf0d-6881-40dc-8578-2163c051c8e7'"
                fi
            fi
            alias mmmv_cre_rsync_based_backups_creator="echo \"\" ; echo \"The \\\"rsync\\\" is not on PATH.\" ; echo \"GUID=='d13fdf11-e235-4772-b478-2163c051c8e7'\" ; echo \"\" ; $S_TMP_0"
        fi
  fi
fi
#------------
if [ "$SB_TAR_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_GUNZIP_EXISTS_ON_PATH" == "t" ]; then
        #----
        func_mmmv_declare_template_creation_alias_tar_gz_t1 \
            "mmmv_cre_bash_boilerplate_t6_copy" \
            "2024_07_13_mmmv_bash_boilerplate_t6.tar.gz" \
            "2024_07_13_mmmv_bash_boilerplate_t6" \
            "846cb91f-01ee-48fe-a3a8-2163c051c8e7"
        #----
        func_mmmv_declare_template_creation_alias_tar_gz_t1 \
            "mmmv_cre_image_length_limiter_t1" \
            "image_edge_length_limiter_t1.tar.gz" \
            "image_edge_length_limiter_t1" \
            "53a9a43c-08a9-43c9-94a8-2163c051c8e7"
        #----
        func_mmmv_declare_template_creation_alias_tar_gz_t1 \
            "mmmv_cre_installed_programs_checklist_t1" \
            "2021_02_xx_mmmv_installed_programs_checklist_t1_template.tar.gz" \
            "installed_programs_checklist_t1_template" \
            "13df2786-9953-41cc-82a8-2163c051c8e7"
        #----
        func_mmmv_declare_template_creation_alias_tar_gz_t1 \
            "mmmv_cre_ruby_boilerplate_t6" \
            "2024_01_27_mmmv_ruby_boilerplate_t6.tar.gz" \
            "2024_01_27_mmmv_ruby_boilerplate_t6" \
            "d5b57853-2e19-4943-a498-2163c051c8e7"
        #----
        func_mmmv_declare_template_creation_alias_tar_gz_t1 \
            "mmmv_cre_ZeroNet_Rev3703_from_mmmv_repackaging" \
            "2018_11_08_ZeroNet_Rev3703_mmmv_repackaging_t2.tar.gz" \
            "2018_11_08_ZeroNet_Rev3703_mmmv_repackaging_t2" \
            "52a35953-e467-40db-b498-2163c051c8e7"
        #----
        func_mmmv_declare_template_creation_alias_tar_gz_t1 \
            "mmmv_cre_vimwiki_project_wiki_t1" \
            "project_wiki_t1.tar.gz" \
            "project_wiki" \
            "2bf1994f-63d0-4e02-b298-2163c051c8e7"
        #----
        func_mmmv_declare_template_creation_alias_tar_gz_t1 \
            "mmmv_cre_data_collection_t1" \
            "2024_11_23_data_collection_template_01.tar.gz" \
            "data_collection" \
            "9a254c2f-3c01-425a-8498-2163c051c8e7"
        #----
    fi
fi
#------------
func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_COMMENTS_txt_t1" \
    "COMMENTS_txt_template_t1.txt" \
    "COMMENTS.txt" \
    "d17f4c84-fb7e-4794-b498-2163c051c8e7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_COMMENTS_txt_t2" \
    "COMMENTS_txt_template_t2.txt" \
    "COMMENTS.txt" \
    "1e56a8f1-e826-4e0c-9298-2163c051c8e7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_CVS_clonescript_t1" \
    "CVS_clonescript_template_01.bash" \
    "CVS_clonescript.bash" \
    "489ca05a-d84a-40fa-9588-2163c051c8e7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_x_txt_git_pack_Bash_script_t1" \
    "mmmv_git_pack_template_t1.bash" \
    "x.txt" \
    "25543392-54d8-4877-8f88-2163c051c8e7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_Rakefile_template_t1" \
    "2022_10_06_Rakefile_template_t1.rb" \
    "Rakefile" \
    "f0c3382c-5591-4d0c-b388-2163c051c8e7" 

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_bash_switch_to_next_keyboard_layout_t1" \
    "mmmv_ui_switch_to_next_keyboard_layout_t1_template.bash" \
    "mmmv_ui_switch_to_next_keyboard_layout_t1.bash" \
    "c69af920-3a6a-4930-9288-2163c051c8e7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_bash_download_t1" \
    "2023_12_20_download_template_t1.bash" \
    "download.bash" \
    "9b402739-777a-432c-b188-2163c051c8e7"

func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_git_runscript_that_uses_SSH_key_based_authentication" \
    "2024_03_02_run_git_with_SSH_URL_by_authenticating_with_an_SSH_key_t1_template.bash" \
    "run_git_by_authenticating_with_an_SSH_key.bash" \
    "53ee8573-c889-40dd-a278-2163c051c8e7"

#------------
SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL="t"
func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_admin_cre_HOME_dot_cargo_config_toml" \
    "HOME_dot_cargo_config.toml.template" \
    "config.toml" \
    "15d5c8d2-33fd-4700-a378-2163c051c8e7" \
    "$SB_USE_UPGUID_ON_COPIED_FILE_OPTIONAL" \
    "$HOME/.cargo"

#------------
S_TMP_0="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/lib/mmmv_utilities"
FP_MMMV_PROCESS_EDITOR_BASH="$S_TMP_0/mmmv_process_editor/src/mmmv_process_editor.bash "
if [ "$SB_RUBY_EXISTS_ON_PATH" == "t" ]; then
    alias mmmv_text_processing_lstop_t1="nice -n 6 ruby $MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/lib/mmmv_text_processing_lstop_t1/mmmv_text_processing_lstop_t1.rb "
    alias mmmv_process_editor="nice -n 6 bash $FP_MMMV_PROCESS_EDITOR_BASH "
fi
#--------------------------------------------------------------------------
func_mmmv_declare_template_creation_alias_t1 \
    "mmmv_cre_bash_try_to_compile_X_template_t5b" \
    "try_to_compile_X_template_t5b.bash" \
    "try_to_compile_X.bash" \
    "2f857c2c-2f35-4568-9278-2163c051c8e7" 

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
alias mmmv_vim_common_bashrc_main_bash="nice -n 2 vim $MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/common_bashrc/common_bashrc_main.bash "

# https://unix.stackexchange.com/questions/196098/copy-paste-in-xfce4-terminal-adds-0-and-1
alias mmmv_terminal_fix_copypaste_t1="printf \"\e[?2004l\""
#-----------------------------
if [ "$SB_XMLLINT_EXISTS_ON_PATH" == "t" ]; then
    alias mmmv_format_xml_t1="nice -n 10 xmllint --format "
fi
if [ "$SB_GPG_EXISTS_ON_PATH" == "t" ]; then
    # The 
    #alias mmmv_gpg_rot13_encrypt="nice -n 17 gpg --symmetric  --force-mdc  --cipher-algo=IDEA --compress-level=0 --pinentry-mode=loopback " # ./letter.txt
    # has been constructed by modifying a command line that was copy-pasted from
    #     https://askubuntu.com/questions/1080204/gpg-problem-with-the-agent-permission-denied
    #     archival copy: https://archive.vn/WnXKX
    # On some Linux systems the "--pinentry-mode=loopback" 
    # gives an error message: "gpg: invalid option "--pinentry-mode=loopback"
    # so the 
    alias mmmv_gpg_rot13_encrypt="nice -n 17 gpg --symmetric  --force-mdc  --cipher-algo=TWOFISH --compress-level=0 " # ./letter.txt
    # is without the "--pinentry-mode=loopback". The same with the 
    #alias mmmv_gpg_rot13_decrypt_2_console="nice -n 17 gpg --decrypt --pinentry-mode=loopback " # ./letter.txt.gpg > ./letter.txt
    # versus 
    alias mmmv_gpg_rot13_decrypt_2_console="nice -n 17 gpg --decrypt " # ./letter.txt.gpg > ./letter.txt
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
        nice -n 18 chmod -f -R 0700 ~/.gnupg &
    fi
fi
#-----------------------------
if [ "$SB_USERNAME_IS_mmmv" == "t" ]; then

    func_mmmv_userspace_distro_t1_declare_alias_cd_t1 \
        "mmmv_go_common_bashrc_subparts_userspace_distro_specific" \
        "$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/common_bashrc/subparts/mmmv_userspace_distro_t1_specific" \
        "666a3749-7134-4933-8178-2163c051c8e7"

    func_mmmv_userspace_distro_t1_declare_alias_cd_t1 \
        "mmmv_go_common_bashrc_subparts_general" \
        "$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/common_bashrc/subparts/general" \
        "dd50e630-973b-45ff-8478-2163c051c8e7"
else
    func_mmmv_verify_sb_t_f_but_do_not_exit_t1 \
        "$SB_USERNAME_IS_mmmv" \
        "58c137d5-9ced-4394-9168-2163c051c8e7"
fi
#--------------------------------------------------------------------------
func_mmmv_userspace_distro_t1_declare_alias_cd_t1 \
    "mmmv_go_mmmv_userspace_distro_t1_mmmv" \
    "$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv" \
    "437b252a-be01-4300-a568-2163c051c8e7"
#--------------------------------------------------------------------------
if [ "$SB_FFMPEG_EXISTS_ON_PATH" == "t" ]; then
    alias mmmv_ffmpeg_t1="nice -n 20 ffmpeg -i "
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
alias mmmv_environment="nice -n 2 bash --rcfile \"$MMMV_FP_COMMON_BASHRC_MAIN\" "
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
#:::::::::::::::start::of::tests::for::Rust::applications::::::::::::::::::
#--------------------------------------------------------------------------
# The SB_EXA_EXISTS_ON_PATH
# MIGHT have been declared at the 
# /home/mmmv/applications/declare_applications.bash
if [ "$SB_EXA_EXISTS_ON_PATH" == "" ]; then
    SB_EXA_EXISTS_ON_PATH="f"
    if [ "`which exa 2> /dev/null`" != "" ]; then
        SB_EXA_EXISTS_ON_PATH="t"
        # The aliases ls0 and mmmv_ls0
        # are declared at a lower part of this file.
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "exa" "43b5680d-cdb6-4c82-be68-2163c051c8e7"
    fi
fi
func_mmmv_userspace_distro_t1_lambda_01_declare_alias_sorted_ls1X(){
    local S_SUFFIX="$1" # is the sorting parameter of 
                        # the ls replacement called exa
    #----------------------------------------------------------------------
    if [ "$SB_FUNC_MMMV_USERSPACE_DISTRO_T1_LAMBDA_01_DECLARE_ALIAS_SORTED_LS1X_ENABLED" == "t" ]; then
        S_TMP_4="$S_TMP_0 $S_TMP_3$S_SUFFIX $S_TMP_1"
        alias ls1_$S_SUFFIX="$S_TMP_4"
        alias mmmv_ls1_$S_SUFFIX="$S_TMP_4"
    else
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo -e "\e[31mThe ~/.bashrc or some subpart of it is flawed. \e[39m"
            echo "The function that outputs this message "
            echo "is in a role of a lambda-function."
            echo "GUID=='47378211-7ec5-4e3a-8468-2163c051c8e7'"
            echo ""
        fi
    fi
    #----------------------------------------------------------------------
} # func_mmmv_userspace_distro_t1_lambda_01_declare_alias_sorted_ls1X
if [ "$SB_EXA_EXISTS_ON_PATH" == "t" ]; then
    #----------------------------------------------------------------------
    # According to 2022_09_07 version of the
    #     https://github.com/ogham/exa/issues/1108
    # the "-b" at the 
    S_TMP_0="nice -n 2 exa "
    S_TMP_1=" -b -l -T -L "
    S_TMP_2="$S_TMP_0 $S_TMP_1"
    # changes the size display mode from decimal prefixes (kB,MB,GB,...)
    # to the binary, classical, prerixes (KiB,MiB,GiB,...). The 
    alias ls0="$S_TMP_2"
    alias mmmv_ls0="$S_TMP_2"
    # reside in this if-clause to make sure that they
    # get defined in a situation, where the exa 
    # is placed on PATH by the 
    #     /home/mmmv/applications/declare_applications.bash
    #----------------------------------------------------------------------
    S_TMP_3=" --sort="
    #--------------------
    #S_SUFFIX="name"
    #S_TMP_4="$S_TMP_0 $S_TMP_3$S_SUFFIX $S_TMP_1"
    SB_FUNC_MMMV_USERSPACE_DISTRO_T1_LAMBDA_01_DECLARE_ALIAS_SORTED_LS1X_ENABLED="t"
        func_mmmv_userspace_distro_t1_lambda_01_declare_alias_sorted_ls1X \
            "accessed"
        func_mmmv_userspace_distro_t1_lambda_01_declare_alias_sorted_ls1X \
            "created"
        func_mmmv_userspace_distro_t1_lambda_01_declare_alias_sorted_ls1X \
            "extension"
        func_mmmv_userspace_distro_t1_lambda_01_declare_alias_sorted_ls1X \
            "modified"
        func_mmmv_userspace_distro_t1_lambda_01_declare_alias_sorted_ls1X \
            "name"
        func_mmmv_userspace_distro_t1_lambda_01_declare_alias_sorted_ls1X \
            "size"
        func_mmmv_userspace_distro_t1_lambda_01_declare_alias_sorted_ls1X \
            "type"
    SB_FUNC_MMMV_USERSPACE_DISTRO_T1_LAMBDA_01_DECLARE_ALIAS_SORTED_LS1X_ENABLED="f"
    #----------------------------------------------------------------------
fi
#----------------------------------------
if [ "$SB_MCFLY_EXISTS_ON_PATH" == "" ]; then
    SB_MCFLY_EXISTS_ON_PATH="f"
    if [ "`which mcfly 2> /dev/null`" != "" ]; then
        SB_MCFLY_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "mcfly" "32ab7db3-3a23-4af5-a368-2163c051c8e7"
    fi
fi
if [ "$SB_MCFLY_EXISTS_ON_PATH" == "t" ]; then
    if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
        # The 
        #     https://github.com/cantino/mcfly
        # is a neural network based Bash history 
        # search engine. If the ~/.bashrc includes
        #
            eval "$(mcfly init bash)" 
        # 
        # then the mcfly will be used for the
        # Bash history retrieval command "Ctrl-r"
    fi
    # The above if-clause surrounds the call to the mcfly 
    # because the mcfly sometimes puts messages to console.
fi
#----------------------------------------
if [ "$SB_GITUI_EXISTS_ON_PATH" == "" ]; then
    SB_GITUI_EXISTS_ON_PATH="f"
    if [ "`which gitui 2> /dev/null`" != "" ]; then
        SB_GITUI_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "gitui" "2d91b42f-828e-4551-9158-2163c051c8e7"
    fi
fi
#----------------------------------------
if [ "$SB_RG_EXISTS_ON_PATH" == "" ]; then
    SB_RG_EXISTS_ON_PATH="f" # rg is installed by "cargo install ripgrep"
    if [ "`which rg 2> /dev/null`" != "" ]; then
        SB_RG_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "rg/ripgrep" "a8687629-7fad-4f8d-8358-2163c051c8e7"
    fi
fi
if [ "$SB_RG_EXISTS_ON_PATH" == "t" ]; then
    alias rg0="nice -n 5 rg --max-depth 0 "
    alias rg1="nice -n 5 rg --max-depth 1 "
    alias rg2="nice -n 5 rg --max-depth 2 "
    alias rg3="nice -n 5 rg --max-depth 3 "
    alias rg4="nice -n 5 rg --max-depth 4 "
    alias rg5="nice -n 5 rg --max-depth 5 "
    alias rg6="nice -n 5 rg --max-depth 6 "
    alias rg7="nice -n 5 rg --max-depth 7 "
    alias rg8="nice -n 5 rg --max-depth 8 "
    alias rg9="nice -n 5 rg --max-depth 9 "
    alias rg10="nice -n 5 rg --max-depth 10 "
    alias rg11="nice -n 5 rg --max-depth 11 "
    alias rg12="nice -n 5 rg --max-depth 12 "
    alias rg13="nice -n 5 rg --max-depth 13 "
    alias rg14="nice -n 5 rg --max-depth 14 "
    alias rg15="nice -n 5 rg --max-depth 15 "
    alias rg16="nice -n 5 rg --max-depth 16 "
    alias rg17="nice -n 5 rg --max-depth 17 "
    alias rg18="nice -n 5 rg --max-depth 18 "
    alias rg19="nice -n 5 rg --max-depth 19 "
    alias rg20="nice -n 5 rg --max-depth 20 "
    alias rg21="nice -n 5 rg --max-depth 21 "
    alias rg22="nice -n 5 rg --max-depth 22 "
    alias rg23="nice -n 5 rg --max-depth 23 "
    alias rg24="nice -n 5 rg --max-depth 24 "
    # Deeper recursion can be used by not setting
    # any recursion depth limits: "nice -n 5 rg SearchString" . 
fi
#----------------------------------------
if [ "$SB_WIKITUI_EXISTS_ON_PATH" == "" ]; then
    SB_WIKITUI_EXISTS_ON_PATH="f"
    if [ "`which wiki-tui 2> /dev/null`" != "" ]; then
        SB_WIKITUI_EXISTS_ON_PATH="t"
    else
        func_mmmv_userspace_distro_t1_err_msg_console_program_missing_t1 \
            "wiki-tui" "e9621b22-3e12-4ace-9248-2163c051c8e7"
    fi
fi
#--------------------------------------------------------------------------
#:::::::::::::::::end::of::tests::for::Rust::applications::::::::::::::::::
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
                alias mmmv_cre_HTML_ls_t1="printf '<!DOCTYPE HTML>\\n<html>\\n<head>\\n<title>ls</title>\\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\\n</head>\\n<body id=\"the_document_body\">\\n<h1>ls</h1>\\n<ul>\\n    <li>\\n        <a href=\"./../\">..</a>\\n    </li>\\n' > ./index.html ; sync ; wait ; ls -1 | sort | grep -i -v 'index.html' | $S_CMD_GNU_SED -e 's/\\(^.\\+\$\\)/    <li><a href=\".\\/\\1\">\\1<\\/a><\\/li>/g' >> ./index.html ; sync ; wait ; printf '</ul>\\n</body>\\n</html>\\n' >> ./index.html ; sync ; wait ;"
            fi
        fi
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_GLIMPSEINDEX_EXISTS_ON_PATH" == "t" ]; then
    # The 
    alias mmmv_se_glimpse_index_t1="SI_MAX_NUMBER_OF_MiB_DURING_INDEXING=\"20\" ; nice -n 5 glimpseindex -M \$SI_MAX_NUMBER_OF_MiB_DURING_INDEXING -n -B -b -f -s -H " # $FULL_PATH_TO_FOLDER_WITH_INDICES  $FULL_PATH_OF_THE_FOLDER_WITH_INDEXABLE_DOCUMENTS
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
    alias mmmv_se_glimpse_search_t1="nice -n 2 glimpse -y -H " # $FULL_PATH_TO_FOLDER_WITH_INDICES <the rest of the parameters> searchstrng
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
        nice -n 5 emacs -eval "(woman \"$S_SEARCHSTRING\")";  
        func_mmmv_wait_and_sync_t1
    else
        if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
            echo ""
            echo -e "\e[31mThe ~/.bashrc or some subpart of it is flawed.\e[39m"
            echo "This function should never be called if "
            echo "the Emacs is missing from PATH."
            echo "GUID=='8bb54526-2372-45b1-a168-2163c051c8e7'"
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
    "$S_FP_1a" "51f072f1-3b50-4310-9348-2163c051c8e7" \
    "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
    func_mmmv_verify_that_the_file_exists_but_do_not_exit_t1 \
        "$S_FP_2a" "337598b7-1e8b-4bae-a348-2163c051c8e7" \
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
        "d205ff4f-1e72-4a80-b538-2163c051c8e7" \
        "$SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING"
    if [ "$SB_VERIFICATION_FAILED" == "f" ]; then
        S_TMP_0="/sdcard/Download"
        func_mmmv_userspace_distro_t1_declare_alias_cd_t1 \
            "mmmv_go_Download" "$S_TMP_0" \
            "32660f5f-a193-4194-b538-2163c051c8e7" \
            "$SB_OPTIONAL_DISPLAY_ERROR_MESSAGE_IF_FOLDER_MISSING"
        S_TMP_0="/sdcard/download"
        func_mmmv_userspace_distro_t1_declare_alias_cd_t1 \
            "mmmv_go_download" "$S_TMP_0" \
            "279aa2c2-21c1-409b-8d38-2163c051c8e7" \
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
        "$FP_MMMV" "2f2d8f21-16cf-4c12-9138-2163c051c8e7" \
        "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
fi
#--------------------------------------------------------------------------
if [ ! -e "$FP_MMMV_BASHRC" ]; then
    mkdir -p $FP_MMMV_BASHRC 
    func_mmmv_wait_and_sync_t1
    func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
        "$FP_MMMV_BASHRC" "2385de51-f6c4-4be8-8328-2163c051c8e7" \
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
            "35447f33-c5fa-43bd-9228-2163c051c8e7" \
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
                    "f4a6721e-d6de-42b9-b128-2163c051c8e7" \
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
    if [ "$SB_OPERATINGSYSTEM_LINUX_ANDROID" == "f" ]; then
        if [ "$SB_XDGMIME_EXISTS_ON_PATH" == "t" ]; then
            #------------------------------------------------------------------
            S_FP_0="/usr/share/applications/"
            # Line for testing the default HTML browser setting:
            #     xdg-open ./index.html
            #------------------------------------------------------------------
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
            #------------------------------------------------------------------
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
            #------------------------------------------------------------------
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
            #------------------------------------------------------------------
            if [ "$SB_DILLO_EXISTS_ON_PATH" == "t" ]; then
                S_FP_1="dillo.desktop"
                S_FP_2="$S_FP_0$S_FP_1"
                if [ -e "$S_FP_2" ]; then
                    if [ ! -d "$S_FP_2" ]; then
                        alias mmmv_admin_set_default_HTML_browser_Dillo="xdg-mime default $S_FP_1 text/html"
                    fi
                fi
            fi
            #------------------------------------------------------------------
            if [ "$SB_MIDORI_EXISTS_ON_PATH" == "t" ]; then
                S_FP_1="midori.desktop" # TODO: check, if that's the most common .desktop file name for Midori
                S_FP_2="$S_FP_0$S_FP_1"
                if [ -e "$S_FP_2" ]; then
                    if [ ! -d "$S_FP_2" ]; then
                        alias mmmv_admin_set_default_HTML_browser_Midori="xdg-mime default $S_FP_1 text/html"
                    fi
                fi
            fi
            #------------------------------------------------------------------
            if [ "$SB_NETSURF_EXISTS_ON_PATH" == "t" ]; then
                S_FP_1="netsurf-gtk.desktop"
                S_FP_2="$S_FP_0$S_FP_1"
                if [ -e "$S_FP_2" ]; then
                    if [ ! -d "$S_FP_2" ]; then
                        alias mmmv_admin_set_default_HTML_browser_NetSurf="xdg-mime default $S_FP_1 text/html"
                    fi
                fi
            fi
            #------------------------------------------------------------------
            if [ "$SB_EVINCE_EXISTS_ON_PATH" == "t" ]; then
                S_FP_1="org.gnome.Evince.desktop"
                S_FP_2="$S_FP_0$S_FP_1"
                if [ -e "$S_FP_2" ]; then
                    if [ ! -d "$S_FP_2" ]; then
                        alias mmmv_admin_set_default_PDF_viewer_Evnice="xdg-mime default $S_FP_1 application/pdf"
                    fi
                fi
            fi
            #------------------------------------------------------------------
            if [ "$SB_XPDF_EXISTS_ON_PATH" == "t" ]; then
                S_FP_1="xpdf.desktop"
                S_FP_2="$S_FP_0$S_FP_1"
                if [ -e "$S_FP_2" ]; then
                    if [ ! -d "$S_FP_2" ]; then
                        alias mmmv_admin_set_default_PDF_viewer_Xpdf="xdg-mime default $S_FP_1 application/pdf"
                    fi
                fi
            fi
            #------------------------------------------------------------------
            if [ "$SB_EOG_EXISTS_ON_PATH" == "t" ]; then
                S_FP_1="org.gnome.eog.desktop"
                S_FP_2="$S_FP_0$S_FP_1"
                if [ -e "$S_FP_2" ]; then
                    if [ ! -d "$S_FP_2" ]; then
                        alias mmmv_admin_set_default_photo_viewer_eog="xdg-mime default $S_FP_1 image/jpeg ; xdg-mime default $S_FP_1 image/pjpeg ; xdg-mime default $S_FP_1 image/bmp ; xdg-mime default $S_FP_1 image/gif ; xdg-mime default $S_FP_1 image/png "
                    fi
                fi
            fi
            #------------------------------------------------------------------
            if [ "$SB_FEH_EXISTS_ON_PATH" == "t" ]; then
                S_FP_1="feh.desktop"
                S_FP_2="$S_FP_0$S_FP_1"
                if [ -e "$S_FP_2" ]; then
                    if [ ! -d "$S_FP_2" ]; then
                        alias mmmv_admin_set_default_photo_viewer_feh="xdg-mime default $S_FP_1 image/jpeg ; xdg-mime default $S_FP_1 image/pjpeg ; xdg-mime default $S_FP_1 image/bmp ; xdg-mime default $S_FP_1 image/gif ; xdg-mime default $S_FP_1 image/png "
                    fi
                fi
            fi
            #------------------------------------------------------------------
            if [ "$SB_GEEQIE_EXISTS_ON_PATH" == "t" ]; then
                S_FP_1="geeqie.desktop"
                S_FP_2="$S_FP_0$S_FP_1"
                if [ -e "$S_FP_2" ]; then
                    if [ ! -d "$S_FP_2" ]; then
                        alias mmmv_admin_set_default_photo_viewer_Geeqie="xdg-mime default $S_FP_1 image/jpeg ; xdg-mime default $S_FP_1 image/pjpeg ; xdg-mime default $S_FP_1 image/bmp ; xdg-mime default $S_FP_1 image/gif ; xdg-mime default $S_FP_1 image/png "
                    fi
                fi
            fi
            #------------------------------------------------------------------
            if [ "$SB_GTHUMB_EXISTS_ON_PATH" == "t" ]; then
                S_FP_1="org.gnome.gThumb.desktop"
                S_FP_2="$S_FP_0$S_FP_1"
                if [ -e "$S_FP_2" ]; then
                    if [ ! -d "$S_FP_2" ]; then
                        alias mmmv_admin_set_default_photo_viewer_gThumb="xdg-mime default $S_FP_1 image/jpeg ; xdg-mime default $S_FP_1 image/pjpeg ; xdg-mime default $S_FP_1 image/bmp ; xdg-mime default $S_FP_1 image/gif ; xdg-mime default $S_FP_1 image/png "
                    fi
                fi
            fi
            #------------------------------------------------------------------
            if [ "$SB_GWENVIEW_EXISTS_ON_PATH" == "t" ]; then
                S_FP_1="org.kde.gwenview.desktop"
                S_FP_2="$S_FP_0$S_FP_1"
                if [ -e "$S_FP_2" ]; then
                    if [ ! -d "$S_FP_2" ]; then
                        alias mmmv_admin_set_default_photo_viewer_Gwenview="xdg-mime default $S_FP_1 image/jpeg ; xdg-mime default $S_FP_1 image/pjpeg ; xdg-mime default $S_FP_1 image/bmp ; xdg-mime default $S_FP_1 image/gif ; xdg-mime default $S_FP_1 image/png "
                    fi
                fi
            fi
            #------------------------------------------------------------------
            if [ "$SB_RISTRETTO_EXISTS_ON_PATH" == "t" ]; then
                S_FP_1="org.xfce.ristretto.desktop"
                S_FP_2="$S_FP_0$S_FP_1"
                if [ -e "$S_FP_2" ]; then
                    if [ ! -d "$S_FP_2" ]; then
                        alias mmmv_admin_set_default_photo_viewer_ristretto="xdg-mime default $S_FP_1 image/jpeg ; xdg-mime default $S_FP_1 image/pjpeg ; xdg-mime default $S_FP_1 image/bmp ; xdg-mime default $S_FP_1 image/gif ; xdg-mime default $S_FP_1 image/png "
                    fi
                fi
            fi
            #------------------------------------------------------------------
            if [ "$SB_VIEWNIOR_EXISTS_ON_PATH" == "t" ]; then
                S_FP_1="viewnior.desktop"
                S_FP_2="$S_FP_0$S_FP_1"
                if [ -e "$S_FP_2" ]; then
                    if [ ! -d "$S_FP_2" ]; then
                        alias mmmv_admin_set_default_photo_viewer_Viewnior="xdg-mime default $S_FP_1 image/jpeg ; xdg-mime default $S_FP_1 image/pjpeg ; xdg-mime default $S_FP_1 image/bmp ; xdg-mime default $S_FP_1 image/gif ; xdg-mime default $S_FP_1 image/png "
                    fi
                fi
            fi
            #------------------------------------------------------------------
        fi
    fi
fi
#--------------------------------------------------------------------------
if [ "$SB_SYSTEMDRUN_EXISTS_ON_PATH" == "t" ]; then
    if [ "$S_FP_NICE" != "" ]; then
        #------------------------------------------------------------------
        # The "systemd-run" requires root privileges, which it can get
        # be asking for root user password.
        #------------------------------------------------------------------
        if [ "$SB_FALKON_EXISTS_ON_PATH" == "t" ]; then
            if [ "$S_FP_FALKON" != "" ]; then # just in case
                #----------------------------------------------------------
                S_TMP_0="systemd-run --scope -p MemoryLimit=1024M -p CPUQuota=60% $S_CMD_NICE_WEBBROWSER $S_FP_FALKON "
                alias mmmv_run_Falkon_with_Linux_kernel_based_limits_enforcement_RAM_1GiB_CPU_60percent="$S_TMP_0"
                alias mmmv_run_webbrowser_Falkon_with_Linux_kernel_based_limits_enforcement_RAM_1GiB_CPU_60percent="$S_TMP_0"
                alias mmmv_webbrowser_Falkon_with_Linux_kernel_based_limits_enforcement_RAM_1GiB_CPU_60percent="$S_TMP_0"
                #----------------------------------------------------------
                S_TMP_0="systemd-run --scope -p MemoryLimit=1024M -p CPUQuota=100% $S_CMD_NICE_WEBBROWSER $S_FP_FALKON "
                alias mmmv_run_Falkon_with_Linux_kernel_based_limits_enforcement_RAM_1GiB_CPU_100percent="$S_TMP_0"
                alias mmmv_run_webbrowser_Falkon_with_Linux_kernel_based_limits_enforcement_RAM_1GiB_CPU_100percent="$S_TMP_0"
                alias mmmv_webbrowser_Falkon_with_Linux_kernel_based_limits_enforcement_RAM_1GiB_CPU_100percent="$S_TMP_0"
                #----------------------------------------------------------
                # For Raspberry_Pi 3, which has 4 CPU-cores, 1GiB GPU-shared RAM.
                S_TMP_0="systemd-run --scope -p MemoryLimit=400M -p CPUQuota=100% $S_CMD_NICE_WEBBROWSER $S_FP_FALKON "
                alias mmmv_run_Falkon_with_Linux_kernel_based_limits_enforcement_RAM_400MiB_CPU_100percent="$S_TMP_0"
                alias mmmv_run_webbrowser_Falkon_with_Linux_kernel_based_limits_enforcement_RAM_400MiB_CPU_100percent="$S_TMP_0"
                alias mmmv_webbrowser_Falkon_with_Linux_kernel_based_limits_enforcement_RAM_400MiB_CPU_100percent="$S_TMP_0"
                #----------------------------------------------------------
            else
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo "A mmmv_userspace_distro_t1 related "
                    echo -e "\e[31msubpart of the ~/.bashrc is probably flawed\e[39m."
                    echo "At this point the S_FP_FALKON should not "
                    echo "have the value of an empty string."
                    echo "GUID=='1307e736-0d43-4bba-a268-2163c051c8e7'"
                    echo ""
                fi
            fi
        fi
        #------------------------------------------------------------------
        if [ "$SB_CHROMIUM_EXISTS_ON_PATH" == "t" ]; then
            if [ "$S_FP_CHROMIUM" != "" ]; then # just in case
                #----------------------------------------------------------
                S_TMP_0="systemd-run --scope -p MemoryLimit=1024M -p CPUQuota=100% $S_CMD_NICE_WEBBROWSER $S_FP_CHROMIUM "
                alias mmmv_run_Chromium_with_Linux_kernel_based_limits_enforcement_RAM_1GiB_CPU_100percent="$S_TMP_0"
                alias mmmv_run_webbrowser_Chromium_with_Linux_kernel_based_limits_enforcement_RAM_1GiB_CPU_100percent="$S_TMP_0"
                alias mmmv_webbrowser_Chromium_with_Linux_kernel_based_limits_enforcement_RAM_1GiB_CPU_100percent="$S_TMP_0"
                #----------------------------------------------------------
            else
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo "A mmmv_userspace_distro_t1 related "
                    echo -e "\e[31msubpart of the ~/.bashrc is probably flawed\e[39m."
                    echo "At this point the S_FP_CHROMIUM should not "
                    echo "have the value of an empty string."
                    echo "GUID=='7db79a1f-45c7-4386-9258-2163c051c8e7'"
                    echo ""
                fi
            fi
        fi
        #------------------------------------------------------------------
        if [ "$SB_REKONQ_EXISTS_ON_PATH" == "t" ]; then
            if [ "$S_FP_REKONQ" != "" ]; then # just in case
                #----------------------------------------------------------
                S_TMP_0="systemd-run --scope -p MemoryLimit=1024M -p CPUQuota=60% $S_CMD_NICE_WEBBROWSER $S_FP_REKONQ "
                alias mmmv_run_Rekonq_with_Linux_kernel_based_limits_enforcement_RAM_1GiB_CPU_60percent="$S_TMP_0"
                alias mmmv_run_webbrowser_Rekonq_with_Linux_kernel_based_limits_enforcement_RAM_1GiB_CPU_60percent="$S_TMP_0"
                alias mmmv_webbrowser_Rekonq_with_Linux_kernel_based_limits_enforcement_RAM_1GiB_CPU_60percent="$S_TMP_0"
                #----------------------------------------------------------
                # For Raspberry_Pi 3, which has 4 CPU-cores, 1GiB GPU-shared RAM.
                S_TMP_0="systemd-run --scope -p MemoryLimit=400M -p CPUQuota=100% $S_CMD_NICE_WEBBROWSER $S_FP_REKONQ "
                alias mmmv_run_Rekonq_with_Linux_kernel_based_limits_enforcement_RAM_400MiB_CPU_100percent="$S_TMP_0"
                alias mmmv_run_webbrowser_Rekonq_with_Linux_kernel_based_limits_enforcement_RAM_400MiB_CPU_100percent="$S_TMP_0"
                alias mmmv_webbrowser_Rekonq_with_Linux_kernel_based_limits_enforcement_RAM_400MiB_CPU_100percent="$S_TMP_0"
                #----------------------------------------------------------
            else
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo "A mmmv_userspace_distro_t1 related "
                    echo -e "\e[31msubpart of the ~/.bashrc is probably flawed\e[39m."
                    echo "At this point the S_FP_REKONQ should not "
                    echo "have the value of an empty string."
                    echo "GUID=='1fd546c4-3a7d-4542-9558-2163c051c8e7'"
                    echo ""
                fi
            fi
        fi
        #------------------------------------------------------------------
        if [ "$SB_NETSURF_EXISTS_ON_PATH" == "t" ]; then
            if [ "$S_FP_NETSURF" != "" ]; then # just in case
                #----------------------------------------------------------
                # For Raspberry_Pi 1 Zero W that has 1 CPU-core, 256MiB GPU-shared RAM.
                S_TMP_0="systemd-run --scope -p MemoryLimit=100M -p CPUQuota=50% $S_CMD_NICE_WEBBROWSER $S_FP_NETSURF "
                alias mmmv_run_NetSurf_with_Linux_kernel_based_limits_enforcement_RAM_100MiB_CPU_50percent="$S_TMP_0"
                alias mmmv_run_webbrowser_NetSurf_with_Linux_kernel_based_limits_enforcement_RAM_100MiB_CPU_50percent="$S_TMP_0"
                alias mmmv_webbrowser_NetSurf_with_Linux_kernel_based_limits_enforcement_RAM_100MiB_CPU_50percent="$S_TMP_0"
                #----------------------------------------------------------
            else
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo "A mmmv_userspace_distro_t1 related "
                    echo -e "\e[31msubpart of the ~/.bashrc is probably flawed\e[39m."
                    echo "At this point the S_FP_NETSURF should not "
                    echo "have the value of an empty string."
                    echo "GUID=='9e75f857-868b-461a-9158-2163c051c8e7'"
                    echo ""
                fi
            fi
        fi
        #------------------------------------------------------------------
        if [ "$SB_DILLO_EXISTS_ON_PATH" == "t" ]; then
            if [ "$S_FP_DILLO" != "" ]; then # just in case
                #----------------------------------------------------------
                # For Raspberry_Pi 1 Zero W that has 1 CPU-core, 256MiB GPU-shared RAM.
                S_TMP_0="systemd-run --scope -p MemoryLimit=100M -p CPUQuota=50% $S_CMD_NICE_WEBBROWSER $S_FP_DILLO "
                alias mmmv_run_Dillo_with_Linux_kernel_based_limits_enforcement_RAM_100MiB_CPU_50percent="$S_TMP_0"
                alias mmmv_run_webbrowser_Dillo_with_Linux_kernel_based_limits_enforcement_RAM_100MiB_CPU_50percent="$S_TMP_0"
                alias mmmv_webbrowser_Dillo_with_Linux_kernel_based_limits_enforcement_RAM_100MiB_CPU_50percent="$S_TMP_0"
                #----------------------------------------------------------
                # For Raspberry_Pi 1 Zero W that has 1 CPU-core, 256MiB GPU-shared RAM.
                S_TMP_0="systemd-run --scope -p MemoryLimit=60M  -p CPUQuota=50% $S_CMD_NICE_WEBBROWSER $S_FP_DILLO "
                alias mmmv_run_Dillo_with_Linux_kernel_based_limits_enforcement_RAM_60MiB_CPU_50percent="$S_TMP_0"
                alias mmmv_run_webbrowser_Dillo_with_Linux_kernel_based_limits_enforcement_RAM_60MiB_CPU_50percent="$S_TMP_0"
                alias mmmv_webbrowser_Dillo_with_Linux_kernel_based_limits_enforcement_RAM_60MiB_CPU_50percent="$S_TMP_0"
                #----------------------------------------------------------
            else
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo "A mmmv_userspace_distro_t1 related "
                    echo -e "\e[31msubpart of the ~/.bashrc is probably flawed\e[39m."
                    echo "At this point the S_FP_DILLO should not "
                    echo "have the value of an empty string."
                    echo "GUID=='7e641d12-42ab-4e8b-9548-2163c051c8e7'"
                    echo ""
                fi
            fi
        fi
        #------------------------------------------------------------------
        if [ "$SB_DILLOPLUS_EXISTS_ON_PATH" == "t" ]; then
            if [ "$S_FP_DILLOPLUS" != "" ]; then # just in case
                #----------------------------------------------------------
                # For Raspberry_Pi 1 Zero W that has 1 CPU-core, 256MiB GPU-shared RAM.
                S_TMP_0="systemd-run --scope -p MemoryLimit=100M -p CPUQuota=50% $S_CMD_NICE_WEBBROWSER $S_FP_DILLOPLUS "
                alias mmmv_run_DilloPlus_with_Linux_kernel_based_limits_enforcement_RAM_100MiB_CPU_50percent="$S_TMP_0"
                alias mmmv_run_webbrowser_DilloPlus_with_Linux_kernel_based_limits_enforcement_RAM_100MiB_CPU_50percent="$S_TMP_0"
                alias mmmv_webbrowser_DilloPlus_with_Linux_kernel_based_limits_enforcement_RAM_100MiB_CPU_50percent="$S_TMP_0"
                #----------------------------------------------------------
                # For Raspberry_Pi 1 Zero W that has 1 CPU-core, 256MiB GPU-shared RAM.
                S_TMP_0="systemd-run --scope -p MemoryLimit=60M  -p CPUQuota=50% $S_CMD_NICE_WEBBROWSER $S_FP_DILLOPLUS "
                alias mmmv_run_DilloPlus_with_Linux_kernel_based_limits_enforcement_RAM_60MiB_CPU_50percent="$S_TMP_0"
                alias mmmv_run_webbrowser_DilloPlus_with_Linux_kernel_based_limits_enforcement_RAM_60MiB_CPU_50percent="$S_TMP_0"
                alias mmmv_webbrowser_DilloPlus_with_Linux_kernel_based_limits_enforcement_RAM_60MiB_CPU_50percent="$S_TMP_0"
                #----------------------------------------------------------
            else
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo "A mmmv_userspace_distro_t1 related "
                    echo -e "\e[31msubpart of the ~/.bashrc is probably flawed\e[39m."
                    echo "At this point the S_FP_DILLOPLUS should not "
                    echo "have the value of an empty string."
                    echo "GUID=='c2dacfbe-da5e-4293-9648-2163c051c8e7'"
                    echo ""
                fi
            fi
        fi
        #------------------------------------------------------------------
    fi
fi
#--------------------------------------------------------------------------

func_mmmv_userspace_distro_t1_create_link_2_central_rc_file_if_local_rc_missing_t1(){
    local S_FP_LOCAL="$1"
    local S_FP_CENTRAL="$2"
    #-------------------
    local SB_OK_TO_CREATE_LINK="t"
    #-------------------
    # S_FP_CENTRAL file system checks
    if [ -h "$S_FP_CENTRAL" ]; then
        #echo "symbolic link, regardless of whether it is broken or not"
        if [ ! -e "$S_FP_CENTRAL" ]; then
            SB_OK_TO_CREATE_LINK="f"
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                echo ""
                echo "The "
                echo ""
                echo "    $S_FP_CENTRAL "
                echo ""
                echo "is a broken symlink."
                echo "GUID=='11b92da8-da17-40fa-a348-2163c051c8e7'"
                echo ""
            fi
        else
            if [ -d "$S_FP_CENTRAL" ]; then
                SB_OK_TO_CREATE_LINK="f"
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo "The "
                    echo ""
                    echo "    $S_FP_CENTRAL "
                    echo ""
                    echo "is a symlink to a folder, but "
                    echo "it must be a file or a symlink to a file."
                    echo "GUID=='ec6a704a-82a2-4d14-8538-2163c051c8e7'"
                    echo ""
                fi
            fi
        fi
    else
        if [ ! -e "$S_FP_CENTRAL" ]; then
            SB_OK_TO_CREATE_LINK="f"
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                echo ""
                echo "The "
                echo ""
                echo "    $S_FP_CENTRAL "
                echo ""
                echo "is missing."
                echo "GUID=='04195059-7788-418d-b138-2163c051c8e7'"
                echo ""
            fi
        else
            if [ -d "$S_FP_CENTRAL" ]; then
                SB_OK_TO_CREATE_LINK="f"
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo "The "
                    echo ""
                    echo "    $S_FP_CENTRAL "
                    echo ""
                    echo "is a folder, but it must be a file or a symlink to a file."
                    echo "GUID=='ce1d3e52-6d64-48f9-a438-2163c051c8e7'"
                    echo ""
                fi
            fi
        fi
    fi
    #-------------------
    # S_FP_LOCAL file system checks
    if [ "$SB_OK_TO_CREATE_LINK" == "t" ]; then
        if [ -h "$S_FP_LOCAL" ]; then
            if [ ! -e "$S_FP_LOCAL" ]; then
                rm -f $S_FP_LOCAL # deletes a broken symlink
            else
                # The symlink is not broken.
                SB_OK_TO_CREATE_LINK="f"
                if [ -d "$S_FP_LOCAL" ]; then
                    if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                        echo ""
                        echo "The "
                        echo ""
                        echo "    $S_FP_LOCAL "
                        echo ""
                        echo "is a symlink to a folder, but "
                        echo "it must be a file or a symlink to a file."
                        echo "GUID=='150ee2d5-8fad-4d7e-b828-2163c051c8e7'"
                        echo ""
                    fi
                fi
            fi # symlink_is_not_broken(S_FP_LOCAL)
        else # file or folder, not a symlink
            if [ -e "$S_FP_LOCAL" ]; then
                SB_OK_TO_CREATE_LINK="f"
                if [ -d "$S_FP_LOCAL" ]; then
                    if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                        echo ""
                        echo "The "
                        echo ""
                        echo "    $S_FP_LOCAL "
                        echo ""
                        echo "is a folder, but it must be "
                        echo "a file or a symlink to a file."
                        echo "GUID=='f7a5635f-b1b6-4059-8228-2163c051c8e7'"
                        echo ""
                    fi
                fi
            fi # exists(S_FP_LOCAL)
        fi # is_symlink(S_FP_LOCAL)
    fi # SB_OK_TO_CREATE_LINK === "t"
    #-------------------
    if [ "$SB_OK_TO_CREATE_LINK" == "t" ]; then
        ln -s $S_FP_CENTRAL $S_FP_LOCAL 
        func_mmmv_wait_and_sync_t1 
        if [ -h $S_FP_LOCAL ]; then
            if [ ! -e $S_FP_LOCAL ]; then
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo "The "
                    echo ""
                    echo "    $S_FP_LOCAL "
                    echo ""
                    echo "is a broken symlink to the "
                    echo ""
                    echo "    $S_FP_CENTRAL "
                    echo ""
                    echo "GUID=='991be753-2d36-4c07-9528-2163c051c8e7'"
                    echo ""
                fi
            fi
        else
            if [ ! -e $S_FP_LOCAL ]; then
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo "The "
                    echo ""
                    echo "    $S_FP_LOCAL "
                    echo ""
                    echo "is missing."
                    echo "GUID=='8e303948-23fe-4b04-a128-2163c051c8e7'"
                    echo ""
                fi
            fi
        fi
    fi # SB_OK_TO_CREATE_LINK === "t"
} # func_mmmv_userspace_distro_t1_create_link_2_central_rc_file_if_local_rc_missing_t1

#--------------------------------------------------------------------------

func_mmmv_userspace_distro_t1_create_link_2_central_rc_folder_if_local_rc_missing_t1(){
    local S_FP_LOCAL="$1"
    local S_FP_CENTRAL="$2"
    #-------------------
    local SB_OK_TO_CREATE_LINK="t"
    #-------------------
    # S_FP_CENTRAL file system checks
    if [ -h "$S_FP_CENTRAL" ]; then
        #echo "symbolic link, regardless of whether it is broken or not"
        if [ ! -e "$S_FP_CENTRAL" ]; then
            SB_OK_TO_CREATE_LINK="f"
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                echo ""
                echo "The "
                echo ""
                echo "    $S_FP_CENTRAL "
                echo ""
                echo "is a broken symlink."
                echo "GUID=='5e544a3e-9373-4cf7-9318-2163c051c8e7'"
                echo ""
            fi
        else
            if [ ! -d "$S_FP_CENTRAL" ]; then
                SB_OK_TO_CREATE_LINK="f"
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo "The "
                    echo ""
                    echo "    $S_FP_CENTRAL "
                    echo ""
                    echo "is a symlink to a file, but "
                    echo "it must be a folder or a symlink to a folder."
                    echo "GUID=='78dbb974-1e78-4f5c-8618-2163c051c8e7'"
                    echo ""
                fi
            fi
        fi
    else
        if [ ! -e "$S_FP_CENTRAL" ]; then
            SB_OK_TO_CREATE_LINK="f"
            if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                echo ""
                echo "The "
                echo ""
                echo "    $S_FP_CENTRAL "
                echo ""
                echo "is missing."
                echo "GUID=='02c5b133-9a8e-45fa-8118-2163c051c8e7'"
                echo ""
            fi
        else
            if [ ! -d "$S_FP_CENTRAL" ]; then
                SB_OK_TO_CREATE_LINK="f"
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo "The "
                    echo ""
                    echo "    $S_FP_CENTRAL "
                    echo ""
                    echo "is a file, but it must be a folder or a symlink to a folder."
                    echo "GUID=='1a944d4e-ea75-411b-9208-2163c051c8e7'"
                    echo ""
                fi
            fi
        fi
    fi
    #-------------------
    # S_FP_LOCAL file system checks
    if [ "$SB_OK_TO_CREATE_LINK" == "t" ]; then
        if [ -h "$S_FP_LOCAL" ]; then
            if [ ! -e "$S_FP_LOCAL" ]; then
                rm -f $S_FP_LOCAL # deletes a broken symlink
            else
                # The symlink is not broken.
                SB_OK_TO_CREATE_LINK="f"
                if [ ! -d "$S_FP_LOCAL" ]; then
                    if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                        echo ""
                        echo "The "
                        echo ""
                        echo "    $S_FP_LOCAL "
                        echo ""
                        echo "is a symlink to a file, but "
                        echo "it must be a folder or a symlink to a folder."
                        echo "GUID=='132555b1-c4d8-45ed-9308-2163c051c8e7'"
                        echo ""
                    fi
                fi
            fi # symlink_is_not_broken(S_FP_LOCAL)
        else # file or folder, not a symlink
            if [ -e "$S_FP_LOCAL" ]; then
                SB_OK_TO_CREATE_LINK="f"
                if [ ! -d "$S_FP_LOCAL" ]; then
                    if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                        echo ""
                        echo "The "
                        echo ""
                        echo "    $S_FP_LOCAL "
                        echo ""
                        echo "is a file, but it must be "
                        echo "a folder or a symlink to a folder."
                        echo "GUID=='331a0341-4827-42c8-8508-2163c051c8e7'"
                        echo ""
                    fi
                fi
            fi # exists(S_FP_LOCAL)
        fi # is_symlink(S_FP_LOCAL)
    fi # SB_OK_TO_CREATE_LINK === "t"
    #-------------------
    if [ "$SB_OK_TO_CREATE_LINK" == "t" ]; then
        ln -s $S_FP_CENTRAL $S_FP_LOCAL 
        func_mmmv_wait_and_sync_t1 
        if [ -h $S_FP_LOCAL ]; then
            if [ ! -e $S_FP_LOCAL ]; then
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo "The "
                    echo ""
                    echo "    $S_FP_LOCAL "
                    echo ""
                    echo "is a broken symlink to the "
                    echo ""
                    echo "    $S_FP_CENTRAL "
                    echo ""
                    echo "GUID=='7e522245-49f8-41cc-8508-2163c051c8e7'"
                    echo ""
                fi
            fi
        else
            if [ ! -e $S_FP_LOCAL ]; then
                if [ "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT" == "t" ]; then
                    echo ""
                    echo "The "
                    echo ""
                    echo "    $S_FP_LOCAL "
                    echo ""
                    echo "is missing."
                    echo "GUID=='02e8df0f-6b39-451c-9408-2163c051c8e7'"
                    echo ""
                fi
            fi
        fi
    fi # SB_OK_TO_CREATE_LINK === "t"
} # func_mmmv_userspace_distro_t1_create_link_2_central_rc_folder_if_local_rc_missing_t1

#--------------------------------------------------------------------------
S_FP_RCFILE_USERSPECIFIC="$HOME/.vimrc"
S_FP_RCFILE_SHARED="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/_vimrc"
func_mmmv_userspace_distro_t1_create_link_2_central_rc_file_if_local_rc_missing_t1 \
  "$S_FP_RCFILE_USERSPECIFIC" \
  "$S_FP_RCFILE_SHARED" 

S_FP_RCFILE_USERSPECIFIC="$HOME/.octaverc"
S_FP_RCFILE_SHARED="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/_octaverc"
func_mmmv_userspace_distro_t1_create_link_2_central_rc_file_if_local_rc_missing_t1 \
  "$S_FP_RCFILE_USERSPECIFIC" \
  "$S_FP_RCFILE_SHARED" 

S_FP_RCFILE_USERSPECIFIC="$HOME/.Xdefaults"
S_FP_RCFILE_SHARED="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/_Xdefaults"
func_mmmv_userspace_distro_t1_create_link_2_central_rc_file_if_local_rc_missing_t1 \
  "$S_FP_RCFILE_USERSPECIFIC" \
  "$S_FP_RCFILE_SHARED" 
#--------------------------------------------------------------------------
S_FP_FONTS_HOME="$HOME/.fonts"
S_FP_FONTS_CENTRAL="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/_fonts"
#--------
SB_S_FP_FONTS_HOME_EXISTS_BEFORE_SYMLINK_CREATION_ATTEMPT="f"
if [ -e "$S_FP_FONTS_HOME" ]; then
    if [ -d "$S_FP_FONTS_HOME" ]; then
        SB_S_FP_FONTS_HOME_EXISTS_BEFORE_SYMLINK_CREATION_ATTEMPT="t"
    else
        # Outputs an error message.
        func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
            "$S_FP_FONTS_HOME" "4578ea05-c858-45fa-a718-2163c051c8e7" \
            "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
    fi
fi
#--------
func_mmmv_userspace_distro_t1_create_link_2_central_rc_folder_if_local_rc_missing_t1 \
  "$S_FP_FONTS_HOME" \
  "$S_FP_FONTS_CENTRAL" 
#--------
if [ "$SB_S_FP_FONTS_HOME_EXISTS_BEFORE_SYMLINK_CREATION_ATTEMPT" == "f" ]; then
    if [ -e "$S_FP_FONTS_HOME" ]; then
        if [ -d "$S_FP_FONTS_HOME" ]; then
            if [ "$SB_FCCACHE_EXISTS_ON_PATH" == "t" ]; then
                if [ "$SB_OPERATINGSYSTEM_LINUX" == "t" ]; then
                    # https://www.techrepublic.com/blog/linux-and-open-source/how-do-i-install-and-use-fonts-in-linux/
                    # archival copy: https://archive.vn/UgphK
                    nice -n 15 fc-cache -f -v 
                    # Related Bash alias: mmmv_admin_refresh_fonts_cache_t1
                fi
            fi
        else
            # Outputs an error message.
            func_mmmv_verify_that_the_folder_exists_but_do_not_exit_t1 \
                "$S_FP_FONTS_HOME" "f1e05d5e-1c0b-4a5f-a218-2163c051c8e7" \
                "$SB_DISPLAY_VERIFICATION_FAILURE_MESSAGE_DEFAULT"
        fi
    fi
fi
#==========================================================================
# S_VERSION_OF_THIS_FILE="9016b53b-7ed0-49b5-8518-2163c051c8e7"
#==========================================================================
