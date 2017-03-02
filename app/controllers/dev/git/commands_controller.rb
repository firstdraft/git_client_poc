class Dev::Git::CommandsController < ApplicationController
  def log
    Dir.chdir(Rails.root) do
      @status = `git status`

      @branches = `git branch`

      @log = `git log --oneline --decorate --graph --all -30`
    end
  end
end
