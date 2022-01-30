class AbsenceApi
  def initialize(id, key)
    @id = id
    @key = key
  end

  def get_vacations
    request("POST", "/api/v2/absences")
  end

  def request(method, uri)
    Hawk::Client.authenticate(
         :credentials => {
           :id => @id,
           :key => @key,
           :algorithm => "sha256"
         },
         :method => method,
         :request_uri => uri,
         :host => "app.absence.io",
         :port => 80,
         :content_type => "text/plain",
      )
  end
end
