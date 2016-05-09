class ExtraExpenditure < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image, styles: { small: "64x64>", med: "100x100>",small_large: "200x200>" ,original: "250x250>", extra_large: "500x500>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  enum extra_type: [:Mobile,:Dau_Al_Madina,:Other]

  def update_user_accounts(user)
  	total_expenditure = self.payment + user.total_expenditures_amount
  	current_amount = user.current_amount - self.payment
    user.update_attributes(:total_expenditures_amount=>total_expenditure,:current_amount=>current_amount)
  end
end
