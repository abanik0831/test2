CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',                        # required
      :aws_access_key_id      => 'AKIAJ4F4N7RPRWGOD5IQ',                        # required
      :aws_secret_access_key  => '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'                        # required
  }
  config.fog_directory  = 'startupsocial'                     # required
  #config.fog_public     = false                                   # optional, defaults to true
  #config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end