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
  	@my_task= Task.find(params[:id].to_i)
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

  def mark_complete
  	@my_task= Task.find(params[:id].to_i)

  	unless (@my_task.completed_at != nil) || (@my_task.completed?)
  		@my_task.completed_at = Time.now 
  		@my_task.save
  	end
  	
  	redirect_to '/'
  end

  def update
  	@my_task= Task.find(params[:id].to_i)
    @my_task.title = params[:task][:title]
    @my_task.description = params[:task][:description]
    @my_task.completed_at = params[:task][:completed_at]
    @my_task.save

  	redirect_to '/'
  end

  def destroy
  	Task.find(params[:id].to_i).destroy
  	redirect_to  '/'
  end

  #only need this method because not using database yet
end
