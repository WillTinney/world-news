require 'capybara/rspec'
require 'test_helper'

feature 'Home Page' do
  before do
    visit "/"
  end

  it 'can be reached' do
    expect(page.status_code).to eq(200)
  end

  scenario 'clicking on valid country shows articles tab' do
    find("[data-code='AU']").click
    expect(page).to have_text('Australia')
  end

  scenario 'clicking on invalid country does not show articles tab' do
    find("[data-code='RU']").click
    expect(page).to have_text('Russia')
  end
end
