require 'rails_helper'

RSpec.describe Department, type: :model do
  describe 'モデルのテスト' do
    it "有効なdepの場合は保存されるか" do
      expect(build(:department)).to be_valid
    end

    context "nameカラム" do
        it "空欄であればエラーメッセージがかえる" do
            department = build(:department, name: nil)
            department.valid?
            expect(department.errors[:name]).to include("を入力してください")
        end

        it "９文字以上はエラー" do
            department = create(:department)
            department.name=Faker::Lorem.characters(number: 9)
            department.valid?
            expect(department.errors[:name]).to include("は8文字以内で入力してください")
        end
    end

    context "correct_nameカラム" do
        it "空欄であればエラーメッセージがかえる" do
            department = build(:department, correct_name: nil)
            department.valid?
            expect(department.errors[:correct_name]).to include("を入力してください")
        end

        it "16文字以上はエラー" do
            department = create(:department)
            department.correct_name=Faker::Lorem.characters(number: 16)
            department.valid?
            expect(department.errors[:correct_name]).to include("は15文字以内で入力してください")
        end
    end
end
end
