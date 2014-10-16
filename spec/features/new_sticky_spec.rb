feature "Sticky Creation" do
  scenario "at the sticky creation page there is a form to create a new sticky" do
    visit new_sticky_path

    expect(page).to have_selector("form[action='#{stickies_path}']")
  end
  scenario "can be created through a form" do
    visit new_sticky_path

    expect{
      fill_in 'Title', with: 'TEST TITLE!'
      fill_in 'Content', with: 'TEST CONTENT!!'
      click_button 'Submit Sticky'
    }.to change{Sticky.count}.by(1)
  end
end

feature "Sticky Updating" do
  before(:each) do
    @stickyballs = Sticky.create(:title=> "blahblah", :content=>
      "blahblah blahblah")
  end

  scenario "at the sticky updating page there is a form to update a new sticky" do

    visit edit_sticky_path(@stickyballs.id)


    expect(page).to have_selector("form[method='put'][action='#{sticky_path}']")
  end
end