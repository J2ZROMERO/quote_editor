class User < ApplicationRecord
  belongs_to :company
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :validatable
  belongs_to :company

  def name
    email.split("@").first.capitalize
  end

  def companies 
 company
  end


end
