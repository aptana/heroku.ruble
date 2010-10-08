with_defaults :scope => ['source.ruby', 'project.rails'], 
              :output => :discard, 
              :working_directory => :current_project do
  command "Download Bundle" do |cmd|
    cmd.invoke do
      require 'heroku_bundle_tools'
      app_name = HerokuTools.prompt('Name of App to download:')
      if !app_name.nil? && !app_name.empty?
        HerokuCmd.run("bundles:download --app #{HerokuTools.shell_escape(app_name)}")
      end
    end
  end
  
  command "Capture Bundle" do |cmd|
    cmd.invoke do
      require 'heroku_bundle_tools'
      app_name = HerokuTools.prompt('Name of App to Capture:')
      if !app_name.nil? && !app_name.empty?
        HerokuCmd.run("bundles:capture --app #{HerokuTools.shell_escape(app_name)}")
      end
    end
  end
end