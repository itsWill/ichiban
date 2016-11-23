class TodosController < ApplicationController
  before_action :correct_user, only: [:index, :edit, :update]
  def index
    @todos = current_user.todos
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = current_user.todos.build(todo_params)
    if @todo.save
      redirect_to user_todos_path(current_user)
    else
      render 'new'
    end
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def destroy
    Todo.find(params[:id]).destroy
    redirect_to user_todos_path(current_user)
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update_attributes(todo_params)
      redirect_to user_todos_path(current_user)
    else
      render 'edit'
    end
  end

  private
    def todo_params
      params.require(:todo).permit(:status, :title, :description)
    end

    def correct_user
      redirect_to root_url unless User.find_by_id(params[:user_id]) == current_user
    end
end
