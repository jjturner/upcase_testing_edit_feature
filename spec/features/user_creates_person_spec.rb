require "rails_helper"

feature "user creates person" do
  scenario "with valid data" do
    visit new_person_path
    fill_in "person_first_name", with: "Bob"
    click_button "Create Person"

    expect(page).to have_content("Person created")
  end
end

feature "user edits existing person" do
  scenario "with valid data" do
    person = Person.create(first_name: "Drusilla")
    visit edit_person_path(person)
    fill_in "person_first_name", with: "Helga"
    click_button "Update Person"

    expect(page).to have_content("Person updated.")
  end
end
