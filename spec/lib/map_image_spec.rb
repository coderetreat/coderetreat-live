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
    it "stores an image from Google" do
      stub_regular_response(body: "image_contents")

      MapImage.for("London")

      expect(File.read("public/map_images/London.png")).to eq "image_contents"
    end

    it "returns the URI path to the newly stored image" do
      stub_regular_response
      expect(File.exist?("public/map_images/London.png")).to be_falsey
      expect(MapImage.for("London")).to eq "/map_images/London.png"
    end

    context "when we hit the rate limit" do
      it "does not store the returned image" do
        stub_rate_limit_response

        MapImage.for("London")

        expect(File.exist?("public/map_images/London.png")).to be_falsey
      end
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
