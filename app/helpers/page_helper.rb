module PageHelper

  def page_states_collection
    Page.states.map do |state, index|
      [ t("states.#{state}"), state ]
    end
  end

end
