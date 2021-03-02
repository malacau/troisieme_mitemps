class Team < ApplicationRecord
    has_many :players
    enum results: [:won, :drawn, :lost]
end
