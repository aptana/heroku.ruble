require 'ruble'

command t(:console) do |cmd|
  cmd.scope = ['source.ruby', 'project.rails']
  cmd.output = :discard
  cmd.working_directory = :current_project
  cmd.invoke do
    require 'heroku_bundle_tools'
    HerokuCmd.run("console")
  end
end

command t(:rake_command) do |cmd|
  cmd.scope = ['source.ruby', 'project.rails']
  cmd.output = :discard
  cmd.working_directory = :current_project
  cmd.invoke do
    require 'heroku_bundle_tools'
    new_name = HerokuTools.prompt('Command:')
    if new_name
      new_name = new_name.sub(/^\s*rake\s+/, '')
      HerokuCmd.run("rake #{HerokuTools.shell_escape(new_name)}")
    end
  end
end