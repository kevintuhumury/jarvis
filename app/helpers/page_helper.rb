module PageHelper

  def page_states_collection
    Page.states.map do |state, index|
      [ t("states.#{state}"), state ]
    end
  end

  def page_collection_for(current_page)
    nested_set_options(Page, current_page) do |page|
      "#{'–' * page.level} #{page.title}"
    end
  end

end
