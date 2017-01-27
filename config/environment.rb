# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Paperclip custom path
Paperclip::Attachment.default_options[:path] = "#{Rails.root}/spec/test_files/:class/:id_partition/:style.:extension"
