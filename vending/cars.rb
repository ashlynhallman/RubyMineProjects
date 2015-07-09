
$cars = {
    'silverado' => 'chevy',
    'camry' => 'toyota',
    'jetta' => 'vw',
    'escalade' => 'cadillac',
    'volt' => 'chevy'
}

$makers = {
    'chevy' => 'A++',
    'ford' => 'B---',
    'vw' => 'C+',
    'cadillac' => 'D-'
}

# This is the car_rating function.
# It will check the above hashes and
# # there is a value, it will print the rating.

def car_rating(car_type)

  if $cars.has_key?(car_type)
    car_maker = $cars[car_type]
    if $makers.has_key?(car_maker)
      car_rating = $makers[car_maker]
    end
  end

  if car_rating
    puts "Your car, a #{car_type}, is rated '#{car_rating}'"
  else
    puts "Your car, a #{car_type}, was not found. No rating."
  end
end

car_rating('jetta')

car_rating('volt')