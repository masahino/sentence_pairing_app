# test/controllers/sentence_pairs_controller_test.rb

require "test_helper"

class SentencePairsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @sentence_pair = sentence_pairs(:one) # fixturesから既存のデータを使用
  end

  test "should get index" do
    get root_path
    assert_response :success
    assert_select "h2", "Translate this sentence:"
  end

  test "should create sentence_pair" do
    assert_difference("SentencePair.count", 1) do
      post sentence_pairs_path, params: { sentence_pair: { japanese_sentence: "ありがとう", english_sentence: "Thank you" } }
    end
    assert_redirected_to result_sentence_pair_path(SentencePair.last)
  end

  test "should update sentence_pair" do
    patch sentence_pair_path(@sentence_pair), params: { sentence_pair: { japanese_sentence: "こんばんは", english_sentence: "Good evening" } }
    assert_redirected_to sentence_pair_list_path
    @sentence_pair.reload
    assert_equal "こんばんは", @sentence_pair.japanese_sentence
    assert_equal "Good evening", @sentence_pair.english_sentence
  end

  test "should destroy sentence_pair" do
    assert_difference("SentencePair.count", -1) do
      delete sentence_pair_path(@sentence_pair)
    end
    assert_redirected_to sentence_pair_list_path
  end

  test "should handle correct answer" do
    post check_answer_sentence_pair_path(@sentence_pair), params: { english_sentence: @sentence_pair.english_sentence }
    assert_equal "Correct!", flash[:notice]
    assert_redirected_to result_sentence_pair_path(@sentence_pair)
  end

  test "should handle incorrect answer" do
    post check_answer_sentence_pair_path(@sentence_pair), params: { english_sentence: "Wrong answer" }
    assert_equal "Incorrect. The correct answer was: #{@sentence_pair.english_sentence}", flash[:alert]
    assert_redirected_to result_sentence_pair_path(@sentence_pair)
  end
end
