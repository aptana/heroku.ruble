
command 'Add Config Var' do |cmd|
  cmd.scope = ['source.ruby', 'project.rails']
  cmd.output = :discard
  cmd.working_directory = :current_project
  cmd.invoke do
    require 'heroku_bundle_tools'
    name = HerokuTools.prompt('Variable Name:')
    value = HerokuTools.prompt('Variable Value:')
    if name && value
      name = name.upcase
      HerokuCmd.run("config:add #{HerokuTools.shell_escape(name)}=#{HerokuTools.shell_escape(value)}")
    end
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
        require 'heroku_bundle_tools'
        HerokuCmd.run("config:clear")
    end
  end
end