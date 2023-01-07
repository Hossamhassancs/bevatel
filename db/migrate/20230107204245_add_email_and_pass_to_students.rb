class AddEmailAndPassToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :email, :string
    add_column :students, :password_digest, :string
  end
end
