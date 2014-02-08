class SystemStatusController < ApplicationController
  def index
    render(json: { core: SystemStatus.get, resque: resque_info })
  end

  private

  def resque_info
    begin
      Resque.info
    rescue
      { offline: true }
    end
  end
end
