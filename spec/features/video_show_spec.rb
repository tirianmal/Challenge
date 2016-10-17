require 'rails_helper'

feature 'video page has play link' do
  scenario "video that has been viewed" do
    visit '/log_in/1'

    visit '/videos/4'
    
    expect(page).to have_selector('a#play_video', :count => 1)
  end
  
  scenario "video that has not been viewed" do
    visit '/log_in/3'

    visit '/videos/4'
    
    expect(page).to have_selector('a#play_video', :count => 1)
  end

  scenario "clicking Play changes watched to true" do
    visit '/log_in/3'

    visit '/videos/4'

    expect(page).not_to have_content('true')
    
    click_link('Play')

    expect(page).to have_content('true')

  end

end

