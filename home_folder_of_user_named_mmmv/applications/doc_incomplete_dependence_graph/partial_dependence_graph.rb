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
    #----------------------------------------------------------------------
    directed_edge_from_left_to_right("glimpse_search_engine","Flex_imlements_Lex");
    directed_edge_from_left_to_right("Flex_imlements_Lex","GNU_Bison_implements_Yacc");
    directed_edge_from_left_to_right("AutoGen","Guile");
    directed_edge_from_left_to_right("GNU_Wget","lib_openssl");
    directed_edge_from_left_to_right("FOX_Toolkit","Doxygen");
    directed_edge_from_left_to_right("FOX_Toolkit","plzip");
    directed_edge_from_left_to_right("FOX_Toolkit","libtool_GNU");
    directed_edge_from_left_to_right("FOX_Toolkit","gunzip");
    directed_edge_from_left_to_right("FOX_Toolkit","ar");
    directed_edge_from_left_to_right("JAVA_gnuplot_GUI","Java");
    directed_edge_from_left_to_right("Maven","Java");
    directed_edge_from_left_to_right("ParaSail","Csh"); # As of 2024_07 the Csh source trunk is part of OpenBSD project
    directed_edge_from_left_to_right("REDUCE_Computer_Algebra_System","AutoGen");
    directed_edge_from_left_to_right("REDUCE_Computer_Algebra_System","ccache");
    directed_edge_from_left_to_right("ncdu","lib_NCURSES");   # https://invisible-island.net/ncurses/
    directed_edge_from_left_to_right("sc-im","lib_NCURSES");
    #----------------------------------------------------------------------
    directed_edge_from_left_to_right("Ruby","lib_openssl");
    directed_edge_from_left_to_right("Ruby","jemalloc");
    #----------------------------------------------------------------------
    directed_edge_from_left_to_right("doc_incomplete_dependence_graph","Ruby");
    directed_edge_from_left_to_right("doc_incomplete_dependence_graph","Bash");
    directed_edge_from_left_to_right("doc_incomplete_dependence_graph","grep");
    directed_edge_from_left_to_right("doc_incomplete_dependence_graph","dot");
    #----------------------------------------------------------------------
    directed_edge_from_left_to_right("Inkscape","CMake");
    directed_edge_from_left_to_right("lib_CLucene","CMake");
    #----------------------------------------------------------------------
    directed_edge_from_left_to_right("sphinx-build", "Sphinx");
    directed_edge_from_left_to_right("Sphinx","Python");
    #----------------------------------------------------------------------
    directed_edge_from_left_to_right("CMake","sphinx-build");
    directed_edge_from_left_to_right("CMake","makeinfo");
    directed_edge_from_left_to_right("makeinfo","texinfo");
    #----------------------------------------------------------------------
    directed_edge_from_left_to_right("xeyes","Debian_package_x11_apps");
    #----------------------------------------------------------------------
    directed_edge_from_left_to_right("DRAKON","tcllib");
    directed_edge_from_left_to_right("DRAKON","libtk-img");
    directed_edge_from_left_to_right("DRAKON","tklib");
    directed_edge_from_left_to_right("DRAKON","tk8.5");
    directed_edge_from_left_to_right("tklib","tk8.5"); # Tk
    #----------------------------------------------------------------------
    directed_edge_from_left_to_right("Geany","lib_GTK3");
    directed_edge_from_left_to_right("lib_GTK3","lib_Pango"); # https://pango.gnome.org/
    directed_edge_from_left_to_right("lib_GTK3","lib_GLib");  # https://docs.gtk.org/glib/
    directed_edge_from_left_to_right("lib_GTK3","lib_ATK");   # https://docs.gtk.org/atk/
    directed_edge_from_left_to_right("Geany","Geany_build_system");
    directed_edge_from_left_to_right("Geany_build_system","rst2html"); # optional dependency
    directed_edge_from_left_to_right("Geany_build_system","Doxygen"); # optional dependency
    #----------------------------------------------------------------------
    directed_edge_from_left_to_right("nodemon","npm"); 
    #----------------------------------------------------------------------
    directed_edge_from_left_to_right("npm","git"); 
    directed_edge_from_left_to_right("npm","node-gyp"); 
    directed_edge_from_left_to_right("node-gyp","Python"); 
    directed_edge_from_left_to_right("node-gyp","make"); 
    directed_edge_from_left_to_right("node-gyp","GCC"); 
    #----------------------------------------------------------------------
    directed_edge_from_left_to_right("rst2html","Docutils"); # supposedly rst2html is part of Docutils, https://www.docutils.org/
    directed_edge_from_left_to_right("Docutils","Python");   # Python version not determined here
    directed_edge_from_left_to_right("rst2pdf","Python3"); # "pipx install rst2pdf", https://rst2pdf.org/
    #----------------------------------------------------------------------
    directed_edge_from_left_to_right("Python", "Python2"); # This graph specific dependency
    directed_edge_from_left_to_right("Python", "Python3");
    #----------------------------------------------------------------------
    directed_edge_from_left_to_right("Xdialog","lib_GTK2");
    directed_edge_from_left_to_right("lib_GTK2","lib_Pango"); # https://pango.gnome.org/
    directed_edge_from_left_to_right("lib_GTK2","lib_GLib");  # https://docs.gtk.org/glib/
    directed_edge_from_left_to_right("lib_GTK2","lib_ATK");   # https://docs.gtk.org/atk/
    #----------------------------------------------------------------------
    # https://github.com/rescrv/redupe
    # https://github.com/rpm-software-management/popt/releases/tag/popt-1.19-release
    directed_edge_from_left_to_right("redupe_file_corruption_mitigator","lib_popt");
    #----------------------------------------------------------------------
    directed_edge_from_left_to_right("Vim","Cscope");
    #----------------------------------------------------------------------
    directed_edge_from_left_to_right("MotionProject_security_camera_software","jpg libraries"); # what ever that means, probably some libjpeg
    #----------------------------------------------------------------------
end # declare_graph

#==========================================================================
# S_VERSION_OF_THIS_FILE="96e3c9a7-26cc-4a10-af2b-e20321d088e7"
#==========================================================================
