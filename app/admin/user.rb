ActiveAdmin.register User do
permit_params :name,:email,:password

	form do |f|
	  f.inputs "Admin Details" do
	  	f.input :name
	    f.input :email
	    f.input :password
	  end
	  f.actions
	end

	index do
		selectable_column
	  id_column
	  column :name
	  column :email
	  actions
	end

  show do
    attributes_table do
      row :name
      row :email 
    end
  end

	filter :name
	filter :email

end
