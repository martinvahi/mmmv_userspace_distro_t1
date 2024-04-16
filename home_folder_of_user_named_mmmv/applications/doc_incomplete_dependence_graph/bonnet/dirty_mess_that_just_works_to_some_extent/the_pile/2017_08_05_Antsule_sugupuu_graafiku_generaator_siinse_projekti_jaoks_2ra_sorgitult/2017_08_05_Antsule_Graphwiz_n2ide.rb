#!/usr/bin/env ruby
=begin
  Initial author: Martin.Vahi@softf1.com
  This file is in public domain.

  This file is a dirty hack that is in the role of a comment, 
  which is part of personal communication. It's a sloppy mix of 
  Estonian and English, because the other person prefers
  Estonian to English, but I, on the other hand, might
  want to copy-paste small bits from here later.
#-------------------------------------------------------------------------

  Andmestiku sisestamise kood asub faili l8pus, 
  funktsioonis nimega ob_init_data() .

Graphviz'i kasutamine konsoolilt:

    dot -Tjpeg tekstifail.dot > ./pilt.jpeg; xview ./pilt.jpeg

.dot-faili kui tekstifaili sisu n2ide:

digraph file_system_example {
    "/" -> "a/" -> "d/";
    "d/" -> "symlink_2";
    "/" -> "e/";
    "a/" -> "b/" -> "c/"
    "c/" -> "hello.txt"
    "c/" -> "symlink_1"
}

Kiirust ja efektiivsust on siin failis koodi visuaalse
poole huvides enamasti ignoreeritud, a la p2ris t66koodi 
ma p2ris nii ei kirjuta nagu ma siinset olen kirjutanud.

=end
#----------------------------------------------------------------------------

if !defined? KIBUVITS_krl171bt5_HOME
   require 'pathname'
   ob_pth_0=Pathname.new(__FILE__).realpath
   ob_pth_1=ob_pth_0.parent.parent.parent.parent
   s_fp_0=ob_pth_1.to_s+"/2024_01_27_mmmv_ruby_boilerplate_t6"
   s_fp_1=s_fp_0+"/2024_01_27_mmmv_ruby_boilerplate_t6.rb"
   require s_fp_1
   ob_pth_2=ob_pth_1.parent
   $s_fp_project_home=ob_pth_2.to_s
   $s_fp_data_rb=$s_fp_project_home+"/partial_dependence_graph.rb"
   ob_pth_0=nil; ob_pth_1=nil; s_KIBUVITS_krl171bt5_HOME_b_fs=nil
end # if
#----------------------------------------------------------------------------


