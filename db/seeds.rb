# Create new admin account.
Admin.create!(username: 'admin', password: 'password', password_confirmation: 'password')

# Create buildings.
names = ['Bowman', 'Merril', 'McGilvery', 'Oscar Ritchie', 'Lowery']
short_names = %w{bow mrl mcg orh low}

names.size.times { |i| Building.create!(:name => names[i], :short_name => short_names[i]) }


# Generate fake jack id string.
def generate_fake_jack_id_label(building)
  charset = (0..9)
  "#{building.short_name}-#{generate_random_string(2, charset)}-#{generate_random_string(2, charset)}-#{generate_random_string(3,charset)}"
end

# Generate fake connections label string.
def generate_fake_connections
  values = %w(Empty Voice Data)
  rand1 = values.sample
  rand2 = values.sample
  "A: #{rand1} B: #{rand2}"
end

# Generate an array of jack id objects.
def generate_jack_ids_array(building)
  jack_ids = []
  num = rand(5-1) + 1 # Random number between 1..5
  num.times do |i|
    label = generate_fake_jack_id_label(building)
    connections = generate_fake_connections
    jack_ids << JackId.create!(:label => label, :connections => connections)
  end
  jack_ids
end

# Returns fake notes string.
def generate_fake_notes
  notes = [
    "Located behind huge bookshelf on left wall.", "",
    "Room is very messy. Hard to reach Jack ID.", "",
    "Had trouble finding JacK ID. Hidden behind bookshelf.", ""
  ]
  num = rand(notes.size)
  notes[num]
end

# Generate a random string of characters using a specfic character set.
def generate_random_string(length, character_set)
  charset = character_set.to_a
  (0...length).map{ charset[rand(charset.size)] }.join
end


# Create locations with Jack IDs, connections, and notes.
buildings = Building.all
base_rooms = %w(105 120 150 204 220 223 301 320 324 325)

buildings.each do |building|
  base_rooms.each do |base_room|
    # Between 15-25 times.
    num = rand(25-15) + 15
    num.times do |i|
      jack_ids = generate_jack_ids_array(building)
      notes = generate_fake_notes
      Location.create!(:building => building, :room => "#{base_room}-#{i}", :jack_ids => jack_ids, :notes => notes)
    end
  end
end

