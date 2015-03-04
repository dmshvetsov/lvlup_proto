module ApplicationHelper
  def page_title
    @page_title || t(params['controller'] + params['action'])
  end

  def shvetsovdm_profile
    shvetsovdm = Profile.find_by(nickname: 'Dmitry Shvetsov')
    profile_path shvetsovdm
  end
end
