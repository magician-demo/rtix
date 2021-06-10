CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['aws_access_key_id'],
    aws_secret_access_key: ENV['aws_secret_access_key'],
    region: 'ap-northeast-1',
    host: 's3-ap-northeast-1.amazonaws.com',
  }
  config.fog_directory = ENV['s3_bucket_name']
  config.fog_public = false
end
