# Controllers for All Open Data Pages

# This pages includes all controllers for the open data pages,
# which are categorized in def crime and end
#                          def economic and end
#                          def education and end
#                          def population and end
#                          def pollution and end
#                          def weather and end
#Those controllers help doing necessary actions of inputing a file, and
#creating corresponding variables for storing information of the file

#Controllers for other pages may be also defined here,
#and they help doing necessary actions before the pages are shown,



class StaticPagesController < ApplicationController
  def home


  end

  def help
  end

  def about
  end

  def crime
    require 'csv' #require a csv file

    #store the csv file(in assets folder) into a variable named a
    a=Rails.root.join('app', 'assets', 'Police personnel and selected crime statistics, Canada, provinces and territories.csv')
    @vec = Array.new #create a new array variable named vec
    i=0
    CSV.foreach(a, headers:true) do |row|
      @vec.push(Array.new)
      row.each do |key, val| #go through each row of the csv file(stored in a)
        if val.to_f == 0.0 #if the type of the value is float
          @vec[i] << val #store the value into the array variable :vec
        else
          @vec[i] << val.delete(',').to_f # sometimes a variable like 100,200 is stored in one grid, so delete the ','
        end
      end
      i += 1
    end

    c=Rails.root.join('app', 'assets', 'Crimes, by actual offences.csv')
    @vec3 = Array.new
    k=0
    CSV.foreach(c, headers:true) do |row|
      @vec3.push(Array.new)
      row.each do |key, val|
        if val.to_f == 0.0
          @vec3[k] << val
        else
          @vec3[k] << val.delete(',').to_f
        end
      end
      k += 1
    end

  end

  def economic
    require 'csv'
    # location of csv
    csv_file = Rails.root.join('app', 'assets', 'families.csv')
    @vec = Array.new
    i = 0
    # parse file line by line
    CSV.foreach(csv_file, headers:true) do |row|
      @vec.push(Array.new)
      row.each do |_, val|
        # .to_f() returns 0.0 on failure
        if val.to_f != 0.0
          # .to_f() has difficulties with commas
          @vec[i] << val.delete(',').to_i
        end
      end
      i += 1
    end
  end

  def education
    require 'csv'
    csv_file = Rails.root.join('app', 'assets', 'education.csv')
    @vec = Array.new
    i = 0
    CSV.foreach(csv_file, headers:true) do |row|
      @vec.push(Array.new)
      row.each do |_, val|
        if val.to_f != 0.0
          @vec[i] << val.to_f
        end
      end
      i += 1
    end
  end

  def pollution
    require 'csv'
    # location of csv file
    csv_file = Rails.root.join('app', 'assets', 'pollution.csv')
    @vec = Array.new
    i = 0
    # parse line by line; functionally remove the first line
    CSV.foreach(csv_file, headers:true) do |row|
      # new line, new array
      @vec.push(Array.new)
      # ignore the key
      row.each do |_, val|
        # .to_f() returns 0.0 on failure
        if val.to_f != 0.0
          @vec[i] << val.to_f
        end
      end
      i += 1
    end
    # create arrays to hold columns, adding zero because we ignored it the first time
    @sulfur = Array.new
    @sulfur << 0
    @nitrogen = Array.new
    @nitrogen << 0
    @voc = Array.new
    @voc << 0
    @ammonia = Array.new
    @ammonia << 0
    @carbon = Array.new
    @carbon << 0
    @fpm = Array.new
    @fpm << 0
    # the useful data is in these rows
    for i in 3..25
      # index 1 is always sulfur
      @sulfur << @vec[i][1]
      # index 2 is always nitrogen
      @nitrogen << @vec[i][2]
      # index 3 is always volatile organic compounds
      @voc << @vec[i][3]
      # index 4 is always ammonia
      @ammonia << @vec[i][4]
      # index 5 is always carbon monoxide
      @carbon << @vec[i][5]
      # index 6 is always fine particulate matter
      @fpm << @vec[i][6]
    end
  end

  def population
    require 'csv'
    # location of csv file
    csv_file = Rails.root.join('app', 'assets', 'population.csv')
    # array of arrays storing the csv
    @vec = Array.new
    i = 0
    # operate line by line; headers are not actually there, but this makes the result smaller
    CSV.foreach(csv_file, headers:true) do |row|
      # new row, new internal array
      @vec.push(Array.new)
      # ignore the key, it would be useless anyway
      row.each do |_, val|
        # .to_f() returns 0.0 if the conversion fails
        if val.to_f != 0.0
          # .to_f doesn't know how to work with commas, but would return nonzero if it was there
          @vec[i] << val.delete(',').to_f
        end
      end
      i += 1
    end
    # @vec now has all the relevant information from the csv
  end

  def weather
    require 'csv'
    csv_file = Rails.root.join('app', 'assets', 'weather.csv')
    @vec = Array.new
    i = 0
    CSV.foreach(csv_file, headers:true) do |row|
      @vec.push(Array.new)
      row.each do |_, val|
        if val != nil and val.delete(',').to_f != 0.0
          @vec[i] << val.delete(',').to_f
        end
      end
      i += 1
    end
    @snowfall = Array.new
    @precipitation = Array.new
    @wetdays = Array.new
    for i in 5..20
      @snowfall << @vec[i][0]
      @precipitation << @vec[i][1]
      @wetdays << @vec[i][2]
    end
  end

  def test
    require 'csv'
    tax_data = CSV.read('tax_data.csv', headers:true)

  end

end
