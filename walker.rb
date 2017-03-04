require "rugged"

repo = Rugged::Repository.new(".")
walker = Rugged::Walker.new(repo)
walker.sorting(Rugged::SORT_TOPO)
walker.push(repo.head.target)
walker.each { |c| puts c.message }
