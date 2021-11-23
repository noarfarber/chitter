# feature 'Posting a peep' do
#   scenario 'A user can post a peep' do
#     visit '/peeps'
#     click_button 'Post a Peep'

#     expect(current_path).to eq '/peeps/new'

#     fill_in('message', with: 'Hello world')
#     click_button('Post')

#     expect(current_path).to eq '/peeps'
#     expect(page).to have_content 'Hello world'
#   end
# end
