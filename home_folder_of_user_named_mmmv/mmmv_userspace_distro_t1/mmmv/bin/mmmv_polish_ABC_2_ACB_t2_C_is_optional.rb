#!/usr/bin/env ruby
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#==========================================================================

s_general_idea=<<DESCRIPTION
The general idea:

        A B +  -->  A+B
        A B    -->  AB

    mmmv_polish_ABC_2_ACB_t2_C_is_optional A B \+
    # gives
    A+B

    mmmv_polish_ABC_2_ACB_t2_C_is_optional A B
    # gives
    AB

DESCRIPTION

# This Ruby script is meant to be used in conjunction with the
# standard command line tool "xargs". The Ruby based implementation
# of the functionality of this script is horribly slow due to the
# Ruby interpreter initialization and the ~40MiB of RAM
# that it takes to start the Ruby interpreter, but Ruby
# handles strings properly and Ruby behaves the same way on both,
# Linux and BSD. It takes less human work to implement the
# functionality of this script in Ruby than it takes to create
# a proper console tool with proper UTF-8 support in C/C++.
#--------------------------------------------------------------------------

i_0=ARGV.size # ARGV.class == Array by the stdlib definition, hence no test here
#puts ARGV.class.to_s
#exit 1

if (i_0 < 2) || (3 < i_0)
   #---------------------------------------------------------
   s_fn=__FILE__
   s_0=s_fn.reverse
   s_1=""
   if s_0.index("/")!=nil
      s_1=s_0[0..(s_0.index("/")-1)]
   else
      s_1=s_0[0..(-1)]
   end # if
   s_2=s_1.reverse
   #---------------------------------------------------------
   s_err="\n"
   s_err<<"The "+s_2+
   "\n\e[31mrequires at least 2 arguments and at most 3 arguments\e[39m.\n"
   s_err<<s_general_idea
   puts(s_err)
   raise(Exception.new("GUID=='ad167624-13e2-4667-b35d-a080310179e7'\n"))
   #---------------------------------------------------------
end # if

#--------------------------------------------------------------------------
# Some comments about the string concatenation:
# https://github.com/martinvahi/mmmv_notes/blob/main/mmmv_notes/phenomenon_scrutinization/string_concatenation/COMMENTS.txt
# https://sourceforge.net/p/mmmv-notes/code/ci/master/tree/mmmv_notes/phenomenon_scrutinization/string_concatenation/COMMENTS.txt
#----------------------------------------
s_argv_0=ARGV[0].to_s
s_argv_1=ARGV[1].to_s
s_argv_2=nil
s_argv_2=ARGV[2].to_s  if i_0==3
s_0=""
s_0<<s_argv_0
s_0<<s_argv_2 if s_argv_2 != nil
s_0<<s_argv_1
printf(s_0)
#==========================================================================
# S_VERSION_OF_THIS_FILE="45635b21-6bf7-4966-a35d-a080310179e7"
#==========================================================================
