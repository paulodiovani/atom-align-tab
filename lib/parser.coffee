re = ///^
  (.+)  # user token
  \/
  ((?:[lr]{1}[0-9]*)*)  # spaces
  (f[0-9]*)?  # how many tokens
$///

reLeft  = /(l[0-9]*)/
reRight = /(r[0-9]*)/

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
      # regex must match user input
      if not re.test(input) then return
      
      [@pattern, @token, spaces, first_many] = re.exec input

      if spaces?
        [..., spaces_left] = reLeft.exec(spaces) if reLeft.test(spaces)
        if spaces_left? and spaces_left[1..] isnt ''
          @spaces_left = parseInt(spaces_left[1..])

        [..., spaces_right] = reRight.exec(spaces) if reRight.test(spaces)
        if spaces_right? and spaces_right[1..] isnt ''
          @spaces_right = parseInt(spaces_right[1..])

      if first_many? and first_many[1..] isnt ''
        @first_many = parseInt(first_many[1..])

      return
