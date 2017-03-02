class Dev::Git::BranchesController < ApplicationController
  def create
    Dir.chdir(Rails.root) do
      @status = `git status`
    end
  end
end
