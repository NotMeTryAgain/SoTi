class AvatarUploader < CarrierWave::Uploader::Base # :nodoc:
  include CarrierWave::MiniMagick
  storage :fog
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    # For Rails 3.1+ asset pipeline compatibility:
    # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))

    #{}"/images/fallback/" + [version_name, "default.png"].compact.join('_')
    'default_avatar.jpg'

    #rails will look at 'app/assets/images/default_avatar.png'
  end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale
  #   process scale: [50, 50]
  # end

  # Create different versions of your uploaded files:
  version :large_avatar do
    # returns a 150x150 image
    process :resize_to_fill => [150, 150]
  end
  version :medium_avatar do
    # returns a 50x50 image
    process :resize_to_fill => [50, 50]
  end
  version :small_avatar do
    # returns a 35x35 image
    process :resize_to_fill => [35, 35]
  end
  version :default_avatar do
    process :resize_to_fill => [35, 35]
  end
  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
