require 'test_helper'

class MailControllerTest < ActionController::TestCase
  setup do
    @mail = mail(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mail)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mail" do
    assert_difference('Mail.count') do
      post :create, mail: { cost: @mail.cost, current_location: @mail.current_location, day: @mail.day, from: @mail.from, max_delivery_time: @mail.max_delivery_time, priority: @mail.priority, receive_date: @mail.receive_date, send_date: @mail.send_date, to: @mail.to, volume: @mail.volume, weight: @mail.weight }
    end

    assert_redirected_to mail_path(assigns(:mail))
  end

  test "should show mail" do
    get :show, id: @mail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mail
    assert_response :success
  end

  test "should update mail" do
    patch :update, id: @mail, mail: { cost: @mail.cost, current_location: @mail.current_location, day: @mail.day, from: @mail.from, max_delivery_time: @mail.max_delivery_time, priority: @mail.priority, receive_date: @mail.receive_date, send_date: @mail.send_date, to: @mail.to, volume: @mail.volume, weight: @mail.weight }
    assert_redirected_to mail_path(assigns(:mail))
  end

  test "should destroy mail" do
    assert_difference('Mail.count', -1) do
      delete :destroy, id: @mail
    end

    assert_redirected_to mail_index_path
  end
end
