# Feature: 'Manage Animal Sightings'
#   As a specialist
#   I want to manage the relations between animals and sightings
#   So I can have the control of the management page
feature 'Manage Animal Sightings' do

  # Scenario: Create a new animal sighting
  #   Given I am a logged specialist
  #   When I am a on the creation page
  #   And I fill the form with valid information
  #   Then it create a new animal
  scenario 'Create a new animal', js: true do
    create(:sighting)
    animal = create(:animal)
    visit sightings_path
    click_on "0 animals"
    select animal.name, from: 'Animal'
    click_on "Valider"
    expect(page).to have_content(animal.name)
    visit sightings_path
    expect(page).to have_content("1 animal")
  end
end
