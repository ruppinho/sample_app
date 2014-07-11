module UsersHelper

  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user, options = {})
    size = options.fetch(:size, 50)
    gravatar_url = gravatar_url_for user, size: size
    image_tag(gravatar_url, alt: user.name, class: options.fetch(:class, 'gravatar'))
  end

  def gravatar_url_for(user, options = {})
    size = options.fetch(:size, nil)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    gravatar_url << "?s=#{size}" if size
    gravatar_url
  end
end
