module ApplicationHelper
  def avatar_navbar(element)
   if element.photo.attached?
    cl_image_tag(element.photo.key, crop: :fill, gravity: :face, class: "avatar dropdown-toggle", id: "navbarDropdown", data: { toggle: "dropdown" }, 'aria-haspopup': true, 'aria-expanded': false)
   else
     image_tag("avatar-fantasy.jpeg", class: "avatar dropdown-toggle", id: "navbarDropdown", data: { toggle: "dropdown" }, 'aria-haspopup': true, 'aria-expanded': false)
   end
end
end
