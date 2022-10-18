Rails.application.routes.draw do

  scope module: 'public' do

    # homes
    root to: 'homes#top'
    get '/about' => 'homes#about', as: 'about'

    #customers
    get 'customers/my_page' => 'customers#show'
    get 'customers/infomation/edit' => 'customers#edit'
    patch 'customers/infomation' => 'customers#update'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw'  => 'customers#withdraw'

    #large_categories
    get 'categories' => 'large_categories#index'

    #quizzes
    get 'quizzes' => 'quizzes#index'
    get 'quizzes/shuffle' => 'quizzes#shuffle'

    #mock_exams
    resources :mock_exams, only: [:index]

    #board_posts
    resources :board_posts, only: [:index, :new, :show, :crate, :destroy]
    get 'board_posts/my_posts' => 'board_posts#my_posts'

    #comments
    resources :comments, only: [:create, :destroy]
    get 'comments/my_comments' => 'commens#index'

    #items
    resources :items, only: [:index, :show]

  end

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do

    #large_categories
    resources :large_categories, only: [:index]
    post 'large_create' => 'large_create'
    delete 'large_destroy' => 'large_destroy'
    post 'medium_create' => 'medium_category'
    delete 'medium_destroy' => 'medium_destroy'
    post 'small_create' => 'small_create'
    delete 'small_destroy' => 'small_destroy'

    #items
    resources :items, only: [:new, :create, :edit, :update, :destroy]

    #quizzes
    resources :quizzes, only: [:create, :edit, :update, :destroy]

    #customers
    resources :customers, only: [:index, :edit, :update]

    #board_posts
    resources :board_posts, only: [:destroy]

    #comments
    resources :comments, only: [:destroy]

  end

end
