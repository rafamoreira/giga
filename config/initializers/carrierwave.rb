CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     ENV['S3_KEY'],                # required
    aws_secret_access_key: ENV['S3_SECRET'],             # required
      region:                'us-east-1',                  # optional, defaults to 'us-east-1'
    #host:                  's3.example.com',             # optional, defaults to nil
    #endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
  }
    config.fog_directory  = 'giga-proj'                                   # required
  config.fog_public     = true                                                 # optional, defaults to true
  config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } # optional, defaults to {}

  config.cache_dir = "#{Rails.root}/tmp/uploads"
end
