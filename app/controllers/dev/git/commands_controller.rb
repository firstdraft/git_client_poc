class Dev::Git::CommandsController < ApplicationController
  def log
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
      end

      @branches = `git branch`

      @log = `git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit`
    end
  end
end
