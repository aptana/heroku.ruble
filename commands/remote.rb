require 'heroku_bundle_tools'

command "Console" do |cmd|
  cmd.scope = ['source.ruby', 'project.rails']
  cmd.output = :discard
  cmd.working_directory = :current_project
  cmd.invoke do
    HerokuCmd.run("console")
  end
end

command "Rake Command" do |cmd|
  cmd.scope = ['source.ruby', 'project.rails']
  cmd.output = :discard
  cmd.working_directory = :current_project
  cmd.invoke do
    new_name = HerokuTools.prompt('Command:')
    new_name = new_name.sub(/^\s*rake\s+/, '')
    HerokuCmd.run("rake #{HerokuTools.shell_escape(new_name)}")
  end
end