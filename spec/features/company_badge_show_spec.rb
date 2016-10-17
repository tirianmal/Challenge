require 'rails_helper'

feature 'company show badges' do
  scenario "company with no badges" do
    visit '/log_in/3'

    visit '/companies/2'

    expect(page).not_to have_content('Users earning this badge')

  end
  scenario "company with badges" do 
    visit '/log_in/3'
    
    visit '/companies/1'
    
    expect(page).to have_content('Users earning this badge')
    
    expect(page).to have_selector('div.badge', count:2)

    within("div#badge_Half-Way") do
      expect(page).to have_content("Half-Way")
      within("div.earned") do
        expect(page).to have_content("2")
      end
    end

    within("div#badge_All-Way") do
      expect(page).to have_content("All-Way")
      within("div.earned") do
        expect(page).to have_content("1")
      end
    end

  end

end
