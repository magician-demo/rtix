class OrganizationsController < ApplicationController
  before_action :find_organization, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show] 

  def index
    @organizations = current_user.organizations.all
  end

  def show
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = current_user.organizations.new(organization_params)

    if @organization.save
      redirect_to @organization, notice: "創建成功！"
    else
      render :new
    end
  end

  def update
    if @organization.update(organization_params)
      redirect_to @organization, notice: "資料更新成功！" 
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
    @organization.destroy
    redirect_to root_path, notice: "組織刪除成功！" 
  end

  private
    def find_organization
      @organization = current_user.organizations.friendly.find(params[:id])
    end

    def organization_params
      params.require(:organization).permit(:title, :description, :domain_name)
    end
end
