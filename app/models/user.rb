class User < ActiveRecord::Base
  has_many :links
  has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def own?(link)
  	self.links.include?(link) || self.comments.include?(link)
  end

end
