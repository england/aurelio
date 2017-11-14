class Bootstrap < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name

      t.timestamps
    end

    create_table :groups do |t|
      t.string :name

      t.timestamps
    end

    create_join_table :users, :groups do |t|
      t.index :user_id
      t.index :group_id
    end

    create_table :tests do |t|
      t.string :name

      t.timestamps
    end

    create_table :testings do |t|
      t.references :user, null: false
      t.references :test, null: false
      t.boolean :passed, null:false, default: false

      t.timestamps
    end
  end
end
