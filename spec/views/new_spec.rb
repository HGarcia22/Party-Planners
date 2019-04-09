require 'spec_helper'

feature 'user sees a form' do
  scenario 'user sees a form' do
    visit '/parties/new'
    expect(page).to have_selector('form')
  end
  scenario 'user sees form fields Name, Description, Location' do
    expect(page).to have_field('Name')
    expect(page).to have_field('Description')
    expect(page).to have_field('Location')
  end
  scenario 'user submits a new party' do
    visit '/parties/new'
    fill_in 'Name', with:'Taco Party'
    fill_in 'Description', with: 'Eat Tacos on Tuesdays, always'
    fill_in 'Location', with: 'My house'
    click_on 'Submit'
    expect(current_path).to eq('/parties/2')
    expect(page).to have_content('Taco Party')
  end
  scenario 'user fails to submit a Name' do
    visit '/parties/new'
    fill_in 'Description', with: 'Eat Tacos on Tuesdays, always'
    fill_in 'Location', with: 'My house'
    click_on 'Submit'
    expect(current_path).to eq('/parties/new')
    expect(page).to have_content('Please supply a name')
  end
  scenario 'user submits nothing' do
    visit '/parties/new'
    click_on 'Submit'
    expect(current_path).to eq('/parties')
    expect(page).to have_content('Please supply a name')
    expect(page).to have_content('Please supply a description')
    expect(page).to have_content('Please supply a location')
  end
end
