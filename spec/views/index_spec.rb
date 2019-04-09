require 'spec_helper'

feature 'user sees a list of parties' do
  scenario 'user sees the name of each party' do
    visit '/parties'
    expect(page).to have_content('Hootenanny')
  end
  scenario 'user sees a link' do
    visit '/parties'
    expect(page).to have_selector('a')
  end
  scenario 'user visits root path' do
    visit '/'
    expect (current_path).to eq('/parties')
  end
  scenario 'user clicks on Hootenanny' do
    visit '/parties'
    click_on 'Hootenanny'
    expect(current_path).to eq('/parties/1')
  end
  scenario 'user clicks on link to go to make a new party' do
    visit '/parties'
    click_on 'Add New Party'
    expect(current_path).to eq('/parties/new')
  end
end
