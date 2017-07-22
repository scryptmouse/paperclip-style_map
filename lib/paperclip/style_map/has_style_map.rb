module Paperclip
  module StyleMap
    module HasStyleMap
      # @!attribute [r] style_map
      # @return [Paperclip::StyleMap::Map]
      def style_map
        @style_map ||= Paperclip::StyleMap::Map.new model: instance, attachment: self
      end
    end
  end
end
