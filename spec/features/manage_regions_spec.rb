# Feature: 'Manage Signtings'
#   As a specialist
#   I want to manage regions
#   So I can have the control of my regions
feature 'Manage Region' do

  # Scenario: View the list of regions
  #   Given I am a logged specialist
  #   When I am on the regions path
  #   Then I can view the list of regions
  scenario 'View the list of regions', js: true do
    region = create(:region)
    visit regions_path
    expect(page).to have_content(region.name)
  end

  # Scenario: Create a new regions
  #   Given I am a logged specialist
  #   When I am a on the creation page
  #   And I fill the form with valid informatiosn
  #   Then I create a new region
  scenario 'Create a new region', js: true do
    visit regions_path
    click_on "New"
    fill_in_form_with_valid_information
    expect(page).to have_content("50.01")
  end

end
