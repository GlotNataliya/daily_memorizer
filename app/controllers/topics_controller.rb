class TopicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_topic, only: %i[show edit update destroy]
  before_action :set_search

  # GET /topics or /topics.json
  def index
    @q = current_user.topics.ransack(params[:q])
    @topics = @q.result(distinct: true).order(:title)
  end

  # GET /topics/1 or /topics/1.json
  def show; end

  # GET /topics/new
  def new
    @topic = current_user.topics.build
  end

  # GET /topics/1/edit
  def edit; end

  # POST /topics or /topics.json
  def create
    @topic = current_user.topics.build(topic_params)

    respond_to do |format|
      if @topic.save
        format.turbo_stream
        format.html { redirect_to topic_url(@topic) }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /topics/1 or /topics/1.json
  def update
    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to topic_url(@topic) }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1 or /topics/1.json
  def destroy
    @topic.destroy

    respond_to do |format|
      format.html { redirect_to topics_url }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_topic
    @topic = current_user.topics.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def topic_params
    params.require(:topic).permit(:title_cont, :title, :description)
  end
end
