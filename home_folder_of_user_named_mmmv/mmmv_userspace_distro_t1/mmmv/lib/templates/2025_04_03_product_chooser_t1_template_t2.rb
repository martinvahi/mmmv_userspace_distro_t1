#!/usr/bin/env ruby
#==========================================================================
# Author of this file: INCOMPLETE
# This file is in public domain.
#
# This file is a template for code that tries to find out, which product
# offers best value for a money-unit. The current intentionally hacky
# sample code has an objective function that calculates
#
#    product_goodness = ( quantity_in_package / package_price ) * some_constant
#
# but this intentionally hacky code here is primitive enough to be easily
# modified to use more complex definitions for assessing the goodness of
# products. Product list resides at
#
#     declare_product_data()
#
# List of methods that are expected to be customized if the
# objective function, the
#
#     fd_objective_function(...)
#
# is modified:
#
#     declare_product(...)
#     declare_product_data()
#     s_product(...)
#
# Dependencies:
#     
#     gem install youplot  kibuvits_ruby_library_krl171bt4_
#
# Usage of this script on Bash console:
#
#     the_name_of_this_script.rb                               # displays the best product
#     the_name_of_this_script.rb spacelessASCIIstring          # as above, but also lists products
#     the_name_of_this_script.rb spacelessASCIIstring  Foo     # ... in color
#     the_name_of_this_script.rb spacelessASCIIstring  Foo Bar # ... and displays a command-line-graph
#
#==========================================================================
# Initial template of this file has been tested to work on ("uname -a")
# Linux DESKTOP-H12EA8D 5.10.43.3-microsoft-standard-WSL2 #1 SMP Fri Oct 1 16:30:18 EEST 2021 x86_64 GNU/Linux
# with ("ruby -v")
# ruby 3.1.2p20 (2022-04-12 revision 4491bb740a) [x86_64-linux]
#
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
# Author of the initial template of this file: Martin.Vahi@softf1.com
#==========================================================================
#:::::::::::::start_of_boilerplate_that_You_should_not_read::::::::::::::::
#--------------------------------------------------------------------------
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
#==========================================================================
KIBUVITS_krl171bt4_b_DEBUG=true
s_gem_name="kibuvits_ruby_library_krl171bt4_"
begin
   require s_gem_name
rescue Exception => e
   puts("")
   puts("The Ruby gem named \"\e[33m"+s_gem_name+"\e[39m\"")
   puts("seems to be\e[31m not yet installed\e[39m. The ")
   puts("")
   puts("    require \""+s_gem_name+"\"")
   puts("")
   puts("will probably work after executing the following Bash command line:")
   puts("")
   puts("\e[36m    gem install "+s_gem_name+" \e[39m")
   puts("")
   s_fp_mmmv_userspace_distro_t1_home=ENV["MMMV_USERSPACE_DISTRO_T1_HOME"].to_s
   if 0<s_fp_mmmv_userspace_distro_t1_home.size
      s_fp_gem=s_fp_mmmv_userspace_distro_t1_home+"/mmmv/lib/templates/2024_01_26_kibuvits_ruby_library_krl171bt4_.tar.lz"
      if File.exists? s_fp_gem
         puts("or if the online installation is not an option, then ")
         puts("the library seem to be avaliable from")
         puts("")
         puts("\e[36m    "+s_fp_gem+"\e[39m")
         puts("")
      end # if
   end # if
   puts("Exiting without doing anything.")
   puts("GUID=='f488bf3f-2f49-4dc6-a2a6-2341213049e7'")
   puts("")
   exit 1
