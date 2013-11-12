def generate_string(capacity)
  o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
  (0...capacity).map { o[rand(o.length)] }.join
end

def generate_array(length, string_length)
  a = []
  length.times do
    a << generate_string(string_length)
  end
  a
end

def generate_boolean_array(length)
  a = []
  length.times do
    a << [true, false].sample
  end
  a
end

def generate_nils(size)
  a = []
  size.times do
    a << nil
  end
  a
end

def generate_hash(capacity, key_length, value_length)
  h = {}
  capacity.times do
    h[generate_string(key_length)] = generate_string(value_length)
  end
  h
end



