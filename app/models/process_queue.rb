class ProcessQueue
  @queue = :gource_tv_queue

  def initialize(repository)
    @repository = repository
  end

  def process!
    with_log do
      with_repository do
        with_video do
          VideoUploader.new(@repository).upload!
        end
      end
    end
  end

  def self.perform(repository)
    self.new(repository).process!
  end

  private

  def with_log
    log = ProcessLog.new(repository: @repository, started_at: DateTime.now)

    yield

    log.body = File.read(@repository.log_path)
    log.save

    File.delete(@repository.log_path)
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