end # rescue
#--------------------------------------------------------------------------
#:::::::::::::::end_of_boilerplate_that_You_should_not_read::::::::::::::::
#--------------------------------------------------------------------------
class Product_selector_implementation
   #-----------------------------------------------------------------------
   def initialize
      # The
      @mx0=Mutex.new
      # is to allow the use of instance variables for passing data
      # between methods, which in turn removes some text clutter
      # from code. It's an intentionally hacky implementation, all
      # in the name of minimizing human work at data entry and code
      # customization while keeping the whole implementation as primitive
      # as possible. Otherwise one might implement some fancy parser and
      # use code generation to simplify the data entry and objective
      # function customization.
   end # initialize

   private

   #-----------------------------------------------------------------------

   def assert_require_t1(s_gem_name,s_optional_error_message_suffix=nil)
      if KIBUVITS_krl171bt4_b_DEBUG
         bn=binding()
         kibuvits_krl171bt4_typecheck(bn,String,s_gem_name)
         kibuvits_krl171bt4_typecheck(bn,[NilClass,String],s_optional_error_message_suffix)
         s_0=s_gem_name.gsub(/[\s\n\r\t]/,$kibuvits_krl171bt4_lc_emptystring)
         if s_0.size != s_gem_name.size
            kibuvits_krl171bt4_throw("\nThe s_gem_name(==\""+s_gem_name+"\") contained \n"+
            "spaces or tabulation characters or linebreaks.\n"+
            "GUID='2aa25a17-a351-4b56-95a6-2341213049e7'")
         end # if
      end # if
      begin
         require s_gem_name
      rescue Exception => e
         #----------------
         b_probably_a_gem=true
         b_probably_a_gem=false if a_gem_name.match(/[.][rR][bB]$/) != nil
         #----------------
         puts("")
         if b_probably_a_gem
            puts("The Ruby gem with the name of")
            puts("\"\e[33m"+s_gem_name+"\e[39m\"")
            puts("seems to be \e[31m not yet installed\e[39m. The")
            puts("")
            puts("    require \""+s_gem_name+"\"")
            puts("")
            puts("MIGHT work after executing the following Bash command line:")
            puts("")
            puts("\e[36m    gem install "+s_gem_name+" \e[39m")
            puts("")
         else
            if File.exists? s_gem_name
               if File.directory? s_gem_name
                  puts("A folder or a symlink to a folder with the name or path of")
                  puts("\"\e[33m"+s_gem_name+"\e[39m\"")
                  puts("exists, but \e[31m a Ruby file is expected\e[39m. ")
               else
                  puts("A file or a symlink to a file with the name or path of")
                  puts("\"\e[33m"+s_gem_name+"\e[39m\"")
                  puts("exists, but it\e[31m could not be loaded as a Ruby library\e[39m. ")
               end # if
            else
               puts("The Ruby file with the name of")
               puts("\"\e[33m"+s_gem_name+"\e[39m\"")
               puts("seems to be \e[31m not available\e[39m. ")
            end # if
         end # if
         puts("")
         puts("Exiting without doing anything.")
         puts("GUID=='234f4011-7311-4ccb-a1a6-2341213049e7'")
         puts s_optional_error_message_suffix if s_optional_error_message_suffix!= nil
         puts("")
         exit 1
         #----------------
      end # rescue
   end # assert_require_t1

   #-----------------------------------------------------------------------

   # It's quite a hacky function, but so is this whole file.
   # All in the name of primitivity.
   def s_product(ht_product,b_use_colors=false,b_use_the_best_product_color_theme=false)
      if KIBUVITS_krl171bt4_b_DEBUG
         bn=binding()
         kibuvits_krl171bt4_typecheck(bn,Hash,ht_product)
         kibuvits_krl171bt4_typecheck(bn,[TrueClass, FalseClass],b_use_colors)
         kibuvits_krl171bt4_typecheck(bn,[TrueClass, FalseClass],b_use_the_best_product_color_theme)
      end # if
      #----------------
      i_n_of_digits=4
      #----------------
      s_out=""
      if b_use_colors
         if b_use_the_best_product_color_theme
            s_out<<("\n\e[42m\e[30m"+ht_product["s_product_id"]+"\e[49m\e[39m\n")
            if ht_product.has_key? "fd_mark"
               #s_out<<("        fd_mark==\e[95m"+ht_product["fd_mark"].to_f.round(i_n_of_digits).to_s+"\e[39m\n")
               s_out<<("                   fd_mark==\e[42m\e[30m"+ht_product["fd_mark"].to_f.round(i_n_of_digits).to_s+"\e[49m\e[39m\n")
            end # if
            if ht_product.has_key? "fd_quantity_in_package"
               s_out<<("    fd_quantity_in_package=="+ht_product["fd_quantity_in_package"].to_f.round(i_n_of_digits).to_s+"\n")
            end # if
            if ht_product.has_key? "fd_package_price"
               s_out<<("          fd_package_price=="+ht_product["fd_package_price"].to_f.round(i_n_of_digits).to_s+"\n")
            end # if
         else
            s_out<<("\n"+ht_product["s_product_id"]+"\n")
            s_out<<("                   fd_mark==\e[95m"+ht_product["fd_mark"].to_f.round(i_n_of_digits).to_s+"\e[39m\n") if ht_product.has_key? "fd_mark"
            s_out<<("    fd_quantity_in_package=="+ht_product["fd_quantity_in_package"].to_f.round(i_n_of_digits).to_s+"\n") if ht_product.has_key? "fd_quantity_in_package"
            s_out<<("          fd_package_price=="+ht_product["fd_package_price"].to_f.round(i_n_of_digits).to_s+"\n") if ht_product.has_key? "fd_package_price"
         end # if
      else
         s_out<<("\n"+ht_product["s_product_id"]+"\n")
         s_out<<("                   fd_mark=="+ht_product["fd_mark"].to_f.round(i_n_of_digits).to_s+"\n") if ht_product.has_key? "fd_mark"
         s_out<<("    fd_quantity_in_package=="+ht_product["fd_quantity_in_package"].to_f.round(i_n_of_digits).to_s+"\n") if ht_product.has_key? "fd_quantity_in_package"
         s_out<<("          fd_package_price=="+ht_product["fd_package_price"].to_f.round(i_n_of_digits).to_s+"\n") if ht_product.has_key? "fd_package_price"
      end # if
      return s_out
   end # s_product


   #-----------------------------------------------------------------------

   # https://github.com/red-data-tools/YouPlot
   #
   #  gem install youplot
   #  Testline:
   #  printf 'X axis name,Y axis name \n -5,20 \n 0,25 \n 10,-5\n' | uplot scatter -H -d, -t IRIS --xlim -10,20  --ylim -10,30
   def display_plot_youplot(ar_products)
      if KIBUVITS_krl171bt4_b_DEBUG
         bn=binding()
         kibuvits_krl171bt4_typecheck(bn,Array,ar_products)
         kibuvits_krl171bt4_typecheck_ar_content(bn,Hash,ar_products,
         "GUID=='55d6f85f-0d10-433d-b2a6-2341213049e7'")
      end # if
      #---------------
      ar_products_sorted=ar_products.sort{|a,b| a["fd_package_price"]<=>b["fd_package_price"]}
      i_ar_products_len=ar_products.size
      if ar_products_sorted.size != i_ar_products_len
         kibuvits_krl171bt4_throw("\nThis code is flawed.\n"+
         "GUID='5ad6a634-a69e-4a2c-82a6-2341213049e7'")
      end # if
      ar_x=Array.new
      ar_y=Array.new
      ht_product=nil
      i_ar_products_len.times do |ix|
         ht_product=ar_products[ix]
         ar_x<<((ht_product["fd_package_price"]).round(3))
         ar_y<<((ht_product["fd_mark"]).round(3))
      end # loop
      #---------------
      fd_x_margin=(@fd_package_price_max-@fd_package_price_min).abs*(0.2)+1
      fd_y_margin=(@fd_mark_max-@fd_mark_min).abs*(0.2)+1
      #----
      #i_x_min=((@fd_package_price_min-fd_x_margin).floor).to_i
      i_x_min=0
      i_x_max=((@fd_package_price_max+fd_x_margin).floor).to_i
      i_x_min=-1 if 0 <= i_x_min
      #----
      #i_y_min=((@fd_mark_min-fd_y_margin).floor).to_i
      i_y_min=0
      i_y_max=((@fd_mark_max+fd_y_margin).floor).to_i
      i_y_min=-1 if 0 <= i_y_min
      #--------------------------------------------------------------------
      ar_s=Array.new
      ar_s<<"Product Package Price, Product Goodness id est Product mark \n"  # x title, y title
      i_ar_products_len.times do |ix|
         ar_s<<(ar_x[ix].to_f.round(3).to_s+" , "+ar_y[ix].to_f.round(3).to_s+$kibuvits_krl171bt4_lc_linebreak)
         #puts(ar_y[ix].to_f.round(3).to_s)
      end # loop
      s_csv=kibuvits_krl171bt4_s_concat_array_of_strings(ar_s)
      s_fp_csv=Kibuvits_krl171bt4_os_codelets.generate_tmp_file_absolute_path()
      kibuvits_krl171bt4_str2file(s_csv,s_fp_csv)
      #--------------------------------------------------------------------
      s_cmd="cat "+s_fp_csv+" | uplot scatter -H -d, -t IRIS --xlim "+
      i_x_min.to_s+","+i_x_max.to_s+" --ylim "+i_y_min.to_s+","+i_y_max.to_s+
      " -w 80  -h 30 "+
      " --title 'Product Goodness by Product Package Price' ; wait ; sync "
      #--------------------------------------------------------------------
      #puts s_cmd
      system(s_cmd)
      File.delete s_fp_csv if File.exists? s_fp_csv
      #--------------------------------------------------------------------
   end # display_plot_youplot

   #-----------------------------------------------------------------------

   # Returns a mark. The higher the mark, the better the product.
   def fd_objective_function(ht_product)
      if KIBUVITS_krl171bt4_b_DEBUG
         bn=binding()
         kibuvits_krl171bt4_typecheck(bn,Hash,ht_product)
      end # if
      fd_p=ht_product["fd_package_price"]
      fd_q=ht_product["fd_quantity_in_package"]
      fd_quantity_in_package_per_moneyunit=((fd_q.to_r)/fd_p)/1000**3
      fd_mark=fd_quantity_in_package_per_moneyunit # the higher the better
      return fd_mark
   end # fd_objective_function

   #-----------------------------------------------------------------------

   def declare_product(fd_package_price,fd_quantity_in_package,s_product_id)
      if KIBUVITS_krl171bt4_b_DEBUG
         bn=binding()
         ar_number_classes=[Integer,Bignum,Fixnum,Float,Rational]
         kibuvits_krl171bt4_typecheck(bn,ar_number_classes,fd_package_price)
         kibuvits_krl171bt4_typecheck(bn,ar_number_classes,fd_quantity_in_package)
         kibuvits_krl171bt4_typecheck(bn,String,s_product_id)
         kibuvits_krl171bt4_assert_is_smaller_than_or_equal_to(bn,
         0, fd_package_price,
         "GUID=='5cb40995-8280-477c-9596-2341213049e7'")
         kibuvits_krl171bt4_assert_is_smaller_than_or_equal_to(bn,
         0, fd_quantity_in_package,
         "GUID=='91af785a-6b31-4f98-8396-2341213049e7'")
      end # if
      ht_product=Hash.new
      fd_p=fd_package_price.to_r
      fd_q=fd_quantity_in_package.to_r
      ht_product["fd_package_price"]=fd_p
      ht_product["fd_quantity_in_package"]=fd_q
      ht_product["s_product_id"]=s_product_id
      @ar_products<<ht_product
   end # declare_product

   #-----------------------------------------------------------------------

   def declare_product_data()
      #--------------------------------------------------------------------
      # Mõned praktilised Bash-read andmete manuaal-töötluseks:
      #     cat ./tore.txt | grep -v -E '[ |/,."'"'"'][0123456789]+[ ]?[TG][i]?[B][ ,."'"'"'|/]'
      #
      #     # Tühjade ridade kustutamine:
      #         cat ./tore.txt | sed -e '/^[[:blank:]]*$/d'
      #
      #--------------------------------------------------------------------
      # Order of arguments:
      #     hind eurodes, suurus müügimeeste GB-des füüsikute stiilis, toote-ID sõnena
      declare_product(42.50 , 256000000000,
      "Intenso 256GB Premium Micro-USB B 3.2 Gen 1 (3.1 Gen 1) Anthracite")
      declare_product(63.10 , 1000000000000,
      "Intenso 2.5&#34; 1TB juhtmevaba korpus USB 3.0 5400RPM 8M_UFODROOM_B must")
      declare_product(63.55 , 1000000000000,
      "INTENSO 6023560 1TB VÄLINE KÕVAKETAS USB3.0")
      declare_product(63.90 , 1000000000000,
      "Seagate Basic 1TB kaasaskantav väline HDD, USB 3.0/3.1/3.2, must")
      declare_product(64.25 , 1000000000000,
      "External HDD|INTENSO|1TB|USB 3.2|Colour Black|6023690")
      declare_product(64.65 , 1000000000000,
      "Intenso 6.3cm 2,5&#34; 1TB 3.0 MemoryBoard anthrazit")
      declare_product(65.25 , 1000000000000,
      "ADATA HV620S 1TB USB3.1 HDD 2.5i Black")
      declare_product(65.55 , 1000000000000,
      "2,5 1TB Toshiba Canvio Basics USB 3.2/USB 2.0 Black")
      declare_product(66.05 , 1000000000000,
      "ADATA DashDrive HV300 1TB 2.5 USB3.1 Blue")
      declare_product(66.40 , 1024000000000,
      "ADATA AHD680-1TU31-CBK ADATA extnl HDD |manuaalselt_v2ljaotsitud_suurus 1024 GB")
      declare_product(66.60 , 1000000000000,
      "Silicon Power väline kõvaketas 1TB Armor A60, must")
      declare_product(66.80 , 1000000000000,
      "ADATA HV300 1TB USB3.1 HDD 2.5i White")
      declare_product(67.80 , 1000000000000,
      "ADATA HD720A 1TB USB3.0 Black ext. 2.5i")
      declare_product(67.90 , 1000000000000,
      "WD Elements kaasaskantav väline HDD USB 3.0 1TB")
      declare_product(68.55 , 1000000000000,
      "External HDD|DAHUA|1TB|USB 3.0|Colour Blue|EHDD-E10-1T")
      declare_product(68.65 , 1000000000000,
      "SEAGATE Expansion Portable 1TB HDD")
      declare_product(68.85 , 1000000000000,
      "Canvio Advance | HDTCA10EW3AA | 1000 GB | 2.5 &#34; | USB 3.2 Gen1 | White")
      declare_product(69.90 , 1000000000000,
      "ADATA HD330 1TB USB3.1 HDD 2.5i Black")
      declare_product(69.90 , 1000000000000,
      "WESTERN DIGITAL My Passport 1TB Väline HDD")
      declare_product(69.95 , 1000000000000,
      "ADATA HV620S 1TB väline HDD")
      declare_product(70.55 , 1000000000000,
      "ADATA HV300 1TB USB3.1 HDD 2.5i Black")
      declare_product(70.55 , 1000000000000,
      "Silicon Power väline kõvaketas 1TB Armor A80, sinine")
      declare_product(70.55 , 1000000000000,
      "ADATA HV300 external hard drive 1000 GB Red")
      declare_product(70.60 , 1000000000000,
      "ADATA HD650 1TB USB3.1 BLACK ext. 2.5in")
      declare_product(71.30 , 1000000000000,
      "Silicon Power väline kõvaketas 1TB Armor A30, valge")
      declare_product(71.30 , 1000000000000,
      "Silicon Power A66 external hard drive 1000 GB Black, Yellow")
      declare_product(71.35 , 1000000000000,
      "Store &#39;n&#39; Go, 1TB, 5400 RPM, USB 3.0, Black")
      declare_product(71.60 , 1000000000000,
      "Toshiba 6.3cm 1TB USB3.0 Canvio Gaming black extern retail")
      declare_product(71.65 , 1000000000000,
      "ADATA HD720 external hard drive 1 TB Black, Blue")
      declare_product(72.05 , 1000000000000,
      "ADATA HD330 external hard drive 1000 GB Red")
      declare_product(72.15 , 1000000000000,
      "Silicon Power väline kõvaketas 1TB Armor A30, must")
      declare_product(72.40 , 1000000000000,
      "ADATA HV320 1TB USB3.0 2.5inch external")
      declare_product(72.55 , 1000000000000,
      "ADATA HD650 external hard drive 1000 GB Blue")
      declare_product(72.55 , 1000000000000,
      "ADATA HD650 1TB USB3.1 RED ext. 2.5in")
      declare_product(73.10 , 1000000000000,
      "2,5 1TB Toshiba Canvio Ready USB 3.2 Gen black")
      declare_product(73.25 , 1000000000000,
      "Canvio Advance | HDTCA10EG3AA | 1000 GB | 2.5 &#34; | USB 3.2 Gen1 | Green")
      declare_product(73.50 , 1000000000000,
      "Silicon Power A62 external hard drive 1000 GB Black, Blue")
      declare_product(73.85 , 1000000000000,
      "Silicon Power Armor A30 external hard drive 1 TB Black")
      declare_product(73.95 , 1000000000000,
      "Silicon Power väline kõvaketas 1TB Armor A60, must/roheline")
      declare_product(74.05 , 1000000000000,
      "ADATA HD710P 1TB USB3.1 HDD 2.5i Yellow")
      declare_product(74.05 , 1000000000000,
      "ADATA HD710P 1TB USB3.1 HDD 2.5i Black")
      declare_product(74.05 , 1000000000000,
      "ADATA HD710P 1TB USB3.1 HDD 2.5i Red")
      declare_product(74.05 , 1024000000000,
      "ADATA AHD710MP-1TU31-CCF External HDD |manuaalselt_v2ljaotsitud_suurus 1024 GB")
      declare_product(74.05 , 1000000000000,
      "ADATA HD710 Pro external hard drive 1 TB Black, Blue")
      declare_product(74.95 , 1000000000000,
      "Silicon Power väline kõvaketas 1TB Armor A80, must")
      declare_product(75.05 , 1000000000000,
      "ADATA HD330 external hard drive 1000 GB Blue")
      declare_product(75.60 , 1000000000000,
      "Silicon Power väline kõvaketas Armor A62 1TB, must")
      declare_product(76.20 , 1000000000000,
      "TOSHIBA Canvio Slim 1TB USB3.2 black")
      declare_product(76.35 , 1000000000000,
      "Canvio Advance | HDTCA10ER3AA | 1000 GB | 2.5 &#34; | USB 3.2 Gen1 | Red")
      declare_product(76.35 , 1000000000000,
      "Canvio Advance | HDTCA10EK3AA | 1000 GB | 2.5 &#34; | USB 3.2 Gen1 | Black")
      declare_product(76.40 , 1024000000000,
      "ADATA AHD770G-1TU32G1-CBK External HDD |manuaalselt_v2ljaotsitud_suurus 1024 GB")
      declare_product(76.40 , 1000000000000,
      "Silicon Power 6.3cm 2.5&#34; 1TB USB3.2 A66 Shockproof Black")
      declare_product(76.90 , 1000000000000,
      "SEAGATE One Touch 1TB External HDD")
      declare_product(77.10 , 1000000000000,
      "External HDD|SEAGATE|One Touch|STKB1000403|1TB|USB 3.0|Colour Red|STKB1000403")
      declare_product(77.10 , 1000000000000,
      "External HDD|SEAGATE|One Touch|STKB1000401|1TB|USB 3.0|Colour Silver|STKB1000401")
      declare_product(77.60 , 1000000000000,
      "Silicon Power väline kõvaketas Armor A75 1TB, hõbedane")
      declare_product(77.65 , 1000000000000,
      "TRANSCEND StoreJet 25M3 1TB External")
      declare_product(78.95 , 1000000000000,
      "TOSHIBA Canvio Flex 1TB Silver 2.5inch")
      declare_product(79.10 , 1000000000000,
      "Toshiba Canvio Slim 	HDTD310ES3DA 1000 GB 2.5")
      declare_product(79.55 , 1500*(1000**3),
      "WD Elements ext portableHDD USB3.0 1500GB")
      declare_product(79.85 , 1000000000000,
      "External HDD|TRANSCEND|StoreJet|1TB|USB 3.1|Colour Iron Grey|TS1TSJ25C3N")
      declare_product(80.60 , 1000000000000,
      "Silicon Power väline kõvaketas Armor A15 1TB, must")
      declare_product(80.60 , 1000000000000,
      "Silicon Power väline kõvaketas 1TB Armor A85B, must")
      declare_product(80.70 , 1000000000000,
      "TRANSCEND SJ25H3P HDD 1TB external")
      declare_product(80.95 , 1000000000000,
      "Transcend StoreJet 25H3B - 1TB - USB 3")
      declare_product(83.20 , 2000000000000,
      "ADATA HV320 2TB USB3.1 2.5inch external")
      declare_product(83.40 , 1000000000000,
      "Silicon Power A66 external hard drive 1000 GB Black, Blue")
      declare_product(83.60 , 1000000000000,
      "TOSHIBA Canvio Flex 1TB 2.5inch silver")
      declare_product(83.80 , 2000000000000,
      "WD Elements kaasaskantav HDD USB 3.0 2TB")
      declare_product(83.80 , 2000000000000,
      "ADATA HV300 2TB USB3.1 HDD 2.5i Black")
      declare_product(83.90 , 2000000000000,
      "Seagate Basic 2TB kaasaskantav väline kõvaketas USB 3.0 must")
      declare_product(84.05 , 1000000000000,
      "ADATA AHD770G-1TU32G1-CRD External HDD |manuaalselt_v2ljaotsitud_suurus 1000 GB")
      declare_product(84.15 , 2000000000000,
      "TOSHIBA CANVIO BASICS 2.5inch 2TB HDD")
      declare_product(84.40 , 1000000000000,
      "Transcend 6.3cm 1TB USB3.1 StoreJet 25M3G Military Green")
      declare_product(84.50 , 1000000000000,
      "SEAGATE One Touch 1TB External HDD")
      declare_product(84.90 , 2000000000000,
      "Western Digital My Passport 2TB väline kõvaketas Must")
      declare_product(85.05 , 2000000000000,
      "ADATA HV620S 2TB USB3.1 HDD 2.5i Black")
      declare_product(85.10 , 2000000000000,
      "Seagate Expansion 2TB USB 3.0 STKN2000400")
      declare_product(85.70 , 1000000000000,
      "Silicon Power väline kõvaketas Stream S03 1TB, valge")
      declare_product(85.70 , 1000000000000,
      "Silicon Power väline kõvaketas Stream S03 1TB, must")
      declare_product(85.70 , 1000000000000,
      "Silicon Power väline kõvaketas 1TB Diamond D30, must")
      declare_product(85.75 , 2000000000000,
      "External HDD|INTENSO|2TB|USB 3.2|Colour Black|6021480")
      declare_product(86.30 , 2000000000000,
      "WD My Passport 2TB portable HDD Blue")
      declare_product(86.50 , 2000000000000,
      "Intenso 2.5&#34; 2TB mälukorpus USB 3.0 väline HDD")
      declare_product(86.55 , 2000000000000,
      "WD My Passport 2TB portable HDD Red")
      declare_product(86.95 , 2000000000000,
      "External HDD|INTENSO|2TB|USB 3.2|Colour Black|6023890")
      declare_product(87.95 , 1000000000000,
      "External HDD|WESTERN DIGITAL|Elements Portable SE|1TB|USB 3.0|Colour Black|WDBEPK0010BBK-WESN")
      declare_product(88.05 , 2000000000000,
      "Intenso 6.3cm 2,5&#34; 2TB 3.0 MemoryBoard anthrazit")
      declare_product(89.45 , 2000000000000,
      "SEAGATE Expansion Portable 2TB HDD")
      declare_product(89.90 , 2000000000000,
      "ADATA HD720A 2TB USB3.0 Veekindel Põrutuskindel Must Väline HDD 2.5 tolli")
      declare_product(89.90 , 2000000000000,
      "ADATA HD720 external hard drive 2 TB Black, Blue")
      declare_product(89.95 , 2000000000000,
      "External HDD|DAHUA|2TB|USB 3.0|Colour Blue|EHDD-E10-2T")
      declare_product(91.40 , 2000000000000,
      "ADATA HV300 external hard drive 2 TB Blue")
      declare_product(91.40 , 2000000000000,
      "ADATA HV300 2TB USB3.1 HDD 2.5i White")
      declare_product(91.40 , 2000000000000,
      "ADATA DashDrive HV300 2TB 2.5 USB3.1 Red")
      declare_product(91.95 , 2000000000000,
      "Verbatim Store &#39;n&#39; Go USB 3.0 Hard Drive 2TB Silver")
      declare_product(92.35 , 2000000000000,
      "Verbatim Store &#39;n&#39; Go USB 3.0 Hard Drive 2TB Black")
      declare_product(92.90 , 2000000000000,
      "ADATA HD650 2TB USB3.0 Black ext. 2.5in")
      declare_product(92.90 , 2000000000000,
      "ADATA AHD650-2TU31-CBL external hard drive 2000 GB Red")
      declare_product(92.90 , 2000000000000,
      "ADATA HD650 2TB USB3.0 Red ext. 2.5in")
      declare_product(92.95 , 2000000000000,
      "Toshiba Canvio Advance external hard drive 2 TB 2.5&#34; Micro-USB B 3.2 Gen 1 (3.1 Gen 1) Green")
      declare_product(93.60 , 2000000000000,
      "Store &#39;n&#39; Go, 2TB, 5400 RPM, USB 3.0, Silver")
      declare_product(93.95 , 2000000000000,
      "Store &#39;n&#39; Go, 2TB, 5400 RPM, USB 3.0, Black")
      declare_product(94.40 , 2000000000000,
      "ADATA HD710 Pro external hard drive 2 TB Black, Blue")
      declare_product(94.40 , 2000000000000,
      "ADATA HD710P 2TB USB3.1 HDD 2.5i Black")
      declare_product(94.40 , 2000000000000,
      "ADATA HD710P 2TB USB3.1 HDD 2.5i Red")
      declare_product(95.05 , 2000000000000,
      "ADATA HD330 2TB USB3.1 HDD 2.5i Black")
      declare_product(95.20 , 1000000000000,
      "Lacie väline kõvaketas 1TB Mobile Drive USB-C (2022), moon silver")
      declare_product(95.45 , 2000000000000,
      "Silicon Power väline kõvaketas 2TB Armor A60, must/roheline")
      declare_product(95.60 , 2000000000000,
      "Silicon Power väline kõvaketas 2TB Armor A30, must")
      declare_product(95.60 , 2000000000000,
      "SILICON POWER HDD A60 2.5inch 2TB USB")
      declare_product(95.90 , 2000000000000,
      "TOSHIBA Canvio Slim 2TB USB3.2 black")
      declare_product(96.30 , 2000000000000,
      "SILICON POWER External HDD Armor A66 2TB")
      declare_product(96.40 , 2000000000000,
      "SEAGATE One Touch 2TB External HDD")
      declare_product(96.85 , 2000000000000,
      "ADATA HD330 external hard drive 2000 GB Red")
      declare_product(97.60 , 2000000000000,
      "ADATA AHD710MP-2TU31-CCF External HDD |manuaalselt_v2ljaotsitud_suurus 2000 GB")
      declare_product(97.60 , 2000000000000,
      "WD My Passport for MAC 2TB Blue")
      declare_product(97.75 , 2000000000000,
      "Canvio Ready | HDTP320EK3AA | 2000 GB | 2.5 &#34; | USB 3.2 Gen1 | Black")
      declare_product(98.15 , 2000000000000,
      "Silicon Power väline kõvaketas 2TB Armor A80, sinine")
      declare_product(98.55 , 2000000000000,
      "Silicon Power väline kõvaketas 2TB Armor A80, must")
      declare_product(98.95 , 2000000000000,
      "TRANSCEND HDD 2TB 2.5inch")
      declare_product(99.60 , 2000000000000,
      "SILICON POWER A62 Ex HDD 2.5inch 2TB USB")
      declare_product(100.20 , 2000000000000,
      "WD Black P10 Game Drive 2TB Black")
      declare_product(100.50 , 1000000000000,
      "Store &#39;n&#39; Go Secure Portable HDD with Keypad Access, USB 3.1, 1TB")
      declare_product(100.90 , 2000000000000,
      "TOSHIBA Canvio Advance 2TB 2.5inch Black")
      declare_product(102.50 , 2000000000000,
      "USB3 Hard Drive 2TB EXT. GOLD STKB2000405 SEAGATE")
      declare_product(102.70 , 2000000000000,
      "TRANSCEND 2TB StoreJet 6.4cm USB3.0 blau")
      declare_product(102.80 , 2000000000000,
      "TOSHIBA Canvio Advance 2TB 2.5inch Red")
      declare_product(102.80 , 1000000000000,
      "Intenso Lesen/Schreiben bis zu 1000 M_UFODROOM_B/s/1TB USB Type-C 3.2 Gen 2 (3.1 Gen 2) Brown")
      declare_product(103.30 , 2000000000000,
      "TRANSCEND 2TB Slim StoreJet 2.5inch M3G")
      declare_product(103.30 , 2000000000000,
      "TRANSCEND StoreJet 25M3 2TB External")
      declare_product(103.50 , 2000000000000,
      "ADATA HD770G external hard drive 2 TB Black")
      declare_product(103.90 , 2000000000000,
      "TRANSCEND 2TB StoreJet 6.4cm USB 3.0")
      declare_product(104.20 , 2048000000000,
      "TRANSCEND StoreJet C3N external USB 3.0 |manuaalselt_v2ljaotsitud_suurus 2048 GB")
      declare_product(104.30 , 2000000000000,
      "Silicon Power väline kõvaketas 2TB Stream S03, must")
      declare_product(104.30 , 2000000000000,
      "Silicon Power väline kõvaketas 2TB Diamond D30, must")
      declare_product(104.80 , 2000000000000,
      "WD My Passport Ultra 2TB Blue")
      declare_product(105.10 , 1000000000000,
      "External USB 3.0 Hard Disk Drive, HDD, 1TB, silver")
      declare_product(105.80 , 2000000000000,
      "TRANSCEND 2TB 2.5inch Portable HDD")
      declare_product(106.20 , 2000000000000,
      "INTENSO 6023580 2TB Väline HDD USB3")
      declare_product(106.90 , 2000000000000,
      "TOSHIBA Canvio Slim 2TB USB3.2 silver")
      declare_product(107.90 , 2000000000000,
      "TRANSCEND 2TB 2.5inch Portable HDD")
      declare_product(107.90 , 2000000000000,
      "TOSHIBA Canvio Gaming 2TB Black 2.5inch")
      declare_product(108.10 , 2000000000000,
      "Armor A75, 2TB, USB 3.1 Gen 1, Type-C, Silver")
      declare_product(108.20 , 2000000000000,
      "Silicon Power väline kõvaketas 2TB Armor A85B, must")
      declare_product(108.60 , 2048000000000,
      "SILICONPOW SP020TBPHDA30S3W External HDD |manuaalselt_v2ljaotsitud_suurus 2048 GB")
      declare_product(109.60 , 1000000000000,
      "LaCie väline kõvaketas 1TB Rugged Mini")
      declare_product(110.70 , 2000000000000,
      "SEAGATE Game Drive for PlayStation 2TB")
      declare_product(111.50 , 1000000000000,
      "LaCie väline kõvaketas 1TB Rugged USB-C")
      declare_product(112.90 , 2000000000000,
      "Western Digital Elements SE 2TB external hard drive 3.2 Gen 1 (3.1 Gen 1) Black")
      declare_product(113.70 , 2000000000000,
      "SEAGATE BackupPlusUltraTouch 2TB black")
      declare_product(117.60 , 4000000000000,
      "Intenso Memory Center 4TB USB 3.0 väline HDD")
      declare_product(119.90 , 2000000000000,
      "SEAGATE Game Drive for Xbox 2TB HDD")
      declare_product(124.30 , 4000000000000,
      "TOSHIBA CANVIO BASICS 2.5inch 4TB HDD")
      declare_product(124.90 , 4000000000000,
      "Western Digital My Passport 4TB väline kõvaketas must")
      declare_product(125.70 , 4000000000000,
      "SEAGATE Expansion Desktop External 4TB")
      declare_product(125.90 , 4000000000000,
      "Seagate Basic 4TB Hõbedane Kaasaskantav Väline HDD USB 3.0")
      declare_product(126.50 , 4000000000000,
      "2.5&#34; 4TB Intenso mälu korpus USB 3.0 must")
      declare_product(126.90 , 4000000000000,
      "External HDD|INTENSO|6023512|4TB|USB 3.0|Colour Black|6023512")
      declare_product(128.90 , 2000000000000,
      "LaCie väline kõvaketas 2TB Mobile Drive USB-C (2022), moon silver")
      declare_product(129.40 , 4000000000000,
      "3,5 4TB WD Elements Desktop USB 3.0")
      declare_product(129.70 , 1000000000000,
      "SANDISK Prof. G-DRIVE ArmorATD 1TB")
      declare_product(129.90 , 4000000000000,
      "WD Elements kaasaskantav väline HDD 4TB")
      declare_product(130.40 , 2000000000000,
      "Store &#39;n&#39; Go Secure Portable HDD with Keypad Access, USB 3.1, 2TB")
      declare_product(135.40 , 2000000000000,
      "LACIE External Protable Hardrive 2TB")
      declare_product(137.10 , 4000000000000,
      "TOSHIBA Canvio Gaming 4TB Black 2.5inch")
      declare_product(137.90 , 4000000000000,
      "SEAGATE Expansion Portable 4TB HDD")
      declare_product(138.10 , 5000000000000,
      "Intenso Hard Drive Memory Case - 5 TB - USB 3.0 - Black")
      declare_product(138.90 , 5000000000000,
      "WD Elements kaasaskantav 5TB 2.5&#34; väline HDD")
      declare_product(139.40 , 4000000000000,
      "ADATA HV300 4TB USB3.1 HDD 2.5i Black")
      declare_product(139.90 , 5000000000000,
      "Western Digital My Passport 5TB väline kõvaketas must")
      declare_product(139.90 , 5000000000000,
      "Seagate Basic STJL5000400 - 5TB Väline kõvaketas")
      declare_product(140.20 , 4000000000000,
      "SEAGATE One Touch Desktop with HUB 4TB")
      declare_product(140.70 , 4000000000000,
      "WD My Passport 4TB portable HDD Blue")
      declare_product(140.80 , 2000000000000,
      "LaCie väline kõvaketas 2TB Rugged Mini")
      declare_product(141.20 , 5000000000000,
      "External HDD|INTENSO|6023513|5TB|USB 3.0|Colour Black|6023513")
      declare_product(141.90 , 4000000000000,
      "Verbatim Store &#39;n&#39; Go USB 3.0 Hard Drive 4TB Black")
      declare_product(142.20 , 4000000000000,
      "SEAGATE One Touch 4TB External HDD")
      declare_product(142.50 , 4000000000000,
      "Canvio Ready | HDTP340EK3CA | 4000 GB | 2.5 &#34; | USB 3.2 Gen1 | Black")
      declare_product(142.70 , 4000000000000,
      "ADATA HD330 4TB USB3.1 HDD 2.5i Black")
      declare_product(142.80 , 4096000000000,
      "SILICONPOW SP040TBPHDA60S3K External HDD |manuaalselt_v2ljaotsitud_suurus 4096 GB")
      declare_product(143.10 , 4000000000000,
      "TRANSCEND Storejet 4TB 3,5 inch")
      declare_product(143.20 , 4000000000000,
      "WD BLACK P10 GAME DRIVE 4TB BLACK")
      declare_product(143.40 , 4000000000000,
      "TOSHIBA Canvio Advance 4TB 2.5inch Black")
      declare_product(143.40 , 4000000000000,
      "TOSHIBA Canvio Advance 4TB 2.5inch Red")
      declare_product(143.40 , 4000000000000,
      "TOSHIBA Canvio Advance 4TB 2.5inch White")
      declare_product(143.90 , 2000000000000,
      "LaCie väline kõvaketas 2TB Rugged USB-C")
      declare_product(143.90 , 4000000000000,
      "Silicon Power Armor A60 external hard drive 4000 GB Black")
      declare_product(143.90 , 4000000000000,
      "Silicon Power väline kõvaketas 4TB Armor A66, must")
      declare_product(143.90 , 4000000000000,
      "SILICON POWER External HDD Armor A66 4TB")
      declare_product(144.20 , 6000000000000,
      "Intenso Memory Center 6TB 3.5 väline HDD must")
      declare_product(144.50 , 4000000000000,
      "ADATA HD710P 4TB USB3.1 HDD 2.5i Black")
      declare_product(144.50 , 4000000000000,
      "ADATA HD650 4TB USB3.0 Black ext. 2.5in")
      declare_product(145.90 , 6000000000000,
      "SEAGATE Expansion Desktop External 6TB")
      declare_product(146.30 , 4000000000000,
      "WD My Passport 4TB portable HDD Red")
      declare_product(147.20 , 5000000000000,
      "SEAGATE Expansion Portable 5TB HDD")
      declare_product(149.40 , 4000000000000,
      "TRANSCEND 4TB 2.5i Portable HDD SJ M3")
      declare_product(149.60 , 4000000000000,
      "TOSHIBA Canvio Flex 4TB 2.5inch silver")
      declare_product(150.10 , 4000000000000,
      "TRANSCEND StoreJet 25H3B 4TB HDD")
      declare_product(150.30 , 4000000000000,
      "WD My Passport Ultra 4TB Blue")
      declare_product(153.50 , 4000000000000,
      "TRANSCEND StoreJet 2.5inch 6.35cm 4TB")
      declare_product(153.50 , 4000000000000,
      "Armor A62, 4TB, USB 3.1 Gen 1, Type-A, Black/Red")
      declare_product(154.60 , 5000000000000,
      "SEAGATE One Touch 5TB External HDD")
      declare_product(154.70 , 4000000000000,
      "SEAGATE BackupPlusUltraTouch 4TB black")
      declare_product(155.60 , 4000000000000,
      "TRANSCEND 4TB 2.5inch Portable HDD TypeC")
      declare_product(156.70 , 6000000000000,
      "SEAGATE One Touch Desktop with HUB 6TB")
      declare_product(158.90 , 5000000000000,
      "WD BLACK P10 GAME DRIVE 5TB BLACK")
      declare_product(159.90 , 4000000000000,
      "WD My Book 4TB USB3.0 HDD")
      declare_product(160.60 , 4000000000000,
      "Silicon Power vÃ¤line kÃµvaketas 4TB Armor A85B, must")
      declare_product(163.90 , 5000000000000,
      "WD BLACK P10 GAME DRIVE FOR XBOX 5TB")
      declare_product(164.60 , 6000000000000,
      "WD Elements external HDD USB3.0 6TB")
      declare_product(164.80 , 4000000000000,
      "SEAGATE Game Drive for Xbox 4TB HDD")
      declare_product(167.10 , 5000000000000,
      "WD My Passport Ultra Mac 5TB Silver")
      declare_product(168.10 , 5000000000000,
      "SEAGATE FireCuda Gaming Hard Drive 5TB")
      declare_product(169.50 , 2000000000000,
      "SANDISK Prof. G-DRIVE ArmorATD 2TB")
      declare_product(171.20 , 6000000000000,
      "WD My Book 6TB vÃ¤line kÃµvaketas USB 3.0 must")
      declare_product(172.60 , 5000000000000,
      "ADATA HD710 Pro external hard drive 5 TB Black")
      declare_product(174.20 , 5000000000000,
      "SEAGATE BackupPlusUltraTouch 5TB black")
      declare_product(174.90 , 6000000000000,
      "Western Digital My Passport 6TB USB 3.2 Gen 1 VÃ¤line HDD")
      declare_product(175.10 , 5120000000000,
      "SILICONPOW SP050TBPHDA60S3K External HDD |manuaalselt_v2ljaotsitud_suurus 5120 GB")
      declare_product(175.10 , 5000000000000,
      "Silicon Power Armor A60 external hard drive 5000 GB Black")
      declare_product(175.10 , 5000000000000,
      "SILICON POWER External HDD Armor A66 5TB")
      declare_product(176.90 , 5000000000000,
      "SEAGATE Game Drive for PlayStation 5TB")
      declare_product(178.50 , 6000000000000,
      "WD My Passport 6TB portable HDD Sinine")
      declare_product(178.50 , 6000000000000,
      "WD My Passport 6TB portable HDD Punane")
      declare_product(180.20 , 4000000000000,
      "LaCie vÃ¤line kÃµvaketas 4TB Mobile Drive USB-C (2022), moon silver")
      declare_product(180.80 , 4000000000000,
      "LACIE External Protable Hardrive 4TB")
      declare_product(181.20 , 6000000000000,
      "WD My Passport 6TB portable HDD Hall")
      declare_product(185.40 , 5000000000000,
      "Armor A62, 5TB, USB 3.1 Gen 1, Type-A, Black/Red")
      declare_product(186.30 , 5000000000000,
      "SILICON POWER External HDD Armor A66 5TB")
      declare_product(190.40 , 8000000000000,
      "SEAGATE Expansion Desktop External 8TB")
      declare_product(194.60 , 8000000000000,
      "Intenso Memory Center 8TB USB 3.0 vÃ¤line kÃµvaketas")
      declare_product(197.90 , 6000000000000,
      "WD BLACK P10 GAME DRIVE FOR XBOX 6TB USB")
      declare_product(199.90 , 5000000000000,
      "Silicon Power vÃ¤line kÃµvaketas 5TB Armor A85B, must")
      declare_product(201.20 , 8000000000000,
      "SEAGATE One Touch Desktop with HUB 8TB")
      declare_product(201.30 , 4000000000000,
      "LaCie vÃ¤line kÃµvaketas 4TB Rugged Mini")
      declare_product(202.20 , 6000000000000,
      "WD My Passport Ultra 6TB Blue USB-C/USB3")
      declare_product(205.30 , 4000000000000,
      "LaCie vÃ¤line kÃµvaketas 4TB Rugged USB-C")
      declare_product(206.90 , 500000000000,
      "Apricorn Hard Disc Drive A25-3PL256-500F - 500 GB - USB 3.0 - Black")
      declare_product(207.20 , 5000000000000,
      "LaCie vÃ¤line kÃµvaketas 5TB Mobile Drive USB-C (2022), moon silver")
      declare_product(207.90 , 5000000000000,
      "LACIE External Protable Hardrive 5TB")
      declare_product(214.60 , 5000000000000,
      "LaCie vÃ¤line kÃµvaketas 5TB Rugged Mini")
      declare_product(214.90 , 8000000000000,
      "3.5 8TB WD My Book black USB 3.0")
      declare_product(218.40 , 8000000000000,
      "Elements, 8 TB, USB 3.0, 48x135x165.8 mm, black")
      declare_product(219.80 , 8000000000000,
      "Graugear Ext 8TB HDD Playstation 4 ja 5 jaoks, Eelvormindatud, Plug and Play")
      declare_product(227.40 , 8000000000000,
      "SEAGATE FireCuda Gaming Hub 8TB")
      declare_product(231.20 , 4000000000000,
      "SANDISK Prof. G-DRIVE ArmorATD 4TB")
      declare_product(232.10 , 4000000000000,
      "LACIE d2 4TB USB-C Desktop Drive")
      declare_product(232.30 , 5000000000000,
      "LaCie vÃ¤line kÃµvaketas 5TB Rugged USB-C")
      declare_product(234.80 , 10000000000000,
      "SEAGATE One Touch Desktop with HUB 10TB")
      declare_product(239.90 , 4000000000000,
      "SAMSUNG T5 EVO vÃ¤line SSD 4TB USB")
      declare_product(249.80 , 10000000000000,
      "SEAGATE Expansion Desktop External 10TB")
      declare_product(250.70 , 10000000000000,
      "3,5 10TB WD Elements Desktop USB 3.0")
      declare_product(254.60 , 128000000000,
      "TRANSCEND 128GB HDD 3.5i CFast SATA3")
      declare_product(272.70 , 5000000000000,
      "SANDISK Prof. G-DRIVE ArmorATD 5TB")
      declare_product(300.90 , 12000000000000,
      "SEAGATE Expansion Desktop External 12TB")
      declare_product(283.80 , 12000000000000,
      "WD Elements external HDD USB3.0 12TB")
      declare_product(287.70 , 12000000000000,
      "WD My Book 12TB USB3.0 HDD")
      declare_product(304.90 , 8000000000000,
      "LACIE d2 8TB USB-C Desktop Drive")
      declare_product(306.60 , 6000000000000,
      "SANDISK Prof. G-DRIVE 6TB")
      declare_product(309.90 , 2000000000000,
      "Apricorn Hard Drive A25-3PL256-2000F - 2 TB - USB 3.0 - Black")
      declare_product(321.50 , 14000000000000,
      "WD My Book 14TB USB3.0 HDD 3.5inch")
      declare_product(322.80 , 14000000000000,
      "WD Elements Desktop 14TB USB BLACK EMEA")
      declare_product(355.30 , 16000000000000,
      "WD Elements Desktop 16TB USB Black")
      declare_product(362.80 , 10000000000000,
      "LACIE d2 10TB USB-C Desktop Drive")
      declare_product(378.70 , 16000000000000,
      "WD My Book 16TB USB3.0 HDD 3.5inch")
      declare_product(390.40 , 18000000000000,
      "WD Elements Desktop 18TB USB Black")
      declare_product(411.20 , 20000000000000,
      "SEAGATE One Touch Desktop HUB 20TB")
      declare_product(431.80 , 18000000000000,
      "WD My Book 18TB USB3.0 HDD 3.5inch")
      declare_product(476.60 , 20000000000000,
      "WD HDex 3.5&#34; USB3 20TB Elements Desktop black")
      declare_product(516.20 , 24000000000000,
      "SEAGATE Expansion Desktop External 24TB")
      declare_product(531.30 , 22000000000000,
      "22TB WD Elements Desktop vÃ¤line kÃµvaketas, must")
      declare_product(532.90 , 12000000000000,
      "Western Digital G-DRIVE 12TB USB-C vÃ¤line HDD")
      declare_product(541.10 , 16000000000000,
      "LACIE d2 Professional 16TB USB-C")
      declare_product(565.50 , 22000000000000,
      "WD My Book 22TB USB3.2 HDD")
      declare_product(668.60 , 20000000000000,
      "LACIE d2 Professional 20TB USB-C")
      declare_product(715.90 , 18000000000000,
      "Western Digital G-DRIVE 18TB USB-C 3.1 Enterprise vÃ¤line HDD - Hall")
      declare_product(814.40 , 20000000000000,
      "3,5 20TB WD My Book Duo 20T_UFODROOM_B Desktop black Disk-Array")
      declare_product(919.70 , 24000000000000,
      "LACIE d2 Professional 24TB USB 3.2")
   end # declare_product_data

   #-----------------------------------------------------------------------

   def find_the_best_product_and_print_its_data_to_console
      #----------------
      declare_product_data()
      #puts @ar_products.to_s
      #----------------
      @fd_package_price_min=nil
      @fd_package_price_max=nil
      #--------
      @fd_mark_min=nil
      @fd_mark_max=nil
      #----------------
      fd_package_price=nil
      fd_mark=nil
      if @b_list_all_products
         puts("\nProducs in the order that they were declared:")
      end # if
      @ar_products.each do |ht_product|
         #----------------
         fd_package_price=ht_product["fd_package_price"]
         fd_mark=fd_objective_function(ht_product).to_f.round(4)
         if @fd_mark_min==nil
            #--------
            @fd_package_price_min=fd_package_price
            @fd_package_price_max=fd_package_price
            #--------
            @fd_mark_min=fd_mark
            @fd_mark_max=fd_mark
            #--------
         else
            #--------
            @fd_package_price_min=fd_package_price if fd_package_price < @fd_package_price_min
            @fd_package_price_max=fd_package_price if @fd_package_price_max < fd_package_price
            #--------
            @fd_mark_min=fd_mark if fd_mark < @fd_mark_min
            @fd_mark_max=fd_mark if @fd_mark_max < fd_mark
            #--------
         end # if
         #----------------
         ht_product["fd_mark"]=fd_mark
         if @b_list_all_products
         end # if
         #----------------
      end # loop
      #----------------
      @ar_products.sort!{|a,b| a["fd_mark"]<=>b["fd_mark"]}
      #----------------
      if @b_list_all_products
         #----------------
         i_ar_products_len=@ar_products.size
         ht_product=nil
         if @b_use_colors
            i_ar_products_len.times do |ix|
               ht_product=@ar_products[ix]
               puts(s_product(ht_product,true))
            end # loop
         else
            i_ar_products_len.times do |ix|
               ht_product=@ar_products[ix]
               puts(s_product(ht_product))
            end # loop
         end # if
         #----------------
      end # if
   end # find_the_best_product_and_print_its_data_to_console

   #-----------------------------------------------------------------------

   public

   def run
      @mx0.synchronize do
         #-----------------------------------------------------------------
         @ar_products=Array.new
         #----------------
         @b_list_all_products=false
         @b_list_all_products=true if ARGV[0]!=nil
         #----------------
         @b_use_colors=false
         @b_use_colors=true if ARGV[1]!=nil
         #----------------
         find_the_best_product_and_print_its_data_to_console()
         ht_best_product=@ar_products[@ar_products.size-1]
         puts("\nThe best product:")
         if @b_use_colors
            puts(s_product(ht_best_product,true,true))
         else
            puts(s_product(ht_best_product))
         end # if
         puts("\n")
         #----------------
         @b_display_plot=false
         @b_display_plot=true if ARGV[2]!=nil
         if @b_display_plot
            #printf("Initializing plot..")
            begin
               display_plot_youplot(@ar_products)
               #puts("\e[32m ✓\e[39m")
            rescue Exception => e
               puts("")
               puts("\e[31mFailed to display plot\e[39m.")
               puts(e.to_s+"\n")
               puts("GUID=='27011a33-3ce5-480f-8796-2341213049e7'")
               puts("")
               exit 1
            end # rescue
         end # if
         puts("\n")
         #-----------------------------------------------------------------
      end # synchronize
   end # run

end # class Product_selector_implementation

Product_selector_implementation.new.run()

#==========================================================================
# S_VERSION_OF_THIS_FILE="1ad41162-8b3a-464c-93a6-2341213049e7"
#==========================================================================
