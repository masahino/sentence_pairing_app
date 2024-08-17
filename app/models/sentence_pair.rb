# app/models/sentence_pair.rb

class SentencePair < ApplicationRecord
  validates :japanese_sentence, presence: true, length: { maximum: 255 }
  validates :english_sentence, presence: true, length: { maximum: 255 }
  validates :correct_count, :incorrect_count, numericality: { greater_than_or_equal_to: 0 }
  before_save :sanitize_sentences

  private
  def sanitize_sentences
    self.japanese_sentence = ActionController::Base.helpers.sanitize(japanese_sentence)
    self.english_sentence = ActionController::Base.helpers.sanitize(english_sentence)
  end
end
