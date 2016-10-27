class TasksController < ApplicationController
  def index
    @this_user_id=session[:user_id]
  	@tasks=Task.where(user_id: session[:user_id])
    puts @tasks.inspect
  end

  def new
  	@my_task=Task.new
    #@my_task.user_id=session[:user_id]
    @path="create"
  end

  def create
    @this_user_id=session[:user_id]
    return redirect_to '/' unless @this_user_id
  	@params = params
    @my_task=Task.new
    @my_task.title = params[:task][:title]
    @my_task.description = params[:task][:description]
    @my_task.completed_at = params[:task][:completed_at]
    @my_task.user_id= @this_user_id
    @my_task.save
    redirect_to  '/'
  end

  def edit
    @this_user_id=session[:user_id]
  	@my_task= Task.find(params[:id].to_i)
    @path="update"
  end

  def show
  	@this_user_id=session[:user_id]
    return redirect_to '/' unless @this_user_id

    @tasks=Task.where(user_id: @this_user_id)

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
    @this_user_id=session[:user_id]
  	@my_task= Task.find(params[:id].to_i)
    @my_task.title = params[:task][:title]
    @my_task.description = params[:task][:description]
    @my_task.completed_at = params[:task][:completed_at]
    @my_task.user_id= @this_user_id
    @my_task.save

  	redirect_to '/'
  end

  def destroy
  	Task.find(params[:id].to_i).destroy
  	redirect_to  '/'
  end 

end
