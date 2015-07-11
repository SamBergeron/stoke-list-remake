'use strict'

describe 'Service: Feeder', ->

  # load the service's module
  beforeEach module 'stokeRemakeApp'

  # instantiate service
  Feeder = {}
  beforeEach inject (_Feeder_) ->
    Feeder = _Feeder_

  it 'should do something', ->
    expect(!!Feeder).toBe true
