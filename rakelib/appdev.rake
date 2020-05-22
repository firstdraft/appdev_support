desc "it does a thing"
task :work, [:option, :foo, :bar] do |task, args|
  puts "work", args
end

namespace :appdev do
  desc "TODO"
  task sync: :environment do
  end

end
