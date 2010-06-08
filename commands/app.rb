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
  cmd.invoke do |context|
    cmd = "create"
    cmd << " #{ENV['HEROKU_APP_NAME']}" if ENV['HEROKU_APP_NAME']
    HerokuCmd.run(cmd)
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

command "Open App in Web Browser" do |cmd|
  cmd.scope = ['source.ruby', 'project.rails']
  cmd.output = :discard
  cmd.working_directory = :current_project
  cmd.invoke.windows = ""
  cmd.invoke do
    HerokuCmd.run("open")
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

# Special command used to create and deploy under deploy wizard. Not surfaced in Ruble UI
command "Create and Deploy App" do |cmd|
cmd.scope = ['source.ruby', 'project.rails']
  cmd.output = :discard
  cmd.working_directory = :current_project
  cmd.invoke do |context|
    cmd = "create"
    cmd << " #{ENV['HEROKU_APP_NAME']}" if ENV['HEROKU_APP_NAME']
    cmd << "; git push heroku master"
    HerokuCmd.run(cmd)
  end
end
