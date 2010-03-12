require 'ruble'

# its ruby, so this just addscommands/snippets in bundle (or replaces those with same name)
# many ruby files could add to a single bundle
bundle 'Heroku' do |bundle|
  bundle.author = 'Kris Rasmussen'
  bundle.copyright = <<END
© Copyright 2010 Aptana Inc. Distributed under the MIT license.
END

  bundle.description = <<END
Easy deployment with Heroku from within Studio 3
END
  
  bundle.repository = "git://github.com/aptana/heroku.ruble.git"

  bundle.menu "Heroku" do |menu|
    menu.scope = [ "source.ruby", "project.rails" ]

    menu.command "Create App"
    menu.separator
    menu.command "Deploy App"
    menu.separator
    menu.menu "Sharing" do |sharing|
      sharing.command "Add Collaborator"
      sharing.command "Remove Collaborator"
    end
    menu.menu "Database" do |database|
      database.command "Push Local Database to Heroku"
      database.command "Pull Remote Database from Heroku"
    end
    menu.menu "Maintenance" do |m|
      m.command "Turn Maintence On"
      m.command "Turn Maintence Off"
    end
    menu.menu "Remote" do |remote|
      remote.command "Console"
      remote.command "Rake Command"
    end
    menu.menu "Config Vars" do |config|
      config.command "Add Config Var"
      config.command "Clear Config Vars"
    end
    menu.menu "Backups" do |bundles|
      bundles.command "Capture Bundle"
      bundles.command "Download Bundle"
    end
    menu.command "App Info"
    menu.command "Rename App"
    
    
        
    #rdoc.menu 'Format' do |format|
     # format.command "Bold"
      #format.command "Italic"
      #format.command "Typewriter"
    #end
  end
end
