class CreateProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :providers do |t|
    	t.string 			:name, null: false, default: ""
    	t.string 			:uid,  null: false, default: ""
    	t.references  :user
    	t.datetime    :token_expiration
      t.timestamps
    end
  end
end
