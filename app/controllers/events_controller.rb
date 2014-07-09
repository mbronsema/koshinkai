class EventsController < ApplicationController
respond_to :html, :json
  before_filter :authenticate_user!, except: [:index, :show]
  
	def index
		@events = Event.all
    #@eventss = Event.all.repeat
		#@event = Event.new
		respond_with @events
	end
  #hallo boys
	def show
		@event = Event.find(params[:id])
		respond_with @event
	end

	def new
		@event = Event.new
    authorize @event
	end

	def create
		@event = Event.new(event_params)
    authorize @event
		if @event.save
			redirect_to @event
		else
			render 'new'
		end
	end

	def edit 
		@event = Event.find(params[:id])
	end

	def update
		@event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event
    else
      render 'edit'
    end
	end

	def destroy
		@event = Event.find(params[:id])
		@event.destroy
		redirect_to events_path
	end

	private
	def event_params
		params.require(:event).permit(:title, :message, :starting_at, :ending_at, :repeat, :alteration)
	end
end