require 'heroku_bundle_tools'

command 'Rake db:migrate on Heroku' do |cmd|
  cmd.scope = ['source.ruby', 'project.rails']
  cmd.output = :discard
  cmd.working_directory = :current_project
  cmd.invoke do
    HerokuCmd.run("rake db:migrate")
  end
end

command 'Push Local Database to Heroku' do |cmd|
  cmd.scope = ['source.ruby', 'project.rails']
  cmd.output = :discard
  cmd.working_directory = :current_project
  cmd.invoke do
    HerokuCmd.run("db:push")
  end
end

command 'Pull Remote Database from Heroku' do |cmd|
  cmd.scope = ['source.ruby', 'project.rails']
  cmd.output = :discard
  cmd.working_directory = :current_project
  cmd.invoke do
    HerokuCmd.run("db:pull")
  end
end