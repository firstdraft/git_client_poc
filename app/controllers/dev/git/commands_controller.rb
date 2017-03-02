class Dev::Git::CommandsController < ApplicationController
  def log
    Dir.chdir(Rails.root) do
      @status = `git status`

      @diff = `diff2html --style=side --output=stdout`.
        gsub("<h1>Diff to HTML by <a href=\"https://github.com/rtfpessoa\">rtfpessoa</a></h1>", "").
        gsub("<a class=\"d2h-file-switch d2h-hide\">hide</a>", "").
        gsub("<a class=\"d2h-file-switch d2h-show\">show</a>", "")

      @branches = `git branch`

      @log = `git log --oneline --decorate --graph --all -30`
    end
  end
end
