# == Schema Information
#
# Table name: attachments
#
#  id                  :bigint           not null, primary key
#  attachment_data     :jsonb
#  attachmentable_type :string
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
