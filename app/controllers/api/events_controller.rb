class Api::EventsController < ApplicationController
    respond_to :json
    def index
        respond_with Event.order(event_date: :DESC)
    end
    
    def show
        respond_with find_event
    end
    
    def create
        respond_with Event.create(event_params)
    end
    
    def update
        event = find_event
        event.update(event_params)
        respond_with Event, json: event
    end
    
    def destroy
        respond_with Event.destroy(params[:id])
    end

    private
    def find_event
        Event.find(params[:id])
    end
    def event_params
        params.require(:event).permit(
            :id,
            :event_type,
            :event_date,
            :title,
            :speaker,
            :host,
            :published
        )
    end
end
