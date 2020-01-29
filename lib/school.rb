
class School
  attr_reader :start_time, :hours_in_school_day, :student_names
  def initialize(start_time, hours_in_school_day)
    @start_time = start_time
    @hours_in_school_day = hours_in_school_day
    @student_names = []
  end

  def add_student_name(name)
    @student_names << name
  end

  def end_time
   self.calculate_end_time - 24 if self.calculate_end_time > 24
   self.convert_time_to_clock_format(calculate_end_time)
  end

  def is_full_time?
    @hours_in_school_day >= 4
  end

  def standard_student_names
    standard_names = []
    @student_names.each {|name| standard_names << name.capitalize}
    standard_names
  end

  def convert_end_time_to_clock_time
    clock_time = self.calculate_end_time

    if clock_time > 12
      clock_time = clock_time - 12
    end
    self.convert_time_to_clock_format(clock_time)
  end

  def calculate_end_time
    @hours_in_school_day.to_i + @start_time.to_i
  end

  def convert_time_to_clock_format(time_to_convert)
    time_to_convert.to_s + ":" + "00"
  end

end
