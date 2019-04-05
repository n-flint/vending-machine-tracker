class Snack < ApplicationRecord
  has_many :machine_snacks
  has_many :machines, through: :machine_snacks


end

# rails g migration CreatePlaylistSongs playlist:references song:references
