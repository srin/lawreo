ActiveAdmin.register User do

permit_params :name, :email, :SRA_number, :verified, :is_solicitor, :industry, :image


end
