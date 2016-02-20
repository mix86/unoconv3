class UnoconvApp
  def call(env)
    request = Rack::Request.new env

    if request.POST.size > 0
      source = request.params["file"]

      source_path = source[:tempfile].path
      pdf_path = "#{source_path.split('.').first}.pdf"

      `/usr/bin/unoconv -f pdf #{source_path} -o #{pdf_path}`

      pdf = File.new(pdf_path, 'rb')

      [200, {}, pdf]
    else
      [404, {}, "not found"]
    end
  end
end
