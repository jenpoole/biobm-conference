require "elasticsearch/model"

class Event < ApplicationRecord
    
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks
    
    validates :name, :location, presence: true
    
    validates :description, length: {minimum: 50}
    
    validates :price, numericality: {greater_than_or_equal_to: 0}
    
    validates :capacity, numericality: {only_integer: true, greater_than: 0}
    
    has_many :registrations, dependent: :destroy
    
    belongs_to :user
    
    # Carrierwave image uploader
    mount_uploader :image, ImageUploader
    
    validate :image_size
    
    # Define price as free
    def free?
        price.blank? || price.zero?
    end
    
    # Number of spots available 
    def spots_available
        capacity - registrations.size
    end
    
    # Define Sold Out
    def sold_out?
        spots_available.zero?
    end
    
    # Display upcoming events
    def self.upcoming
        where('starts_at >= ?', Time.now).order('starts_at')
    end 
    
    # Display most registered events
    def self.popular
    end
    
    # Define event_ended
    def event_ended?
    end
    
    
    private
    
        def image_size
            if image.size > 5.megabytes
                errors.add(:image, "Image should be less than 5MB")
            end
        end
end

Event.__elasticsearch__.create_index!