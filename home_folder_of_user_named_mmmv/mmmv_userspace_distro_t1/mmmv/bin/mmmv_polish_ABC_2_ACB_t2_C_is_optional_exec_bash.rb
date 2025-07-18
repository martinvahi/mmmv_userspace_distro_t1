#!/usr/bin/env ruby
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#==========================================================================
# Ruby language version related normalization:
#--------------------------------------------------------------------------
# Most Ruby versions prior to Ruby version 3.2.0
# had that method. This code makes old code that
# worked with those older Ruby versions
# work with the Ruby version 3.2.0 .
if !defined? File.exists?
   def File.exists? x
      b=File.exist? x
      return b
   end # File.exists?
end # if
# Ruby 2.4.0 introduced a change, where
# classes Fixnum and Bignum were deprecated
# their use triggered a warning text to stderr
# and their common parent class, Integer,
# was expected to be used instead of them.
# Ruby version 2.7.2 removed the warning from the stderr.
# Ruby version 3.2.0 missed the classes, Fixnum and Bignum.
# The following 2 if-clauses keep the old code working.
if !defined? Fixnum
   Fixnum=Integer
end # if
if !defined? Bignum
   Bignum=Integer
end # if
#--------------------------------------------------------------------------

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

and then that string gets executed as a shell script.

DESCRIPTION

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
   raise(Exception.new("GUID=='350fd62e-685b-41dc-91a5-3340310179e7'\n"))
   #---------------------------------------------------------
end # if

#--------------------------------------------------------------------------

class Boilerplate

   def init_x_fp_mmmv_userspace_distro_t1_fp_ram_partition_64
      ob_x=ENV["MMMV_USERSPACE_DISTRO_T1_FP_RAM_PARTITION_64K"]
      return if ob_x==nil
      s_0=ob_x.to_s.gsub(/[\s\t]+/,"")
      return if s_0==""
      s_fp=s_0.gsub(/[\/]+/,"/").gsub(/[\/]$/,"")
      return if !File.exists? s_fp
      return if File.ftype(s_fp)!="directory"
      @x_fp_mmmv_userspace_distro_t1_fp_ram_partition_64=s_fp
   end # init_x_fp_mmmv_userspace_distro_t1_fp_ram_partition_64

   def initialize
      @x_fp_mmmv_userspace_distro_t1_fp_ram_partition_64=nil
      init_x_fp_mmmv_userspace_distro_t1_fp_ram_partition_64()
   end # initialize

   private

   def generate_tmp_file_name(s_file_name_prefix="tmp_file_",
      s_file_name_suffix="e.txt") # 'e' is a [^\d]
      s=s_file_name_prefix+(Time.new.to_s).gsub!(/[\s;.\\\/:+-]/,"_")
      # 2147483647==2^(32-1)-1, i.e. 0 included
      s=s+'r'+Kernel.rand(2147483647).to_s
      s=s+'r'+Kernel.rand(2147483647).to_s
      s=s+'r'+Kernel.rand(2147483647).to_s+s_file_name_suffix
      return s
   end # generate_tmp_file_name

   public

   def str2file(s_a_string, s_fp)
      begin
         file=File.open(s_fp, "w")
         file.write(s_a_string)
         file.close
      rescue Exception =>err
         raise "No comments. GUID='6ca54218-68a0-4d3f-a2a5-3340310179e7' \n"+
         "s_a_string=="+s_a_string+"\n"+err.to_s+"\n\n"
      end #
   end # str2file

   def generate_tmp_file_absolute_path()
      s_fp0=""
      if @x_fp_mmmv_userspace_distro_t1_fp_ram_partition_64!=nil
         s_fp0<<@x_fp_mmmv_userspace_distro_t1_fp_ram_partition_64
      else
         s_fp0<<"/tmp"
      end # if
      s_fp0<<"/"
      s_fp0<<generate_tmp_file_name()
      return s_fp0
   end # generate_tmp_file_absolute_path


end #  class Boilerplate

ob_bp=Boilerplate.new
#puts(ob_bp.generate_tmp_file_absolute_path())

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
#printf(s_0)
#----------------------------------------
# Citation from Ruby 3.1.2 stdlib core documentation:
#
#     "system returns true if the command gives
#     zero exit status, false for non zero exit
#     status. Returns nil if command execution
#     fails. An error status is available in $?."
#
#----------------------------------------
i_exit_code=1 # error occurred
#s_1=s_0.gsub(/[\\]/,"\\\\").gsub(/[`]/,"\\\\`").gsub(/[$]/,"\\$").gsub(/["]/,'\\"')
s_fp_bash=ob_bp.generate_tmp_file_absolute_path()
ob_bp.str2file(s_0,s_fp_bash)
s_cmd=('bash '+s_fp_bash)+(" ; wait ; rm -f "+s_fp_bash)
x=system(s_cmd) # executes sh, not bash
if x!=nil
   ob_process_status=$?
   x1=ob_process_status.exitstatus
   i_exit_code=x1 if x1!=nil
end # if
exit i_exit_code
#==========================================================================
# S_VERSION_OF_THIS_FILE="126a8a35-7538-44f7-84a5-3340310179e7"
#==========================================================================
