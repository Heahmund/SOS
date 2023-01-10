require 'rails_helper'

feature 'Create question', %q{
    in order to get answer from community
    as an authenticated user
    i want to be able to ask questions
} do
    given(:user) {create(:user)}

  scenario 'Authenticated user creates question' do
    User.create!(email: 'user@test.com', password: '12345678' )

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'

    visit questions_path
    click_on 'Ask question'
    fill_in 'Title', with: 'Test question'
    fill_in 'Body', with: 'text text'

    click_on 'Create'

    expect(page).to have_content 'Your question successfully created.'
  end
  scenario 'Non_authenticated user tries to create question' do
    visit questions_path

    click_on 'Ask question'

    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end

