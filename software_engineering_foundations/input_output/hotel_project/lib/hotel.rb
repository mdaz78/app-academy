require_relative "room"

class Hotel
  def initialize(name, room_hash)
    @name = name
    @rooms = Hash.new()
    room_hash.map do |room_name, room_capacity|
      @rooms[room_name] = Room.new(room_capacity)
    end
  end

  def name
    @name.split(' ').map { |word| word.capitalize }.join(' ')
  end

  def rooms
    @rooms
  end

  def room_exists?(room_name)
    room_names = @rooms.keys
    room_names.include?(room_name)
  end

  def check_in(person, room_name)
    if self.room_exists?(room_name)
      if @rooms[room_name].add_occupant(room_name)
        p "check in successful"
      else
        p "sorry, room is full"
      end
    else
      p "sorry, room does not exist"
    end
  end

  def has_vacancy?
    @rooms.values.any? do |room|
      !room.full?
    end
  end

  def list_rooms
    @rooms.each do |name, room|
      puts "#{name} : #{room.available_space}"
    end
  end
end
