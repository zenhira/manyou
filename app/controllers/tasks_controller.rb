class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user

  def index
    if params[:sort_deadline]
      @tasks = Task.all.order(deadline: "ASC").page(params[:page]).per(5)
    elsif params[:title] && params[:status]
      puts 'wwwwwwwwwwwwwwwwwwwwwwwwwwww'
      @status = params[:status].to_i
      @tasks = Task.serch_title(params[:title]).serch_status(@status).page(params[:page]).per(5)
    elsif params[:sort_priority]
      @tasks = Task.all.order(priority: "ASC").page(params[:page]).per(5)
    else
    @tasks = Task.all.order(created_at: "DESC").page(params[:page]).per(5)
    end

    @tasks = @tasks.user_scope(current_user.id)
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
    params.require(:task).permit(:title, :detaile, :status, :priority, :deadline)
  end
end
