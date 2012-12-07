$LOAD_PATH.unshift(Rails.root)
$LOAD_PATH.unshift("#{Rails.root}/app/coderetreat_live")
require 'coderetreats'
def create_event(location)
  puts "Creating event at #{location}"
  Coderetreat.create location: location
end
namespace :gdcr do
  task :create_events => :environment do
    include Rails.application.routes.url_helpers

    file = File.open("#{Rails.root}/doc/gdcr_cities.txt")
    events = file.lines.map{|l| l.strip}.reject{|city| city.empty?}.map do |city|
      create_event(city)
    end
    file.close
    output = File.open("#{Rails.root}/doc/gdcr_cities_admin_urls.tab", "w+")
    events.each do |event|
      exp = "#{event.location}\t#{event.admin_token}\t#{edit_coderetreat_status_url(coderetreat_id: event.admin_token, host: "live.coderetreat.org")}\n"
      puts exp
      output << exp
    end
    output.close
  end
end
