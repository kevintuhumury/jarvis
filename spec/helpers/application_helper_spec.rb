require "rails_helper"

describe ApplicationHelper do

  describe "#link_to_nav" do
    let(:li) { helper.link_to_nav(:pages, pages_path, :file, 26) }

    it "returns an list-item with the specified settings" do
      expect(li).to eq '<li><a href="/pages"><span class="glyphicon glyphicon-file"></span> pages<span class="badge pull-right">26</span></a></li>'
    end
  end

end
