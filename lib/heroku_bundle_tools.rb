require 'ruble'
require 'ruble/ui'

class CommandRunner
  def initialize(command)
    @command = command
    @on_success = nil
    @on_failure = nil
  end
  
  def on_success(&block)
    @on_success = block
  end
  
  def on_failure(&block)
    @on_failure = block
  end
  
  def run
    output = `#{@command}`
    if $? == 0
      @on_success.call(output, $?) if @on_success
    else
      @on_failure.call(output, $?) if @on_failure
    end
  end
end

module HerokuTools
  def self.prompt(prompt)
    Ruble::UI.send(:request_string_core, prompt, false, {})
  end
  
  def self.shell_escape(string)
    # TODO: escape for shell
    string
  end
end

module HerokuCmd
  def self.gem_is_installed?(name)
    `gem search #{name}` =~ /#{Regexp.escape(name)}/
  end
  
  def self.run(command)
    command = "heroku #{command}"
    unless system('heroku help')
      # heroku gem is probably not installed, check to make sure
      if gem_is_installed?('heroku')
        Ruble::UI.alert(:error, "Heroku command failed", "The Heroku gem appears to be installed but the heroku command failed to run.")
        return false
      else
        if Ruble::UI.request_confirmation(
            :title => "Install Heroku gem?", 
            :prompt => "The Heroku gem was not found on your system. Would you like to install the heroku gem now?",
            :button1 => "Install Heroku gem")
          command = "sudo gem install heroku && #{command}"
        else
          return false
        end
      end
    end
    
    Ruble::Terminal.open(command)
  end
end