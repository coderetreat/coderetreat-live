require 'map_image'
require 'fakefs/safe'

describe MapImage do
  context "when a cached version is not available" do
    it "stores an image from Google" do
      FakeFS.activate!

      MapImage.for("London")

      expect(File.exist?("public/map_images/London.png")).to be_truthy
    end

    it "serves the newly stored image"
  end
end
