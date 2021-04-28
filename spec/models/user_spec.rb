require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができるとき' do
      it 'ユーザー情報と本人情報が全て入力されていれば登録できる' do
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
      end
      it 'emailが空では登録できない' do
      end
      it 'emailに@を含まないと登録できない' do
      end
      it 'emailが重複すると登録できない' do
      end
      it 'passwordが空では登録できない' do
      end
      it 'passwordが5文字以下では登録できない' do
      end
      it 'passwordは半角英数字が混合されてないと登録できない' do
      end
      it 'passwordとpassword_confirmationが一致しないと登録できない' do
      end
      it 'first_nameとlast_nameが空では登録できない' do
      end
      it 'first_nameとlast_nameは漢字・ひらがな・カタカナでなければ登録できない' do
      end
      it 'first_name_kanaとlast_name_kanaが空では登録できない' do
      end
      it 'first_name_kanaとlast_name_kanaがカタカナでなければ登録できない' do
      end
      it 'birth_dateが空では登録できない' do
      end
    end
  end
end
