class Dev::Git::CommandsController < ApplicationController
  def status
    Dir.chdir(Rails.root) do
      @status = `git status`
    end
  end
end
