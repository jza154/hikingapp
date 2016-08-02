class EventsController < InheritedResources::Base
      before_action :authenticate_user!
      before_action :event_owner, only: [:edit, :update, :destroy]
      # before_action :set_post, only: [:show, :edit, :update, :destroy]
      
    def index 
        @events= Event.all
        @events_by_date = Event.all.group_by {|i| i.date}
        @date = params[:date] ? Date.parse(params[:date]) :Date.today
        
    end
    
    def create
      @events = Event.new(event_params)
      @events.user_id = current_user.id
      respond_to do |format|
      if @events.save
        format.html { redirect_to @events, notice: 'Dog was successfully created.' }
        format.json { render :show, status: :created, location: @events }
      else
        format.html { render :new }
        format.json { render json: @events.errors, status: :unprocessable_entity }
      end
    end
    end


  private

    def event_params
      params.require(:event).permit(:event_name, :desription, :date, :location, :time)
    end
    
    
    # def set_event
      
    # end
    
    def event_owner
      @events = Event.find(params[:id])
     unless @events.user_id == current_user.id
      flash[:notice] = 'Access denied as you are not the manger of this Event'
      redirect_to event_path(@events)
     end
    end
    
end