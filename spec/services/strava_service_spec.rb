RSpec.describe StravaService, :type => :service  do
    @service = StravaService.new(ENV["STRAVA_PERSONAL"])
end
