module ApplicationHelper

  include Pagy::Frontend

  def avatar_for(user, options = { size: '80x80' })
    email_address = user.email.downcase
    hash = Digest::MD5.hexdigest(email_address)
    size = options[:size]
    robot_url = "https://robohash.org/#{hash}.png/bgset_any?size=#{size}"
    image_tag(robot_url, alt: user.username, class: "rounded-3 shadow mx-auto d-block")
  end


end
