require 'rails_helper'
describe User do
  describe '#create' do
    context 'ユーザの新規登録ができる場合' do
      it "nickname,age,email,passwardがあると保存ができる" do
        user = build(:user ) 
        expect(user).to be_valid
      end

      it  "nicknameが８文字以内なら保存できる"do
        user = build(:user, nickname: "a" * 8 )
        expect(user).to be_valid 
      end

      it "password,password_confirmationが6文字以上の場合は登録できること" do
        user = build(:user,password: "123456", password_confirmation: "123456")
        expect(user).to be_valid
      end
    end

    context "ユーザの新規登録ができない場合" do
      it "nicknameが無いと保存ができない" do
        user = build(:user, nickname:nil)
        user.valid?
        expect(user.errors[:nickname]).to include("を入力してください")
      end

      it "同じnicknameがあると保存ができない" do
        user = build(:user, nickname:"aa")
        user.save
        user = build(:user, nickname:"aa")
        user.valid?
        expect(user.errors[:nickname]).to include("はすでに存在します")
      end
      
      it "nicknameが9文字以上あると保存ができない" do
        user = build(:user, nickname:"a" * 9)
        user.valid?
        expect(user.errors[:nickname]).to include("は8文字以内で入力してください")
      end

      it "ageが無いと保存ができない" do
        user = build(:user, age:nil)
        user.valid?
        expect(user.errors[:age]).to include("を入力してください")
      end

      it " emailがない場合は登録できないこと" do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("を入力してください")
      end

      it " 同じemailがすでに保存している時は保存できないこと" do
        user = build(:user, email: "kkk@gmail.com")
        user.save
        user_two = build(:user, email: "kkk@gmail.com")
        user_two.valid?
        expect(user_two.errors[:email]).to include("はすでに存在します")
      end

      it " passwordがない場合は保存できないこと" do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("を入力してください")
      end
      
      it " passwordは5文字以下は保存できないこと" do
        user = build(:user, password: "12345", password_confirmation: "12345")
        user.valid?
        expect(user.errors[:password]).to include("は6文字以上で入力してください")
      end

      it " passwordは確認用を入力しないと保存ができないこと" do
        user = build(:user, password_confirmation: "")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
      end      
    end
  end 
end

