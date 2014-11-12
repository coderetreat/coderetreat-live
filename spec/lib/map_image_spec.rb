require 'map_image'
require 'fakefs/safe'
require "webmock/rspec"
WebMock.disable_net_connect!(allow_localhost: true)

describe MapImage do
  before { FakeFS.activate! }
  after do
    FileUtils.rm_r("public") rescue nil
    FakeFS.deactivate!
  end

  context "when a cached version is not available" do
    it "requests the image from Google" do
      stub_regular_response

      MapImage.for("London")

      WebMock.should have_requested(
        :get,
        "https://maps.googleapis.com/maps/api/staticmap" +
        "?markers=London" +
        "&size=100x100" +
        "&zoom=1" +
        "&style=feature:all|element:labels|visibility:off"
      )
    end

    it "stores the image in the cache" do
      stub_regular_response(body: "image_contents")

      MapImage.for("London")

      expect(File.read("public/map_images/London.png")).to eq "image_contents"
    end

    it "returns the path to the newly stored image" do
      stub_regular_response
      expect(File.exist?("public/map_images/London.png")).to be_falsey
      expect(MapImage.for("London")).to eq "/map_images/London.png"
    end

    context "when the location contains non-URL-safe characters" do
      it "requests the image from Google" do
        stub_regular_response

        MapImage.for("Lübeck, Germany")

        WebMock.should have_requested(
          :get,
          "https://maps.googleapis.com/maps/api/staticmap" +
          "?markers=L%C3%BCbeck%2C+Germany" +
          "&size=100x100" +
          "&zoom=1" +
          "&style=feature:all|element:labels|visibility:off"
        )
      end
    end

    context "when we hit the rate limit" do
      it "does not store the returned image" do
        stub_rate_limit_response

        MapImage.for("London")

        expect(File.exist?("public/map_images/London.png")).to be_falsey
      end

      it "returns a default image path" do
        stub_rate_limit_response

        expect(MapImage.for("London")).to eq "/map_images/default.png"
      end
    end
  end

  context "when a cached version is available" do
    it "does not request the image from Google" do
      FileUtils.mkdir_p "public/map_images/"
      FileUtils.touch "public/map_images/London.png"

      MapImage.for("London")
    end
  end

  protected

  def stub_regular_response(body: "image_contents")
    stub_request(:get, /maps.googleapis.com/).
      to_return(status: 200, body: body)
  end

  def stub_rate_limit_response
    stub_request(:get, /maps.googleapis.com/).
      to_return(status: 403, body: "")
  end
end
