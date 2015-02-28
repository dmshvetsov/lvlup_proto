module ApplicationHelper
  def page_title
    @page_title || "#{t(params['controller'])} #{t(params['action'])}"
  end
end
