describe "adding a question", js: true do
  it "allows a signed-in user to add a new question" do
    visit '/sessions/new'
    user = User.create(:name => 'Bobby', :email => 'user@example.com', :password => 'password')
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'password'
    click_button 'Log In'
    visit '/questions'
    click_on 'Ask new question'
    fill_in 'Headline', with: 'Sample question'
    fill_in 'Content', with: 'sample content'
    click_button 'Create Question'
    save_and_open_page
    expect(page).to have_content "New question created, bro!"
  end
end
