require 'rails_helper'

RSpec.describe PostComment, type: :model do
  describe 'モデルのテスト' do
    it "有効なpostcommentの場合は保存されるか" do
      expect(build(:post_comment)).to be_valid
    end

    context "commentカラム" do
      it "空欄であれば保存されない" do
        post_comment = build(:post_comment, comment: nil)
        post_comment.valid?
        expect(post_comment.valid?).to eq false
      end

      it "400字以上だとエラーが表示される" do
        post_comment = create(:post_comment)
        post_comment.comment = Faker::Lorem.characters(number: 401)
        post_comment.valid?
        expect(post_comment.errors[:comment]).to include("は400文字以内で入力してください")
      end
    end
  end
end
