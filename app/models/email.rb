class Email < ActiveRecord::Base
  attr_accessible :author, :content, :ticket

  validates :content, :presence => true

  has_many :statements, :dependent => :destroy

  after_create :init_statements

  searchable do
    text :content
  end

  private
  def init_statements
  	return if self.content.blank?

  	self.content.split(".").compact.uniq.flatten.each do |record|
  		self.statements.create(:content => record.lstrip.rstrip)
  	end
  end


end
