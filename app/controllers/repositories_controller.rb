class RepositoriesController < ApplicationController
  def index
    render(json: Repository.all.order('updated_at DESC').as_json(only: %i(id account name processing)))
  end

  def create
    repository = Repository.new(repository_params)

    if repository.save
      render(json: repository)
    else
      render(json: repository.errors, status: 422)
    end
  end

  def show
    respond_to do |format|
      format.json do
        render(json: Repository.find(params[:id]).as_json({
          methods: %i(web_url youtube_processing),
          only: %i(account name processing youtube_id)
        }))
      end

      format.html do
        render('welcome/index')
      end
    end
  end

  private

  def repository_params
    params.require(:repository).permit(:account, :name)
  end
end
