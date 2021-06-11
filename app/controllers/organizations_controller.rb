class OrganizationsController < ApplicationController
  before_action :find_organization,
                only: %i[appropriations info events edit update destroy]
  before_action :authenticate_user!, except: [:show]
  before_action :find_event, only: [:publish, :pending]

  def show
    @organization = Organization.friendly.find(params[:id])
  end

  def info; end

  def events
    @events =
      Organization.find(params[:id]).events.all.includes(:tickets).sort.reverse
  end

  def appropriations; end

  def new
    @organization = Organization.new
  end

  def create
    @organization = current_user.organizations.new(organization_params)

    if @organization.save
      redirect_to info_organization_path(@organization.id), notice: '創建成功！'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @organization.update(organization_params)
      redirect_to info_organization_path(@organization),
                  notice: '資料更新成功！'
    else
      render :edit
    end
  end

  def destroy
    @organization.slug = @organization.id
    @organization.save
    @organization.destroy
    redirect_to root_path, notice: '組織刪除成功！'
  end

  def publish
    @event.update(status: '已發佈')
    redirect_to events_organization_path(params[:organization_id]),
                notice: '活動發佈成功！'
  end

  def pending
    @event.update(status: '待發佈')
    redirect_to events_organization_path(params[:organization_id]),
                notice: '活動暫停發布！'
  end

  private

  def find_organization
    @organization = current_user.organizations.friendly.find(params[:id])
  end

  def find_event
    @event = Event.find_by(id: params[:id])
  end

  def organization_params
    params
      .require(:organization)
      .permit(
        :title,
        :description,
        :domain_name,
        :image,
        :e_mail,
        :facebook,
        :twitter,
        :flickr,
        :web,
      )
  end
end
