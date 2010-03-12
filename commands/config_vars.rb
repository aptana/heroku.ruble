require 'heroku_bundle_tools'

command 'Add Config Var' do |cmd|
  cmd.scope = ['source.ruby', 'project.rails']
  cmd.output = :discard
  cmd.working_directory = :current_project
  cmd.invoke do
    name = HerokuTools.prompt('Variable Name:').upcase
    value = HerokuTools.prompt('Variable Value:')
    HerokuCmd.run("config:add #{HerokuTools.shell_escape(name)}=#{HerokuTools.shell_escape(value)}")
  end
end

command 'Clear Config Vars' do |cmd|
  cmd.scope = ['source.ruby', 'project.rails']
  cmd.output = :discard
  cmd.working_directory = :current_project
  cmd.invoke do
    if Ruble::UI.request_confirmation(
        :title => "Confirm Action", 
        :prompt => "You cannot undue this operation. Are you sure you want to clear all config vars?",
        :button1 => "Clear config vars")
        HerokuCmd.run("config:clear")
    end
  end
end