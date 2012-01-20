require 'ruble'

command t(:rake_db_migrate) do |cmd|
  cmd.scope = ['source.ruby', 'project.rails']
  cmd.output = :discard
  cmd.working_directory = :current_project
  cmd.invoke do
    require 'heroku_bundle_tools'
    HerokuCmd.run("rake db:migrate")
  end
end

command t(:push_database) do |cmd|
  cmd.scope = ['source.ruby', 'project.rails']
  cmd.output = :discard
  cmd.working_directory = :current_project
  cmd.invoke do
    require 'heroku_bundle_tools'
    HerokuCmd.run("db:push")
  end
end

command t(:pull_database) do |cmd|
  cmd.scope = ['source.ruby', 'project.rails']
  cmd.output = :discard
  cmd.working_directory = :current_project
  cmd.invoke do
    require 'heroku_bundle_tools'
    HerokuCmd.run("db:pull")
  end
end