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

  def display_current_method(width)
    # cadre de 50 caracteres de large
    length = controller_name.length + action_name.length + 5
    side = "=" * ((width-length)/2)
    string = "#{side}#{" #{controller_name.upcase} - #{action_name.upcase} "}#{side}"
    string.length < 50 ? string + "=" : string
  end

end
