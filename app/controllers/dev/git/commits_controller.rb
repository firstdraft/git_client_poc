class Dev::Git::CommitsController < ApplicationController
  def create
    Dir.chdir(Rails.root) do
      `git add -A`
      `git commit -m "#{params[:title]}" -m "#{params[:description]}"`
    end

    redirect_to dev_git_url, notice: "Changed committed."
  end

  def stash
    Dir.chdir(Rails.root) do
      `git add -A`
      `git stash`
    end

    redirect_to dev_git_url, notice: "Changes discarded."
  end
end
