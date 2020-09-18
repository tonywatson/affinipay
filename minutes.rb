load "string.rb"

class Minutes
  @am_pm = 0
  @hours = 0
  @minutes = 0
  @time = ""

  def initialize
    @add_minutes = 0
    @all_minutes = 0
    @am_pm = ""
    @hours = 0
    @minutes = 0
    @time = ""
  end

  def add_minutes
    @all_minutes += @add_minutes.to_i
  end

  def get_inputs
    puts "-- Add Minutes coding test --"
    puts 'Input a time in this format: "[H]H:MM {AM|PM}". e.g. 9:13 AM'
    @time = gets.chomp

    puts "Input how many minutes you would like to add. e.g. 200"
    @add_minutes = gets.chomp
  end

  def has_inputs?
    @time != "" && minutes_is_numeric?
  end

  def new_time
    self.split_time()
    self.to_24hr_format()
    self.to_minutes()
    self.add_minutes()
    self.to_12hr_format()

    return @time
  end

  def minutes_is_numeric?
    @minutes.to_s.numeric?
  end

  def split_time
    arr = @time.split(/ /, -1)
    hh_mm = arr[0]

    @am_pm = arr[1].to_s.upcase
    @hours = hh_mm.split(":", -1)[0].to_i
    @minutes = hh_mm.split(":", -1)[1].to_i
  end

  def to_24hr_format
    if @am_pm == 'PM'
        @hours += 12
    end
  end

  def to_minutes
    @all_minutes = (@hours * 60) + @minutes
  end

  def to_12hr_format
    @hours = @all_minutes / 60
    if @all_minutes > 60
        @minutes = @all_minutes % 60
    else
        @minutes = @all_minutes - (@all_minutes / @hours)
    end

    @am_pm = "AM"

    while @hours >= 24
        @hours -= 24
    end

    if @hours >= 12
        @am_pm = "PM"
        @hours -= 12
    end

    if @hours == 0 
        @hours = 1
    end

    @time = "#{@hours}:#{@minutes == 0 ? '00' : @minutes} #{@am_pm}"
  end
end
