feature "helps" do

  before(:each) do
    @stickywicket = Sticky.create(:title=> "blahblah", :content=>
      "blahblah blahblah")
  end

  scenario "create a new help" do

    visit sticky_path(@stickywicket)

    expect(page).to have_button("Help")

  end

  scenario "click the fucking help button" do
    visit sticky_path(@stickywicket)
    click_button "Help"

    expect(page).to have_selector("form[method='post']")
    expect{
      fill_in 'Title', with: 'TEST TITLE!'
      fill_in 'Content', with: 'TEST CONTENT!!'
      click_button 'Submit Help'
    }.to change{Help.count}.by(1)

  end



end