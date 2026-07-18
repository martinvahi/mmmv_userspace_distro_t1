#!/usr/bin/env bash
#==========================================================================
# Author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#
# The main use case of this script is described at the next if-clause:

if [ "$1" != "" ]; then
    echo -e ""
    echo -e "This script\e[31m does not take any command line arguments\e[39m."
    echo -e "This script reads a string like"
    echo -e "    \"\e[36mFoo----Scie/nti"'\\'"fic   Bar by Commander Data,Spock and Christine Chapel\e[39m\""
    echo -e "from clipboard, converts it to"
    echo -e "    \"\e[36mFooScie_atleast1slash_nti_atleast1backslash_fic_Bar_by_Commander_Data_and_Spock_and_Christine_Chapel.pdf\e[39m\""
    echo -e "and puts the conversion result to clipboard."
    echo -e "GUID=='32ffc711-dedb-4263-b013-715360d07ae7'"
    echo -e ""
    exit 1
fi

#--------------------------------------------------------------------------
func_mmmv_assert_exists_on_path_t1c() {
    local S_NAME_OF_THE_EXECUTABLE="$1" # first function argument
    #----------------------------------------------------------------------
    local S_TMP_0="\`which $S_NAME_OF_THE_EXECUTABLE 2> /dev/null\`"
    local S_TMP_1=""
    local S_TMP_2="S_TMP_1=$S_TMP_0"
    eval ${S_TMP_2}
    if [ "$S_TMP_1" == "" ]; then
        S_TMP_0="This bash script requires the \""
        S_TMP_1="\" to be on the PATH."
        #--------
        echo ""
        echo -e "$S_TMP_0\e[31m$S_NAME_OF_THE_EXECUTABLE\e[39m$S_TMP_1"
        echo "GUID=='10b4a0b5-1419-4954-bf53-715360d07ae7'"
        echo ""
        cd "$S_FP_ORIG"
        exit 1 # exit with an error
    fi
} # func_mmmv_assert_exists_on_path_t1c

func_mmmv_assert_exists_on_path_t1c "tr"
func_mmmv_assert_exists_on_path_t1c "cat"

#--------------------------------------------------------------------------

S_FP_TMP_RAMPARTITION_OR_HDD="/tmp" ;
if [ "$MMMV_USERSPACE_DISTRO_T1_FP_RAM_PARTITION_64K" != '' ]; then
    if [ -d "$MMMV_USERSPACE_DISTRO_T1_FP_RAM_PARTITION_64K" ]; then
        S_FP_TMP_RAMPARTITION_OR_HDD="$MMMV_USERSPACE_DISTRO_T1_FP_RAM_PARTITION_64K"
        # On Linux it is likely that temporary files that are created
        # by this script get read and deleted before they get sync-ed
        # to disk even if their path is within "/tmp". That is to say,
        # the use of the MMMV_USERSPACE_DISTRO_T1_FP_RAM_PARTITION_64K
        # is about consistency of not wearing permanent storage devices
        # with temporary data.
    fi
fi
S_CMD_GNU_SED="sed" ;
if [ "`uname -a | grep -i 'BSD' `" != '' ]; then
    S_CMD_GNU_SED="gsed"
fi ; wait
func_mmmv_assert_exists_on_path_t1c "$S_CMD_GNU_SED"
S_CMD_CLIPBOARD_2_STDOUT="xclip -out " ; wait
S_CMD_STDOUT_2_CLIPBOARD="xclip -selection c -in " ; wait
if [ "`uname -a | grep -i 'Microsoft' `" != '' ]; then
    echo '' > /dev/null ; wait
    func_mmmv_assert_exists_on_path_t1c "powershell.exe"
    S_CMD_CLIPBOARD_2_STDOUT="powershell.exe -c Get-Clipboard " ; wait
    func_mmmv_assert_exists_on_path_t1c "clip.exe"
    S_CMD_STDOUT_2_CLIPBOARD="clip.exe " ; wait
else
    func_mmmv_assert_exists_on_path_t1c "xclip"
fi ; wait
if [ "`which uuid 2>/dev/null `" != "" ]; then
    S_FN_SUFFIX="`uuid | $S_CMD_GNU_SED -e 's/-//g'`.txt" ; wait
else
    func_mmmv_assert_exists_on_path_t1c "uuidgen"
    S_FN_SUFFIX="`uuidgen | $S_CMD_GNU_SED -e 's/-//g'`.txt" ; wait
