require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'モデルのテスト' do
    it "有効なpostの場合は保存されるか" do
      expect(build(:post)).to be_valid
    end

    context "titleカラム" do
      it '空欄であればエラーメッセージがかえる' do
        post = build(:post, title: nil)
        post.valid?
        expect(post.errors[:title]).to include("を入力してください")
      end

      it '２文字以上OKで１文字はエラーメッセージ' do
        post = create(:post)
        post.title = Faker::Lorem.characters(number: 1)
        post.valid?
        expect(post.errors[:title]).to include("は2文字以上で入力してください")
        # expect(post.valid?).to eq false
      end

      it '６０文字を越えたらエラーメッセージ' do
        post = create(:post)
        post.title = Faker::Lorem.characters(number: 65)
        post.valid?
        expect(post.errors[:title]).to include("は60文字以内で入力してください")
      end
    end

    context "contentカラム" do
      it "空欄であればエラーメッセージがかえる" do
        post = build(:post, content: nil)
        post.valid?
        expect(post.errors[:content]).to include("を入力してください")
      end

      it "19文字以下であればエラーメッセージがかえる" do
        post = create(:post)
        post.content = Faker::Lorem.characters(number: 19)
        post.valid?
        expect(post.errors[:content]).to include("は20文字以上で入力してください")
      end
    end

    # context "impressions_count" do
    #     it "空欄でないこと" do
    #     post = build(:impressions_count, content: nil)
    #     post.valid?
    #     expect(post.valid?).to false
    #     end
    # end

    # context "statusカラム" do
    #     it "空欄でないこと" do
    #     post = build(:status, content: nil)
    #     post.valid?
    #     expect(post.valid?).to false
    #     end
    # end
  end
end
# RSpec.describe Post, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
