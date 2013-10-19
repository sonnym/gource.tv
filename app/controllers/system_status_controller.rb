class SystemStatusController < ApplicationController
  def index
    render(json: { core: SystemStatus.get, resque: Resque.info })
  end
end
