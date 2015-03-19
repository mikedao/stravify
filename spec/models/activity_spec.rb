require 'spec_helper'
RSpec.describe Activity do
  def activities_for(overrides)
    raw_activities = overrides.map do |override|
      {'name'         => 'a',
       'start_date'   => Date.today.strftime('%Y %m %d'),
       'elapsed_time' => 100,
       'distance'     => 100,
      }.merge(override)
    end
    Activity.new(raw_activities)
  end

  it 'calculates the distance ridden as the sum of the activities distances' do
    activity = activities_for [{'distance' => 19000}, {'distance' => 1000}]
    expect(activity.distance_ridden).to eq 20
  end
end

