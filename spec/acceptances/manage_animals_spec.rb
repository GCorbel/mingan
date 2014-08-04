# Feature: 'Manage Animals'
#   As a specialist
#   I want to manage an animals page
#   So I can have the control of my animals
feature 'Manage Animals' do

  # Scenario: View the list of animals
  #   Given I am a logged specialist
  #   When I am on the index page
  #   Then I can view the list of animals
  scenario 'View the list of animals' do
    animal = create(:animal)
    visit animals_path
    expect(page).to have_content(animal.name)
  end
end
