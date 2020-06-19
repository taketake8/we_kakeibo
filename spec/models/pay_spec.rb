require 'rails_helper'
describe Pay do
  describe '#create' do
    context 'payの保存ができる場合' do
      it "start_timeとpriceとuser_idがあると保存ができる" do
        user = create(:user)
        pay_category = create(:pay_category)
        pay = build(:pay,user_id:user.id) 
        expect(pay).to be_valid
      end

      it "pay_category_idがなくても保存ができる" do
        user = create(:user)
        pay_category = create(:pay_category)
        pay = build(:pay,user_id:user.id,pay_category_id:nil) 
        expect(pay).to be_valid
      end


      it "memoがなくても保存ができる" do
        user = create(:user)
        pay_category = create(:pay_category)
        pay = build(:pay,user_id:user.id,memo:"") 
        expect(pay).to be_valid
      end

      it "priceが0未満は保存ができる" do
        user = create(:user)
        pay_category = create(:pay_category)
        pay = build(:pay,user_id:user.id,price:-1) 
        expect(pay).to be_valid
      end

      it "priceが-999999999以上は保存ができる" do
        user = create(:user)
        pay_category = create(:pay_category)
        pay = build(:pay,user_id:user.id,price:-999999999) 
        expect(pay).to be_valid
      end

    end
    context 'payの保存ができない場合' do
      it "priceが無いと保存ができない" do       
        user = create(:user)
        pay_category  = create(:pay_category)
        pay = build(:pay,price:nil,user_id:user.id,pay_category_id:pay_category.id)
        pay.valid?
        expect(pay.errors[:price]).to include("を入力してください")
      end

      it "priceが0以上だと保存ができない" do       
        user = create(:user)
        pay_category  = create(:pay_category)
        pay = build(:pay,price:0,user_id:user.id,pay_category_id:pay_category.id)
        pay.valid?
        expect(pay.errors[:price]).to include("は0より小さい値にしてください")
      end
      
      it "priceが-1000000000以下だと保存ができない" do       
        user = create(:user)
        pay_category  = create(:pay_category)
        pay = build(:pay,price:-1000000000,user_id:user.id,pay_category_id:pay_category.id)
        pay.valid?
        expect(pay.errors[:price]).to include("は-1000000000より大きい値にしてください")
      end

      it "priceが数値でないと保存ができない" do       
        user = create(:user)
        pay_category  = create(:pay_category)
        pay = build(:pay,price:/¥D/,user_id:user.id,pay_category_id:pay_category.id)
        pay.valid?
        expect(pay.errors[:price]).to include("は数値で入力してください")
      end

      it "start_timeがないと保存ができない" do       
        user = create(:user)
        pay_category  = create(:pay_category)
        pay = build(:pay,start_time:nil,user_id:user.id,pay_category_id:pay_category.id)
        pay.valid?
        expect(pay.errors[:start_time]).to include("を入力してください")
      end

      it "user_idがないと保存ができない" do       
        user = create(:user)
        pay_category  = create(:pay_category)
        pay = build(:pay,user_id:nil,pay_category_id:pay_category.id)
        pay.valid?
        expect(pay.errors[:user]).to include("を入力してください")
      end
    end
  end
end