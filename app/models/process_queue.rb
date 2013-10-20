class ProcessQueue
  @queue = :gource_tv_queue

  def initialize(repository)
    @repository = repository
    @retry = false
  end

  def process!
    with_log do
      with_repository do
        with_video do
          upload!(5)
        end
      end
    end

    Resque.enqueue(ProcessQueue, @repository) if @retry
  end

  def self.perform(repository_hash)
    self.new(Repository.find(repository_hash['id'])).process!
  end

  private

  def with_log
    log = ProcessLog.new(repository: @repository, started_at: DateTime.now)

    yield

    log.save unless @retry
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

  def upload!(retries)
    begin
      response = VideoManager.new(@repository).upload!
      @repository.update_attributes(youtube_id: response.unique_id, processing: false)
    rescue
      retries -= 1

      if retries > 0
        retry
      else
        @retry = true
      end
    end
  end
end
