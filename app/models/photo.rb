# == Schema Information
#
# Table name: photos
#
#  id             :integer          not null, primary key
#  caption        :text
#  comments_count :integer
#  image          :string
#  likes_count    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  owner_id       :integer
#
class Photo < ApplicationRecord
  def poster
    my_owner_id = self.owner_id
    matching_users = User.where({ :id => my_owner_id })
    the_user = matching_users.at(0)
    return the_user
  end
  
  def comments
    my_id = self.id
    matching_comments = Comment.where({ :photo_id => my_id })
    return matching_comments
  end

  def fans
    my_id = self.id
    fans = Like.where({ :photo_id => my_id})
    return fans
  end



end
