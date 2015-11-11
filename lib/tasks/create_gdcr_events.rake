$LOAD_PATH.unshift(Rails.root)
$LOAD_PATH.unshift("#{Rails.root}/app/coderetreat_live")
require 'coderetreats'
def create_event(location, start_datetime)
  puts "Creating event at #{location}"
  Coderetreat.create(
    location: location,
    status: CoderetreatLive::Coderetreats::StateMachine.default_state_string,
    date: start_datetime
  )
end
namespace :gdcr do
  desc "Creates Coderetreat Events"
  task :create_events => :environment do
    include Rails.application.routes.url_helpers

    events = []
    file = "#{Rails.root}/doc/gdcr_cities.tsv"
    CSV.foreach(file, :headers => true, :header_converters => :symbol, :converters => :all, :col_sep => "\t") do |event|
      if (event[:location] && not(event[:location].empty?) && event[:location] != ",")
        events << create_event(event[:location], DateTime::parse(event[:start_time]))
      end
    end

    output = File.open("#{Rails.root}/doc/gdcr_cities_admin_urls.tab", "w+")
    events.each do |event|
      exp = "#{event.location}\t#{event.admin_token}\t#{edit_coderetreat_status_url(coderetreat_id: event.admin_token, host: "live.coderetreat.org")}\n"
      puts exp
      output << exp
    end
    output.close
  end
end
