beginning_time = Time.now
# Trollons un peu
# system 'osascript -e "set Volume 8"'
# system 'say -v Daniel "Welcome to turbo seeds! Moooo, Bèèh, Woof, Meow!"'
# Trollons un peu

# Faker::Config.locale = 'fr'

puts "\n\nPOPULATE DATABASE"
# ============================== PARAMETRAGE ==============================
puts "\n Welcome to these magnificent turbo seeds\n \n "
puts "**************************************************"
puts "*                                                *"
puts "*  ***!!! Seeding will drop the database !!!***  *"
puts "*                                                *"
puts "**************************************************\n \n "
puts "====================================="
# puts "Do you want to build seeds with pictures? \n(This is way much longer, AND it uses a LOT of CLOUDINARY TOKENS, choose wisely)"
# with_pictures = ""
# loop do
#   print "Yes (y) or No (n) > "
#   with_pictures = STDIN.gets.chomp
#   if with_pictures == "n" || with_pictures == "y"
#     break
#   end
# end

# (with_pictures == "y") ? (puts "Building seeds with pictures.") : (puts "Building seeds without pictures.")
animals = %w(cat cow cow2 goat pig)

puts "\n How many styles do you want to build?"
print " > "
style_count = STDIN.gets.chomp.to_i

# puts "\n How many sounds do you want to build?"
# print " > "
# sounds_count = STDIN.gets.chomp.to_i
sounds_count = animals.count

puts "\n How many boxes do you want to build?"
print " > "
boxes_count = STDIN.gets.chomp.to_i


total_objects_to_create = style_count + sounds_count + boxes_count
total_objects_to_create = style_count + sounds_count + boxes_count
# ============================== PARAMETRAGE END ==============================

# ============================== DATABASE CLEANING ==============================
  if Rails.env.development?
    puts "\n Executing db:drop db:create & db:migrate"
    system 'rails db:drop db:create db:migrate'
  elsif Rails.env.production?
    puts "You seem to be in production, are you sure you want to continue? This will erase the DataBase entirely"
    print "Yes (y) or No (n) > "
    erase_prod = STDIN.gets.chomp
    # system 'rails db:drop db:create db:migrate' unless erase_prod == 'n'
    raise "You can't seed if you don't drop DataBase" if erase_prod == 'n'
    puts "\n Cleaning DB"
    AgencyWorkerAssociation.destroy_all
    Incident.destroy_all
    Worker.destroy_all
    Tenant.destroy_all
    Property.destroy_all
    Owner.destroy_all
    Agency.destroy_all
    User.destroy_all
  end
puts " DB cleaned \n \n "

# Trollons un peu
puts File.read('app/assets/images/Troll.txt')
# system 'osascript -e "set Volume 8"'
system 'afplay app/assets/images/moo_sound.mp3'
# Trollons un peu
# ============================== DATABASE CLEANING END ==============================

# ============================== CREATING TEST USER ==============================
puts "\n Building test account"
  User.create!(email: 'test@test.com', password: 'password')
puts "Test account built"
# ============================== CREATING TEST USER END ==============================

# ============================== CREATING STYLES ==============================
puts "\n Building #{style_count.to_s} styles"
  styles_progress_bar = TTY::ProgressBar.new("-[:bar] :percent | ETA::eta | :rate/s", width: 80, total: style_count)
  style_count.times do
    Style.create!(on_verra: Faker::Creature::Animal.name)
    styles_progress_bar.advance(1)
  end
puts " Styles built"
# ============================== CREATING STYLES END ==============================

# ============================== CREATING SOUNDS ==============================
puts "\n Building #{sounds_count.to_s} sounds"
  sounds_progress_bar = TTY::ProgressBar.new("-[:bar] :percent | ETA::eta | :rate/s", width: 80, total: sounds_count)
  animals.each do |animal|
    sound = Sound.new(name: animal)
    sound.sound_file.attach(io: File.open(File.join(Rails.root,"app/assets/images/sound-#{animal}.mp3")), filename: "sound-#{animal}")
    sound.save!
    sounds_progress_bar.advance(1)
  end
puts " Sounds built"
# ============================== CREATING SOUNDS END ==============================

# ============================== CREATING BOXES ==============================
puts "\n Building #{boxes_count.to_s} boxes"
  boxes_progress_bar = TTY::ProgressBar.new("-[:bar] :percent | ETA::eta | :rate/s", width: 80, total: boxes_count)
  boxes_count.times do
    Box.create!(
      name: Faker::Food.dish,
      size: Box::SIZES.sample,
      # size: [:extra_tiny, :tiny, :extra_small, :small, :extra_medium, :medium, :large, :extra_large, :huge, :extra_huge, :monumental, :extra_monumental].sample,
      style: Style.order("RANDOM()").first,
      sound: Sound.order("RANDOM()").first)
    boxes_progress_bar.advance(1)
  end
puts " Boxes built"
# ============================== CREATING BOXES END ==============================

  Faker::UniqueGenerator.clear
  elapsed_time = (Time.now - beginning_time).round
  elapsed_hours = elapsed_time/3600
  elapsed_time_minus_hours = elapsed_time % 3600
  elapsed_minutes = elapsed_time_minus_hours/60
  elapsed_seconds = elapsed_time_minus_hours % 60
  if elapsed_hours >= 1
    time_string = "#{elapsed_hours.to_s}hrs, #{elapsed_minutes.to_s}mn, #{elapsed_seconds.to_s}s"
  elsif elapsed_minutes >= 1
    time_string = "#{elapsed_minutes.to_s}mn, #{elapsed_seconds.to_s}s"
  else
    time_string = "#{elapsed_seconds.to_s}s"
  end

puts "\nDATABASE POPULATED in #{time_string}\n\n"
puts File.read('app/assets/images/unitard.txt')
system 'say -v Daniel "Thank you, see you next time!"'
