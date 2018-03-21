# require 'config/environment'

desc 'Speak to marilyn'
task :speak_to_marilyn => :environment do
  10.times do
    p "RUNNING!"
    train_data = Bart.get_train_data
    next_train = train_data[:next_train].to_i
    if next_train == 0 || next_train > 13
      Marilyn.set_light(2)
    elsif next_train >= 11 && next_train < 13
      Marilyn.set_light(1)
    elsif next_train > 8 && next_train < 11
      Marilyn.set_light(0)
    end
    sleep 60
  end
end
