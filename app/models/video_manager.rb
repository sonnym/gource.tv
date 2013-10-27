class VideoManager
  def initialize(repository)
    @repository = repository
  end

  def upload!
    client.video_upload(File.open(@repository.video_path), settings)
  end

  def processing?
    begin
      remote_video = client.video_by(@repository.youtube_id)
      remote_video.present? && remote_video.state.present? && remote_video.state[:name] == 'processing'
    rescue
      true
    end
  end

  private

  def client
    @client ||= YouTubeIt::Client.new(dev_key: ENV['YOUTUBE_KEY'],
                                      username: ENV['YOUTUBE_USERNAME'],
                                      password: ENV['YOUTUBE_PASSWORD'])
  end

  def settings
    { title: "#{@repository.account} - #{@repository.name}",
      description: "Visualization of #{@repository.web_url}",
      keywords: [:gource, @repository.account, @repository.name] }
  end
end
