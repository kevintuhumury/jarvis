module ApplicationHelper

  def link_to_nav(name, path, icon, count = nil, html_options = nil)
    content_tag "li", menu_item_options(path) do
      link_to(path, html_options) do
        concat content_tag(:span, nil, class: "glyphicon glyphicon-#{icon}")
        concat " #{name}"
        concat content_tag(:span, count, class: "badge pull-right") if count
      end
    end
  end

  private

  def menu_item_options(path)
    if current_page?(path)
      { class: "active" }
    else
      {}
    end
  end

end
