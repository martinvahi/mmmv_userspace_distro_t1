#!/usr/bin/env ruby
#==========================================================================
# Author of this file: INCOMPLETE
# This file is in public domain.
#
# This file is a template for code that tries to find out, which product
# offers best value for a money-unit. The current intentionally hacky
# sample code has an objective function that calculates
#
#    product_goodness = quantity_in_package / package_price
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
#==========================================================================
# Initial template of this file has been tested to work on ("uname -a")
# Linux terminal01 6.1.0-17-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.1.69-1 (2023-12-30) x86_64 GNU/Linux
# with ("ruby -v")
# ruby 3.4.1 (2025-02-17) +PRISM [x86_64-linux]
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
   puts("GUID=='90fab414-1274-4f77-81fa-7331213049e7'")
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
            "GUID='ecbc5042-da23-4e10-83fa-7331213049e7'")
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
         puts("GUID=='2fd6ddb6-ada6-4cfd-94fa-7331213049e7'")
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

   def display_plot(ar_products)
      if KIBUVITS_krl171bt4_b_DEBUG
         bn=binding()
         kibuvits_krl171bt4_typecheck(bn,Array,ar_products)
         kibuvits_krl171bt4_typecheck_ar_content(bn,Hash,ar_products,
         "GUID=='e2064aee-f5c5-488c-a3fa-7331213049e7'")
      end # if
      #---------------
      if !defined? Gnuplot
         s_gem_name="gnuplot"
         assert_require_t1(s_gem_name,
         "GUID=='12acae41-4e25-4159-82fa-7331213049e7'")
      end # if
      #---------------
      ar_products.sort!{|a,b| a["fd_package_price"]<=>b["fd_package_price"]}
      i_ar_products_len=ar_products.size
      ar_x=Array.new
      ar_y=Array.new
      ht_product=nil
      i_ar_products_len.times do |ix|
         ht_product=ar_products[ix]
         ar_x<<(ht_product["fd_package_price"].round(2))
         ar_y<<(ht_product["fd_mark"].round(3))
      end # loop
      #---------------
      fd_x_margin=(@fd_package_price_max-@fd_package_price_min).abs*(0.1)+1
      fd_y_margin=(@fd_mark_max-@fd_mark_min).abs*(0.1)+1
      #----
      i_x_min=((@fd_package_price_min-fd_x_margin).floor).to_i
      i_x_max=((@fd_package_price_max+fd_x_margin).floor).to_i
      i_x_min=-1 if 0 <= i_x_min
      #----
      i_y_min=((@fd_mark_min-fd_y_margin).floor).to_i
      i_y_max=((@fd_mark_max+fd_y_margin).floor).to_i
      i_y_min=-1 if 0 <= i_y_min
      #--------------------------------------------------------------------
      #if !defined? StringIO
      #   s_gem_name="stringio"
      #   assert_require_t1(s_gem_name,
      #   "GUID=='5234dd54-4cb4-42c1-b7fa-7331213049e7'")
      #end # if
      # With Ruby version 3.4.1 on AMD64 Linux the idea
      #
      #     ob_stderr_mystical_object=$stderr
      #     ob_stderr_tmp=StringIO.new
      #     $stderr=ob_stderr_tmp
      #     func_do_something
      #     s_stderr_text=$stderr.string
      #     $stderr=ob_stderr_mystical_object
      #
      # Does not seem to work and one couln't figure out, how to create
      # proper detection code for the case, where this Ruby script is
      # executed by a user who can not create graphical windows.
      #--------------------------------------------------------------------
      Gnuplot.open do |gp|
         Gnuplot::Plot.new( gp ) do |plot|
            plot.title  "Product Goodness by Product Package Price"
            plot.xlabel "Product Package Price"
            plot.ylabel "Product Goodness id est Product mark"
            plot.xrange("["+i_x_min.to_s+" to "+i_x_max.to_s+"]")
            plot.yrange("["+i_y_min.to_s+" to "+i_y_max.to_s+"]")
            plot.data << Gnuplot::DataSet.new( [ar_x, ar_y] ) do |ds|
               #--------
               #ds.with = "linespoints"
               ds.linewidth = 1
               #--------
               ds.with = "circles"
               #ds.with = "points"
               #--------
               ds.notitle
               #ds.title="Foo"
               #--------
            end
         end
      end
      #--------------------------------------------------------------------
   end # display_plot

   #-----------------------------------------------------------------------

   # Returns a mark. The higher the mark, the better the product.
   def fd_objective_function(ht_product)
      if KIBUVITS_krl171bt4_b_DEBUG
         bn=binding()
         kibuvits_krl171bt4_typecheck(bn,Hash,ht_product)
      end # if
      fd_p=ht_product["fd_package_price"]
      fd_q=ht_product["fd_quantity_in_package"]
      fd_quantity_in_package_per_moneyunit=fd_q/fd_p
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
         "GUID=='2f9659f4-4a93-4703-adfa-7331213049e7'")
         kibuvits_krl171bt4_assert_is_smaller_than_or_equal_to(bn,
         0, fd_quantity_in_package,
         "GUID=='8ae69b58-bdb5-4247-94fa-7331213049e7'")
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
      # Order of arguments:
      #     price, quantity, product_ID_as_string
      declare_product(3,245,"tore1")
      declare_product(4,545,"tore2")
      declare_product(4,546,"tore3")
      declare_product(8,1070.1,"tore4")
      declare_product(5,570.1,"tore5")
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
            if @b_use_colors
               puts(s_product(ht_product,true))
            else
               puts(s_product(ht_product))
            end # if
         end # if
         #----------------
      end # loop
      @ar_products.sort!{|a,b| a["fd_mark"]<=>b["fd_mark"]}
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
         ht_best_product=@ar_products[-1]
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
            printf("Initializing plot..")
            begin
               display_plot(@ar_products)
               puts("\e[32m ✓\e[39m")
            rescue Exception => e
               puts("")
               puts("\e[31mFailed to display plot\e[39m.")
               puts("GUID=='3e5397b4-5592-4dca-b5fa-7331213049e7'")
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
# S_VERSION_OF_THIS_FILE="44994373-55d0-4f2f-91fa-7331213049e7"
#==========================================================================
