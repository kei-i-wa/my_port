require 'rails_helper'

describe 'ユーザーログイン後のテスト' do
    let(:user) { create(:user) }
    let!(:other_user) { create(:user) }
    let!(:post) { create(:post, user: user) }
    let!(:other_post) { create(:post, user: other_user) }
    
    before do
        visit new_user_session_path
        fill_in 'user[email]',with: user.email
        fill_in 'user[password]',with: user.password
        click_button 'ログインする'
    end
    
    describe 'ヘッダーのテスト' do
        context '表示内容の確認' do
            it 'urlが正しい' do
            expect(current_path).to eq '/posts'
            end
            it 'NOTICEのリンクの内容が正しい' do
                notice_link = find_all('a')[1].native.inner_text
                expect(page).to have_link notice_link,href: notifications_path
            end
            it 'GROUPのリンクの内容が正しい' do
                group_link = find_all('a')[2].native.inner_text
                expect(page).to have_link group_link,href: groups_path
            end
            it 'Usersのリンクが正しい' do
                users_link = find_all('a')[3].native.inner_text
                expect(page).to have_link users_link,href: users_path
            end
            it 'POSTのリンクが正しい' do
                post_link = find_all('a')[4].native.inner_text
                expect(page).to have_link post_link,href: posts_path
            end
            it 'NEWのリンクが正しい' do
                new_link = find_all('a')[5].native.inner_text
                expect(page).to have_link new_link,href: new_post_path
            end
            it 'マイページのリンクが正しい' do
                mypage = find_all('a')[6].native.inner_text
                expect(page).to have_link mypage,href: user_path(user)
            end
            it 'いいねした記事へのリンクが正しい' do
                favorite_post = find_all('a')[7].native.inner_text
                expect(page).to have_link favorite_post,href: favorites_user_path(user)
            end
            it 'コメントした記事へのリンクが正しい' do
                comment_post = find_all('a')[8].native.inner_text
                expect(page).to have_link comment_post,href: comments_user_path(user)
            end
            it '下書き記事へのリンクが正しい' do
                confirm_post = find_all('a')[9].native.inner_text
                expect(page).to have_link confirm_post,href: confirm_user_path(user)
            end
            it 'ログアウトのリンクが正しい' do
                logout_link = find_all('a')[10].native.inner_text
                expect(page).to have_link logout_link,href: destroy_user_session_path
            end
        end
    end

    describe '投稿一覧画面のテスト' do
        before do
            visit posts_path
        end
        
        context '表示内容の確認' do
            it 'URLが正しい' do
                expect(current_path).to eq '/posts'
            end
            it '自分と他人の画像のリンクが正しい' do
                expect(page).to have_link '', href: user_path(post.user)
                expect(page).to have_link '', href: user_path(other_post.user)
            end
            it '自分の投稿と他人の投稿のタイトルのリンク先が正しい' do
                expect(page).to have_link post.title, href: post_path(post)
                expect(page).to have_link other_post.title, href: post_path(other_post)
            end
        end
        context 'サイドバーの確認' do
            it '検索窓が表示される' do
                expect(page).to have_field 'posts_keyword'
            end
        end
    end
end