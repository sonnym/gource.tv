class Repository < ActiveRecord::Base
  validate :name, :account, presence: true, format: { with: /\A[\w-]+\z/ }
  validate :name, uniqueness: true, scope: :account

  def url
    "git://github.com/#{account}/#{name}.git"
  end

  def web_url
    "https://github.com/#{account}/#{name}.git"
  end

  def path
    File.join(REPOSITORY_DIRECTORY, account, name)
  end

  def clone_from_github
    Rugged::Repository.clone_at(url, path)
  end

  def fs_name
    "#{@repository.account}-#{@repository.name}"
  end

  def video_path
    File.join(REPOSITORY_DIRECTORY, "#{fs_name}.mp4")
  end

  def log_path
    File.join(REPOSITORY_DIRECTORY, "#{fs_name}.log")
  end
end
