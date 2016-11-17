class Event < ApplicationRecord
    
    validates :name, :location, presence: true
    
    validates :description, length: {minimum: 50}
    
    validates :price, numericality: {greater_than_or_equal_to: 0}
    
    validates :capacity, numericality: {only_integer: true, greater_than: 0}
    
    # Define price as free
    def free?
        price.blank? || price.zero?
    end
    
    # Display upcoming events
    def self.upcoming
        where('starts_at >= ?', Time.now).order('starts_at')
    end 
    
    # Display most registered events
    def self.popular
    end
end
