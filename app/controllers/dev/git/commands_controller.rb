class Dev::Git::CommandsController < ApplicationController
  def status
    Dir.chdir(Rails.root) do

      @current_branch = `git symbolic-ref --short HEAD`

      diff = `git diff`

      unless diff.blank?
        @diff_html = `diff2html --style=side --output=stdout`.
          gsub("<h1>Diff to HTML by <a href=\"https://github.com/rtfpessoa\">rtfpessoa</a></h1>", "").
          gsub("<a class=\"d2h-file-switch d2h-hide\">hide</a>", "").
          gsub("<a class=\"d2h-file-switch d2h-show\">show</a>", "")
      else
        @status = `git status`

        @latest_diff_html = `diff2html --style=line --output=stdout -- -M HEAD~1`.
          gsub("<h1>Diff to HTML by <a href=\"https://github.com/rtfpessoa\">rtfpessoa</a></h1>", "").
          gsub("<a class=\"d2h-file-switch d2h-hide\">hide</a>", "").
          gsub("<a class=\"d2h-file-switch d2h-show\">show</a>", "")

        @latest_commit_message = `git log -1 --pretty=%B`
      end

      @branches = `git branch --sort=-committerdate`.split - ["*"]

      @log = `git log --branches --remotes --tags --graph --oneline --decorate --pretty=format:"#%h %d %s - %cr"`
    end
  end
end
