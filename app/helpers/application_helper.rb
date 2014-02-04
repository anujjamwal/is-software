module ApplicationHelper
def error_messages_for(object)
    render partial: 'shared/error_msg', locals: {object: object}
  end

end
