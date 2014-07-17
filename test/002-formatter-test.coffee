expect    = require("chai").expect
Parser    = require("../lib/parser.coffee")
Formatter = require("../lib/formatter.coffee")

describe "Formatter", ->
  # string for alignment test
  text = """
    foo = "olá"
    foobar = {"key": 1, "value": "hello, world"}
    myTinyLittleVar = {"key": 999, "value": "hello, world, again"}
  """

  parser = new Parser '=/f'
  formatter = new Formatter
  formatter.setParser parser

  it "is a Formatter", ->
    expect(formatter).to.be.instanceof Formatter

  it "has a parser", ->
    expect(formatter.parser).to.be.instanceof Parser

  it "parse equals", ->
    expect(formatter.format(text)).to.be.equal """
      foo             = "olá"
      foobar          = {"key": 1, "value": "hello, world"}
      myTinyLittleVar = {"key": 999, "value": "hello, world, again"}
    """