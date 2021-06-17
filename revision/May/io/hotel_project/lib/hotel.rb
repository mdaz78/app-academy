require_relative "room"

class Hotel
  def initialize(name, rooms)
    @name = name
    @rooms = create_rooms(rooms)
  end

  def create_rooms(rooms)
    room_instances = {}

    rooms.each do |room_name, room_capacity|
      room_instances[room_name] = Room.new(room_capacity)
    end

    room_instances
  end

  def name
    name = @name.split(" ").map { |word| word[0].upcase + word[1..-1] }
    name.join(" ")
  end

  def rooms
    @rooms
  end

  def room_exists?(name)
    @rooms.has_key?(name)
  end

  def check_in(person, room_name)
    if room_exists?(room_name)
      room = @rooms[room_name]

      if room.add_occupant(person)
        p "check in successfull"
      else
        p "sorry, room is full"
      end
    else
      p "sorry, room does not exist"
    end
  end

  def has_vacancy?
    @rooms.values.each do |room|
      return true unless room.full?
    end

    false
  end

  def list_rooms
    @rooms.each do |room_name, room_instance|
      puts "#{room_name}. #{room_instance.available_space}"
    end
  end
end
