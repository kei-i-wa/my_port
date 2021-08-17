require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
    describe 'モデルのテスト' do
        it "有効なuserの場合は保存されるか" do
            expect(build(:user)).to be_valid
        end
        
    # describe 'バリデーションのテスト' do
    #     subject{user.valid?}
        
        # let!(:other_user) { create(:user) }
        let(:user) { build(:user) }
        
        # before do
        # @user = User.create(id: '100', name: 'テスト太郎', email: 'hoge@examples.com',join_yaer: "新入社員",department_id: 1)
        # end
        
        context 'nameカラム' do
            it '空欄でないこと' do
                user.name= ""
                is_expected.to eq false
            end
            
            it '2文字以上であること　１文字はNG' do
                user.name= Faker::Lorem.characters(number: 1)
                is_expected.to eq false
            end
            it '２文字以上、２文字はOK' do
                user.name=Faker::Lorem.characters(number: 2)
                is_expected.to eq true
            end
            
            it '８文字以下,８文字はOK' do
                user.name=Faker::Lorem.characters(number: 8)
                is_expected.to eq true
            end
            
            it '８文字以下であること　９文字はNG' do
                user.name=Faker::Lorem.characters(number: 9)
                is_expected.to eq false
            end
        end
        
        context 'introductionカラム' do
            it '400文字以下であること400文字はOK' do
                user.introduction=Faker::Lorem.character(number: 400)
                is_expected.to eq true
            end
            it '401文字はNG' do
                user.introduction=Faker::Lorem.character(number: 401)
                is_expected.to eq false
            end
        end
        context 'join_yearカラム' do
            it '空欄でないこと' do
                user.join_year = nil
                is_expected.to eq false
            end
        end
        context 'is_validカラム' do
            it '空欄でないこと' do
                user.is_valid = nil
                is_expected.to eq false
            end
        end
        context 'department_idカラム' do
            it '空欄でないこと' do
                user.department_id = nil
                is_expected.to eq false
            end
        end
    end
end