fi
S_FP_TMP_0="$S_FP_TMP_RAMPARTITION_OR_HDD/tmp_0_$S_FN_SUFFIX" ; wait
#---------------------------------------
# That kind of probability based hack is not good enough for automated
# use cases, but this script is meant for manual use anyway, so in the
# name of script simplicity this probability based hack will do.
S_SUBST_0="AA🥒⇛⇛🥏🍁🐢🐝🦟🐘🥏💌🐘🌼🎱🎱🐝🐌🐌🐌🐌🐌🥀🐌📫🎉⇛🪚🔻🌛⇉⇉⇉⇉🐌🐌🐪🎮♓♥🆙✨💓🎱🦜🦟🦜🦜💓🦠🕢💌💌🦜🌺🌺🦠🐢🍸➿🕢🆙🛷💌🎹🫛⚙👔⇛🍁🎂🔙🥒077745fe41M653Wa94c6921d23936fdBB"
# In theory there might be an option to increase the string to some
# string longer than maximum allowed file name length of 256 characters
# and then use checks that the initial file name is not a substring
# of the temporary string, but that would make the code here longer, more complex.
#---------------------------------------
nice -n 2 $S_CMD_CLIPBOARD_2_STDOUT | \
    $S_CMD_GNU_SED -e 's/[\r][\n]/\n/g' | \
    $S_CMD_GNU_SED -e 's/[\r]/\n/g' | \
    tr '\n\t' ' ' | \
    tr -d '$^{}<>()[];:&-' | \
    tr '?"|!' ' ' | \
    tr "'" ' ' | \
    $S_CMD_GNU_SED -e 's/^[[:blank:]]\+//g' | \
    $S_CMD_GNU_SED -e 's/[[:blank:]]\+$//g' | \
    $S_CMD_GNU_SED -e 's/[.]\([^_\/][^_\/][^_\/][^_\/]\?\)$/'"$S_SUBST_0"'\1/g' | \
    $S_CMD_GNU_SED -e 's/[\]\+/_atleast1backslash_/g' | \
    $S_CMD_GNU_SED -e 's/[\/]\+/_atleast1slash_/g' | \
    $S_CMD_GNU_SED -e 's/[.]\+/_/g' | \
    $S_CMD_GNU_SED -e 's/^[[:blank:]]\+//g' | \
    $S_CMD_GNU_SED -e 's/[[:blank:]]\+$//g' | \
    $S_CMD_GNU_SED -e 's/[[:blank:]]*[,]\+[[:blank:]]*/,/g' | \
    $S_CMD_GNU_SED -e 's/[,]\+/,/g' | \
    $S_CMD_GNU_SED -e 's/[,]/_and_/g' | \
    $S_CMD_GNU_SED -e 's/\(_and\)\+/_and/g' | \
    $S_CMD_GNU_SED -e 's/[[:blank:]]\+/_/g' | \
    $S_CMD_GNU_SED -e 's/[’]\+/_/g' | \
    $S_CMD_GNU_SED -e 's/['"'"']\+/_/g' | \
    $S_CMD_GNU_SED -e 's/[_]\+/_/g' | \
    $S_CMD_GNU_SED -e 's/[_]$//g' | \
    $S_CMD_GNU_SED -e 's/\(_and\)\+$//g' | \
    $S_CMD_GNU_SED -e 's/'"$S_SUBST_0"'\([^_\/][^_\/][^_\/][^_\/]\?\)$/.\1/g' | \
    $S_CMD_GNU_SED -e 's/[.][pP][dD][fF]$/.pdf/g' | \
    $S_CMD_GNU_SED -e 's/$/.pdf/g' | \
    $S_CMD_GNU_SED -e 's/\([.]pdf\)\+/.pdf/g' | \
    $S_CMD_GNU_SED -e 's/[_]and[_]\?[.]pdf$/.pdf/g' > $S_FP_TMP_0 ; wait
#---------------------------------------
# Some commands that were in use at the above text processing
# pipeline at some version of this script:
#     tr -d '/\\-'
# Some Bash testlines:
#     printf 'a\\\\b/////c/d...e'"\n" | gsed -e 's/[\]\+/X/g' | gsed -e 's/[\/]\+/Y/g' | gsed -e 's/[.]\+/_/g'
#     printf 'abcd_efgh'"\n" | gsed -e 's/[_]\([^_\/][^_\/][^_\/][^_\/]\?\)$/.\1/g'
#     echo "abcd.PdF" | gsed -e 's/[.][pP][dD][fF]$/.pdf/g'
#     echo "A_and_and_B_and__and_C" | gsed -e 's/\(_and\)\+/_/g'
#
#     S_SUBST_0="AA🥒⇛⇛🥏🍁🐢🐝🦟🐘🥏💌🐘🌼🎱🎱🐝🐌🐌🐌🐌🐌🥀🐌📫🎉⇛🪚🔻🌛⇉⇉⇉⇉🐌🐌🐪🎮♓♥🆙✨💓🎱🦜🦟🦜🦜💓🦠🕢💌💌🦜🌺🌺🦠🐢🍸➿🕢🆙🛷💌🎹🫛⚙👔⇛🍁🎂🔙🥒077745fe41M653Wa94c6921d23936fdBB"
#     echo "ab.cde" | gsed -e 's/[.]\([^_\/][^_\/][^_\/][^_\/]\?\)$/'"$S_SUBST_0"'\1/g' | gsed -e 's/'"$S_SUBST_0"'\([^_\/][^_\/][^_\/][^_\/]\?\)$/{.}{\1}/g'
#     echo "S_SUBST_0 == \"$S_SUBST_0\""
#
# Some test strings for placing on clipbard:
#     "   {foo}}? [bar-bar] "by "AAAA '''aaaa', //BBBB\\ bbbb,,,, , CCC_ccc and DDDD dddd_and_EEEEE eee,,,and.pdf   "
#
#---------------------------------------
cat $S_FP_TMP_0 | $S_CMD_STDOUT_2_CLIPBOARD ; wait
rm -f $S_FP_TMP_0 ; wait
exit 0
#==========================================================================
# S_VERSION_OF_THIS_FILE="546364f1-9087-434c-9b43-715360d07ae7"
#==========================================================================
