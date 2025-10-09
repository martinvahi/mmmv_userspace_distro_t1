#!/usr/bin/env ruby
#==========================================================================
# Initial author of this file:
# This file is in public domain.
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#
# Tested to work with ("ruby -v")
# ruby 3.4.1 (2025-05-18) +PRISM [x86_64-linux]
# on ("uname -a")
# Linux terminal01 6.1.0-39-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.1.148-1 (2025-08-26) x86_64 GNU/Linux
#==========================================================================
# https://rubygems.org/gems/kibuvits_ruby_library_krl171bt4_
require "kibuvits_ruby_library_krl171bt4_" # by Martin.Vahi@softf1.com under BSD license
#--------------------------------------------------------------------------
$s_program_description=<<DESCRIPTION

This program does:
    Foo
    Bar

DESCRIPTION
#--------------------------------------------------------------------------

class Application_main

   def initialize
   end # initialize

   #-----------------------------------------------------------------------
   private

   def demo_use_of_the_XML_analogue_named_ProgFTE
      ht=Hash.new
      ht["planet_name"]="Mars"
      ht["issue"]="non-breathable athmosphere"
      s_progfte=Kibuvits_krl171bt4_ProgFTE_v1.from_ht(ht)
      ht_from_a_string=Kibuvits_krl171bt4_ProgFTE_v1.to_ht(s_progfte)
      return s_progfte
   end # demo_use_of_the_XML_analogue_named_ProgFTE

   def demo_read_add_write_textfile (s_fp_in, i_failures_of_humanity=7)
      if KIBUVITS_krl171bt4_b_DEBUG
         bn=binding()
         kibuvits_krl171bt4_typecheck bn, String, s_fp_in
         kibuvits_krl171bt4_typecheck bn, Integer, i_failures_of_humanity
      end # if
      s_in=kibuvits_krl171bt4_file2str(s_fp_in)
      #--------------------------------------------------------------------
      ar_s=Array.new
      ar_s<<s_in
      ar_s<<"Hello \n"
      ar_s<<"World \n"
      ar_s<<"War? :( \n"
      #--------
      s_progfte=demo_use_of_the_XML_analogue_named_ProgFTE()
      ar_s<<(s_progfte+$kibuvits_krl171bt4_lc_linebreak)
      #--------
      s_out=kibuvits_krl171bt4_s_concat_array_of_strings(ar_s)
      #--------------------------------------------------------------------
      s_fp_out="/tmp/modified.txt"
      kibuvits_krl171bt4_str2file(s_out, s_fp_out)
   end # demo_read_add_write_textfile

   #-----------------------------------------------------------------------
   public

   def run
      if 0 < ARGV.size
         puts($s_program_description)
      else
         s_fp_in="/tmp/some.txt"
         demo_read_add_write_textfile(s_fp_in)
      end # if
   end # run

end # class Application_main
Application_main.new.run
#==========================================================================
# S_VERSION_OF_THIS_FILE="de93f693-5a4e-45b8-b2fb-21308050a9e7"
#==========================================================================
