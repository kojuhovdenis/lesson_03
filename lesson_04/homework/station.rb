class Station

  def initialize(station_name)
    @station_name = station_name
    @list_train = []


    @@all_stations ||= []
    @@all_stations.append(self)

    # @@all_stations << self
  end

  attr_reader :station_name

  def self.all
    @@all_stations.each { |ax| puts " - #{ax.station_name}" }
  end

  def show_list_train(train_type = 0)

    puts "Список поездов на станции #{@station_name}:"

    # for index in (0..@list_train.count - 1)
    #   puts " - #{@list_train[index]}"
    # end
    @list_train.each { |current_train| puts " - #{current_train}" }
  end

  def take_train(new_train = 'noname')
    @list_train.append(new_train)
    puts "Поезд #{new_train} прибыл на платформу"
  end

  def send_train(sender_train = 'noname')
    @list_train.delete(sender_train)
    puts "Отправляется поезд #{sender_train}"
  end

end
