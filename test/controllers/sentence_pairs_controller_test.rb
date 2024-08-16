require "test_helper"

class SentencePairsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sentence_pairs_index_url
    assert_response :success
  end

  test "should get new" do
    get sentence_pairs_new_url
    assert_response :success
  end

  test "should get create" do
    get sentence_pairs_create_url
    assert_response :success
  end

  test "should get show" do
    get sentence_pairs_show_url
    assert_response :success
  end
end
