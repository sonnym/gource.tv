class Repository < ActiveRecord::Base
  validates :name, :account, presence: true, format: { with: /\A[\w\-.]+\z/ }
  validates :name, uniqueness: { scope: :account }

  after_create :process_video, unless: :youtube_id?

  def url
    "git://github.com/#{account}/#{name}.git"
  end

  def web_url
    "https://github.com/#{account}/#{name}"
  end

  def path
    File.join(REPOSITORY_DIRECTORY, account, name)
  end

  def clone_from_github
    FileUtils.mkdir_p(REPOSITORY_DIRECTORY) unless Dir.exists?(REPOSITORY_DIRECTORY)
    Rugged::Repository.clone_at(url, path)
  end

  def remove_from_filesystem
    FileUtils.rm_r(path)
  end

  def fs_name
    "#{account}-#{name}"
  end

  def video_path
    File.join(REPOSITORY_DIRECTORY, "#{fs_name}.mp4")
  end

  def youtube_processing
    VideoManager.new(self).processing?
  end

  def process_video
    RepositoryMailer.processing_start_email(self).deliver

    Resque.enqueue(ProcessQueue, self)
  end
end
