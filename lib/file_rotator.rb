require 'fileutils'

# Rotate any files. Call it before writing new file
# ex. nginx.conf rotate:
# 1) mv nginx.conf.last nginx.conf.last + 1
# 2) mv nginx.conf.prelast nginx.conf.last
# ...
# 3) mv nginx.conf nginx.conf.1
# and then you can write new file `nginx.conf`
# etc...
class FileRotator
  attr_accessor :stack, :original, :count_files

  def initialize(original, count_files = 10)
    self.original = original
    self.stack = []
    self.count_files = count_files
  end

  def next_name(file)
    name_arr = file.split('.')
    next_num = name_arr.last.to_i + 1
    if next_num == 1
      name_arr.join('.') + ".#{next_num}"
    else
      name_arr[0..-2].join('.') + ".#{next_num}"
    end
  end

  def number(file)
    file.split('.').last.to_i
  end

  def move(file)
    next_file = next_name(file)
    if number(next_file) <= count_files
      FileUtils.mv(file, next_file)
    else
      FileUtils.rm(file)
    end
  end

  def rotate(file)
    next_file = next_name(file)
    if File.exist?(next_file)
      stack << file
      return rotate(next_file)
    end
    move(file)
    return if stack.empty?
    rotate(stack.pop)
  end

  def run
    rotate(original) if File.exist?(original)
  end
end
