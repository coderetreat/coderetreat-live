module ApplicationHelper
  def google_map_image_for(city)
    "/maps/#{CGI.escape city}"
  end

  def all_sponsors
    {
      galaxy: [ Sponsor.new('Thoughtworks', 'http://www.thoughtworks.com/') ],
      globe: [ Sponsor.new('Github', 'https://github.com') ],
      continent: [ Sponsor.new('DNSimple', 'https://www.dnsimple.com/') ],
    }
  end

  class Sponsor
    def initialize name, url
      @name, @url = name, url
    end

    def logo_path
      "http://globalday.coderetreat.org/images/sponsors/#{name.downcase}_logo.png"
    end

    attr_reader :name, :url
  end
end
