class Image
  def initialize(array)
    @image = array
  end

  def output_image
    @image.each do |row|
      puts row.join
    end
  end

  def blur (distance=1)
    distance.times do
      blur_pixels
    end
  end

  def blur_pixels
    #Step One - identify coordinates of 1s
    pixels_to_blur = []
    @image.each_with_index do |row, i|
      row.each_with_index do |x, row_i|
        pixels_to_blur << [i, row_i] if x == 1
      end
    end
    #Step Two - change values of surrounding pixels, validating coordinates are inbounds
    pixels_to_blur.each do |pixel|
        @image[pixel[0]][pixel[1] + 1] = 1 if pixel[1] + 1 <= @image[pixel[0]].length - 1
        @image[pixel[0]][pixel[1] - 1] = 1 if pixel[1] - 1 >= 0
        @image[pixel[0] + 1][pixel[1]] = 1 if pixel[0] + 1 <= @image.length - 1
        @image[pixel[0] - 1][pixel[1]] = 1 if pixel[0] - 1 >= 0
    end
  end
end


image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])

puts "The original Manhattan distance of 1 image is:"
image.output_image

image.blur(1)

puts "The blurred Manhattan distance of 1 image is:"
image.output_image

image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])

puts "The original Manhattan distance of 2 image is:"
image.output_image

image.blur(2)

puts "The blurred Manhattan distance of 2 image is:"
image.output_image

image = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 1]
])

puts "The original Manhattan distance of 3 image is:"
image.output_image

image.blur(3)

puts "The blurred Manhattan distance of 3 image is:"
image.output_image