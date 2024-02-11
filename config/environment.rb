# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# Stop Rails default styleing for preventing clash between Rails default style and bootstrap
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  html_tag.html_safe
end