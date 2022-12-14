#!/opt/ruby/bin/ruby -Ku
#==========================================================================
=begin

 Copyright 2012, martin.vahi@softf1.com that has an
 Estonian personal identification code of 38108050020.
 All rights reserved.

 Redistribution and use in source and binary forms, with or
 without modification, are permitted provided that the following
 conditions are met:

 * Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer
   in the documentation and/or other materials provided with the
   distribution.
 * Neither the name of the Martin Vahi nor the names of its
   contributors may be used to endorse or promote products derived
   from this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
 CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
 INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
 CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

=end
#==========================================================================
BREAKDANCEMAKE_BDMSERVICE_DETECTOR_MAVEN_INCLUDED=true

require "rubygems"
require 'pathname'
if !defined? BREAKDANCEMAKE_HOME
   BREAKDANCEMAKE_HOME=Pathname.new($0).realpath.parent.parent.parent.parent.to_s
end # if
require BREAKDANCEMAKE_HOME+"/src/bonnet/lib/breakdancemake_inclusions.rb"

#==========================================================================

# The bdmservice detector interface resides in
# ../../bonnet/breakdancemake_bdmservice_detector.rb
#
# All of the bdmservice detector class names must have a name structure of
# Breakdancemake_bdmservice_detector_<bdmservice name>
class Breakdancemake_bdmservice_detector_maven< Breakdancemake_bdmservice_detector

   def initialize
      super
      @s_bdmcomponent_name="maven".freeze

      # If a bdmservice is a web service,
      # then a loss of a network connection renders the
      # bdmservice to be unavailable. Applications that
      # have been installed to the local machine and
      # are available by the PATH, are "usually"
      # available all the time, except when they reside
      # in network folders, etc.
      @b_bdmcomponent_availability_is_static=true
   end #initialize

   protected

   def b_assess_bdmcomponent_availability(ht_cycle_detection_opmem,fd_threshold)
      b_on_the_path=Kibuvits_shell.b_available_on_path("mvn")
      return false if !b_on_the_path
      ht_stdstreams=kibuvits_sh("mvn --version")
      s_stdout=ht_stdstreams[$kibuvits_lc_s_stdout]
      rgx=/^Apache Maven 3/
      b_ready_for_use=false
      b_ready_for_use=true if rgx.match(s_stdout)!=nil
      return b_ready_for_use
   end # b_assess_bdmcomponent_availability


   public

   # The main purpose of the method s_status
   # is to give feedback about the reasons, why the
   # bdmservice is not available, i.e.
   # why the method b_ready_for_use() returns a
   # boolean value of false.
   #
   # If the b_ready_for_use() returns the boolean value of true,
   # then the s_status should just return some polite text that
   # says that things are running smoothly and the text may,
   # is encouraged to, but does not necessarily have to,
   # contain some reasonable status details.
   #
   # The s_language is usually "uk", which stands for United Kingdom,
   # or "et", which stands for Estonian.
   def s_status(s_language)
      s_out=breakdancemake_s_bdmservice_status_by_PATH_only_t1(s_language)
      return s_out
   end # s_status


end # class Breakdancemake_bdmservice_detector_maven

#--------------------------------------------------------------------------
ob_bdmservice_detector=Breakdancemake_bdmservice_detector_maven.new
Breakdancemake.declare_bdmcomponent(ob_bdmservice_detector)

#==========================================================================

