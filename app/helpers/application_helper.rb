module ApplicationHelper
  def btn_to text, link
    link_to text, link, class: :btn
  end
end
