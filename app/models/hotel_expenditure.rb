class HotelExpenditure < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image, styles: { small: "64x64", med: "100x100", original: "250x250"}
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  enum d_room_type: [:D_standard,:D_suprier,:D_classic,:D_suprier_HV,:D_Delux,:D_Delux_HV,:D_Twin_room,:D_PartiaL_HV,:D_Kaaba_View,:Selective_Beds]
  enum room_basis: [:B_B,:R_O,:H_B,:F_B]
  enum q_room_type: [:Q_standard,:Q_suprier,:Q_classic,:Q_suprier_HV,:Q_Delux,:Q_Delux_HV,:Q_PartiaL_HV,:Q_Kaaba_View,:Selective_beds]
  enum t_room_type: [:T_standard,:T_suprier,:T_classic,:T_suprier_HV,:T_Delux,:T_Delux_HV,:T_PartiaL_HV,:T_Kaaba_View,:Selective_Bed]
  before_save :set_columns

  def set_columns
  	self.total_days = (self.checked_out_date - self.checked_in_date).to_i/86400 + 1
  end

  def update_rooms
    d_room_total = self.d_rooms * self.charge_d_room
    t_room_total = self.t_rooms * self.charge_t_room
    q_room_total = self.q_rooms * self.charge_q_room
    total_charges = d_room_total + t_room_total + q_room_total
    total_rooms = self.d_rooms + self.t_rooms + self.d_rooms
    self.update_columns(:no_of_rooms=>total_rooms,:total_amount=>total_charges)
  end

  def update_user_accounts(user)
    total_expenditure = self.total_amount + user.total_expenditures_amount
    current_amount = user.current_amount - self.total_amount

    user.update_attributes(:total_expenditures_amount=>total_expenditure,:current_amount=>current_amount)

  end

end
