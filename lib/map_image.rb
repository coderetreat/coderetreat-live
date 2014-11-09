require 'httparty'

class MapImage
  def self.for(location)
    new(location).image_path
  end

  def initialize(location)
    @location = location
    fetch_image_unless_cached
  end

  def image_path
    "/map_images/#{@location}.png"
  end

  protected
  def fetch_image_unless_cached
    response = HTTParty.get('https://maps.googleapis.com')
    if response.code == 200
      FileUtils.mkdir_p(images_path)
      File.write("#{images_path}/London.png", response.body)
    end
  end

  def images_path
    "public/map_images"
  end
end
