class SchoolsController < ApplicationController

  before_action :set_todo, only: [:show, :update, :destroy]

  # GET /todos
  def index
    @schools = School.all
    render json: @schools
  end

  # POST /todos
  def create
    @schools = School.create!(todo_params)
    render json: @schools
  end

  # GET /todos/:id
  def show
    render json: @school
  end

  # PUT /todos/:id
  def update
    @school.update(todo_params)
    head :no_content
  end

  # DELETE /todos/:id
  def destroy
    @school.destroy
    head :no_content
  end

  private

  def todo_params
    # whitelist params
    params.permit(:name)
  end

  def set_todo
    @school = School.find(params[:id])
  end

end
