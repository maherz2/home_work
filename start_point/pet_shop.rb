def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, cash_amount)
  pet_shop[:admin][:total_cash] = pet_shop[:admin][:total_cash] + cash_amount
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, amount_of_pets_sold)
  pet_shop[:admin][:pets_sold] = pet_shop[:admin][:pets_sold] + amount_of_pets_sold
end

def stock_count(pets_shop)
  return pets_shop[:pets].length
end

def pets_by_breed(pets_shop, breed_name)
  matched_pets = []

  for pet in pets_shop[:pets]
    matched_pets <<  pet if pet[:breed] == breed_name
  end
  return matched_pets
end

def find_pet_by_name(pet_shop, pet_name)

  for pet in pet_shop[:pets]
    return pet if pet[:name] == pet_name
  end
  return nil
end

def remove_pet_by_name(pet_shop, pet_name)

  for pet in pet_shop[:pets]
    pet_shop[:pets].delete_at( pet_shop[:pets].index(pet) ) if pet[:name] == pet_name
  end
end

def add_pet_to_stock(pet_shop, new_pet)
pet_shop[:pets] << new_pet
end

def customer_pet_count(customer)
  return customer[:pets].length
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets] << new_pet
end

def customer_can_afford_pet(customer, new_pet)
  return customer[:cash] > new_pet[:price]
end

def sell_pet_to_customer(pet_shop, pet, customer)

  if (!pet.nil? || !pet.empty?) && customer_can_afford_pet(customer, pet)
    add_or_remove_cash(pet_shop, pet[:price])
    add_pet_to_customer(customer, pet)
    remove_pet_by_name(pet_shop, pet[:name])
    increase_pets_sold(pet_shop, 1)
  else
    return
  end
end
















