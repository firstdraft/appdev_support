require 'rails'

module AppdevSupport
  class Railtie < Rails::Railtie
    rake_tasks do
      load "tasks/appdev.rake"
    end
  end
end
