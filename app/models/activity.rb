class Activity
  def self.service(key)
    @service = StravaService.new(key)
  end

  def self.all(key)
    service(key).activities.map do |activity|
      _build_object(activity)
    end
  end

  def self._build_object(data)
    activity = OpenStruct.new(data)
    activity.name = data["name"]
    activity.start_date = Time.new(data["start_date"][0..3],
                                   data["start_date"][5..6],
                                   data["start_date"][8..9])
    activity.raw_time = data['elapsed_time']
    activity.elapsed_time = "#{data['elapsed_time'] / 3600}h #{(data['elapsed_time'] / 60) % 60}m"
    activity.distance = (data["distance"] / 1000).round(1)
    activity.recent = true if activity.start_date > Time.now - 7.days
    activity
  end
end
