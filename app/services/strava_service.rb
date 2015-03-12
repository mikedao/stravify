class StravaService
  attr_reader :connection

  def initialize(key)
    header_key = "Bearer #{key}"
    @connection = Faraday.new(url: "https://www.strava.com/api/v3")
    @connection.headers = {'Authorization' => header_key}
  end

  def activities
    parse(connection.get("athlete/activities"))
  end

  private

  def parse(response)
    JSON.parse(response.body)
  end
end
