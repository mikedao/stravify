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
    OpenStruct.new(data)
  end

end
