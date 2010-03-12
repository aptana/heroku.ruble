require 'heroku_bundle_tools'

%w(On Off).each do |state|
  command "Turn Maintence #{state}" do |cmd|
    cmd.scope = ['source.ruby', 'project.rails']
    cmd.output = :discard
    cmd.working_directory = :current_project
    cmd.invoke do
      HerokuCmd.run("maintenance:#{state.downcase}")
    end
  end
end
