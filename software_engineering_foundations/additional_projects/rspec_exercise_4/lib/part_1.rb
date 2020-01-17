def my_reject(arr, &prc)
  rejects = []
  arr.each do |el|
    rejects << el unless prc.call(el)
  end

  rejects
end

def my_one?(arr, &prc)
  true_count = 0

  arr.each do |el|
    if prc.call(el)
      true_count += 1
    end
  end

  if true_count == 1
    true
  else
    false
  end
end

def hash_select(hash, &prc)
  selected_hash = {}

  hash.each do |k, v|
    if prc.call(k, v)
      selected_hash[k] = v
    end
  end

  selected_hash
end

def xor_select(arr, prc1, prc2)
  xor_arr = []

  arr.each do |el|
    if ((prc1.call(el) || prc2.call(el)) && !(prc1.call(el) && prc2.call(el)))
      xor_arr << el
    end
  end

  xor_arr
end

def proc_count(value, procs)
  count = 0

  procs.each do |proc|
    count += 1 if proc.call(value)
  end

  count
end
