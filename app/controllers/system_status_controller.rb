class SystemStatusController < ApplicationController
  def index
    render(json: SystemStatus.get)
  end
end
