class DailyBalance < ActiveRecord::Base
  belongs_to :user

  def self.update_balance
  	User.user.all.each do |user|
  		food = FoodExpenditure.where("user_id= ? and created_at >= ? and created_at <= ?",user.id,Date.yesterday.beginning_of_day,Date.yesterday.end_of_day).map(&:payment).sum
  		extra = ExtraExpenditure.where("user_id= ? and created_at >= ? and created_at <= ?",user.id,Date.yesterday.beginning_of_day,Date.yesterday.end_of_day).map(&:payment).sum
  		hotel = HotelExpenditure.where("user_id= ? and created_at >= ? and created_at <= ?",user.id,Date.yesterday.beginning_of_day,Date.yesterday.end_of_day).map(&:total_amount).sum
  		transport = TransportExpenditure.where("user_id= ? and created_at >= ? and created_at <= ?",user.id,Date.yesterday.beginning_of_day,Date.yesterday.end_of_day).map(&:payment).sum
  		total_expense = food+hotel+extra+transport
      user_balance = UserBalance.where("user_id= ? and created_at >= ? and created_at <= ?",user.id,Date.yesterday.beginning_of_day,Date.yesterday.end_of_day).map(&:amount).sum 
  	  daily_balance = DailyBalance.where("created_at >= ? and created_at <= ? and user_id = ?",Date.yesterday.beginning_of_day,Date.yesterday.end_of_day,user.id)

      if daily_balance.count > 0
        
        opening_balance = daily_balance.first.opening_balance
        closing_balance = (opening_balance - total_expense) + user_balance
        daily_balance.last.update_attributes(:closing_balance=>closing_balance,:expense=>total_expense,:balance_added=>user_balance)
        DailyBalance.create(:opening_balance=>closing_balance,:user_id=>user.id)
      else
        DailyBalance.create(:opening_balance=>user.current_amount,:user_id=>user.id)
      end

    end
  end
end


