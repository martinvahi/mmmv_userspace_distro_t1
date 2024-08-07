#!/usr/bin/env ruby
#==========================================================================
# Initial author: Martin.Vahi@softf1.com
# This file is in public domain.
#--------------------------------------------------------------------------
require "./mmmv_ruby_boilerplate_t3.rb"

#--------------------------------------------------------------------------

ar_s=["aa","bb","cc"]
s=kibuvits_krl171bt3_s_concat_array_of_strings(ar_s)
puts s
puts kibuvits_krl171bt3_factorial(4).to_s
puts Kibuvits_krl171bt3_rng.i_random_t1(42).to_s
puts kibuvits_krl171bt3_hash_plaice_t1("abcc")

#-------------------------------
s_cleartext="aa"
s_normalized=Kibuvits_krl171bt3_cleartext_length_normalization.s_normalize_t1(
s_cleartext,42) # 42 is too short for real data
puts "\nNormalized text:\n"+s_normalized+"\n\n"
s_denormalized=Kibuvits_krl171bt3_cleartext_length_normalization.s_normalize_t1_extract_cleartext(
s_normalized,$kibuvits_krl171bt3_msgc_stack)
puts "denormalized text:\n"+s_denormalized+"\n\n"
#-------------------------------
s=Kibuvits_krl171bt3_cg.fill_form([],"")
#-------------------------------
s_php_array_variable_name="arht_uuu"
ar_or_ht_x=Hash.new
ar_or_ht_x["ee"]=44
ar_or_ht_x[55]="ihii"
ar_or_ht_x[57]=4.5
s_x=Kibuvits_krl171bt3_cg_php_t1.s_ar_or_ht_2php_t1(s_php_array_variable_name,
ar_or_ht_x)
#-------------------------------
ob_arcursor=Kibuvits_krl171bt3_arraycursor_t1.new
ob_arcursor.reset(["aa","bb","cc"])
if ob_arcursor.inc()!="aa"
   raise(Exception.new("GUID=='e715b4f5-6e43-43d8-9611-63e18001c6e7'"))
end # if
if ob_arcursor.inc()!="bb"
   raise(Exception.new("GUID=='5e337c93-e0a7-46d3-a411-63e18001c6e7'"))
end # if
ob_arcursor.reset([])
if ob_arcursor.inc()!=nil
   raise(Exception.new("GUID=='352e51ab-7b0b-438f-8211-63e18001c6e7'"))
end # if
if ob_arcursor.inc()!=nil
   raise(Exception.new("GUID=='18440446-6b1f-4537-8411-63e18001c6e7'"))
end # if
if ob_arcursor.dec()!=nil
   raise(Exception.new("GUID=='52207433-7e84-49df-9211-63e18001c6e7'"))
end # if
#-------------------------------
#ht_dependency_relations=Hash.new
#ht_dependency_relations["Micky"]=["Donald","Pluto"]
#ht_dependency_relations["Swan"]=[]
#ht_dependency_relations["Horse"]=["Mule"]
#ht_dependency_relations["Frog"]=nil
#ht_dependency_relations["Butterfly"]="Beetle"
#-------------------------------

#==========================================================================
