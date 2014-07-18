expect = require("chai").expect
Parser = require("../lib/parser.coffee")

describe "Parser", ->
  # test the setter of parser properties
  parser01 = new Parser 'foo/r0f'

  it "is a Parser", ->
    expect(parser01).to.be.instanceof Parser

  it "set pattern property", ->
    expect(parser01.pattern).to.be.not.null .and .to.be.not.undefined

  it "set spaces_right property", ->
    expect(parser01.spaces_right).to.be.not.null .and .to.be.not.undefined

  it "set first_many property", ->
    expect(parser01.first_many).to.be.not.null .and .to.be.not.undefined

  # test the content of the properties
  parser02 = new Parser '=/l2f'

  it "has pattern equal =/l2f", ->
    expect(parser02.pattern).to.be.equal '=/l2f'

  it "has token equal =", ->
    expect(parser02.token).to.be.equal '='

  it "has first_many equal 1", ->
    expect(parser02.first_many).to.be.equal 1

  it "has spaces_left equal 2", ->
    expect(parser02.spaces_left).to.be.equal 2

  # test for unordered parameters
  parser03 = new Parser '=/r3l0'

  it "has first_many equal 1 (default)", ->
    expect(parser03.first_many).to.be.equal 1

  it "has spaces_left equal 0", ->
    expect(parser03.spaces_left).to.be.equal 0

  it "has spaces_right equal 3", ->
    expect(parser03.spaces_right).to.be.equal 3

  # test for inverted order
  parser04 = new Parser '=/l0r3'

  it "has spaces_left equal 0 again", ->
    expect(parser04.spaces_left).to.be.equal 0

  it "has spaces_right equal 3 again", ->
    expect(parser04.spaces_right).to.be.equal 3
