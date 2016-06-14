class Belt < ActiveRecord::Base
  belongs_to :owner, class_name: "User"

  # has_many :tags


  # def tags_list
  #   tags.join(",")
  # end

  # def tags_list=(input_tags)
  #   temp_tags = input_tags.split(",")

  #   # disassociate deleted tags (remove join record)
  #   tags.each do |tag|
  #     if !temp_tags.include? tag.text
  #       tags.delete(tag)
  #     end
  #   end

  #   # find or create new tags, and associate it with belt (create join record)
  #   temp_tags.each do |temp_tag|
  #     tag = Tag.find_or_create_by(text: temp_tag)
  #     if !tags.include? tag
  #       tags << tag
  #     end
  #   end
  # end
end




# <input type="text" name="belt[tags_list]">

# value = "brown,dyed,giant buckle,magical"