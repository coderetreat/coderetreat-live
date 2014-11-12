require 'spec_helper'

describe MapImagesController, type: :controller do
  describe "GET /:location" do
    let(:map_imager) { double }

    before do
      stub_const("MapImage", map_imager)
    end

    it "redirects the user to the file specified by MapImage" do
      FileUtils.mkdir_p "public/map_images"

      map_imager.stub(:for => "/map_images/London.png")

      get :show, location: "London"
      expect(response).to redirect_to("/map_images/London.png")
    end
  end
end
