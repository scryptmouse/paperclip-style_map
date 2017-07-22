require "dux"
require "active_support/hash_with_indifferent_access"
require "active_support/core_ext/module/delegation"
require "paperclip"

require "paperclip/style_map/version"
require "paperclip/style_map/map"
require "paperclip/style_map/has_style_map"

module Paperclip
  module StyleMap
  end
end

Paperclip::Attachment.prepend Paperclip::StyleMap::HasStyleMap
