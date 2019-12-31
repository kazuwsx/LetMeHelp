json.id @chat.id
json.comment @chat.comment
json.user_id @chat.user_id
json.image @chat.user.image.url unless @chat.user.image.url.nil?
json.current_user_id current_user.id


