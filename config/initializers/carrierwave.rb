config.fog_credentials = {
  provider:              'AWS',                            # required
  aws_access_key_id:     "AKIA5H5QV2EXHYH3RNYH",            # required
  aws_secret_access_key: "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",            # required
  region:                'us-east-1'                       # to match the carrierwave and bucket region
}
config.fog_directory = "researchly-project"                   # required
config.fog_public    = false
config.cache_dir     = "#{Rails.root}/tmp/uploads"         # To let CarrierWave work on Heroku
config.storage       = :fog
