class HotelExpenditure < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image, styles: { small: "64x64", med: "100x100", original: "250x250"}
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  enum room_type: [:D_standard,:Dsuprier,:D_classic,:D_suprier_HV,:D_Delux,:D_Delux_HV,:D_Twin_room,:D_PartiaL_HV,:D_Kaaba_View,:T_standard,:T_suprier,:T_classic,:T_suprier_HV,:T_Delux,:T_Delux_HV,:T_PartiaL_HV,:T_Kaaba_View,:Q_standard,:Q_suprier,:Q_classic,:Q_suprier_HV,:Q_Delux,:Q_Delux_HV,:Q_PartiaL_HV,:Q_Kaaba_View]
  enum room_basis: [:R_B,:B_B]
  before_save :set_columns

  def set_columns
  	self.total_days = (self.checked_out_date - self.checked_in_date).to_i/86400 + 1
  	self.total_amount = self.total_days * self.charges_per_day
  end

  def update_user_accounts(user)
    total_expenditure = self.total_amount + user.total_expenditures_amount
    current_amount = user.current_amount - self.total_amount
    user.update_attributes(:total_expenditures_amount=>total_expenditure,:current_amount=>current_amount)
  end

end
