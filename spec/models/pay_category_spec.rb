require 'rails_helper'
describe PayCategory do
  describe '#create' do
    context 'pay_categoryが保存できる場合' do
      it "nameがあれば保存ができる" do
        pay_category = build(:pay_category)
        expect(pay_category).to be_valid
      end

      it "colorがなくても保存ができる" do
        pay_category = build(:pay_category,color:nil)
        expect(pay_category).to be_valid
      end
    end
    context 'pay_categoryが保存できる場合' do
      it "nameが無いと保存ができない" do 
        pay_category = build(:pay_category,name:nil)
        pay_category.valid?
        expect(pay_category.errors[:name]).to include("を入力してください")
      end
    end
  end
end