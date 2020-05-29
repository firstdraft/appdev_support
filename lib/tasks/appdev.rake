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

end
