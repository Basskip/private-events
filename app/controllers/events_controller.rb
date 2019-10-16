class EventsController < ApplicationController

    def new
        if session[:user_id]
            @event = Event.new
        else
            flash[:error] = "Please sign in to create an event"
            redirect_to signin_url
        end
    end

    def create
        user = User.find(session[:user_id])
        @event = user.hosted_events.build(event_params)
        if @event.save
            redirect_to event_path(@event)
        else
            flash.now[:error] = "Invalid event params"
            render 'new'
        end
    end

    def show
        @event = Event.find(params[:id])
    end

    def index
        @upcoming_events = Event.upcoming
        @past_events = Event.past
    end

    private

    def event_params
        params.require(:event).permit(:title, :location)
    end
end
