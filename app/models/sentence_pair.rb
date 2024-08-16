# app/models/sentence_pair.rb

class SentencePair < ApplicationRecord
  validates :japanese_sentence, presence: true
  validates :english_sentence, presence: true

  validates :correct_count, :incorrect_count, numericality: { greater_than_or_equal_to: 0 }
end

