
command 'Add Collaborator' do |cmd|
  cmd.scope = ['source.ruby', 'project.rails']
  cmd.output = :discard
  cmd.working_directory = :current_project
  cmd.invoke do
    require 'heroku_bundle_tools'
    email = HerokuTools.prompt('Email address of collaborator:')
    if !email.nil? && !email.empty?
      HerokuCmd.run("sharing:add #{HerokuTools.shell_escape(email)}")
    end
  end
end

command 'Remove Collaborator' do |cmd|
  cmd.scope = ['source.ruby', 'project.rails']
  cmd.output = :discard
  cmd.working_directory = :current_project
  cmd.invoke do
    require 'heroku_bundle_tools'
    email = HerokuTools.prompt('Email address of collaborator:')
    if !email.nil? && !email.empty?
      HerokuCmd.run("sharing:remove #{HerokuTools.shell_escape(email)}")
    end
  end
end