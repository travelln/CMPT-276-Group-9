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
    csv_file = Rails.root.join('app', 'assets', 'families.csv')
    @vec = Array.new
    i = 0
    CSV.foreach(csv_file, headers:true) do |row|
      @vec.push(Array.new)
      row.each do |_, val|
        if val.to_f != 0.0
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
    csv_file = Rails.root.join('app', 'assets', 'pollution.csv')
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
    for i in 3..25
      @sulfur << @vec[i][1]
      @nitrogen << @vec[i][2]
      @voc << @vec[i][3]
      @ammonia << @vec[i][4]
      @carbon << @vec[i][5]
      @fpm << @vec[i][6]
    end
  end

  def population
    require 'csv'
    csv_file = Rails.root.join('app', 'assets', 'population.csv')
    @vec = Array.new
    i = 0
    CSV.foreach(csv_file, headers:true) do |row|
      @vec.push(Array.new)
      row.each do |_, val|
        if val.to_f != 0.0
          @vec[i] << val.delete(',').to_f
        end
      end
      i += 1
    end
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
