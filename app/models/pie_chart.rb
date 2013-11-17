class PieChart < ActiveRecord::Base
  attr_accessor :width_height #set accessor so width height is read and writeable
  @random = Random.new
  @values = Array.new
  @width_height = 200
  @segments = 10
  @inner_angle  = 360 / @segments



  def self.create_dummy_chart
    (0..5).each do |i|
      @values[i] = rand(25)
    end
    @radius = deg_to_rad(@inner_angle)
  end

  def self.get_coords
    coords = Hash.new

    coords['x1'] = Math.cos(@radius).abs * @width_height.abs2 + @width_height
    coords['y1'] = Math.sin(@radius).abs * @width_height.abs2 + @width_height

    coords['x2'] = @width_height * 2
    coords['y2'] = @width_height

    coords
  end

  def self.segments
    @segments
  end


  def self.radius
    @inner_angle
  end

  def self.values
    @values
  end

  def self.center
    @width_height
  end

  private
    def self.deg_to_rad (deg)
      Math::PI/180 * deg
    end
end
