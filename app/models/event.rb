class Event < ApplicationRecord
    
    validates :name, :location, presence: true
    
    validates :description, length: {minimum: 50}
    
    validates :price, numericality: {greater_than_or_equal_to: 0}
    
    validates :capacity, numericality: {only_integer: true, greater_than: 0}
    
    has_many :registrations, dependent: :destroy
    
    # Define price as free
    def free?
        price.blank? || price.zero?
    end
    
    # Number of tickets available
    def tickets_available
        capacity - registrations.size
    end
    
    # Define Sold Out
    def sold_out?
        tickets_available.zero?
    end
    
    # Display upcoming events
    def self.upcoming
        where('starts_at >= ?', Time.now).order('starts_at')
    end 
    
    # Display most registered events
    def self.popular
    end
end