describe 'the signin process', type: :feature do
  let(:user) { FactoryGirl.create(:user) }

  it 'signs me in if I have a confirmed email' do
    sign_in_as_factory_user
    expect(page).to have_content 'Signed in successfully'
  end

  it 'does not sign me in if I have not confirmed my email' do
    user.confirmed_at = nil
    user.save
    sign_in_as_factory_user
    expect(page).not_to have_content 'Signed in successfully'
    expect(page).to have_content 'You have to confirm your email address before continuing.'
  end

  def sign_in_as_factory_user
    visit '/users/sign_in'
    within('#new_user') do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
    end
    click_button 'Log In'
  end
end
