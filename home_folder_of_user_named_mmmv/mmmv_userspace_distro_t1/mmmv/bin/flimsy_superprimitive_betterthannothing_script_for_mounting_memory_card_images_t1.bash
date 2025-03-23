#!/usr/bin/env bash 
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
#
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#
# The credits for the mounting instructions go to:
# https://major.io/2010/12/14/mounting-a-raw-partition-file-made-with-dd-or-dd_rescue-in-linux/ 
# archival copy: https://archive.ph/9r3ip
#==========================================================================

func_print_help_message(){
# The spaces around the "txt1" are compulsory.
# All quotation marks in the heredoc must be paired and their pair mate 
# must reside at the same line or the syntax highlighting might not work.
cat<< 'txt1' #======================================================== 

----------------------------------------------------------------------
1. console argument:  

    Start cylinder number of the mountable partition
    at the USB memory image. The cylinder numbers 
    can be listed by executing:
                         
        fdisk -l <full path to the some_file_name.img>
----------------------------------------------------------------------
2. console argument:  <full path to the the_USB_memory_image.img>
----------------------------------------------------------------------
Optional 3. console argument: 
    Full path to the folder, where the partition is to be mounted.
    
    If the 3. console argument is missing, then the
    mounting point will be `pwd`/mounted_img_partition ,
    which will be created automatically, if it does not exist.
    If the 3. console argument is present, then
    there is no attempt to auto-create the mounting point folder.
    
----------------------------------------------------------------------
txt1
# The previous line with the "txt1" 
# must not have any trailing or preceding spaces.
#======================================================== 
} # func_print_help_message
#--------------------------------------------------------------------------
S_FP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#--------------------------------------------------------------------------
S_FP_MOUNTING_POINT_FOLDER="`pwd`/mounted_img_partition " # a default value
#--------------------------------------------------------------------------

if [ "`which ruby`" == "" ]; then
    echo ""
    echo "Ruby is missing from the PATH."
    echo "Aborting script without mounting anything."
    echo "GUID='03f40451-3f9f-4aae-b427-6321008139e7'"
    echo ""
    exit 1
fi
if [ "`which mount`" == "" ]; then
    echo ""
    echo "The console tool \"mount\" is missing from the PATH."
    echo "Aborting script without mounting anything."
    echo "GUID='163cc275-ade3-4aa5-a427-6321008139e7'"
    echo ""
    exit 1
fi

#--------------------------------------------------------------------------

func_print_help_message_and_exit_with_an_error(){
    func_print_help_message
    echo ""
    echo "Aborting script without doing anything."
    echo "GUID='4a532849-050c-4ec3-b327-6321008139e7'"
    echo ""
    exit 1
} # func_print_help_message_and_exit_with_an_error

S_TMP="$1"
if [ "$S_TMP" == "" ]; then
    func_print_help_message_and_exit_with_an_error
fi
if [ "$S_TMP" == "help" ]; then
    func_print_help_message
    exit 0
fi
if [ "$S_TMP" == "-? " ]; then
    func_print_help_message
    exit 0
fi
if [ "$S_TMP" == "doc" ]; then
    func_print_help_message
    exit 0
fi
if [ "$S_TMP" == "-h" ]; then
    func_print_help_message
    exit 0
fi
if [ "$S_TMP" == "h" ]; then
    #func_print_help_message_and_exit_with_an_error
    func_print_help_message
    exit 0
fi

#--------------------------------------------------------------------------
S_START_SYLINDER_CANDIDATE="$1"

# Leading zeros, like 00001, are OK, but 
# a value that consists of only zeros, like 0000, is not OK.
# The regexp must also mathch values with zeros between
# other digits, like 4040 and 00004040.
# The following regexp also handles the 
# exclusion of negative values, like -42.
S_TMP_0=" grep -E ^[0]*[123456789]+[0123456789]* " # 

S_TMP_1="`echo $S_START_SYLINDER_CANDIDATE`"
S_TMP_2="`echo $S_START_SYLINDER_CANDIDATE | $S_TMP_0 `"
if [ "$S_TMP_1" != "$S_TMP_2" ]; then
    echo ""
    echo "The 1. console argument, the cylinder number, "
    echo "is expected to be a positive whole number, but "
    echo "currently its string form looks like: "
    echo ""
    echo "\"$S_START_SYLINDER_CANDIDATE\""
    echo ""
    echo "Aborting script without doing anything."
    echo "GUID='1dbba982-0749-425a-b127-6321008139e7'"
    echo ""
    exit 1
