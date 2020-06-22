class CreatePolls < ActiveRecord::Migration[5.2]
  def self.up  #MOD 
    create_table :polls do |t|
       t.column :question, :string
	 t.column :yes, :integer, :default => 0
       t.column :no, :integer, :default => 0	 
	 
	 #START ADD day, createed_on, updated_on
	 t.column :created_on, :datetime 
      t.column :updated_on, :datetime
	 #END ADD 
    end

#
    execute("ALTER TABLE polls MODIFY created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL")
   execute("ALTER TABLE polls MODIFY updated_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL")
#
  end  # End  of self.up
  
  #START ADD self.down
  def self.down
   drop_table :polls
  end
  #END ADD self.down

end
