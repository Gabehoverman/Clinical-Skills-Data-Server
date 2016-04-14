namespace :seed do
  desc 'Uploads all images in the db/images folder to Cloudinary'

  task images: :environment do

    Dir.glob("#{Rails.root}/db/images/*/*.png").each do |path|
      folder_name = File.basename(File.dirname(path))
      image_name = File.basename(path, '.png')
      Cloudinary::Uploader.upload(path, :public_id => "#{folder_name}/#{image_name}")
    end

  end

end
