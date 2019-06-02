class RequestsServices < ActiveRecord::Migration[5.2]
  def change
    create_table :requests_services, :id => false do |t|
      t.integer :request_id
      t.integer :service_id
    end
  end
end
