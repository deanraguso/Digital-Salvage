class InboxesController < ApplicationController
  before_action :set_inbox, only: %i[ show edit update destroy ]

  # GET /inboxes or /inboxes.json
  def index
    @inboxes = Inbox.all
  end

  # GET /inboxes/1 or /inboxes/1.json
  def show
    @message = Message.new()
  end

  # GET /inboxes/new
  def new
    @inbox = Inbox.new
  end

  # GET /inboxes/1/edit
  def edit
  end

  # POST /message
  def message_create
    @message = current_user.messages.new(message_params)
    respond_to do |format|
      if @message.save
        format.html { redirect_to inbox_path(params[:id]), notice: "message was successfully created." }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /inboxes or /inboxes.json
  def create
    @inbox = Inbox.new(inbox_params)

    respond_to do |format|
      if @inbox.save
        format.html { redirect_to @inbox, notice: "Inbox was successfully created." }
        format.json { render :show, status: :created, location: @inbox }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @inbox.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inboxes/1 or /inboxes/1.json
  def update
    respond_to do |format|
      if @inbox.update(inbox_params)
        format.html { redirect_to @inbox, notice: "Inbox was successfully updated." }
        format.json { render :show, status: :ok, location: @inbox }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @inbox.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inboxes/1 or /inboxes/1.json
  def destroy
    @inbox.destroy
    respond_to do |format|
      format.html { redirect_to inboxes_url, notice: "Inbox was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inbox
      @inbox = Inbox.includes(:messages).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def inbox_params
      params.fetch(:inbox, {})
    end

    private

    def message_params
        params.require(:message).permit(:content).merge(inbox_id: params[:id])
    end
end
