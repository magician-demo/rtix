class OrganizationsController < ApplicationController
  before_action :find_organization, only: [:show, :edit, :update, :destroy]
  before_action :check_user!

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

    # respond_to do |format|
    #   if @organization.save
    #     format.html { redirect_to @organization, notice: "組織建立成功！" }
    #     format.json { render :show, status: :created, location: @organization }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @organization.errors, status: :unprocessable_entity }
    #   end
    # end
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
    redirect_to organizations_path, notice: "刪除成功！" 
  end

  private
    def find_organization
      @organization = current_user.organizations.find(params[:id])
    end

    def organization_params
      params.require(:organization).permit(:title, :descraption)
    end
end
