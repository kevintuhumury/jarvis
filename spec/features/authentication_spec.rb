require "rails_helper"

feature "authentication" do

  background { Fabricate :admin }

  context "when the admin isn't signed in" do
    scenario "signing in" do
      visit pages_path

      expect(page.current_path).to eq admin_session_path

      expect(page).not_to have_content "Pagina's"
      expect(page).not_to have_content "Toevoegen"
      expect(page).not_to have_content "uitloggen"

      within ".signin" do
        expect(page).to have_content "Je dient in te loggen of je in te schrijven."
        expect(page).to have_content "Log in om uw content te beheren."

        within "form" do
          fill_in "E-mail", with: "tony.stark@starkindustries.com"
          fill_in "Wachtwoord", with: "iamironman"
          click_button "Inloggen"
        end
      end

      expect(page).to have_content "Pagina's"
      expect(page).to have_content "Toevoegen"
      expect(page).to have_content "uitloggen"

      expect(page.current_path).to eq pages_path

      expect(page).to have_content "Je bent succesvol ingelogd."
    end
  end

  context "when the admin is signed in" do
    background do
      visit root_path

      within "form" do
        fill_in "E-mail", with: "tony.stark@starkindustries.com"
        fill_in "Wachtwoord", with: "iamironman"
        click_button "Inloggen"
      end
    end

    scenario "signing out" do
      expect(page).to have_content "Pagina's"
      expect(page).to have_content "Toevoegen"
      expect(page).to have_content "uitloggen"

      expect(page.current_path).to eq root_path

      click_link "uitloggen"

      expect(page).not_to have_content "Pagina's"
      expect(page).not_to have_content "Toevoegen"
      expect(page).not_to have_content "uitloggen"

      expect(page.current_path).to eq admin_session_path

      expect(page).to have_content "Je dient in te loggen of je in te schrijven."
      expect(page).to have_content "Log in om uw content te beheren."
    end
  end

end
