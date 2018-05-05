module ApplicationHelper

  def alert_box_class(key)

    case key
    when 'notice' then
      'alert-primary'
    when 'alert' then
      'alert-danger'
    else
      ''
    end

  end

end
