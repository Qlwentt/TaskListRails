class TasksController < ApplicationController
  def index
  	@tasks=Task.all
  end

  def new
  	@my_task=Task.new
  end

  def create
  	@params = params
    @my_task=Task.new
    @my_task.title = params[:task][:title]
    @my_task.description = params[:task][:description]
    @my_task.completed_at = params[:task][:completed_at]
    @my_task.save
    redirect_to  '/'
  end

  def edit
  end

  def show
  	
  	@tasks=Task.all

    @my_task= Task.find(params[:id].to_i)
  	# @my_task = nil

   #  id = params[:id].to_i
   #  @id =id


   #  @tasks.each do |task|
   #    if task[:id] == id
   #      @my_task = task
   #    end
   #  end

    if @my_task == nil
      render :file => 'public/404.html', :status => :not_found, :layout => false
      # @mypost = { id: number, title: "Did not find", body: ""}
    end

  end

  def update
  end

  def destroy
  end

  #only need this method because not using database yet
end
