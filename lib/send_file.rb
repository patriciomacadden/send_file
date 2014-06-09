module SendFile
  def send_file(path)
    file = Rack::File.new(nil)
    file.path = path

    return halt(file.serving(env))
  end
end
