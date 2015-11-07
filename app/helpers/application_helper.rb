module ApplicationHelper
  def google_map_image_for(city)
    "/maps/#{CGI.escape city}"
  end

  def all_sponsors
    {
      continent: [
        Sponsor.new('8th Light', 'https://8thlight.com/'),
        Sponsor.new('Zopa', 'http://www.zopa.com/'),
      ],
      timezone: [
        Sponsor.new('ThoughtWorks', 'http://www.thoughtworks.com'),
      ]
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
