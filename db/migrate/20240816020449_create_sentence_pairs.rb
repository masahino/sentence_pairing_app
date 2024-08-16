class CreateSentencePairs < ActiveRecord::Migration[7.2]
  def change
    create_table :sentence_pairs do |t|
      t.text :japanese_sentence
      t.text :english_sentence

      t.timestamps
    end
  end
end
