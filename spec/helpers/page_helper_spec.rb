require "spec_helper"

describe PageHelper do

  describe "#page_states_collection" do
    it "returns an array with the available values and their i18n labels" do
      expect(helper.page_states_collection).to match_array [
        [ "Draft", "draft" ],
        [ "Published", "published" ]
      ]
    end
  end

end
