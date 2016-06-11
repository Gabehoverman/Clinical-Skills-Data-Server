# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

Dir.glob("#{Rails.root}/assets/dialog_controllers/**/").each do |path|
	Rails.application.config.assets.paths << path
	Dir.glob(path + '*').each do |file|
		Rails.application.config.assets.precompile += [File.basename(file)]
	end
end

Dir.glob("#{Rails.root}/assets/dialog_htmls/**/").each do |path|
	Rails.application.config.assets.paths << path
	Dir.glob(path + '*').each do |file|
		Rails.application.config.assets.precompile += [File.basename(file)]
	end
end

Dir.glob("#{Rails.root}/assets/javascripts/*").each do |path|
	Rails.application.config.assets.paths << path
	Dir.glob(path + '*').each do |file|
		Rails.application.config.assets.precompile += [File.basename(file)]
	end
end

Dir.glob("#{Rails.root}/assets/stylesheets/*").each do |path|
	Rails.application.config.assets.paths << path
	Dir.glob(path + '*').each do |file|
		Rails.application.config.assets.precompile += [File.basename(file)]
	end
end