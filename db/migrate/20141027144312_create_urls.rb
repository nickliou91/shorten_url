class CreateUrls < ActiveRecord::Migration
  def change
  	create_table :urls do |t|
  		t.text :orginal_url
  		t.string :shorten_url
  		t.integer :visit_counts, default: 0
  		t.timestamps

  	end
  end
end
