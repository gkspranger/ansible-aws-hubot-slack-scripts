# Commands:
#   hubot who am i - find out your user details

module.exports = (robot) ->
  robot.respond /who am i/i, id: "whoami.who", (msg) ->
    msg.send "your name is %".replace "%", msg.message.user.name
    msg.send "your real name is %".replace "%", msg.message.user.real_name
    msg.send "your id is %".replace "%", msg.message.user.id
    msg.send "your email is %".replace "%", msg.message.user.profile.email
    msg.send "you are in room %".replace "%", msg.message.user.room
    
    are_not = if msg.message.user.is_admin then "are" else "are not"
    
    msg.send "you % an admin".replace "%", are_not
