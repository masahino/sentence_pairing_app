class SentencePairsController < ApplicationController
  def index
    @sentence_pair = SentencePair.order("RANDOM()").first
    if @sentence_pair.nil?
      flash.now[:alert] = "No sentence pairs available. Please add some sentence pairs first."
      render :no_data  # no_data.html.erb という新しいビューを作成して、メッセージを表示します
    end
  end

  def new
    @sentence_pair = SentencePair.new
  end

  def create
    @sentence_pair = SentencePair.new(sentence_pair_params)

    if @sentence_pair.save
      redirect_to result_sentence_pair_path(@sentence_pair), notice: "Sentence pair was successfully created."
    else
      render :new
    end
  end

  def show
  end

  def list
    @sentence_pairs = SentencePair.all
  end

  def edit
    @sentence_pair = SentencePair.find(params[:id])
  end

  def update
    @sentence_pair = SentencePair.find(params[:id])
    if @sentence_pair.update(sentence_pair_params)
      redirect_to sentence_pair_list_path, notice: "Sentence pair was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @sentence_pair = SentencePair.find(params[:id])
    @sentence_pair.destroy
    redirect_to sentence_pair_list_path, notice: "Sentence pair was successfully deleted."
  end

  def check_answer
   @sentence_pair = SentencePair.find(params[:id])
    user_answer = params[:english_sentence].strip.downcase
    correct_answer = @sentence_pair.english_sentence.strip.downcase

    if user_answer == correct_answer
      @sentence_pair.increment!(:correct_count)  # 正解回数をインクリメント
      flash[:notice] = "Correct!"
    else
      @sentence_pair.increment!(:incorrect_count)  # 間違い回数をインクリメント
      flash[:alert] = "Incorrect. The correct answer was: #{@sentence_pair.english_sentence}"
    end

    redirect_to result_sentence_pair_path(@sentence_pair)
  end

  def result
    @sentence_pair = SentencePair.find(params[:id])
  end

  private

  def sentence_pair_params
    params.require(:sentence_pair).permit(:japanese_sentence, :english_sentence)
  end
end
