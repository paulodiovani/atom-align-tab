module.exports =
  class Parser
    pattern: null,

    token       : null
    spaces_left : 1,
    spaces_right: 1,
    first_many  : 1,

    constructor: (input) ->
      @parse_user_input input

    parse_user_input: (input) ->
      re = ///
        (.+)  # user token
        \/
        (l[0-9]*)?  # left spaces
        (r[0-9]*)?  # right spaces
        (f[0-9]*)?  # how many tokens
      ///

      [@pattern, @token, spaces_left, spaces_right, first_many] = re.exec input

      if spaces_left? and spaces_left[1..] isnt ''
        @spaces_left = parseInt(spaces_left[1..])

      if spaces_right? and spaces_right[1..] isnt ''
        @spaces_right = parseInt(spaces_right[1..])

      if first_many? and first_many[1..] isnt ''
        @first_many = parseInt(first_many[1..])

      return
