describe 'the creating posts process', type: :feature do
  let(:user) { FactoryGirl.create(:user) }

  it 'directs users to the post show page when they create a post' do
    sign_in_with(user.email, user.password)
    click_link 'New Post'
    within('#new_post') do
      fill_in 'Title', with: 'A Test Title'
      fill_in 'Body', with: 'This is the Test Body'
    end
    click_button 'Submit'
    within('#post') do
      expect(page).to have_content 'This is the Test Body'
      expect(page).to have_content 'A Test Title'
      byline = "by #{user.first_name} #{user.last_name}"
      expect(page).to have_content byline
    end
  end

  it 'lets a logged in user create a post that shows on the home page' do
    sign_in_with(user.email, user.password)
    click_link 'New Post'
    within('#new_post') do
      fill_in 'Title', with: 'A Test Title'
      fill_in 'Body', with: 'This is the Test Body'
    end
    click_button 'Submit'
    visit '/'
    within('#all_posts') do
      expect(page).to have_content 'A Test Title'
    end
  end

  def sign_in_with(email, password)
    visit '/users/sign_in'
    within('#new_user') do
      fill_in 'Email', with: email
      fill_in 'Password', with: password
    end
    click_button 'Log In'
  end
end
