class Image

  def initialize(array)
    @array = array
    self.initial_blur
    
  end

  def initial_blur
  row=0
  col=0
  count=@array[0].length
  count_row=@array.length
  count_col=@array.transpose.length
  row_array = []
  col_array = []
  while row<count_row
    while col<count_col
    if @array[row][col] == 1 
        row_array << row
        col_array << col
        
    end
    col=col+1
    end
    col=0
    row=row+1
  end
  

  count_2= row_array.length
  x=0
  while x<count_2
  if col_array[x]+1 < count_col && col_array[x]+1 > -1
  @array[row_array[x]][col_array[x]+1] = 1
  end
  if row_array[x]+1 < count_row && row_array[x]+1 > -1
  @array[row_array[x]+1][col_array[x]] = 1
  end
  if row_array[x]-1 < count_row && row_array[x]-1 > -1
  @array[row_array[x]-1][col_array[x]] = 1
  end
  if col_array[x]-1 < count_col && col_array[x]-1 > -1
  @array[row_array[x]][col_array[x]-1] = 1
  end
  x=x+1
  end
  end
  
  def blur(blur_count)
  while blur_count != 0
  self.initial_blur
  blur_count = blur_count -1
  end
  end
  
  
  def output_image
  @array.each { |x| puts x.join("") }
  end

end 

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 1, 0]
])
image.output_image 