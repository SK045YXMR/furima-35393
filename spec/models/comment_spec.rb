require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント機能' do
    context 'コメントができるとき' do
      it 'コメントが適切に入力されていればコメントできる' do
        expect(@comment).to be_valid
      end
    end

    context 'コメントができないとき' do
      it 'コメントが空では投稿できない' do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end
      it 'ユーザーが紐づかなければコメントできない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("User must exist")
      end
      it '商品が紐づかなければコメントできない' do
        @comment.item = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Item must exist")
      end
    end
  end
end
