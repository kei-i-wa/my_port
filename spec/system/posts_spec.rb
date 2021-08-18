# require 'rails_helper'

# describe '投稿に関するテスト' do
#   before do
#             @department = Department.create(id: '1', name: '未登録', correct_name: '未登録')
#         end
#   let!(:user) { create(:user) }
#   let!(:post) { create(:post, user_id: user.id) }
  
#   describe'投稿のテスト' do
#     before do
#       sign_in user
#       visit new_post_path
#     end
    
#     context '投稿は成功したとき' do
#       it '遷移先が正しいか' do
#         fill_in 'post[title]',with: Faker::Lorem.characters(number: 10)
#         fill_in 'post[content]',with: Faker::Lorem.characters(number: 50)
#         click_button "投稿"
#         expect(page).to have_current_path '/posts/' + post.id.to_s
#       end
#     end
#   end
# end
