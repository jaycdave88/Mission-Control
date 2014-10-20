feature "Sticky Creation" do
  xscenario 'at the stickies index page there should be a button to create a new sticky' do

    visit stickies_path
    expect(page).to have_link('Raise a new sticky!')

  end


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
    @stickywicket = Sticky.create(:title=> "blahblah", :content=>
      "blahblah blahblah")
  end
  after(:each) do
    Sticky.delete_all
  end

  scenario "at the sticky updating page there is a form to update a new sticky" do

    visit edit_sticky_path(@stickywicket.id)

    # expect(page).to have_selector("form[action='#{sticky_path}']")
     expect(page).to have_selector("form[method='post']")
  end

  scenario "submitting the update form updates the thing to have the new values" do

      visit edit_sticky_path(@stickywicket.id)
      fill_in 'Title', with: 'TEST TITLE!'
      fill_in 'Content', with: 'TEST CONTENT!!'
      click_button 'Update Sticky'

      url = URI.parse(current_url)

      expect(url.path).to eq(sticky_path(@stickywicket))

      expect(page).to have_content('TEST TITLE!')

      expect(@stickywicket.reload.title).to eq('TEST TITLE!')

      expect(@stickywicket.content).to eq('TEST CONTENT!!')
  end

end

feature "Sticky Deletion" do
  before(:each) do
    @stickyvictim = Sticky.create(:title=> "blahblah", :content=>
      "blahblah blahblah")
  end
  after(:each) do
    Sticky.delete_all
  end
  # TODO: Should only delete if author
  scenario "removes a sticky from DB" do
    visit sticky_path(@stickyvictim)
    expect{
      click_button "Delete"
    }.to change{Sticky.count}.by(-1)

  end
end