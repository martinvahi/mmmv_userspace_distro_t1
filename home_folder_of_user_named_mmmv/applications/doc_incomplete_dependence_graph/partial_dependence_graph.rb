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

    directed_edge_from_left_to_right("AutoGen","Guile");
    directed_edge_from_left_to_right("GNU_Wget","lib_openssl");
    directed_edge_from_left_to_right("Ruby","lib_openssl");
    directed_edge_from_left_to_right("JAVA_gnuplot_GUI","Java");
    directed_edge_from_left_to_right("Maven","Java");
    directed_edge_from_left_to_right("REDUCE_Computer_Algebra_System","ccache");
    directed_edge_from_left_to_right("ncdu","ncurses");
    #----------------------------------------------------------------------
    directed_edge_from_left_to_right("doc_incomplete_dependence_graph","Ruby");
end # declare_graph

#==========================================================================
# S_VERSION_OF_THIS_FILE="529ea372-3753-4112-b7fe-a110802168e7"
#==========================================================================
