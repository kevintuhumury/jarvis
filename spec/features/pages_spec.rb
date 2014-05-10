require "spec_helper"

feature "manage pages" do

  background { visit root_path }

  context "when there are no pages" do
    scenario "viewing the index page" do
      expect(page).to have_selector "h1", text: "Content"

      within "table" do
        expect(page).to have_content "Er is nog geen content toegevoegd."
      end
    end
  end

  context "when there are pages" do
    background do
      Fabricate :page
      click_link "Content"
    end

    scenario "viewing the index page" do
      expect(page).to have_selector "h1", text: "Content"

      within "table" do
        expect(page).not_to have_content "Er is nog geen content toegevoegd."

        expect(page).to have_content "Page"
        expect(page).to have_link "Bewerken"
      end
    end
  end

end
