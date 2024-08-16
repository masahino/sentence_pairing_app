class AddCorrectAndIncorrectCountsToSentencePairs < ActiveRecord::Migration[7.2]
  def change
    add_column :sentence_pairs, :correct_count, :integer, default: 0
    add_column :sentence_pairs, :incorrect_count, :integer, default: 0
  end
end
