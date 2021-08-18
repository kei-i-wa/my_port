require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
    describe 'モデルのテスト' do
        before do
            @department = Department.create(id: '1', name: '未登録', correct_name: '未登録')
        end
        
        it "有効なuserの場合は保存されるか" do
            expect(build(:user)).to be_valid
        end
        
        context 'nameカラム' do
            it '空欄であればエラーメッセージがかえる' do
                user = build(:user, name: nil)
                user.valid?
                expect(user.errors[:name]).to include("を入力してください")
            end
            
            it '2文字以上であること　１文字はエラーメッセージ' do
                user = create(:user)
                user.name=Faker::Lorem.characters(number: 1)
                user.valid?
                expect(user.errors[:name]).to include("は2文字以上で入力してください")
            end
            
            it '9文字以上はエラーメッセージ' do
                user = create(:user)
                user.name=Faker::Lorem.characters(number: 9)
                user.valid?
                expect(user.errors[:name]).to include("は8文字以内で入力してください")
            end
        end
        
        context 'introductionカラム' do
            it '401文字以上はエラーメッセージ' do
                user = create(:user)
                user.introduction=Faker::Lorem.characters(number: 401)
                user.valid?
                expect(user.errors[:introduction]).to include("は400文字以内で入力してください")
            end
        end
    end
end
