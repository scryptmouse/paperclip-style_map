class Thing < ActiveRecord::Base
  include Paperclip::Glue

  has_attached_file :asset, styles: { small: "100x100>", tiny: "50x50>" }

  # We don't actually need the styles
  before_post_process { false }

  validates_attachment_content_type :asset, content_type: /\Aimage/
end
