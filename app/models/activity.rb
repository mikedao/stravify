class Activity
  def initialize(raw_activities)
    @raw_activities = raw_activities
  end

  def all
    @activities ||= @raw_activities.map do |activity|
      build_object(activity)
    end
  end

  def recent
    @recent ||= all.select(&:recent)
  end

  def time_ridden
    @time_ridden ||= recent.map(&:raw_time).inject(0, :+)
  end

  def distance_ridden
    @distance_ridden ||= recent.map(&:distance).inject(0, :+)
  end

  private

  attr_reader :service

  def build_object(data)
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
