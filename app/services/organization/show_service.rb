# frozen_string_literal: true

class Organization
  # Exposes preparation (here mostly serializing) for showing particular organization.
  class ShowService
    attr_reader :organization_id

    def initialize(options)
      @organization_id = options[:organization_id]
    end

    def run
      organization = Organization.find(organization_id)
      OrganizationSerializer.new(organization).serializable_hash
    end
  end
end
