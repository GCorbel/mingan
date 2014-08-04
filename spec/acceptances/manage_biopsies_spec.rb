# Feature: 'Manage biopsies'
#   As a specialist
#   I want to manage biopsies
#   So I can have the control of biopsies
feature 'Manage biopsies' do

  # Scenario: Add a new biopsies
  #   Given I am a logged specialist
  #   When I am on sighting page
  #   And I go to the link to add a new biopsies
  #   And I add a new biopsy
  #   Then a new biopsy is added
  scenario 'Add a new biopsy', js: true do
    create(:sighting)
    visit sightings_path
    click_on "0 biopsies"
    fill_in "Tissue", with: "111"
    click_on "Valider"
    expect(page).to have_content("111")
    visit sightings_path
    expect(page).to have_content("1 biopsy")
  end

end
