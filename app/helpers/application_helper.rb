module ApplicationHelper

  def gravatar_for(user, size = 30, title = user.member_name)
    image_tag gravatar_image_url(user.email, size: size), title: title, class: 'img-circle img-responsive'
  end

end