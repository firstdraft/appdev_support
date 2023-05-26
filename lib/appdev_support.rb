require "appdev_support/version"
require "dry-configurable"

module AppdevSupport
  extend Dry::Configurable
  setting :active_record,   default: true
  setting :action_dispatch, default: true
  setting :pryrc,           default: :minimal

  class Error < StandardError; end

  def self.init
    if config.action_dispatch
      self.load_active_record_patches
    end
    if config.active_record
      self.load_action_dispatch_patches
    end
    if config.pryrc
      self.load_pryrc_patches
    end
  end

  private

  def self.load_active_record_patches
    active_record_loaded = begin
      Kernel.const_get("ActiveRecord")
    rescue NameError
      false
    end
    if active_record_loaded
      require "appdev_support/active_record/relation/to_s.rb"
      require "appdev_support/active_record/attribute_methods.rb"
      require "appdev_support/active_record/calculations.rb"
      require "appdev_support/active_record/delegation.rb"
    end
  end

  def self.load_action_dispatch_patches
    action_dispatch_loaded = begin
      Kernel.const_get("ActionDispatch")
    rescue NameError
      false
    end
    if action_dispatch_loaded
      require "appdev_support/action_dispatch/cookies/cookie_jar/fetch.rb"
      require "appdev_support/action_dispatch/cookies/cookie_jar/store.rb"
      require "appdev_support/action_dispatch/request/session/fetch.rb"
      require "appdev_support/action_dispatch/request/session/store.rb"
    end
  end

  def self.load_pryrc_patches
    pry_loaded = begin
      Kernel.const_get("Pry")
    rescue NameError
      false
    end
    if pry_loaded
      if self.config.pryrc == :minimal
        require "appdev_support/pryrc/minimal.rb"
      elsif self.config.pryrc == :debug
        require "appdev_support/pryrc/debug.rb"
      end
    end
  end
end
