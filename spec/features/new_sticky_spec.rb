feature "Stickies" do
  scenario "have a form in the view" do
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