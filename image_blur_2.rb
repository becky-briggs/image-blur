class Image
  def initialize(array)
    @image = array
  end

  def output_image
    @image.each do |row|
      puts row.join
    end
  end

  def blur
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

puts "The original one pixel transform image is:"
image.output_image

image.blur

puts "The blurred one pixel transform image is:"
image.output_image

image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 1, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])

puts "The original two pixel transform image is:"
image.output_image

image.blur

puts "The blurred two pixel transform image is:"
image.output_image

image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [1, 0, 0, 0],
  [0, 0, 0, 0]
])

puts "The original edge pixel transform image is:"
image.output_image

image.blur

puts "The blurred edge pixel transform image is:"
image.output_image