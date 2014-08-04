# Feature: 'Manage Sightings'
#   As a specialist
#   I want to manage an sightings page
#   So I can have the control of my sightings
feature 'Manage Sightings' do

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
    create(:mode, name: 'Survey')
    visit sightings_path
    click_on "New"
    fill_in_form_with_valid_information
    expect(page).to have_content("Survey")
  end

  # Scenario: Create two new sightings
  #   Given I am a logged specialist
  #   When I am a on the creation page
  #   And I fill the form with valid information
  #   And I reopen the form to create a sighting
  #   Then it keep the information
  scenario 'Create two sightings', js: true do
    mode = create(:mode, name: 'Survey')
    visit sightings_path
    click_on "New"
    fill_in_form_with_valid_information

    click_on "New"
    within("#new_sighting") do
      expect(find_field("Mode").value).to eq mode.id.to_s
    end
  end

  def fill_in_form_with_valid_information
    within("#new_sighting") do
      select "Survey", from: "Mode"
      click_on 'Valider'
    end
  end

end
