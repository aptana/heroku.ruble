require 'heroku_bundle_tools'

command "Download Bundle" do |cmd|
  cmd.scope = ['source.ruby', 'project.rails']
  cmd.output = :discard
  cmd.working_directory = :current_project
  cmd.invoke do
    app_name = HerokuTools.prompt('Name of App to download:')
    if !app_name.nil? && !app_name.empty?
      HerokuCmd.run("bundles:download --app #{HerokuTools.shell_escape(app_name)}")
    end
  end
end

command "Capture Bundle" do |cmd|
  cmd.scope = ['source.ruby', 'project.rails']
  cmd.output = :discard
  cmd.working_directory = :current_project
  cmd.invoke do
    app_name = HerokuTools.prompt('Name of App to Capture:')
    if !app_name.nil? && !app_name.empty?
      HerokuCmd.run("bundles:capture --app #{HerokuTools.shell_escape(app_name)}")
    end
  end
end