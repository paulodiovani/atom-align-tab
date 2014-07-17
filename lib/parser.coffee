module.exports =
  re: /(.+)\/([lcr\*\(\)0-9]*)(f[0-9]*)?/

  pattern: null,
  spaces: null,
  first: null,

  parse_input: (user_input) ->
    [test, @pattern, @spaces, @first] = @re.exec(user_input)
