require 'spec_helper'

feature 'user sees name, description, and location' do
  scenario 'user sees a name' do
    visit '/parties/2'
    expect(page).to have_content('Taco Party')
  end
  scenario 'user sees a description' do
    visit '/parties/2'
    expect(page).to have_content('always')
  end
  scenario 'user sees a location' do
    visit '/parties/2'
    expect(page).to have_content('My house')
  end
  scenario 'user clicks back button' do
    visit '/parties/2'
    click_on 'Back'
    expect(current_path).to eq('/parties')
  end
end
