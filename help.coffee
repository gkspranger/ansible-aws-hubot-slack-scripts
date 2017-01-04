# Commands:
#   hubot help - display all commands your bot knows about
#   hubot help <query> - display all commands that match <query>

module.exports = (robot) ->
  robot.respond /help(?:\s+(.*))?$/i, id: "help.help", (msg) ->
    cmds = renamedHelpCommands(robot)
    filter = msg.match[1]

    if filter
      cmds = cmds.filter (cmd) ->
        cmd.match new RegExp(filter, 'i')
      if cmds.length == 0
        msg.send "Sorry .. No available commands match #{filter}"
        return

    emit = cmds.join "\n"
    msg.reply "\n#{emit}"

renamedHelpCommands = (robot) ->
  robot_name = robot.alias or robot.name
  help_commands = robot.helpCommands().map (command) ->
    command.replace /^hubot/i, robot_name
  help_commands.sort()