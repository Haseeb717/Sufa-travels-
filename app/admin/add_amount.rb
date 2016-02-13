ActiveAdmin.register_page "Add Amount" do

  content do
  	columns do
			column min_width: "45%" do
		    panel "Recent Donations made by users" do
		      ul do
		        FoodExpenditure.where(:edit_request=>true).limit(5).map do |user|
		          
		          li user.hotel_name
		        end
		      end
		    end
		  end	
		end
  end

end