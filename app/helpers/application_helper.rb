module ApplicationHelper
  def DTformat(dateandtime)
    dateandtime.strftime("%d-%m-%Y %H:%M")
  end

  def current(path)
    if current_page?(path)
      "current-page-item"
    end
  end

end