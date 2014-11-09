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
    if @response.code == 200
      location_uri
    else
      default_image_uri
    end
  end

  protected
  def fetch_image_unless_cached
    @response = HTTParty.get(request_url)
    if @response.code == 200
      FileUtils.mkdir_p(directory_root)
      File.write(cache_path, @response.body)
    end
  end

  def directory_root
    "public/map_images"
  end

  def uri_root
    "/map_images"
  end

  def cache_path
    File.expand_path("#{@location}.png", directory_root)
  end

  def location_uri
    File.expand_path("#{@location}.png", uri_root)
  end

  def default_image_uri
    File.expand_path("default.png", uri_root)
  end

  def request_url
    "https://maps.googleapis.com/maps/api/staticmap?#{request_parameter_string}"
  end

  def request_parameter_string
    request_parameters.join("&")
  end

  def request_parameters
    [
      "markers=#{@location}",
      "size=100x100",
      "style=feature:all%7Celement:labels%7Cvisibility:off",
      "zoom=1",
    ]
  end
end
