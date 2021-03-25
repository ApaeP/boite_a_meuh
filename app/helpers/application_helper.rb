module ApplicationHelper

  def theme_is_dark?
    return false unless cookies[:theme].present?
    cookies[:theme] == 'dark'
  end

  def current_theme
    return 'light' unless cookies[:theme].present?
    cookies[:theme]
  end

  def current_opposite_theme
    current_theme == 'light' ? 'dark' : 'light'
  end

end
