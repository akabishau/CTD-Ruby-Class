class RenameMonthToMonthsInSubscriptions < ActiveRecord::Migration[7.0]
  def change
    rename_column :subscriptions, :month, :months
  end
end
