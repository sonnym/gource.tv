class VideoUploader
  YOUTUBE_USERNAME = 'GourceTV'
  YOUTUBE_PASSWORD = 'oiJOS9f238!nxjni'
  YOUTUBE_KEY = 'AIzaSyC_nu1u3daHzQPimuQ4c3-JHTtuzDv3Ymk'

  def initialize(repository)
    @repository = repository
  end

  def upload!
    client = YouTubeIt::Client.new(dev_key: YOUTUBE_KEY,
                                   username: YOUTUBE_USERNAME,
                                   password: YOUTUBE_PASSWORD)
    client.video_upload(File.open(@repository.video_path), settings)
  end

  private

  def settings
    { title: "#{@repository.account} - #{@repository.name}",
      description: "Visualization of #{@repository.web_url}",
      keywords: [:gource, @repository.account, @repository.name] }
  end
end
