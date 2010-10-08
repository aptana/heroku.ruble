require 'ruble'

command 'Install Gem' do |cmd|
  cmd.scope = ['source.ruby', 'project.rails']
  cmd.output = :discard
  cmd.working_directory = :current_project
  cmd.invoke do
    require 'ruble/terminal'
    # TODO Don't even run command if gem is already installed
    # FIXME Don't do sudo on windows, what about other OSes?
    Ruble::Terminal.open('sudo gem install heroku')
  end
end