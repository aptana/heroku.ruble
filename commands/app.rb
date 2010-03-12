require 'heroku_bundle_tools'

command 'App Info' do |cmd|
  cmd.scope = ['source.ruby', 'project.rails']
  cmd.output = :discard
  cmd.working_directory = :current_project
  cmd.invoke do
    HerokuCmd.run("info")
  end
end

command 'Create App' do |cmd|
  cmd.scope = ['source.ruby', 'project.rails']
  cmd.output = :discard
  cmd.working_directory = :current_project
  cmd.invoke do
    HerokuCmd.run("create")
  end
end

command "Deploy App" do |cmd|
  cmd.scope = ['source.ruby', 'project.rails']
  cmd.output = :discard
  cmd.working_directory = :current_project
  cmd.invoke do
    Ruble::Terminal.open("git push heroku master")
  end
end

command "Rename App" do |cmd|
  cmd.scope = ['source.ruby', 'project.rails']
  cmd.output = :discard
  cmd.working_directory = :current_project
  cmd.invoke do
    new_name = HerokuTools.prompt('New App Name:')
    Ruble::Terminal.open("heroku rename '#{HerokuTools.shell_escape(new_name)}'")
  end
end
