module ApplicationHelper
  def uniq_title(title = "")
    normal_title = "Diver SNS"
    if title.empty?
      normal_title
    else
      title + " - " + normal_title
    end
  end
end
