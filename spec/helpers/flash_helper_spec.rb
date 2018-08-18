require "rails_helper"

describe FlashHelper do

  describe "#flash_for" do
    context "when flash message is a notice" do
      it "returns success" do
        expect(helper.flash_for(:notice)).to eq "success"
      end
    end

    context "when flash message is an alert" do
      it "returns danger" do
        expect(helper.flash_for(:alert)).to eq "danger"
      end
    end

    context "when flash message is not notice or alert" do
      it "returns info" do
        expect(helper.flash_for(:success)).to eq "info"
      end
    end
  end

end
