class WelcomeController < ApplicationController
  def index
    render(nothing: true, :layout => 'application')
  end
end
