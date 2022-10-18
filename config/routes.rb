Rails.application.routes.draw do
  namespace :admin do
    get 'customers/index'
    get 'customers/edit'
  end
  namespace :admin do
    get 'quizzes/edit'
  end
  namespace :admin do
    get 'items/new'
    get 'items/edit'
  end
  namespace :admin do
    get 'large_categories/index'
  end
  namespace :public do
    get 'items/index'
    get 'items/show'
  end
  namespace :public do
    get 'comments/index'
  end
  namespace :public do
    get 'board_posts/index'
    get 'board_posts/new'
    get 'board_posts/show'
  end
  namespace :public do
    get 'mock_exams/index'
    get 'mock_exams/show'
  end
  namespace :public do
    get 'quizzes/index'
  end
  namespace :public do
    get 'large_categories/index'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
  end
  devise_for :customers
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
