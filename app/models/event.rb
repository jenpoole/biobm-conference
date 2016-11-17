class Event < ApplicationRecord
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
