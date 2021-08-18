require 'rails_helper'

describe '[STEP1] ユーザログイン前のテスト' do
  describe 'トップ画面のテスト' do
    before do
      visit root_path
    end
    context'表示内容の確認' do
      it'urlが正しい' do
        expect(current_path).to eq'/'
      end
      
      it 'loginリンクの内容が正しい' do
        log_in_link = find_all('a')[4].native.inner_text
        expect(page).to have_link log_in_link, href: new_user_session_path
      end
      
      it 'signupリンクの内容が正しい' do
        sign_up_link = find_all('a')[3].native.inner_text
        expect(page).to have_link sign_up_link, href: new_user_registration_path
      end
    end
  end
end
  
  # describe 'ログインしてない時のヘッダーのテスト' do
  #   before do
  #     visit root_path
  #   end
    
  #   cotext '表示内容の確認'
  #     it 'TOPを押すとトップ画面に遷移する' do
  #       top_link = find_all('a')[3].native.inner_text
  #       top_link = top_link.delete(' ')
  #       top_link.gsub!(/\n/, '')
  #       click_link top_link
  #       is_expected.to eq '/'
  #     end
  # end
# end