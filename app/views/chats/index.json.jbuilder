if @new_messages.present?
  json.array! @new_messages do |new_message|
    json.comment new_message.comment
    json.image new_message.user.image.url unless new_message.user.image.nil?
    json.id new_message.id
    json.user_id new_message.user.id
    json.current_user_id current_user.id
  end
end