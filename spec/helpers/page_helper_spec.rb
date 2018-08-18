require "rails_helper"

describe PageHelper do

  describe "#page_states_collection" do
    it "returns an array with the available values and their i18n labels" do
      expect(helper.page_states_collection).to match_array [
        [ "Draft", "draft" ],
        [ "Published", "published" ]
      ]
    end
  end

  describe "#page_collection_for" do
    let!(:page)   { Fabricate :page }
    let!(:parent) { Fabricate :page, id: 26, title: "Parent" }
    let!(:child)  { Fabricate :page, id: 85, title: "Child" }

    before { child.move_to_child_of(parent) }

    it "returns an array with the child pages nested under their parent" do
      expect(helper.page_collection_for(page)).to match_array [
        [" Parent", 26],
        ["– Child", 85]
      ]
    end
  end

end
