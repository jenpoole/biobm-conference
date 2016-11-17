class Registration < ApplicationRecord
    
    validates :first_name, :last_name, presence: true
    
    validates :email, format: { with: /(\S+)@(\S+)/ }
    
    belongs_to :event
    
end
