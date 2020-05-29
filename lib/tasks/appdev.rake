namespace :appdev do
  
  desc "Add/Update specific file given raw URL and path to save the file."
  task :get_file_from, [:url, :path] do |task, args|
    url = args[:url]
    path = args[:path]
    require "open-uri"
    file_contents = open(url).read
    format_file = File.open(path, File::RDWR|File::CREAT)
    format_file.seek(0)
    format_file.write(file_contents)
    puts "Updated file —— #{path}"
  end

  desc "Update files in app to match the template files currently in firstdraft/appdev_template"
  task :sync_file, [:file] do |task, args|
    p filename = args[:file]
    p args
    base_url = "https://raw.githubusercontent.com/firstdraft/appdev_template/master/files/"
    require "open-uri"
    new_contents = open(base_url + filename).read
    p "------"
    p new_contents
    
  end
  task :update do
    files = {
      ".pryrc" => ".pryrc",
      ".gitpod.yml" => ".gitpod.yml",
      "Procfile" => "Procfile",
      "json_output_formatter.rb" => "spec/support/json_output_formatter.rb",
      "nicer_errors.rb" => "config/initializers/nicer_errors.rb",
      "rails_db.rb" => "config/initializers.rails_db.rb",
      "settings.json" => ".theia/settings.json",
      "server" => "bin/server",
      "puma.rb" => "config/puma.rb"
    }

    base_url = "https://raw.githubusercontent.com/firstdraft/appdev_template/master/files/"
    require "open-uri"
    files.keys.each do |filename|
      new_contents = open(base_url + filename).read
      path = files[filename]
      if File.exists?(path)
        current = open(path).read
        p new_contents == path
      else
        p "no file yet"
      end
      # format_file = File.open(path, File::RDWR)
      # format_file.seek(0)
      # format_file.write(new_content)
    end
  end

end
