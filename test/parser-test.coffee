expect = require("chai").expect
parser = require("../lib/parser.coffee")

describe "Parser", ->

  # test the setter of parser properties
  parser.parse_input 'foo/r0f'

  it "set pattern property", ->
    expect(parser.pattern).to.be.not.null .and .to.be.not.undefined

  it "set spaces property", ->
    expect(parser.spaces).to.be.not.null .and .to.be.not.undefined

  it "set first property", ->
    expect(parser.first).to.be.not.null .and .to.be.not.undefined

  # test the content of the properties
  parser.parse_input '=/l1f'

  it "pattern is =", ->
    expect(parser.pattern).to.be.equal '='

  it "first is f", ->
    expect(parser.first).to.be.equal 'f'

  it "spaces is l1", ->
    expect(parser.spaces).to.be.equal 'l1'