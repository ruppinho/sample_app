module ApplicationHelper

  def base_title
    @base_title ||= "Ruby on Rails Tutorial Sample App"
  end

  # Returns the full title on a per-page basis.
  def full_title(page_title = nil)
    if page_title.nil? || page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def glyph(*names)
    content_tag :i, nil, class: names.map { |name| "icon-#{name.to_s.gsub('_', '-')}" }
  end

end
