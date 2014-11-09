require 'spec_helper'

describe MapImagesController, type: :controller do
  describe "GET /:location" do
    let(:map_imager) { double }

    before do
      stub_const("MapImage", map_imager)
    end

    it "serves the file specified by MapImage" do
      FakeFS.activate!
      FileUtils.mkdir_p "public/map_images"

      path = "public/map_images/London.png"
      File.write(path, "image_contents")
      map_imager.stub(:for => path)

      get :show, location: "London"
      response.should eq 200
      response.body should eq "image_contents"

      FakeFS.deactivate!
    end

    context "some coderetreats running today" do
      it "renders running" do
        coderetreats.stub(:empty? => false)

        get :London
        response.should have_rendered("running")
      end
    end

    context "no coderetreats running today" do
      it "renders running_no_coderetreats" do
        coderetreats.stub(:empty? => true)

        get :London
        response.should have_rendered("none_running")
      end
    end
  end
end
