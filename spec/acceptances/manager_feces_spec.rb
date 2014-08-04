# Feature: 'Manage feces'
#   As a specialist
#   I want to manage feces
#   So I can have the control of feces
feature 'Manage feces' do

  # Scenario: Add a new feces
  #   Given I am a logged specialist
  #   When I am on sighting page
  #   And I go to the link to add a new feces
  #   And I add a new fece
  #   Then a new fece is added
  scenario 'Add a new fece', js: true do
    create(:sighting)
    visit sightings_path
    click_on "0 feces"
    fill_in "Mass", with: "111"
    click_on "Valider"
    expect(page).to have_content("111")
    visit sightings_path
    expect(page).to have_content("1 fece")
  end

end
