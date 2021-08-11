class TasksController < ApplicationController
  before_action :set_task, only: [:show, :update, :destroy]
  before_action :find_user
  before_action :find_list, only: [:index, :show, :update, :destroy]

  # GET /tasks
  def index
    if decoded_token[0]["user_id"] == @user.id
      if @list.present?
        @tasks = @list.tasks
        render json: @tasks
      else
        render json: {error: "Tasks do not exist within any of your lists."}, status: :unauthorized
      end
    else
      render json: {error: "You do not have access to view other user's tasks."}, status: :unauthorized
    end
  end

   # GET /tasks/1
  def show
    if decoded_token[0]["user_id"] == @user.id && @list.user_id == @user.id && @list.present?
      if @task.present? && @task.list_id == @list.id
        render json: @task
      else
        render json: {error: "That task does not exist or belong to you."}, status: :unauthorized
      end
    else
      render json: {error: "You do not have access to view other user's tasks."}, status: :unauthorized
    end
  end

  # POST /tasks
  def create
    if decoded_token[0]["user_id"] == @user.id 
      @list = @user.lists.find_by(id: params[:list_id])
      @task = Task.new(task_params)
      @task.list_id = @list.id
      @task.save
        if @task.save
          render json: @task, status: :created, location: @task
        else
          render json: @task.errors, status: :unprocessable_entity
        end
    else
      render json: {error: "You do not have permission to create Tasks"}, status: :unauthorized
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if decoded_token[0]["user_id"] == @user.id && @list.user_id == @user.id && @list.present?
      @task.update(task_params)
      if @task.update(task_params) && @task.present? && @task.list_id == @list.id
        render json: {notice: "Task was successfully updated." }, status: :ok
      else
        render json: {error: "Action was unsuccessful in updating Task."}, status: :unauthorized
      end
    else 
      render json: {error: "You do not have access to update other user's Tasks."}, status: :unauthorized
    end
  end

  # DELETE /tasks/1
  def destroy
    if decoded_token[0]["user_id"] == @user.id && @list.user_id == @user.id && @list.present?
      if @task.present? && @task.list_id == @list.id
        @task.destroy
        render json: {notice: "Task was successfully deleted." }, status: :ok
      else
        render json: {error: "Action was unsuccessful in updating Task."}, status: :unauthorized
      end
    else 
      render json: {error: "You do not have access to delete other user's Tasks."}, status: :unauthorized
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.permit(:title, :description, :priority, :completed)
    end

    def find_user
      @user = User.find_by(username: params[:username])
    end

    def find_list
      @list = @user.lists.find_by(id: params[:list_id])
    end
end
