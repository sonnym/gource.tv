class SystemStatusController < ApplicationController
  def index
    @system_status = SystemStatus.get
    render(layout: false)
  end
end
