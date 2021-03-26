class ApplicationController < ActionController::Base
  before_action :set_theme

  def set_theme
    if params[:theme].present?
      theme = params[:theme].to_sym
      cookies[:theme] = {
        value: theme,
        expires: 20.year
      }
      redirect_to(request.referrer || root_path)
    end
  end

  def animal_talk
  [
    "Moo.",
    "Moo!",
    "Moo moo.",
    "Moo moo!",
    "Mooooo.",
    "Mooooo!",
    "Meow.",
    "Meow!",
    "Baa.",
    "Baa!",
    "Baa baa.",
    "Baa baa!",
    "Oink.",
    "Oink!",
    "Oink oink.",
    "Oink oink!"
  ]
  .sample
end

end
