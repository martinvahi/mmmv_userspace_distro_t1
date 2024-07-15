#!/usr/bin/env ruby
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#==========================================================================
if !defined? Graafikugeneraator_2_tulbaline_tabel
   require 'pathname'
   ob_pth_0=Pathname.new(__FILE__).realpath
   ob_pth_1=ob_pth_0.parent.parent
   s_fp_generator=ob_pth_1.to_s+"/bin/regenerate.bash"
   throw(Exception.new("\n\n Please run the "+s_fp_generator+
   " to regenerate the graph images. \n\n"))
end
#==========================================================================
def declare_graph()

    directed_edge_from_left_to_right("glimpse_search_engine","Flex_imlements_Lex");
    directed_edge_from_left_to_right("Flex_imlements_Lex","GNU_Bison_implements_Yacc");
    directed_edge_from_left_to_right("AutoGen","Guile");
    directed_edge_from_left_to_right("GNU_Wget","lib_openssl");
    directed_edge_from_left_to_right("FOX_Toolkit","doxygen");
    directed_edge_from_left_to_right("FOX_Toolkit","plzip");
    directed_edge_from_left_to_right("FOX_Toolkit","libtool_GNU");
    directed_edge_from_left_to_right("FOX_Toolkit","gunzip");
    directed_edge_from_left_to_right("FOX_Toolkit","ar");
    directed_edge_from_left_to_right("Ruby","lib_openssl");
    directed_edge_from_left_to_right("JAVA_gnuplot_GUI","Java");
    directed_edge_from_left_to_right("Maven","Java");
    directed_edge_from_left_to_right("ParaSail","Csh"); # As of 2024_07 the Csh source trunk is part of OpenBSD project
    directed_edge_from_left_to_right("REDUCE_Computer_Algebra_System","AutoGen");
    directed_edge_from_left_to_right("REDUCE_Computer_Algebra_System","ccache");
    directed_edge_from_left_to_right("ncdu","ncurses");
    #----------------------------------------------------------------------
    directed_edge_from_left_to_right("doc_incomplete_dependence_graph","Ruby");
    directed_edge_from_left_to_right("doc_incomplete_dependence_graph","Bash");
    directed_edge_from_left_to_right("doc_incomplete_dependence_graph","grep");
    directed_edge_from_left_to_right("doc_incomplete_dependence_graph","dot");
    #----------------------------------------------------------------------
    directed_edge_from_left_to_right("Inkscape","CMake");
    directed_edge_from_left_to_right("lib_CLucene","CMake");
    directed_edge_from_left_to_right("CMake","sphinx-build");
    #----------------------------------------------------------------------
    directed_edge_from_left_to_right("Vim","Cscope");
    #----------------------------------------------------------------------
    directed_edge_from_left_to_right("MotionProject_security_camera_software","jpg libraries"); # what ever that means, probably some libjpeg
    #----------------------------------------------------------------------
    directed_edge_from_left_to_right("Xdialog","GTK2");
    #----------------------------------------------------------------------
end # declare_graph

#==========================================================================
# S_VERSION_OF_THIS_FILE="16813ad5-6cda-45c7-be9d-612071d168e7"
#==========================================================================