# Tulp 1: Vanema nimi, ID
# Tulp 2: Lapse nimi, ID
class Graafikugeneraator_2_tulbaline_tabel
   attr_reader :ht_s_parent_2_ht_children, :ht_s_child_2_ht_ancestors
   attr_reader :ht_all_persons_downcased_2_camelcase

   def initialize
      #------------------------------------
      # To cope with the case, were "Cat ARthur" and "Cat Arthur" are
      # counted as 2 separate instances, all names at the parent-child
      # relations hashtables are held in downcase form.
      @ht_all_persons_downcased_2_camelcase=Hash.new # offers the reverse conversion.
      #------------------------------------
      # The ht_ancestors and ht_children have 42 as their values.
      @ht_s_parent_2_ht_children=Hash.new # values are hashtables of of children
      @ht_s_child_2_ht_ancestors=Hash.new # values are hashtables of ancestors
      #------------------------------------
   end # initialize

   # Returns false, if the parent candidate is not
   # in the list of declared parents.
   def b_is_parent_child_pair(s_parent_candidate,s_child_candidate)
      s_p=s_parent_candidate.downcase
      s_c=s_child_candidate.downcase
      #-----------
      b_out=false
      return b_out if !@ht_s_parent_2_ht_children.has_key? s_p
      ht_children=@ht_s_parent_2_ht_children[s_p]
      b_out=true if ht_children.has_key? s_c
      return b_out
   end # b_is_parent_child_pair(b_parent_candidate,b_child_candidate)

   def exc_declare_parent_and_child(s_parent,s_child)
      #--------------------
      # Sobi-tyybikontroll, v2ltimaks korraliku kontrolli saamiseks
      # teegi lisamist siinse koodi s8ltuvuseks ja v2ltimaks lisakoodi.
      if s_parent.class!=String
         raise(Exception.new("GUID=='44bad739-8699-4973-8353-7010f00148e7'"))
      end # if
      if s_child.class!=String
         raise(Exception.new("GUID=='11c93f64-0811-42ec-aa53-7010f00148e7'"))
      end # if
      #--------------------
      s_p=s_parent.downcase
      s_c=s_child.downcase
      #--------------------
      # Primitiivne vea-kontroll. Korrektne oleks, et
      # inimene I_1 ei saa olla ise-enda vanavanavanem ega lapse-lapse-laps,
      # aga ma ei soovi siin praegu hakata graafialgoritmide koodi kirjutama,
      # mist8ttu kontroll piirdub vaid vahetu j2rglase kontrolliga.
      # Rekursiivne kontroll oleks lihtne, aga jama on selles, et
      # tegu on v2ga eksponentsiaalse keerukusega/maksumusega algoritmiga.
      if b_is_parent_child_pair(s_child,s_parent)
         raise(Exception.new("\n\nA child is not allowed to be its own parent.\n"+
         "\n"+
         "s_parent=="+s_parent.to_s+"\n"+
         "s_child=="+s_child.to_s+"\n"+
         "\n"+
         "GUID=='2bc1e793-b21c-445e-9c53-7010f00148e7'\n\n"))
      end # if
      if s_p==s_c
         raise(Exception.new("\n\nA child is not allowed to be its own parent.\n"+
         "\n"+
         "s_parent=="+s_parent.to_s+"\n"+
         "s_child=="+s_child.to_s+"\n"+
         "\n"+
         "GUID=='d39d021c-0484-464c-8353-7010f00148e7'\n\n"))
      end # if
      #--------------------
      if !@ht_all_persons_downcased_2_camelcase.has_key? s_p
         @ht_all_persons_downcased_2_camelcase[s_p]=s_parent
      end # if
      if !@ht_all_persons_downcased_2_camelcase.has_key? s_c
         @ht_all_persons_downcased_2_camelcase[s_c]=s_child
      end # if
      #--------------------
      ht_children=nil
      if @ht_s_parent_2_ht_children.has_key? s_p
         ht_children=@ht_s_parent_2_ht_children[s_p]
      else
         ht_children=Hash.new
         @ht_s_parent_2_ht_children[s_p]=ht_children
      end # if
      #--------------------
      ht_ancestors=nil
      if @ht_s_child_2_ht_ancestors.has_key? s_c
         ht_ancestors=@ht_s_child_2_ht_ancestors[s_c]
      else
         ht_ancestors=Hash.new
         @ht_s_child_2_ht_ancestors[s_c]=ht_ancestors
      end # if
      #--------------------
      ht_ancestors[s_p]=42
      ht_children[s_c]=42
      return 42
   end # exc_declare_parent_and_child


   def exc_declare_directed_edge_from_left_to_right(s_parent,s_child)
      exc_declare_parent_and_child(s_parent,s_child)
   end # exc_declare_directed_edge_from_left_to_right

end # class Graafikugeneraator_2_tulbaline_tabel

#--------------------------------------------------------------------------

