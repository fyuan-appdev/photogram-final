# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  comments_count  :integer
#  email           :string
#  likes_count     :integer
#  password_digest :string
#  private         :boolean
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  def own_photos
    my_id = self.id

    matching_photos = Photo.where({ :owner_id => my_id })

    return matching_photos
  end

  def requests_sent
    my_id = self.id

    sending_requests = FollowRequest.where({ :sender_id => my_id })
    
    return sending_requests
  end

  def requests_received
    my_id = self.id
    receiving_requests = FollowRequest.where({ :recipient_id => my_id })
    return receiving_requests
  end

end
