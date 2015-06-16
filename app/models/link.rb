class Link < ActiveRecord::Base
	acts_as_votable
	belongs_to :user
	has_many :comments, dependent: :destroy
	validates_presence_of :url, :on => :create, :message => "Url can't be blank"
	validates_presence_of :title, :on => :create, :message => "Title can't be blank"

	
end
