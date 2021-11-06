class DefaultStateCurrentsymbol < ActiveRecord::Migration[5.2]
  def change
    change_column_default :games, :current_symbol, "x"
    change_column_default :games, :state, { 
                0 => { 0 => nil, 1 => nil, 2 => nil },
                1 => { 0 => nil, 1 => nil, 2 => nil },
                2 => { 0 => nil, 1 => nil, 2 => nil }
            }
  end
end