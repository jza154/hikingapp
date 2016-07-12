module UsersHelper
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    default_url = "#{root_url}images/paw.png"
    image_tag(gravatar_url, alt: user.email, class: "gravatar") # may change to username once it's added
  end
  
  def gravatar_for_current(user)
    gravatar_id = Digest::MD5::hexdigest(@user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    default_url = "#{root_url}assets/paw.png"
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=48&d=#{CGI.escape(default_url)}"
  end
end
