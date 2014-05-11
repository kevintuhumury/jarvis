require "spec_helper"

describe PagesController do

  let!(:page)         { Fabricate :page }
  let!(:another_page) { Fabricate :page }

  describe "GET index" do
    let(:pages) { assigns(:pages) }

    before { get :index }

    it "assigns all pages" do
      expect(pages).to match_array [ page, another_page ]
    end
  end

  describe "GET edit" do
    let(:assigned)  { assigns(:page) }
    let(:edit_page) { get :edit, id: page.id }

    it "renders the edit template" do
      edit_page
      expect(controller).to render_template :edit
    end

    it "assigns the page" do
      edit_page
      expect(assigned).to be_a Page
    end
  end

  describe "PUT update" do
    let(:update_page) { put :update, id: page.id, page: page_params }

    context "when the page is valid" do
      let(:page_params) do
        { name: "Contact" }
      end

      it "updates the page" do
        expect(page.name).to eq "Page"

        update_page
        expect(page.reload.name).to eq "Contact"
      end

      it "redirects to the index page" do
        update_page
        expect(controller).to redirect_to pages_path
      end

      it "sets a flash notice" do
        update_page
        expect(flash.notice).to be_present
      end
    end

    context "when the page is invalid" do
      let(:page_params) do
        { name: nil }
      end

      it "does not update the page" do
        expect(page.name).to eq "Page"

        update_page
        expect(page.reload.name).to eq "Page"
      end

      it "renders the edite template" do
        update_page
        expect(controller).to render_template :edit
      end

      it "sets a flash alert" do
        update_page
        expect(flash.alert).to be_present
      end
    end
  end

end
