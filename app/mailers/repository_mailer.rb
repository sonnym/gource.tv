class RepositoryMailer < ActionMailer::Base
  default from: 'notifications@gource.tv'

  def processing_start_email(repository)
    @repository = repository

    mail(to: 'gourcetv+processing@gmail.com',
         subject: 'Processing new video')
  end
end
