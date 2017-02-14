feature "Interactive Map" do
  before do
    visit "/"
  end

  scenario "map displays on page" do
    expect(page).to have_selector('#map')
  end

  scenario "map shows 170+ countries" do
    expect(page).to have_selector('.jvectormap-element', minimum: 170)
  end

  scenario "map has 5 valid countries" do
    expect(page).to have_selector('.valid', count: 5)
  end
end
