Aws.config.update(region: Rails.application.credentials[:aws][:region], credentials: Aws::Credentials.new(*Rails.application.credentials[:aws].slice(:access_key_id, :secret_access_key).values))

S3 = Aws::S3::Client.new
