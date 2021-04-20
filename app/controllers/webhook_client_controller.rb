class WebhookClientController < ApplicationController
  before_action :set_client, only: [:edit, :update, :destroy]

  # GET /webhooks
  def index
    @clients = WebhookClient.all
  end

  # GET /webhooks/new
  def new
    @client = WebhookClient.new
  end

  # POST /webhooks
  def create
    par = webhook_client_params
    par[:events] = par[:events].split(',')

    @client = WebhookClient.new(par)
    respond_to do |format|
      if @client.save
        format.html { redirect_to action: 'index', notice: "Webhook was successfully created." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # GET /webhooks/:id/edit
  def edit
  end

  # PATCH /webhooks/:id
  def update
    par = webhook_client_params
    par[:events] = par[:events].split(',')
    respond_to do |format|
      if @client.update(par)
        format.html { redirect_to action: 'index', notice: "Webhook was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /webhooks/:id
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to action: 'index', notice: "Webhook was successfully destroyed." }
    end
  end

  private 
    def set_client
      @client = WebhookClient.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render_404
    end

    def webhook_client_params
      params.require(:webhook_client).permit(:target_url, :events)
    end
end
