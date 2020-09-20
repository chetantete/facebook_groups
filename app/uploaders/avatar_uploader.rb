class AvatarUploader < CarrierWave::Uploader::Base
 
  if Rails.env.development?


   include CarrierWave::MiniMagick

   storage :file

   def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
else
  include Cloudinary::CarrierWave

  CarrierWave.configure do |config|
   config.cache_storage = :file
 end
end
def extension_whitelist
  %w(jpg jpeg gif png)
end

end
