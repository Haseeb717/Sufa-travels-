class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :extra_expenditures
  has_many :food_expenditures
  has_many :hotel_expenditures
  has_many :transport_expenditures
  has_many :user_balances

  enum role: [:user, :super_admin, :admin,:ceo]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end
  
  has_attached_file :image, styles: { small: "64x64", med: "100x100",small_large: "200x200>" , large: "250x250" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
