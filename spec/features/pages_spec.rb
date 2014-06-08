require "spec_helper"

feature "manage pages" do

  background do
    Fabricate :admin
    visit root_path

    within "form" do
      fill_in "E-mail", with: "tony.stark@starkindustries.com"
      fill_in "Wachtwoord", with: "iamironman"
      click_button "Inloggen"
    end
  end

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
      expect(page).to have_selector "h3", text: "Beheer uw pagina's"

      within "table" do
        expect(page).not_to have_content "Er zijn nog geen pagina's aangemaakt."

        expect(page).to have_content "Page"
        expect(page).to have_link "Bewerken"
      end
    end

    scenario "creating a new page" do
      expect(page).to have_selector "h1", text: "Pagina's"
      expect(page).to have_selector "h3", text: "Beheer uw pagina's"

      expect(page).not_to have_content "About"

      click_link "Toevoegen"

      expect(page).to have_selector "h1", text: "Pagina"
      expect(page).to have_selector "h3", text: "Voeg nieuwe content toe"

      within "form" do
        select "Geen bovenliggende pagina"

        fill_in "Titel", with: "About"
        fill_in "Inhoud", with: "Nullam id dolor id nibh ultricies vehicula ut id elit."
        choose "Published"
        click_button "Opslaan"
      end

      expect(page).to have_content "Pagina is aangemaakt"
      expect(page).to have_content "About"
    end

    scenario "editing a page" do
      expect(page).to have_selector "h1", text: "Pagina"
      expect(page).to have_selector "h3", text: "Beheer uw pagina's"

      within "table" do
        expect(page).to have_content "Page"
        expect(page).to have_link "Bewerken"
        click_link "Bewerken"
      end

      expect(page).to have_selector "h1", text: "Pagina"
      expect(page).to have_selector "h3", text: "Bewerk uw content"

      within "form" do
        expect(page).to have_button "Opslaan"
        expect(page).to have_link "Annuleren"

        click_link "Annuleren"
      end

      within "table" do
        click_link "Bewerken"
      end

      expect(page).to have_selector "h1", text: "Pagina"
      expect(page).to have_selector "h3", text: "Bewerk uw content"

      within "form" do
        fill_in "Titel", with: "About"
        fill_in "Inhoud", with: "Nullam id dolor id nibh ultricies vehicula ut id elit."
        click_button "Opslaan"
      end

      expect(page).to have_content "Pagina is opgeslagen"
      expect(page).to have_content "About"

      expect(page).not_to have_content "Page"
    end

    scenario "deleting a page" do
      expect(page).to have_selector "h1", text: "Pagina's"

      within "table" do
        expect(page).to have_content "Page"
        expect(page).to have_link "Verwijderen"
        click_link "Verwijderen"
      end

      expect(page).to have_content "Pagina is verwijderd"

      within "table" do
        expect(page).not_to have_content "Page"
      end
    end
  end
end
