namespace :seed do
  desc 'Uploads all images in the db/images folder to Cloudinary'

  task images: :environment do
    Cloudinary::Uploader.upload('/Users/Nick/Developer/clinical-skills-data-server/db/images/musculoskeletal/spurling_test.png', :public_id => 'musculoskeletal/spurling_test')
    Cloudinary::Uploader.upload('/Users/Nick/Developer/clinical-skills-data-server/db/images/musculoskeletal/compression_test.png', :public_id => 'musculoskeletal/compression_test')
    Cloudinary::Uploader.upload('/Users/Nick/Developer/clinical-skills-data-server/db/images/musculoskeletal/distraction_test.png', :public_id => 'musculoskeletal/distraction_test')
  end

end
