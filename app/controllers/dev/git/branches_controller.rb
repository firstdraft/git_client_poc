class Dev::Git::BranchesController < ApplicationController
  def create
    Dir.chdir(Rails.root) do
      @status = `git status`
    end
  end

  def checkout
    Dir.chdir(Rails.root) do
      `git checkout #{params[:name]}`
    end

    redirect_to dev_git_url, notice: "Switched to #{params[:name]}." 
  end
end
