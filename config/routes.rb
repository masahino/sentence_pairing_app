Rails.application.routes.draw do
  root "sentence_pairs#index"  # Rootパスを定義

  get "sentence_pairs/list", to: "sentence_pairs#list", as: "sentence_pair_list"  # リスト表示用のルート

  resources :sentence_pairs do
    member do
      post "check_answer"  # 個別のsentence_pairに対して回答をチェックするルート
      get "result"  # 結果を表示するルート
    end
  end

  # その他の必要なカスタムルートをここに追加します
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
