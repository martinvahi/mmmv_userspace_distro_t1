load 'lib/action.rb'
load 'lib/binder.rb'
load 'lib/browser.rb'
load 'lib/clipboard.rb'
load 'lib/context.rb'
load 'lib/editor.rb'
load 'lib/elements.rb'
load 'lib/filepath.rb'
load 'lib/files.rb'
load 'lib/find_in_files.rb'
load 'lib/find_result.rb'
load 'lib/focus.rb'
load 'lib/gem.rb'
load 'lib/mounter.rb'
load 'lib/navigator.rb'
load 'lib/os.rb'
load 'lib/path.rb'
load 'lib/pmip_action.rb'
load 'lib/refresh.rb'
load 'lib/run.rb'
load 'lib/run_configuration.rb'
load 'lib/servlet.rb'
load 'lib/sound.rb'
load 'lib/stats.rb'

#TODO: consistify on execute or run
load 'lib/action/execute_command.rb'
load 'lib/action/execute_configuration.rb'
load 'lib/action/open_url.rb'
load 'lib/action/run_ant_target.rb'
load 'lib/action/run_intellij_action.rb'

load 'lib/ui/balloon.rb'
load 'lib/ui/chooser.rb'
load 'lib/ui/dialogs.rb'
load 'lib/ui/progress_bar.rb'
load 'lib/ui/status_bar.rb'

PMIP_CORE_VERSION = '0.4.2' if !defined? PMIP_CORE_VERSION 

#TODO: add check to ensure that host version is good enough
puts "- Version: #{PMIP_CORE_VERSION}"
