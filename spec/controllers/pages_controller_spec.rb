require "spec_helper"

describe PagesController do

  let!(:page_1) { Fabricate :page }
  let!(:page_2) { Fabricate :page }

  describe "GET index" do
    let(:pages) { assigns(:pages) }

    before { get :index }

    it "assigns all pages" do
      expect(pages).to match_array [ page_1, page_2 ]
    end
  end

end
