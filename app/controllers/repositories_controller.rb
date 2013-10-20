class RepositoriesController < ApplicationController
  def index
    render(json: Repository.all.order('updated_at DESC').as_json(only: %i(id account name)))
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
    render(json: Repository.find(params[:id]).as_json({ methods: %i(web_url process_log youtube_processing),
                                                        only: %i(account name youtube_id) }))
  end

  private

  def repository_params
    params.require(:repository).permit(:account, :name)
  end
end
