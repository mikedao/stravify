class User < ActiveRecord::Base
  def self.find_or_create_from_auth(auth)
    user = User.find_or_create_by(provider: auth.provider, uid: auth.uid)

    user.first_name = auth.info.first_name
    user.last_name = auth.info.last_name
    user.email = auth.info.email
    user.city = auth.extra.raw_info.city
    user.state = auth.extra.raw_info.state
    user.country = auth.extra.raw_info.country
    user.profile = auth.extra.raw_info.profile
    user.token = auth.credentials.token
    user.sex = auth.extra.raw_info.sex
    user.ftp = auth.extra.raw_info.ftp

    user.save
    user
  end

  def api_data
    { ftp: ftp, time: time_ridden, distance: distance_ridden }
  end
end
