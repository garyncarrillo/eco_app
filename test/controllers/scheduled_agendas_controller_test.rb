require "test_helper"

class ScheduledAgendasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scheduled_agenda = scheduled_agendas(:one)
  end

  test "should get index" do
    get scheduled_agendas_url
    assert_response :success
  end

  test "should get new" do
    get new_scheduled_agenda_url
    assert_response :success
  end

  test "should create scheduled_agenda" do
    assert_difference('ScheduledAgenda.count') do
      post scheduled_agendas_url, params: { scheduled_agenda: { address: @scheduled_agenda.address, contact_email: @scheduled_agenda.contact_email, contact_name: @scheduled_agenda.contact_name, contact_phone_number: @scheduled_agenda.contact_phone_number, scheduled_date: @scheduled_agenda.scheduled_date } }
    end

    assert_redirected_to scheduled_agenda_url(ScheduledAgenda.last)
  end

  test "should show scheduled_agenda" do
    get scheduled_agenda_url(@scheduled_agenda)
    assert_response :success
  end

  test "should get edit" do
    get edit_scheduled_agenda_url(@scheduled_agenda)
    assert_response :success
  end

  test "should update scheduled_agenda" do
    patch scheduled_agenda_url(@scheduled_agenda), params: { scheduled_agenda: { address: @scheduled_agenda.address, contact_email: @scheduled_agenda.contact_email, contact_name: @scheduled_agenda.contact_name, contact_phone_number: @scheduled_agenda.contact_phone_number, scheduled_date: @scheduled_agenda.scheduled_date } }
    assert_redirected_to scheduled_agenda_url(@scheduled_agenda)
  end

  test "should destroy scheduled_agenda" do
    assert_difference('ScheduledAgenda.count', -1) do
      delete scheduled_agenda_url(@scheduled_agenda)
    end

    assert_redirected_to scheduled_agendas_url
  end
end
