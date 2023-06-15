class CreateAttachments < ActiveRecord::Migration[7.0]
  def change
    create_table :attachments do |t|
      t.belongs_to :attachmentable, polymorphic: true
      t.jsonb :attachment_data
      t.timestamps
    end
  end
end
