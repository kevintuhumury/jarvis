require "spec_helper"

feature "manage pages" do

  background { visit root_path }

  context "when there are no pages" do
    scenario "viewing the index page" do
      expect(page).to have_selector "h1", text: "Pagina's"

      within "table" do
        expect(page).to have_content "Er zijn nog geen pagina's aangemaakt."
      end
    end
  end

  context "when there are pages" do
    background do
      Fabricate :page
      click_link "Pagina's"
    end

    scenario "viewing the index page" do
      expect(page).to have_selector "h1", text: "Pagina's"

      within "table" do
        expect(page).not_to have_content "Er zijn nog geen pagina's aangemaakt."

        expect(page).to have_content "Page"
        expect(page).to have_link "Bewerken"
      end
    end

    scenario "editing a page" do
      expect(page).to have_selector "h1", text: "Pagina's"

      within "table" do
        expect(page).to have_content "Page"
        expect(page).to have_link "Bewerken"
        click_link "Bewerken"
      end

      within "form" do
        expect(page).to have_button "Opslaan"
        expect(page).to have_link "Annuleren"

        click_link "Annuleren"
      end

      within "table" do
        click_link "Bewerken"
      end

      within "form" do
        fill_in "Titel", with: "About"
        fill_in "Inhoud", with: "Nullam id dolor id nibh ultricies vehicula ut id elit."
        click_button "Opslaan"
      end

      expect(page).to have_content "Pagina is opgeslagen"
      expect(page).to have_content "About"

      expect(page).not_to have_content "Page"
    end
  end
end
