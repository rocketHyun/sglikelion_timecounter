Rails.application.routes.draw do
  get 'home/index'
  get 'home/correct' => "home#correct"
  post 'home/correct' => "home#correct"
  post 'home/pass'
  get 'home/finish'
  get 'home/teamselect'
  get 'home/teamTimeMake/:id' => 'home#teamTimeMake'

  root 'home#teamselect'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
