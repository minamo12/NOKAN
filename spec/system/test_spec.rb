# frozen_string_literal: true

require 'rails_helper'

# ログイン前
describe 'トップ画面(root_path)のテスト' do
  before do
    visit root_path
  end
  context '表示・リンクの確認' do
    it 'トップ画面に各カテゴリ・模試へのリンクはあるか' do
      LargeCategory.all.each_with_index do |large_category,i|
        j = i * 3
        expect(page).to have_content large_category.name
        # 勉強するリンク
        study_link = find_all('a')[j]
        expect(study_link.native.inner_text).to eq categories_path(large_category)
        # 模試へのリンク
        quiz_link = find_all('a')[j]
        expect(quiz_link.native.inner_text).to eq quizzes_path(large_category)
        expect(page).to have_content '模試をする'
        expect(page).to have_content '勉強する'
      end
    end
    it 'サイト名がトップ(root_path)へのリンクになっているか' do
      expect(page).to have_content 'NOKAN'
      expect(page).to have_link 'NOKAN', href: root_path
    end
    it 'ヘッダーの「トップ」がトップ(root_path)へのリンクになっているか' do
      expect(page).to have_content 'トップ'
      expect(page).to have_link 'トップ', href: root_path
    end
    it 'ヘッダーの「掲示板」が掲示板(board_posts_path)へのリンクになっているか' do
      expect(page).to have_content '掲示板'
      expect(page).to have_link '掲示板', href: board_posts_path
    end
    it 'ヘッダーの「About」がAbout(about_path)へのリンクになっているか' do
      expect(page).to have_content 'About'
      expect(page).to have_link 'About', href: about_path
    end
    it 'ヘッダーの「ログイン」が会員ログイン(new_customer_session_path)へのリンクになっているか' do
      expect(page).to have_content 'ログイン'
      expect(page).to have_link 'ログイン', href: new_customer_session_path
    end
  end
end

describe 'About画面のテスト' do
  before do
    visit about_path
  end
  it '「About」の文字が表示されているか' do
    expect(page).to have_content 'About'
  end
end

describe '新規会員登録画面のテスト' do
  before do
    visit new_customer_registration_path
  end
  context '表示・リンクの確認' do
    it 'ユーザ名、パスワード、確認用のフォームがあるか' do
      expect(page).to have_field 'customer[name]'
      expect(page).to have_field 'customer[password]'
      expect(page).to have_field 'customer[password_confirmation]'
    end
    it '「新規登録」ボタンがあるか' do
      expect(page).to have_button '新規登録'
    end
    it '「こちら」がログイン(new_customer_session_path)へのリンクになっているか' do
      expect(page).to have_content 'こちら'
      expect(page).to have_link 'こちら', href: new_customer_session_path
    end
  end
end

describe 'ログイン画面のテスト'do
  before do
    visit new_customer_session_path
  end
  context '表示・リンクの確認' do
    it 'ユーザ名、パスワード用のフォームがあるか' do
      expect(page).to have_field 'customer[name]'
      expect(page).to have_field 'customer[password]'
    end
    it '「ログイン」ボタンがあるか' do
      expect(page).to have_button 'ログイン'
    end
    it '「こちら」が新規登録(new_customer_registration_path)へのリンクになっているか' do
      expect(page).to have_content 'こちら'
      expect(page).to have_link 'こちら', href: new_customer_registration_path
    end
  end
end

describe '模試実施画面のテスト' do
  let(:large_category) { create(:large_category) }
  let(:medium_category) { create(:medium_category, large_category_id: large_category.id) }
  let(:small_category) { create(:small_category, medium_category_id: medium_category.id) }
  let(:item) { create(:item, large_category_id: large_category.id, medium_category_id: medium_category.id, small_category_id: small_category.id) }
  let(:quiz) { create(:quiz, item_id: item.id) }
  before do
    visit quizzes_path(large_category_id: large_category.id)
  end
  context '表示・リンクの確認' do
    it '未ログイン時の警告が表示されるか' do
      expect(page).to have_content '未ログイン状態'
    end
    it '「答えを表示する」ボタンがあるか' do
      expect(page).to have_button '答えを表示する'
    end
    it '問題文・回答用フォーム・正誤判定用チェック・詳細ボタンが表示・機能しているか' do
      (1..5).each do |i|
        Quiz.create(question:'test'+i.to_s, correct_answer:'test'+i.to_s, item_id: item.id)
      end
      visit quizzes_path(large_category_id: large_category.id)
      Quiz.all.each_with_index do |quiz,i|
        expect(page).to have_content quiz.question
        expect(page).to have_field 'mock_exam[answers_attributes][0][answer]'
        expect(page).to have_field 'mock_exam[answers_attributes][0][scoring]'
        expect(page).to have_unchecked_field 'mock_exam[answers_attributes][0][scoring]'
        expect(page).to have_content '詳細'
      end
    end
  end
end