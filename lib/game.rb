class Game

  attr_reader :player_name, :computer_weapon

  WEAPONS = ["Paper", "Scissors", "Rock"]

  def initialize(player_name)
    @player_name = player_name
    @computer_weapon = WEAPONS.sample
  end

  def battle(player_weapon, computer_weapon = @computer_weapon)
    validate(player_weapon)
    return "drew" unless player_weapon != computer_weapon
    return "won" if WEAPONS[WEAPONS.index(player_weapon) - 1] == computer_weapon
    return "lost" if WEAPONS[WEAPONS.index(computer_weapon) - 1] == player_weapon
  end

  def result_img_url(player_weapon, computer_weapon = @computer_weapon)
    "img/" + generate_win_img_filename(player_weapon, computer_weapon) + ".png"
  end

  private

    def validate(weapon)
      "probably did something weird" unless WEAPONS.include? weapon
    end

    def generate_win_img_filename(player_weapon, computer_weapon)
      case battle(player_weapon, computer_weapon)
      when "drew"
        player_weapon.chr.downcase
      when "won"
        player_weapon.chr.downcase + "_win"
      when "lost"
        computer_weapon.chr.downcase + "_win"
      end
    end

end
