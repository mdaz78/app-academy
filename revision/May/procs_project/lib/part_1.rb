def my_map(array, &prc)
  result = []

  array.each do |el|
    result << prc.call(el)
  end

  result
end

def my_select(array, &prc)
  result = []

  array.each do |el|
    result << el if prc.call(el)
  end

  result
end

def my_count(array, &prc)
  count = 0

  array.each do |el|
    count += 1 if prc.call(el)
  end

  count
end

def my_any?(array, &prc)
  array.each do |el|
    return true if prc.call(el)
  end

  false
end

def my_all?(array, &prc)
  array.each do |el|
    return false unless prc.call(el)
  end

  true
end

def my_none?(array, &prc)
  array.each do |el|
    return false if prc.call(el)
  end

  return true
end
