module ApplicationHelper
  def title
    base_title = "Charles is Learning Rails"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
    
end
