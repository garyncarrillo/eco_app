require "application_system_test_case"

class ScheduledAgendasTest < ApplicationSystemTestCase
  setup do
    @scheduled_agenda = scheduled_agendas(:one)
  end

  test "visiting the index" do
    visit scheduled_agendas_url
    assert_selector "h1", text: "Scheduled Agendas"
  end

  test "creating a Scheduled agenda" do
    visit scheduled_agendas_url
    click_on "New Scheduled Agenda"

    fill_in "Address", with: @scheduled_agenda.address
    fill_in "Contact email", with: @scheduled_agenda.contact_email
    fill_in "Contact name", with: @scheduled_agenda.contact_name
    fill_in "Contact phone number", with: @scheduled_agenda.contact_phone_number
    fill_in "Scheduled date", with: @scheduled_agenda.scheduled_date
    click_on "Create Scheduled agenda"

    assert_text "Scheduled agenda was successfully created"
    click_on "Back"
  end

  test "updating a Scheduled agenda" do
    visit scheduled_agendas_url
    click_on "Edit", match: :first

    fill_in "Address", with: @scheduled_agenda.address
    fill_in "Contact email", with: @scheduled_agenda.contact_email
    fill_in "Contact name", with: @scheduled_agenda.contact_name
    fill_in "Contact phone number", with: @scheduled_agenda.contact_phone_number
    fill_in "Scheduled date", with: @scheduled_agenda.scheduled_date
    click_on "Update Scheduled agenda"

    assert_text "Scheduled agenda was successfully updated"
    click_on "Back"
  end

  test "destroying a Scheduled agenda" do
    visit scheduled_agendas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Scheduled agenda was successfully destroyed"
  end
end
