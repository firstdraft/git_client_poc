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


      @log_html = `git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold white)%s%C(reset) %C(dim white)(%ar)%C(reset)%n%C(auto)%d%C(reset)%n''          %C(white)%an%C(reset) %C(dim white)- %aD%C(reset)' --branches --remotes --tags --color | sh ansi2html.sh --bg=dark`
      # @log_html = `git log --graph --abbrev-commit --decorate  --branches --remotes --tags | sh ansi2html.sh --bg=dark`
      # @log_html = `git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --branches --remotes --tags --color | sh ansi2html.sh --bg=dark`
      # @log_html = `git log --graph --abbrev-commit --decorate --format=format:'%C(auto)%h - %s (%ar)%d%n''          %an - %aD' --branches --remotes --tags | sh ansi2html.sh --bg=dark`

      # @log_html = `git log --graph --branches --remotes --tags --color | sh ansi2html.sh --bg=dark`
    end
  end
end
