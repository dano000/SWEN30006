require('json')

class Post < ActiveRecord::Base

  belongs_to :category

  def to_json
    if (self.category == nil)
      sub_hash = nil
    else
      sub_hash = {"name" => self.category.name, "description" => self.category.description}
    end
    main_hash = {"title"=> self.title, "body"=> self.body, "category" => sub_hash}
    return main_hash.to_json
  end

end
