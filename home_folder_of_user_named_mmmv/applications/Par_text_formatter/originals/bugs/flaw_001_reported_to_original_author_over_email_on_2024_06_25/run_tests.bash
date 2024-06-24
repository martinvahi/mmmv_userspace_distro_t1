#!/usr/bin/env bash

S_COLOR_START="\e[34m"
S_COLOR_END="\e[39m"
S_FP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
S_FP_TXT_01="$S_FP_DIR/testdata/testdata_01.txt"
S_FP_TXT_02="$S_FP_DIR/testdata/testdata_02.txt"
S_FP_TXT_03="$S_FP_DIR/testdata/testdata_03.txt"
S_FP_TXT_04="$S_FP_DIR/testdata/testdata_04.txt"
S_FP_TXT_05="$S_FP_DIR/testdata/testdata_05.txt"
S_FP_TXT_06="$S_FP_DIR/testdata/testdata_06.txt"
S_FP_TXT_07="$S_FP_DIR/testdata/testdata_07.txt"
S_FP_TXT_08="$S_FP_DIR/testdata/testdata_08.txt"

func_run_test(){
    local S_FP_IN="$1"
    local SI_IN="$2"
    #----------------
    echo ""
    echo -e "-----citation--of--the--`basename $S_FP_IN`---start-----$S_COLOR_START"
    cat $S_FP_IN
    echo -e "$S_COLOR_END-----citation--of--the--`basename $S_FP_IN`---end-----"
    S_CMD="par_text_formatter $SI_IN"
    echo -e "Below is the output of the Bash command \"\e[33m$S_CMD\e[39m\", without the quotation marks:"
    echo "----par_text_formatter--output--citation--start-----"
    cat $S_FP_IN | $S_CMD
    echo "----par_text_formatter--output--citation--end-------"
    #----------------
} # func_run_test

func_run_test "$S_FP_TXT_01" "100"
func_run_test "$S_FP_TXT_02" "30"
func_run_test "$S_FP_TXT_03" "30"
func_run_test "$S_FP_TXT_04" "45"
func_run_test "$S_FP_TXT_05" "45"
func_run_test "$S_FP_TXT_06" "45"
func_run_test "$S_FP_TXT_07" "45"
func_run_test "$S_FP_TXT_08" "45"


