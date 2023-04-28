require "appdev_support/version"
require "appdev_support/appdev_support"

module AppdevSupport
  class Error < StandardError; end

  # class << self
  #   extend Dry::Configurable
  #   # attr_writer :active_record, :action_dispatch, :pryrc

  #   setting :active_record,   default: true
  #   setting :action_dispatch, default: true
  #   setting :pryrc do
  #     setting :level, default: :minimal

  #   end
  
  #   # def action_dispatch
  #   #   @action_dispatch || true
  #   # end

  #   # def active_record
  #   #   @active_record || true
  #   # end

  #   # def pryrc
  #   #   @pryrc || true
  #   #   yield self
  #   # end

  #   # def config
  #   #   yield self
  #   # end
  # end

  # def self.init
  #   if @active_record
  #     load "appdev_support/active_record/delegation.rb"
  #     load "appdev_support/active_record/attribute_methods.rb"
  #     load "appdev_support/active_record/relation/to_s.rb"
  #   end
  #   if @action_dispatch
  #     load "appdev_support/action_dispatch/request/session/fetch.rb"
  #     load "appdev_support/action_dispatch/request/session/store.rb"
  #     load "appdev_support/action_dispatch/cookies/cookie_jar/fetch.rb"
  #     load "appdev_support/action_dispatch/cookies/cookie_jar/store.rb"
  #   end
  #   case @pryrc
  #   when true || :minimal
  #     load "appdev_support/pryrc/minimal.rb" if Object.const_defined?("Pry")
  #   when :debug
  #     load "appdev_support/pryrc/debug.rb" if Object.const_defined?("Pry")
  #   end
  # end
  def self.init
    if self.config.active_record
      puts "loading"
      load "appdev_support/active_record/delegation.rb"
      load "appdev_support/active_record/attribute_methods.rb"
      load "appdev_support/active_record/relation/to_s.rb"
    end
    if self.config.action_dispatch
      puts "dispatch"
      load "appdev_support/action_dispatch/request/session/fetch.rb"
      load "appdev_support/action_dispatch/request/session/store.rb"
      load "appdev_support/action_dispatch/cookies/cookie_jar/fetch.rb"
      load "appdev_support/action_dispatch/cookies/cookie_jar/store.rb"
    end
    case self.config.pryrc
    when :minimal
      puts "minimal"
      load "appdev_support/pryrc/minimal.rb" if Object.const_defined?("Pry")
    when :debug
      puts "debug"
      load "appdev_support/pryrc/debug.rb" if Object.const_defined?("Pry")
    end
  end
end
