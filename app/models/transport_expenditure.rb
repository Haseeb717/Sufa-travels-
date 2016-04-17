class TransportExpenditure < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image, styles: { small: "64x64", med: "100x100", original: "250x250" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  enum transport_type: [:Bus,:Car_Ford,:Car_Camry,:Coaster,:Other]

  def update_user_accounts(user)
  	total_expenditure = self.payment + user.total_expenditures_amount
  	current_amount = user.current_amount - self.payment
    user.update_attributes(:total_expenditures_amount=>total_expenditure,:current_amount=>current_amount)
  end
  
end
