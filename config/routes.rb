Rails.application.routes.draw do
  # resourcesメソッドをhomesコントローラーとbooksコントローラーに適用
  resources :homes, :books

  # トップ画面のルートパス設定
  root to: 'homes#top'

end
