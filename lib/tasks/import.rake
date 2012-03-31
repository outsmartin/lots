require 'lots/grabber'
namespace :lots do
  desc "import the Raid data from the wiki"
  task :import => :environment do
    data = Raid.fetch
    Raid.import data
    puts "done importing"
  end

end
