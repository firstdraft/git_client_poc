class Dev::Git::BranchesController < ApplicationController
  def create
    Dir.chdir(Rails.root) do
      if params[:commit_hash].present?
        `git checkout #{params[:commit_hash].strip.reverse.chomp("#").reverse}`
        `git checkout -b #{params[:name].parameterize}`
      else
        `git checkout -b #{params[:name].parameterize}`
      end

      redirect_to dev_git_url, notice: "Created branch #{params[:name]}."
    end
  end

  def show
    Dir.chdir(Rails.root) do
      `git checkout #{params[:name].parameterize}`
    end

    redirect_to dev_git_url, notice: "Switched to branch #{params[:name]}."
  end

  def destroy
    Dir.chdir(Rails.root) do
      `git branch -D #{params[:name].parameterize}`
    end

    redirect_to dev_git_url, notice: "Switched to branch #{params[:name]}."
  end
end
