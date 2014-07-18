module.exports =
  class Formatter
    parser: null,

    setParser: (@parser) ->

    format: (text) ->
      # token must not be null
      if not @parser.token? then return text

      longest = -1
      lines = text.split "\n"

      # get the line with longest distance from
      # start to the token
      lines.forEach (l) =>
        shortest = l.indexOf @parser.token
        longest  = shortest if shortest > longest

      # then, we align the lines
      lines.forEach (l, i) =>
        shortest = l.indexOf @parser.token

        if -1 < shortest < longest
          lines[i] = l[...shortest] +
            new Array(longest + 1 - shortest).join(' ') +
            l[shortest..]

      # return
      lines.join("\n")