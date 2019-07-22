class AddReferencesToAuditLog < ActiveRecord::Migration[5.2]
  def change
    add_reference :audit_logs, :user, foreign_key: true
    add_reference :expedientes, :user, foreign_key: true
  end
end
