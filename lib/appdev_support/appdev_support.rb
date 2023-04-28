require "dry-configurable"
module AppdevSupport
  extend Dry::Configurable

  setting :active_record,   default: true
  setting :action_dispatch, default: true
  setting :pryrc do
    setting :level, default: :minimal

  end

  # def self.init
  #   if self.config.active_record
  #     puts "loading"
  #     load "appdev_support/active_record/delegation.rb"
  #     load "appdev_support/active_record/attribute_methods.rb"
  #     load "appdev_support/active_record/relation/to_s.rb"
  #   end
  #   if self.config.action_dispatch
  #     load "appdev_support/action_dispatch/request/session/fetch.rb"
  #     load "appdev_support/action_dispatch/request/session/store.rb"
  #     load "appdev_support/action_dispatch/cookies/cookie_jar/fetch.rb"
  #     load "appdev_support/action_dispatch/cookies/cookie_jar/store.rb"
  #   end
  #   case self.config.pryrc
  #   when :minimal
  #     load "appdev_support/pryrc/minimal.rb" if Object.const_defined?("Pry")
  #   when :debug
  #     load "appdev_support/pryrc/debug.rb" if Object.const_defined?("Pry")
  #   end
  # end
end

