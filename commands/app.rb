
command 'App Info' do |cmd|
  cmd.scope = ['source.ruby', 'project.rails']
  cmd.output = :discard
  cmd.working_directory = :current_project
  cmd.invoke do
    require 'heroku_bundle_tools'
    HerokuCmd.run("info")
  end
end

command 'Create App' do |cmd|
  cmd.scope = ['source.ruby', 'project.rails']
  cmd.output = :discard
  cmd.working_directory = :current_project
  cmd.invoke do |context|
    require 'heroku_bundle_tools'
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
    require 'heroku_bundle_tools'
    Ruble::Terminal.open("git push heroku master")
  end
end

command "Open App in Web Browser" do |cmd|
  cmd.scope = ['source.ruby', 'project.rails']
  cmd.output = :discard
  cmd.working_directory = :current_project
  cmd.invoke.windows = ""
  cmd.invoke do
    require 'heroku_bundle_tools'
    HerokuCmd.run("open")
  end
end

command "Rename App" do |cmd|
  cmd.scope = ['source.ruby', 'project.rails']
  cmd.output = :discard
  cmd.working_directory = :current_project
  cmd.invoke do
    require 'heroku_bundle_tools'
    new_name = HerokuTools.prompt('New App Name:')
    if !new_name.nil? && !new_name.empty?
      Ruble::Terminal.open("heroku rename '#{HerokuTools.shell_escape(new_name)}'")
    end
  end
end

# Special command used to create and deploy under deploy wizard. Not surfaced in Ruble UI
command "Create and Deploy App" do |cmd|
cmd.scope = ['source.ruby', 'project.rails']
  cmd.output = :discard
  cmd.working_directory = :current_project
  cmd.invoke do |context|
    require 'heroku_bundle_tools'
    cmd = "create"
    cmd << " #{ENV['HEROKU_APP_NAME']}" if ENV['HEROKU_APP_NAME']
    cmd << "; git push heroku master"
    HerokuCmd.run(cmd)
  end
end
