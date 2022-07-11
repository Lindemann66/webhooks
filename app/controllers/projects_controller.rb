# frozen_string_literal: true

# Exposes API for interacting with Projects.
class ProjectsController < ApplicationController
  before_action :find_organization
  before_action :find_project, only: %i[show update destroy]

  def index
    render json: Project::IndexService.new(organization: @organization).run
  end

  def create
    render json: Project::CreateService.new(organization: @organization, params: project_params).run
  rescue Project::CreateService::Error => e
    render json: { errors: JSON.parse(e.message) }, status: :unprocessable_entity
  end

  def show
    render json: Project::ShowService.new(project: @project).run
  end

  def update
    render json: Project::UpdateService.new(project: @project, params: project_params).run
  rescue Project::UpdateService::Error => e
    render json: { errors: JSON.parse(e.message) }, status: :unprocessable_entity
  end

  def destroy
    Project::DestroyService.new(project: @project).run
    head :ok
  end

  private

  def find_organization
    @organization = Organization.find(params[:organization_id])
  end

  def find_project
    @project = @organization.projects.find(params[:id])
  end

  def project_params
    params.permit(:name)
  end
end
