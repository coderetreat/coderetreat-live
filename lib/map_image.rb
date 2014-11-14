require 'httparty'
require 'digest/md5'

class MapImage
  def self.for(location)
    new(location).image_path
  end

  def initialize(location)
    @location = CGI.escape location
    fetch_image_unless_cached
  end

  def image_path
    if File.exist? cache_path
      map_image_path
    else
      default_image_path
    end
  end

  protected
  def fetch_image_unless_cached
    unless File.exist? cache_path
      fetch_image
    end
  end

  def fetch_image
    response = HTTParty.get(request_url)

    if response.code == 200
      write_image response.body
    end
  end

  def write_image contents
    FileUtils.mkdir_p(cache_root)
    File.open(cache_path, "wb") do |f|
      f.write(contents)
    end
  end

  def public_root
    "public"
  end

  def image_root
    "/map_images"
  end

  def cache_root
    File.join(public_root, image_root)
  end

  def map_image_path
    locationHash = Digest::MD5.hexdigest @location
    File.join(image_root, "#{locationHash}.png")
  end

  def cache_path
    File.join(public_root, map_image_path)
  end

  def default_image_path
    File.join(image_root, "default.png")
  end

  def request_url
    "https://maps.googleapis.com/maps/api/staticmap?#{request_parameter_string}"
  end

  def request_parameter_string
    request_parameters.join("&")
  end

  def request_parameters
    addApiKeyIfAvailable([
      "markers=#{@location}",
      "size=100x100",
      "style=feature:all%7Celement:labels%7Cvisibility:off",
      "zoom=1",
    ])
  end

  def addApiKeyIfAvailable request_parameters
    if ENV['STATIC_MAPS_API_KEY']
      request_parameters.push("key=#{ENV['STATIC_MAPS_API_KEY']}")
    end
    request_parameters
  end
end
