expect = require("chai").expect
Parser = require("../lib/parser.coffee")

describe "Parser", ->
  # test the setter of parser properties
  parser = new Parser 'foo/r0f'

  it "is a Parser", ->
    expect(parser).to.be.instanceof Parser

  it "set pattern property", ->
    expect(parser.pattern).to.be.not.null .and .to.be.not.undefined

  it "set spaces_right property", ->
    expect(parser.spaces_right).to.be.not.null .and .to.be.not.undefined

  it "set first_many property", ->
    expect(parser.first_many).to.be.not.null .and .to.be.not.undefined

  # test the content of the properties
  parser = new Parser '=/l2f'

  it "is instance of Parser", ->
    expect(parser).to.be.instanceof Parser

  it "pattern is =/l2f", ->
    expect(parser.pattern).to.be.equal '=/l2f'

  it "token is =", ->
    expect(parser.token).to.be.equal '='

  it "first_many is 1", ->
    expect(parser.first_many).to.be.equal 1

  it "spaces_left is 2", ->
    expect(parser.spaces_left).to.be.equal 2