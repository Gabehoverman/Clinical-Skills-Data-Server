# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( new_system_dialog_controller.js )

%w(new_system_dialog edit_links_dialog).each do |base|
	Rails.application.config.assets.precompile += ["#{base}_controller.js"]
	Rails.application.config.assets.precompile += ["#{base}.html"]
end

%w(application systems subsystems links api).each do |controller|
  Rails.application.config.assets.precompile += ["#{controller}.js"]
  Rails.application.config.assets.precompile += ["#{controller}.scss"]
end