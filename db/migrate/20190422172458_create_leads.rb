class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.text :issue
      t.string :language

      t.timestamps
    end
  end
end
