class Statement < ActiveRecord::Base
  attr_accessible :content, :email_id

  belongs_to :email

  searchable do
    text :content
  end

  def target_id
  	self.email.id
  end

end
