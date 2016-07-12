module UsersHelper
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?d=https%3A%2F%2Fwww.gravatar.com%2Favatar%2Faf0aa7a8aa4f4cd528a0d663379c99ac"
    image_tag(gravatar_url, alt: user.email, class: "gravatar") # may change to username once it's added
  end
  
end
