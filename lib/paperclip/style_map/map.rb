module Paperclip
  module StyleMap
    class Map
      DEFAULT_EXPIRATION = 3600

      attr_reader :model
      attr_reader :attachment
      attr_reader :attachment_name
      attr_reader :style_names

      # @param [ActiveRecord::Base] model
      # @param [Paperclip::Attachment] attachment
      def initialize(model:, attachment:)
        @model = model
        @attachment = attachment

        @attachment_name = attachment.name

        @style_names = Dux.enum @attachment.default_style, *@attachment.styles.keys
      end

      # @param [String, Symbol] style_name
      # @param [ActiveSupport::Duration, Integer] expiration
      # @return [String, nil]
      def fetch(style_name, expiration: DEFAULT_EXPIRATION)
        return nil if blank? || !valid_style?(style_name)

        @attachment.expiring_url(expiration, style_name)
      end

      alias_method :[], :fetch

      def blank?
        !@attachment.exists? || processing?
      end

      def processing?
        @attachment.respond_to?(:processing?) && @attachment.processing?
      end

      def inspect
        inspected_styles = @style_names.map { |n| n.to_sym.inspect }.inspect

        "#<#{self.class.name} @model=#{@model.model_name} @attachment=#{@attachment_name} @style_names=#{inspected_styles}>"
      end

      # @param [String, Symbol] name
      def valid_style?(name)
        @style_names.include? name
      end

      def to_h
        @style_names.each_with_object({}.with_indifferent_access) do |style_name, urls|
          urls[style_name.to_s] = self[style_name]
        end
      end
    end
  end
end
