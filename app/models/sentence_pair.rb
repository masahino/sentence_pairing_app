class SentencePair < ApplicationRecord
  validates :correct_count, :incorrect_count, numericality: { greater_than_or_equal_to: 0 }
end
