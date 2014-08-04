# Feature: 'Manage Blows'
#   As a specialist
#   I want to manage blows
#   So I can have the control of blows
feature 'Manage Blows' do

  # Scenario: Add a new blows
  #   Given I am a logged specialist
  #   When I am on sighting page
  #   And I go to the link to add a new blows
  #   And I add a new blow
  #   Then a new blow is added
  scenario 'Add a new blow', js: true do
    create(:sighting)
    visit sightings_path
    click_on "0 blows"
    fill_in "Distance", with: "111"
    click_on "Valider"
    expect(page).to have_content("111")
    visit sightings_path
    expect(page).to have_content("1 blow")
  end

end
