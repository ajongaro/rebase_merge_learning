# Adds the CSV Class to interface with... you guessed it, CSV files.
require 'CSV'

# This loads a default CSV file from location if none is passed in.
def initialize(file_location="./assets/record.csv")
  # Each row of the CSV file becomes an array with each index separated by commas.
  # Each of those arrays is shoveled into the @rows array, creating one big nested array.
  @rows = CSV.read(file_location)
  # Just in case you want to pass in a different file
  @file_location = file_location
end

# Same as above except not in the initialize method.
def load_csv(file_location="./assets/record.csv")
  @rows = CSV.read(file_location)
  @file_location = file_location
end

# Load CSV one line at a time (better for very large files)
CSV.foreach(file_location="./assets/record.csv") do |row|
  @rows << row
end

# Load CSV one line at a time and recognize headers as symbols
CSV.foreach(file_location="./assets/record.csv", headers: true) do |row|
  @rows << row
end

# Write the @rows data back into csv format from array when done.
def write_file
  CSV.open(@file_location, "wb") do |csv|
    @rows.each do |row|
      csv << row
    end
  end
end

# Wipe the whole dang file.
def wipe_file
  CSV.open(@file_location, "wb") do |csv|
    # Adds an empty string on line 1 of the file.
    csv = ""
  end
end
