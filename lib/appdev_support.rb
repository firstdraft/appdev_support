require "appdev_support/version"
require "appdev_support/active_record/delegation"
require "appdev_support/active_record/attribute_methods"
require "appdev_support/active_record/relation/to_s"
require "appdev_support/action_dispatch/request/session/fetch"
require "appdev_support/action_dispatch/request/session/store"
require "appdev_support/action_dispatch/cookies/cookie_jar/fetch"
require "appdev_support/action_dispatch/cookies/cookie_jar/store"

module AppdevSupport
  class Error < StandardError; end
  # Your code goes here...
end
