# frozen_string_literal: true

# Exposes API for interacting with Tasks.
class TasksController < ApplicationController
  before_action :find_project
  before_action :find_task, only: %i[show update destroy]

  def index
    render json: Task::IndexService.new(project: @project).run
  end

  def create
    render json: Task::CreateService.new(project: @project, params: task_params).run
  rescue Task::CreateService::Error => e
    render json: { errors: JSON.parse(e.message) }, status: :unprocessable_entity
  end

  def show
    render json: Task::ShowService.new(task: @task).run
  end

  def update
    render json: Task::UpdateService.new(task: @task, params: task_params).run
  rescue Task::UpdateService::Error => e
    render json: { errors: JSON.parse(e.message) }, status: :unprocessable_entity
  end

  def destroy
    Task::DestroyService.new(task: @task).run
    head :ok
  end

  private

  def find_project
    @project = Project.find(params[:project_id])
  end

  def find_task
    @task = @project.tasks.find(params[:id])
  end

  def task_params
    params.permit(:name, :description)
  end
end
