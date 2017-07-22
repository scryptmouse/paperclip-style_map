require "active_record"
require "paperclip"

ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: ":memory:"

require_relative './db/paperclip'
load File.join(__dir__, 'db', 'schema.rb')
require_relative './db/models'
