class ProcessQueue
  @queue = :gource_tv_queue

  def self.perform(repository)
    log = ProcessLog.new(repository: repository, started_at: DateTime.now)

    repository.clone_from_github

    GourceRunner.new(repository).run!
    VideoUploader.new(repository).upload!

    log.body = File.read(repository.log_path)
    log.save

    File.delete(repository.log_path)
    File.delete(repository.video_path)
  end
end
