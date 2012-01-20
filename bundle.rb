require 'ruble'

# its ruby, so this just addscommands/snippets in bundle (or replaces those with same name)
# many ruby files could add to a single bundle
bundle t(:bundle_name) do |bundle|
  bundle.author = 'Kris Rasmussen'
  bundle.copyright = "Copyright 2010 Aptana Inc. Distributed under the MIT license."
  bundle.description = 'Easy deployment with Heroku from within Studio 3' 
  bundle.repository = "git://github.com/aptana/heroku.ruble.git"

  bundle.menu t(:bundle_name) do |menu|
    menu.scope = [ "source.ruby", "project.rails" ]

    menu.command t(:create_app)
    menu.separator
    menu.command t(:deploy_app)
    menu.separator
    menu.command t(:open_in_browser)
    menu.menu t(:sharing) do |sharing|
      sharing.command t(:add_collaborator)
      sharing.command t(:remove_collaborator)
    end
    menu.menu t(:database) do |database|
      database.command t(:rake_db_migrate)
      database.command t(:push_database)
      database.command t(:pull_database)
    end
    menu.menu t(:maintenance) do |m|
      m.command t(:maintenance_on)
      m.command t(:maintenance_off)
    end
    menu.menu t(:remote) do |remote|
      remote.command t(:console)
      remote.command t(:rake_command)
    end
    menu.menu t(:config_vars) do |config|
      config.command t(:add_config_var)
      config.command t(:clear_config_vars)
    end
    menu.menu t(:backups) do |bundles|
      bundles.command t(:capture_bundle)
      bundles.command t(:download_bundle)
    end
    menu.command t(:app_info)
    menu.command t(:rename_app)
        
    #rdoc.menu 'Format' do |format|
     # format.command "Bold"
      #format.command "Italic"
      #format.command "Typewriter"
    #end
  end
end
