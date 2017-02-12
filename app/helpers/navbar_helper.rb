module NavbarHelper
  def cuisine_menu
    Cuisine.all
  end

  def meal_menu
    Meal.all
  end
end
