require 'ruble'
require 'ruble/ui'
require 'escape'
require 'ruble/terminal'
require 'rbconfig'

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
    e_sh(string)
  end
end

module HerokuCmd
  def self.gem_is_installed?(name)
    if is_windows?
      `gem search #{name}` =~ /#{Regexp.escape(name)}/
    else
      `/bin/sh -l -c "gem search{name}"` =~ /#{Regexp.escape(name) }/
    end
  end
  
  def self.is_windows?
    RbConfig::CONFIG['target_os'] =~ /(win|w)32$/
  end
  
  def self.run(command)
    # FIXME Doesn't seem to find my heroku installed in rvm
    #heroku_path = "~/.rvm/gems/ruby-1.8.7-p249/bin/heroku"
    command = "heroku #{command}"
    unless gem_is_installed?('heroku')
      if Ruble::UI.request_confirmation(
          :title => "Install Heroku gem?", 
          :prompt => "The Heroku gem was not found on your system. Would you like to install the heroku gem now?",
          :button1 => "Install Heroku gem")
        if !is_windows?  
          command = "sudo gem install heroku && #{command}"
        else
          command = "gem install heroku && #{command}"
        end
      else
        return false
      end
    end
    
    Ruble::Terminal.open(command)
  end
end