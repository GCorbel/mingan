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

  # Scenario: Create a new sighting
  #   Given I am a logged specialist
  #   When I am a on the creation page
  #   And I fill the form with valid information
  #   Then it create a new sighting
  scenario 'Create a new sighting', js: true do
    visit sightings_path
    click_on "New"
    fill_in_form_with_valid_information
    expect(page).to have_content("50.01")
  end

  # Scenario: Create two new sightings
  #   Given I am a logged specialist
  #   When I am a on the creation page
  #   And I fill the form with valid information
  #   And I reopen the form to create a sighting
  #   Then it keep the information
  scenario 'Create two sightings', js: true do
    visit sightings_path
    click_on "New"
    fill_in_form_with_valid_information

    click_on "New"
    within("#new_sighting") do
      expect(find_field("Longitude").value).to eq "50.01"
    end
  end

  def fill_in_form_with_valid_information
    within("#new_sighting") do
      fill_in "Longitude", with: "50.01"
      click_on 'Valider'
    end
  end

end
