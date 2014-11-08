module ApplicationHelper
  def google_map_image_for(city)
    "https://maps.googleapis.com/maps/api/staticmap?markers=#{city}&size=100x100&zoom=1" +
    "&style=feature:all|element:labels|visibility:off"
  end

  def galaxy_sponsors
    [
      Sponsor.new('Thoughtworks', 'http://www.thoughtworks.com/')
    ]
  end

  def globe_sponsors
    [
      Sponsor.new('Github', 'https://github.com'),
    ]
  end

  def continent_sponsors
    [
      Sponsor.new('DNSimple', 'https://www.dnsimple.com/'),
    ]
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
