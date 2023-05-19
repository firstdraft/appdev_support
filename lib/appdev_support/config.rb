module AppdevSupport
  class Config
    puts self.config.active_record
    puts x = File.join("appdev_support", "lib", "appdev_support", "active_record", "calculations.rb")
    puts open(x).read
    Dir[File.join("appdev_support", "lib", "appdev_support", "active_record", "*.rb")].each do |file|
      puts "dd"
      load file if self.config.active_record
    end
    
  end
end