class Graafikugeneraator

   def initialize
      @mx_streamaccess=Mutex.new
      #------
      s_cl_self=self.class.to_s.freeze
      #------
      ob_time=Time.now
      @s_fp_prefix="/tmp/"+
      ob_time.year.to_s+"_"+
      s_zeroprefix_1(ob_time.month.to_s)+"_"+
      s_zeroprefix_1(ob_time.day.to_s)+"_"+
      s_zeroprefix_1(ob_time.hour.to_s)+"_"+
      s_zeroprefix_1(ob_time.hour.to_s)+"_"+
      s_zeroprefix_1(ob_time.min.to_s)+"_"+
      s_zeroprefix_1(ob_time.sec.to_s)+"_"+
      s_zeroprefix_1(ob_time.usec.to_s)+"_"
      #----
      s_0=""
      10.times { s_0<<rand(20).to_s }
      @s_fp_prefix<<(s_0+"_")
      @s_fp_prefix<<"tmp_"+s_cl_self+"_"
      #------
      @fp_tmp_dot=(@s_fp_prefix+".txt.dot").freeze
      @fp_jpeg=(Dir.getwd+"/"+s_cl_self+"_graafik.jpeg").freeze
      @fp_svg=(Dir.getwd+"/"+s_cl_self+"_graafik.svg").freeze
   end # initialize

   private



   #-----------------------------------------------------------------------

   # Kopeeritud/asetatud Kibuvitsast ja natuke muudetud.
   def file2str(s_file_path)
      s_out=""
      @mx_streamaccess.synchronize do
         s_fp=s_file_path
         ar_lines=Array.new
         begin
            File.open(s_fp) do |file|
               while line = file.gets
                  ar_lines<<$kibuvits_lc_emptystring+line
               end # while
            end # Open-file region.
            s_out=kibuvits_s_concat_array_of_strings(ar_lines)
         rescue Exception =>err
            raise(Exception.new("\n"+err.to_s+"\n\ns_file_path=="+
            s_file_path+
            "\n GUID='4b469414-4199-46ce-8353-7010f00148e7'\n\n"))
         end #
      end # synchronize
      return s_out
   end # file2str


   def str2file(s_a_string, s_fp)
      @mx_streamaccess.synchronize do
         begin
            file=File.open(s_fp, "w")
            file.write(s_a_string)
            file.close
         rescue Exception =>err
            raise "No comments. GUID='96be7c25-5444-435a-9553-7010f00148e7' \n"+
            "s_a_string=="+s_a_string+"\n"+err.to_s+"\n\n"
         end #
      end # synchronize
   end # str2file

   #-----------------------------------------------------------------------

   def s_zeroprefix_1(s_in)
      i_0=s_in.to_i(10)
      if i_0<0
         raise(Exception.new("s_in=="+s_in+"\n"+
         "GUID=='5cd6fcf3-cdcf-4d8a-b153-7010f00148e7'"))
      end # if
      #--------
      s_out=s_in
      s_out="0"+s_in if i_0<10
      return s_out
   end # s_zeroprefix_1

   public


   private

   # .dot-faili content example:
   #
   #     digraph file_system_example {
   #         "/" -> "a/" -> "d/";
   #         "d/" -> "symlink_2";
   #         "/" -> "e/";
   #         "a/" -> "b/" -> "c/"
   #         "c/" -> "hello.txt"
   #         "c/" -> "symlink_1"
   #     }
   def s_generate_graphviz_dot_file(ob_data)
      if ob_data.class!=Graafikugeneraator_2_tulbaline_tabel
         raise(Exception.new("GUID=='ef4e2530-453c-4794-b153-7010f00148e7'"))
      end # if
      #----------------------------
      ar_column_parents=Array.new
      ar_column_children=Array.new
      #-------
      ht_s_parent_2_ht_children=ob_data.ht_s_parent_2_ht_children
      ht_dc2camel=ob_data.ht_all_persons_downcased_2_camelcase
      ar_children=nil
      s_p_camel=nil
      ht_s_parent_2_ht_children.each_pair do |s_parent,ht_children|
         ar_children.clear if ar_children!=nil
         ar_children=ht_children.keys
         s_p_camel=ht_dc2camel[s_parent]
         ar_children.each do |s_child|
            ar_column_parents<<s_p_camel
            ar_column_children<<ht_dc2camel[s_child]
         end # loop
      end # loop
      #-------
      if ar_column_parents.size!=ar_column_children.size
         # The 2 columns represent graph vertices that are
         # connected by an edge from the parent to the child.
         raise(Exception.new("GUID=='336ef881-4e8e-4dd5-8153-7010f00148e7'"))
      end # if
      #----------------------------
      func_0=lambda do |s_in|
         s_func_out="\""+s_in+"\""
         return s_func_out
      end #func_0
      #--------
      s_lc_arrow=" -> ".freeze
      s_lc_line_end=" ; \n".freeze
      s="digraph Aadrite_sugupuu { \n"
      i_len=ar_column_parents.size # ar len equality checked before
      i_len.times do |ix|
         s_parent=ar_column_parents[ix]
         s_child=ar_column_children[ix]
         s<<((func_0.call(s_parent)+s_lc_arrow)+
         (func_0.call(s_child)+s_lc_line_end))
      end #loop
      s<<"}\n"
      s_out=s
   end # s_generate_graphviz_dot_file

   public

   def run(ob_data)
      cl_required=Graafikugeneraator_2_tulbaline_tabel
      cl_ob_data=ob_data.class
      if cl_ob_data!=cl_required
         raise(Exception.new("\n\n"+
         "The ob_data is of class "+cl_ob_data.to_s+" , but \n"+
         "it is required to be of class "+cl_required.to_s+"\n"+
         "GUID=='6b286792-6217-45a7-a153-7010f00148e7'\n\n"))
      end # if
      #-------
      # puts @fp_tmp_dot
      # puts @fp_jpeg
      s_cmd_jpeg="dot -Tjpeg "+@fp_tmp_dot+" > "+@fp_jpeg+" ;" # xview ./pilt.jpeg
      # s_cmd_svg="dot -Tsvg "+@fp_tmp_dot+" > "+@fp_svg+" ;" # xview ./pilt.svg
      #-------
      if (@fp_jpeg.reverse)[0..4]=="gepj."
         File.delete @fp_jpeg if File.exist? @fp_jpeg
      end # if
      if (@fp_svg.reverse)[0..3]=="gvs."
         File.delete @fp_svg if File.exist? @fp_svg
      end # if
      #-------
      s_lc_check="✔\n"
      printf "\n\nGenerating the Graphviz .dot file .. "
      s_dot_file_content=s_generate_graphviz_dot_file(ob_data)
      str2file(s_dot_file_content,@fp_tmp_dot)
      printf(s_lc_check)
      #-------
      printf "\nGenerating the JPEG .. "
      x=eval("`"+s_cmd_jpeg+"`")
      if File.exist? @fp_jpeg
         printf(s_lc_check)
         puts "The path of the generated JPEG is:\n"+@fp_jpeg+"\n"
      else
         printf("failed\n")
      end # if
      #-------
      # # The variable s_cmd_svg must also be uncommented, if this block is uncommented.
      # printf "\nGenerating the SVG .. "
      # x=eval("`"+s_cmd_svg+"`")
      # if File.exist? @fp_svg
      #    printf(s_lc_check)
      #    puts "The path of the generated SVG is:\n"+@fp_svg+"\n"
      # else
      #    printf("failed\n")
      # end # if
      #-------
      puts "\n\n"
      #-------------
      if @fp_tmp_dot[0..4]=="/tmp/"
         File.delete @fp_tmp_dot if File.exist? @fp_tmp_dot
      end # if
   end # run

