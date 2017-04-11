CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage :fog

    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region:                'eu-west-2',
      path_style:            true
    }

    config.fog_directory = Settings.bucket_name.recording
  end
end
