require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'モデルのテスト' do
    it "有効なgroupの場合は保存されるか" do
      expect(build(:group)).to be_valid
    end

    context "nameカラム" do
      it "空欄であればエラーメッセージがかえる" do
        group = build(:group, name: nil)
        group.valid?
        expect(group.errors[:name]).to include("を入力してください")
      end

      it "1文字だとエラーメッセージがかえる" do
        group = create(:group)
        group.name = Faker::Lorem.characters(number: 1)
        group.valid?
        expect(group.errors[:name]).to include("は2文字以上で入力してください")
      end

      it "2６文字以上であればエラーメッセージがかえる" do
        group = create(:group)
        group.name = Faker::Lorem.characters(number: 26)
        group.valid?
        expect(group.errors[:name]).to include("は25文字以内で入力してください")
      end
    end

    context "statusカラム" do
      it "空欄であればエラーメッセージがかえる" do
        group = build(:group, status: nil)
        group.valid?
        expect(group.errors[:status]).to include("を入力してください")
      end

      it "1文字だとエラーメッセージがかえる" do
        group = create(:group)
        group.status = Faker::Lorem.characters(number: 1)
        group.valid?
        expect(group.errors[:status]).to include("は2文字以上で入力してください")
      end

      it "2６文字以上であればエラーメッセージがかえる" do
        group = create(:group)
        group.status = Faker::Lorem.characters(number: 26)
        group.valid?
        expect(group.errors[:status]).to include("は25文字以内で入力してください")
      end
    end

    context "introductionカラム" do
      it "空欄であればエラーメッセージがかえる" do
        group = build(:group, introduction: nil)
        group.valid?
        expect(group.errors[:introduction]).to include("を入力してください")
      end

      it "1文字であればエラーメッセージがかえる" do
        group = create(:group)
        group.introduction = Faker::Lorem.characters(number: 1)
        group.valid?
        expect(group.errors[:introduction]).to include("は2文字以上で入力してください")
      end

      it "1001文字以上であればエラーメッセージがかえる" do
        group = create(:group)
        group.introduction = Faker::Lorem.characters(number: 1001)
        group.valid?
        expect(group.errors[:introduction]).to include("は1000文字以内で入力してください")
      end
    end
  end
end
