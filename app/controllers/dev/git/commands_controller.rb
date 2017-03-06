class Dev::Git::CommandsController < ApplicationController
  def status
    Dir.chdir(Rails.root) do
      @status = `git status`

      @current_branch = `git symbolic-ref --short HEAD`

      diff = `git diff`

      unless diff.blank?
        @diff_html = `diff2html --style=side --output=stdout`.
          gsub("<h1>Diff to HTML by <a href=\"https://github.com/rtfpessoa\">rtfpessoa</a></h1>", "").
          gsub("<a class=\"d2h-file-switch d2h-hide\">hide</a>", "").
          gsub("<a class=\"d2h-file-switch d2h-show\">show</a>", "")
      else
        @last_diff_html = `diff2html --style=line --output=stdout -- -M HEAD~1`.
          gsub("<h1>Diff to HTML by <a href=\"https://github.com/rtfpessoa\">rtfpessoa</a></h1>", "").
          gsub("<a class=\"d2h-file-switch d2h-hide\">hide</a>", "").
          gsub("<a class=\"d2h-file-switch d2h-show\">show</a>", "")

        @last_commit_message = `git log -1 --pretty=%B`
      end

      @branches = `git branch --sort=-committerdate`.split - ["*"]

      @log_html = `git log --graph --format=format:' %C(bold white)%s%C(reset)%n %C(cyan)#%h%C(reset)%n%C(auto)%d%C(reset)%n %C(bold blue)%an - %ar%C(reset)%n' --branches --remotes --tags --color | sh ansi2html.sh --bg=dark --palette=solarized`
    end
  end
end
