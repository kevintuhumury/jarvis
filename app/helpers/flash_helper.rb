module FlashHelper

  def flash_for(flash_type)
    case flash_type
    when :notice
      "success"
    when :alert
      "danger"
    else
      "info"
    end
  end

end
