# == Schema Information
#
# Table name: attachments
#
#  id                  :bigint           not null, primary key
#  attachmentable_type :string
#  image_data          :jsonb
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  attachmentable_id   :bigint
#
# Indexes
#
#  index_attachments_on_attachmentable  (attachmentable_type,attachmentable_id)
#
class Attachment < ApplicationRecord
  include AttachmentUploader::Attachment(:image)

  belongs_to :attachmentable, polymorphic: true
end
