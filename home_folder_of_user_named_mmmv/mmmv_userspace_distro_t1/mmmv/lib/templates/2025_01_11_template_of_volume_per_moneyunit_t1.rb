#!/usr/bin/env ruby
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#
# Tested to work on ("uname -a")
# Linux terminal01 6.1.0-17-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.1.69-1 (2023-12-30) x86_64 GNU/Linux
# with "ruby -v"
# ruby 3.1.2p20 (2022-04-12 revision 4491bb740a) [x86_64-linux]
#==========================================================================

def declare_data(ar=Array.new)
   #Format:  ["<Product URL>", <price in money-units>, <product volume/amount>]
   ar<<["product URL at eshop", 50, 1000]
   ar<<["product Foo URL", 42, 55]
   ar<<["https:///something.something", 300, 8000]
   ar<<["product Bar URL", 2.5, 32]
end # declare_data

#-----------implementation--start------------------------------------------

s_fp_0=ENV["GEM_HOME"]
s_fp_1=s_fp_0.to_s+"/gems/kibuvits_ruby_library_krl171bt4_-2024.1.26"
if File.exist? s_fp_1
   # Optional.
   # https://rubygems.org/gems/kibuvits_ruby_library_krl171bt4_
   require "kibuvits_ruby_library_krl171bt4_"
end # if

ar=declare_data()

def fd_amount_of_product_per_1_moneyunit(ar_x)
   fd_0=((ar_x[2].to_r)/(ar_x[1]))
   return fd_0.to_f
end # fd_amount_of_product_per_1_moneyunit

ar_sorted=ar.sort {|ar_a,ar_b|
   fd_a=fd_amount_of_product_per_1_moneyunit(ar_a)
   fd_b=fd_amount_of_product_per_1_moneyunit(ar_b)
   i_out=nil
   if fd_b<fd_a
      i_out=1
   else
      if fd_a<fd_b
         i_out=(-1)
      else  # fd_a==fd_b
         i_out=0
      end # if
   end # if
   i_out
}

ar_sorted.reverse!
puts("\nProducts sorted according to product volume that can be bought for 1 money-unit:\n\n")
ar_sorted.size.times do |ix|
   ar_elem=ar_sorted[ix]
   fd_product_volume=fd_amount_of_product_per_1_moneyunit(ar_elem).round(3)
   #--------
   s_pv=fd_product_volume.to_s
   s_pv_0=s_pv.sub(/[.].*$/,"")
   s_pv_1=s_pv.sub(/^.+[.]/,"")
   #--------
   i_pv_0_spaces=4-s_pv_0.size
   i_pv_0_spaces=0 if i_pv_0_spaces<0
   s_pv_00=" "*i_pv_0_spaces+s_pv_0
   #--------
   i_pv_1_spaces=4-s_pv_1.size
   i_pv_1_spaces=0 if i_pv_1_spaces<1
   s_pv_11=s_pv_1+" "*i_pv_1_spaces
   #--------
   s_pv_0011=s_pv_00+"."+s_pv_11
   printf("    "+ix.to_s+": "+
   s_pv_0011+" "+ar_elem.to_s+"\n")
end # loop
puts("\n\n")

#==========================================================================
# S_VERSION_OF_THIS_FILE="833afd1a-e224-4714-a4a9-317390b019e7"
#==========================================================================
