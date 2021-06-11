class EventsController < ApplicationController
  before_action :find_event, only: %i[show edit update destroy]

  def index
    @events =
      Event.available

    @organizations = current_user.organizations.all if user_signed_in?

    #每日精選
    
    @focusevent = 
      Event
        .where(start_time: Time.now..(Time.now + 7.days))
        .available

    @relaxevent = 
    Event
      .where("tag = ? or tag = ?", '美食', '戶外')
      .available

    @featureevent = 
    Event
      .where(tag: '演出')
      .available
      
  end

  def tag
    @events =
      Event
        .where(tag: params[:event_tag])
        .available
    @tag = params[:event_tag]
  end

  def contacts; end

  def show
    @tickets = Event.find(params[:id]).tickets.sample(5).sort
    @event = Event.find(params[:id])
  end

  def new
    @organization =
      current_user.organizations.find_by(id: params[:organization_id])
    @event = @organization.events.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to new_event_ticket_path(@event.id),
                  notice: '請接著繼續設定活動的票券'
    else
      render :new
    end
  end

  def edit
    @event = Event.find_by(id: params[:id])
    @organization = @event.organization
  end

  def update
    @event.update(event_params)
    redirect_to events_organization_path(@event.organization_id),
                notice: '活動資訊更新成功!'
  end

  def destroy
    @event.destroy
    redirect_to events_organization_path(params[:organization_id]),
                notice: '活動刪除成功！'
  end

  def search
    if params[:q].blank?
      redirect_to(root_path, alert: '請勿搜尋空白')
    else
      @events =
        Event
          .where(status: '已發佈')
          .ransack(title_or_description_cont: params[:q])
          .result(distinct: true)
      respond_to do |format|
        format.html { @results = @events.limit(5) }
        format.json { @events = @events.limit(5) }
      end
    end
  end

  private

  def event_params
    params
      .require(:event)
      .permit(
        :title,
        :description,
        :location,
        :start_time,
        :end_time,
        :address,
        :image,
        :organization_id,
        :seats_image,
        :latitude,
        :longitude,
        :tag,
      )
  end

  def find_event
    @event = current_event
  end
end
