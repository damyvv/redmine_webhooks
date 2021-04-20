class CreateWebhookClients < ActiveRecord::Migration[5.2]
  def change
    create_table :webhook_clients do |t|
      t.string :target_url, null: false
      t.string :events, null: false
      t.timestamps
    end
  end
end
