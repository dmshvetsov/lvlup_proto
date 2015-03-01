module ApplicationHelper
  def page_title
    @page_title || t(params['controller'] + params['action'])
  end
end
