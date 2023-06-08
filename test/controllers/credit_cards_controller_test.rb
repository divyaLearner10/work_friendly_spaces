require "test_helper"

class CreditCardsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get credit_cards_new_url
    assert_response :success
  end
end
