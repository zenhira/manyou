class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user

  def index
    if params[:sort_deadline]
      @tasks = Task.all.order(deadline: "ASC").page(params[:page]).per(5)
    elsif params[:sort_priority]
      @tasks = Task.all.order(priority: "ASC").page(params[:page]).per(5)
    elsif params[:title] && params[:status] && params[:label_ids]
      puts "wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww"
      @status = params[:status].to_i
      @label_id = params[:label_ids]
      @tasl_labels = TaskLabel.where(label_id: @label_id).pluck(:task_id)
      @tasks = Task.search_label(@tasl_labels).page(params[:page]).per(15)
    elsif params[:title] && params[:status]
      puts "eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee"
      @status = params[:status].to_i
        @tasks = Task.where(user_id: current_user.id).serch_title(params[:title]).serch_status(@status).page(params[:page]).per(5)
    else
      puts "eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee"
      @tasks = Task.where(user_id: current_user.id).order(created_at: :desc).page(params[:page]).per(5)
    end
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:title, :detaile, :status, :priority, :deadline, label_ids: [] )
  end
end
