require "rugged"

repo = Rugged::Repository.new(".")

walker = Rugged::Walker.new(repo)
walker.sorting(Rugged::SORT_REVERSE)

repo.branches.each do |branch|
  puts "="*50
  puts branch.name
  walker.push(branch.target_id)
  walker.each { |c| puts c.message }
end