fi
S_START_SYLINDER="$S_START_SYLINDER_CANDIDATE"
S_OFFSET="`ruby -e \"printf((512*(ARGV[0].to_i)).to_s)\" $S_START_SYLINDER `"

#--------------------------------------------------------------------------

S_FP_USB_IMAGE_FILE_CANDIDATE="$2"

if [ "$S_FP_USB_IMAGE_FILE_CANDIDATE" == "" ]; then
    echo ""
    echo "Image file path is missing."
    echo "Aborting script without doing anything."
    echo "GUID='4ad44e3a-5cae-48b6-8127-6321008139e7'"
    echo ""
    exit 1
fi
if [ ! -e $S_FP_USB_IMAGE_FILE_CANDIDATE ]; then
    echo ""
    echo "Image file with the path of "
    echo ""
    echo "    $S_FP_USB_IMAGE_FILE_CANDIDATE"
    echo ""
    echo "is missing or it is a broken link."
    echo "Aborting script without doing anything."
    echo "GUID='448a8922-dfd6-45cb-9427-6321008139e7'"
    echo ""
    exit 1
fi
if [ -d $S_FP_USB_IMAGE_FILE_CANDIDATE ]; then
    echo ""
    echo "The 2. console argument is expected to"
    echo "reference a file or a link to a file, but the "
    echo ""
    echo "    $S_FP_USB_IMAGE_FILE_CANDIDATE"
    echo ""
    echo "references a folder or a link to a folder."
    echo "Aborting script without doing anything."
    echo "GUID='323ec664-268f-4030-b227-6321008139e7'"
    echo ""
    exit 1
fi
S_FP_USB_IMAGE_FILE="$S_FP_USB_IMAGE_FILE_CANDIDATE"

#--------------------------------------------------------------------------
FP_MOUNTING_POINT_DEFAULT="$S_FP_DIR/mounted_memory_image"
FP_MOUNTING_POINT_CANDIDATE="$3"

if [ "$FP_MOUNTING_POINT_CANDIDATE" == "" ]; then
    FP_MOUNTING_POINT_CANDIDATE="$FP_MOUNTING_POINT_DEFAULT"
fi
if [ -e $FP_MOUNTING_POINT_CANDIDATE ]; then
    if [ ! -d $FP_MOUNTING_POINT_CANDIDATE ]; then
        echo ""
        echo "The optional 3. console argument is expected to"
        echo "reference an existing folder or "
        echo "a link to an existing folder or"
        echo "a non-existing file/folder, but the "
        echo ""
        echo "    $FP_MOUNTING_POINT_CANDIDATE "
        echo ""
        echo "references an existing file or a link to a file."
        echo "Aborting script without doing anything."
        echo "GUID='6dd24a18-6a6c-499a-9527-6321008139e7'"
        echo ""
        exit 1
    fi
else
fi

#--------------------------------------------------------------------------


FP_MOUNTING_POINT="$S_FP_DIR/mounted_memory_image"
mkdir -p $FP_MOUNTING_POINT
if [ ! -e $FP_MOUNTING_POINT ]; then
    echo ""
    echo "The mounting point "
    echo ""
    echo "    $FP_MOUNTING_POINT "
    echo ""
    echo "is missing."
    echo "Aborting script without mounting anything."
    echo "GUID='a87f0123-e1b6-4360-b227-6321008139e7'"
    echo ""
    exit 1
fi
if [ ! -d $FP_MOUNTING_POINT ]; then
    echo ""
    echo "The path to the mounting point "
    echo ""
    echo "    $FP_MOUNTING_POINT "
    echo ""
    echo "references a file or a link to a file, but "
    echo "a folder is expected."
    echo "Aborting script without mounting anything."
    echo "GUID='8455cc51-6ca1-4401-a427-6321008139e7'"
    echo ""
    exit 1
fi


# The credits for the mounting instructions go to:
# https://major.io/2010/12/14/mounting-a-raw-partition-file-made-with-dd-or-dd_rescue-in-linux/ 
# archival copy: https://archive.ph/9r3ip
mount -o ro,loop,offset=$S_OFFSET $S_FP_USB_IMAGE_FILE $FP_MOUNTING_POINT
S_TMP="$?"
if [ "$S_TMP" != 0 ]; then
    echo ""
    echo "Mounting failed. Error code: $S_TMP"
    echo "Aborting script."
    echo "GUID='64c7f653-693c-48be-a127-6321008139e7'"
    echo ""
    exit 1
fi

#--------------------------------------------------------------------------
exit 0
#==========================================================================
# S_VERSION_OF_THIS_FILE="27e58154-36bb-4ff3-a527-6321008139e7"
#==========================================================================
