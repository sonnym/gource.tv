class ProcessQueue
  @queue = :gource_tv_queue

  def initialize(repository)
    @repository = repository
  end

  def process!
    with_log do
      with_repository do
        with_video do
          response = VideoUploader.new(@repository).upload!
          @repository.update_attributes(youtube_id: response.unique_id, processing: false)
        end
      end
    end
  end

  def self.perform(repository_hash)
    self.new(Repository.find(repository_hash['id'])).process!
  end

  private

  def with_log
    log = ProcessLog.new(repository: @repository, started_at: DateTime.now)

    yield

    log.save
  end

  def with_repository
    @repository.clone_from_github

    yield

    @repository.remove_from_filesystem
  end

  def with_video
    GourceRunner.new(@repository).run!

    yield

    File.delete(@repository.video_path)
  end
end
