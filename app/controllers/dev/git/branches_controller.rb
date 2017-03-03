class Dev::Git::BranchesController < ApplicationController
  def create
    Dir.chdir(Rails.root) do
      @status = `git checkout -b #{params[:name].parameterize}`

      redirect_to dev_git_url, notice: "Created branch #{params[:name]}."
    end
  end

  def checkout
    Dir.chdir(Rails.root) do
      `git checkout #{params[:name]}`
    end

    redirect_to dev_git_url, notice: "Switched to branch #{params[:name]}."
  end
end
