# Feature: 'Manage Signtings'
#   As a specialist
#   I want to manage an sightings page
#   So I can have the control of my sightings
feature 'Manage Sittings' do

  # Scenario: View the list of sightings
  #   Given I am a logged specialist
  #   When I am on the index page
  #   Then I can view the list of sightings
  scenario 'View the list of sightings' do
    sighting = create(:sighting)
    visit sightings_path
    expect(page).to have_content(sighting.date)
  end

  # Scenario: Create a new sightings
  #   Given I am a logged specialist
  #   When I am a on the creation page
  #   And I fill the form with valid informatiosn
  #   Then I create a new sighting
  scenario 'Create a new sighting' do
    visit new_sighting_path
    fill_in_form_with_valid_information
    expect(page).to have_content('Votre observation a été enregisté')
  end

  def fill_in_form_with_valid_information
    click_on 'Valider'
  end

end