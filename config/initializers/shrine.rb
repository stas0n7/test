require 'shrine'
require 'shrine/storage/file_system'
require 'shrine/storage/s3'

# Shrine.storages = {
#   cache: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/cache'), # temporary
#   store: Shrine::Storage::FileSystem.new('public', prefix: 'uploads') # permanent
# }

s3_options = {
  bucket: Rails.application.credentials[:aws][:bucket],
  region: Rails.application.credentials[:aws][:region],
  access_key_id: Rails.application.credentials[:aws][:access_key_id],
  secret_access_key: Rails.application.credentials[:aws][:secret_access_key]
}

Shrine.storages = {
  cache: Shrine::Storage::S3.new(prefix: 'cache', **s3_options), # temporary
  store: Shrine::Storage::S3.new(**s3_options) # permanent
}

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data # for retaining the cached file across form redisplays
Shrine.plugin :restore_cached_data # re-extract metadata when attaching a cached file
Shrine.plugin :rack_file # for non-Rails apps
Shrine.plugin :validation_helpers
Shrine.plugin :determine_mime_type
Shrine.plugin :remove_attachment
