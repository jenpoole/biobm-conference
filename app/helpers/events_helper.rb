module EventsHelper
    
    # Format Event pricing
    def format_price(event)
        if event.free?
         "Free"   
        else
            number_to_currency(event.price)
        end    
    end
    
end
