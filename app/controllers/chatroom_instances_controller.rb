class ChatroomInstancesController < ApplicationController
  before_action :set_chatroom_instance, only: %i[ show edit update destroy ]

  # GET /chatroom_instances or /chatroom_instances.json
  def index
    @chatroom_instances = ChatroomInstance.all
  end

  # GET /chatroom_instances/1 or /chatroom_instances/1.json
  def show
    gon.chatroom = @chatroom_instance.as_json(include: { messages: { methods: :formated_created_at, include: :user } })
    gon.current_user = current_user
    gon.form_url = messages_path
    @message = Message.new
  end

  # GET /chatroom_instances/new
  def new
    @chatroom_instance = ChatroomInstance.new
  end

  # GET /chatroom_instances/1/edit
  def edit
  end

  # POST /chatroom_instances or /chatroom_instances.json
  def create
    @chatroom_instance = ChatroomInstance.new(chatroom_instance_params)

    respond_to do |format|
      if @chatroom_instance.save
        format.html { redirect_to @chatroom_instance, notice: "Chatroom instance was successfully created." }
        format.json { render :show, status: :created, location: @chatroom_instance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chatroom_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chatroom_instances/1 or /chatroom_instances/1.json
  def update
    respond_to do |format|
      if @chatroom_instance.update(chatroom_instance_params)
        format.html { redirect_to @chatroom_instance, notice: "Chatroom instance was successfully updated." }
        format.json { render :show, status: :ok, location: @chatroom_instance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chatroom_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chatroom_instances/1 or /chatroom_instances/1.json
  def destroy
    @chatroom_instance.destroy
    respond_to do |format|
      format.html { redirect_to chatroom_instances_url, notice: "Chatroom instance was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chatroom_instance
      @chatroom_instance = ChatroomInstance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def chatroom_instance_params
      params.require(:chatroom_instance).permit(:name)
    end
end
