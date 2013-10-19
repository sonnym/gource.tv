class RepositoriesController < ApplicationController
  def index
    render(json: Repository.all.order('updated_at DESC'))
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
    render(json: Repository.find(params[:id]))
  end

  private

  def repository_params
    params.require(:repository).permit(:account, :name)
  end
end
