# frozen_string_literal: true

# Exposes API for interacting with Organizations.
class OrganizationsController < ApplicationController
  def show
    render json: Organization::ShowService.new(organization_id: params[:id]).run
  end
end
