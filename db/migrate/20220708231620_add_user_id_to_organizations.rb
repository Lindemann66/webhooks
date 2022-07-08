# frozen_string_literal: true

class AddUserIdToOrganizations < ActiveRecord::Migration[7.0]
  def change
    add_reference :organizations, :user, index: true
  end
end
