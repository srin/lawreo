ActiveAdmin.register Question do

permit_params :title, :description, :user_id, :category_id, :tally, :anonymous


end
