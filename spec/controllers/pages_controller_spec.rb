require "spec_helper"

describe PagesController do

  before { sign_in Fabricate :admin }

  let!(:page)         { Fabricate :page }
  let!(:another_page) { Fabricate :page }

  describe "GET index" do
    let(:pages) { assigns(:pages) }

    before { get :index }

    it "assigns all pages" do
      expect(pages).to match_array [ page, another_page ]
    end
  end

  describe "GET new" do
    let(:assigned) { assigns(:page) }

    before { get :new }

    it "renders the new template" do
      expect(controller).to render_template :new
    end

    it "assigns the page" do
      expect(assigned).to be_a Page
    end
  end

  describe "POST create" do
    let(:create_page) { post :create, page: page_params }

    context "when the page is valid" do
      let(:page_params) do
        { title: "Another Title", body: "Cras justo odio, dapibus ac facilisis in, egestas eget quam.", state: "published", menu_title: "Menu Title", forward_url: "/forward_url" }
      end

      it "creates a new page" do
        expect { create_page }.to change { Page.count }.from(2).to 3
      end

      it "redirects to the index page" do
        create_page
        expect(controller).to redirect_to pages_path
      end

      it "sets a flash notice" do
        create_page
        expect(flash.notice).to be_present
      end
    end

    context "when the page is invalid" do
      let(:page_params) do
        { title: nil }
      end

      it "does not create a new page" do
        expect { create_page }.not_to change { Page.count }.from(2).to 3
      end

      it "renders the new template" do
        create_page
        expect(controller).to render_template :new
      end

      it "sets a flash alert" do
        create_page
        expect(flash.alert).to be_present
      end
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
        { title: "Contact" }
      end

      it "updates the page" do
        expect(page.title).to eq "Page"

        update_page
        expect(page.reload.title).to eq "Contact"
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
        { title: nil }
      end

      it "does not update the page" do
        expect(page.title).to eq "Page"

        update_page
        expect(page.reload.title).to eq "Page"
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

  describe "PUT destroy" do
    let(:destroy_page) { put :destroy, id: page.id }

    context "when the page is destroyed" do
      it "destroys the page" do
        expect { destroy_page }.to change { Page.count }.from(2).to 1
      end

      it "sets a flash notice" do
        destroy_page
        expect(flash.notice).to be_present
      end
    end

    context "when the page can not be destroyed" do
      before { allow_any_instance_of(Page).to receive(:destroy).and_return false }

      it "does not destroy the page" do
        expect { destroy_page }.not_to change { Page.count }
      end

      it "sets a flash alert" do
        destroy_page
        expect(flash.alert).to be_present
      end
    end

    it "redirects to the index view" do
      destroy_page
      expect(controller).to redirect_to pages_path
    end
  end

end
