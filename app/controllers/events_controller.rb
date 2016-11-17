class EventsController < ApplicationController
    # Find event before actions
    before_action :find_event, only: [:show, :edit, :update, :destroy]
    
    def index
        @events = Event.all
    end
    
    def show
    end
    
    def edit
    end
    
    def update
        if @event.update(event_params)
            redirect_to event_path(@event), notice: 'Event successfully updated!'
        else
            render :edit
        end
    end
    
    def new
        @event = Event.new
    end
    
    def create
        @event = Event.new(event_params)
        
        if @event.save
            redirect_to event_path(@event), notice: 'Event successfully created!'
        else
            render :new
        end
    end
    
    def destroy 
        @event.destroy
        redirect_to events_url
    end
    
    private
    
        def find_event
            @event = Event.find(params[:id])
        end
        
        def event_params
             params.require(:event).permit(:name, :description, :location, :price, :starts_at, :capacity)
        end
end
