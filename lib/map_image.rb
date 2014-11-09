class MapImage
  def self.for location
    FileUtils.mkdir_p("public/map_images")
    FileUtils.touch("public/map_images/London.png")
  end
end
