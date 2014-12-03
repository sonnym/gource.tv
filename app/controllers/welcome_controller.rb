class WelcomeController < ApplicationController
  def index
    @domain = request.domain
  end
end