end # class Graafikugeneraator

#-------------------------------------------------------------------------

def directed_edge_from_left_to_right(s_left_node_label,s_right_node_label)
   ob_data=$ob_data
   ob_data.exc_declare_parent_and_child(s_left_node_label,s_right_node_label)
end # directed_edge_from_left_to_right

#-------------------------------------------------------------------------

def ob_init_data
   ob_data=Graafikugeneraator_2_tulbaline_tabel.new
   $ob_data=ob_data
   #---------------------
   # Vim-makrod on see "v8luvits", millega sellist andmete
   # sisestamise koodi elegantselt prototyypide korral
   # genereerida saab.
   # ob_data.exc_declare_parent_and_child("Karupoeg Puhh","J2nes")
   # ob_data.exc_declare_parent_and_child("Karupoeg Puhh","Eesel")
   # ob_data.exc_declare_parent_and_child("Karupoeg Puhh","Notsu")
   # ob_data.exc_declare_parent_and_child("Batman","Karupoeg Puhh")
   #---------------------
   require($s_fp_data_rb)
   declare_graph()
   return ob_data
end # ob_init_data

ob_data=ob_init_data()
ob_jpeg_generator=Graafikugeneraator.new
ob_jpeg_generator.run(ob_data)

#==========================================================================
# S_VERSION_OF_THIS_FILE="9e519d50-53ce-460f-8153-7010f00148e7"
#==========================================================================
