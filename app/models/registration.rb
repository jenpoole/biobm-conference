class Registration < ApplicationRecord
    
    validates :first_name, :last_name, presence: true
    
    validates :email, format: { with: /(\S+)@(\S+)/ }
    
    POSITION_OPTIONS = [
        'Student',
        'Scientist',
        'Marketer',
        'Exhibitor',
        'Media'
    ]
    validates :position, inclusion: { in: POSITION_OPTIONS }
    
    EXPERIENCE_OPTIONS = [
        'Student',
        'Entry Level',
        '2-9 Years of Professional Experience',
        '9+ Years of Professional Experience',
        'Management',
        'Executive'
    ]
    validates :experience, inclusion: { in: EXPERIENCE_OPTIONS }
    
    HOW_HEARD_OPTIONS = [
        'Facebook',
        'Twitter',
        'Company Website',
        'Google Search',
        'Friend / Coworker',
        'Other'
    ]
    validates :how_heard, inclusion: { in: HOW_HEARD_OPTIONS }
    
    JOIN_EMAIL_LIST_OPTIONS = [
        'Yes',
        'No'
    ]
    validates :join_email_list, inclusion: { in: JOIN_EMAIL_LIST_OPTIONS }
    
    
    belongs_to :event
    
end
