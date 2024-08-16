# test/models/sentence_pair_test.rb

require "test_helper"

class SentencePairTest < ActiveSupport::TestCase
  def setup
    @sentence_pair = SentencePair.new(japanese_sentence: "こんにちは", english_sentence: "Hello")
  end

  test "should be valid" do
    assert @sentence_pair.valid?
  end

  test "japanese_sentence should be present" do
    @sentence_pair.japanese_sentence = "  "
    assert_not @sentence_pair.valid?
  end

  test "english_sentence should be present" do
    @sentence_pair.english_sentence = "  "
    assert_not @sentence_pair.valid?
  end

  test "correct_count should have default value 0" do
    assert_equal 0, @sentence_pair.correct_count
  end

  test "incorrect_count should have default value 0" do
    assert_equal 0, @sentence_pair.incorrect_count
  end
end
