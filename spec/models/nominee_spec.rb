require "rails_helper"

RSpec.describe Nominee do
  context "#merge_into(nominee)" do
    let(:nominee) { create :nominee }
    let!(:nomination) { create :nomination, nominee: nominee }
    let!(:new_nominee) { create :nominee, name: "Peter", github_username: "peter" }

    subject(:merge){ nominee.merge_into(new_nominee) }

    it "destroys the instance & switches its nominations to the passed nominee" do
      expect(merge).to be_truthy
      expect(nominee).to_not be_persisted
      expect(nominee.nominations).to include(nomination)
    end

    context "when attempting to merge a nominee into itself" do
      let!(:new_nominee) { nominee }

      it "not possible to merge into oneself" do
        expect(merge).to be_falsey
        expect(nominee).to be_persisted
      end
    end
  end
end
