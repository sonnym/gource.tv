class WelcomeController < ApplicationController
  def index
    @domain = request.domain
    render(nothing: true, :layout => 'application')
  end
end
