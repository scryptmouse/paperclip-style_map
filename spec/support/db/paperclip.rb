require "paperclip"
require "delayed_paperclip"

Paperclip.options[:log] = false

Paperclip.interpolates :test_attachment_path do |*|
  test_env_number = ENV['TEST_ENV_NUMBER'].to_i if ENV['PARALLEL_TEST_GROUPS']

  Bundler.root.join("tmp/attachments/#{test_env_number}").to_s
end

Paperclip::Attachment.default_options[:path] = ":test_attachment_path/:class/:attachment/:id_partition/:style/:filename"
