require 'ruble'

with_defaults :scope => ['source.ruby', 'project.rails'], :output => :discard, :working_directory => :current_project do

  command t(:maintenance_on) do |cmd|
    cmd.invoke do
      require 'heroku_bundle_tools'
      HerokuCmd.run("maintenance:on")
    end
  end

  command t(:maintenance_off) do |cmd|
    cmd.invoke do
      require 'heroku_bundle_tools'
      HerokuCmd.run("maintenance:off")
    end
  end

end
