class MatrixProfile
  def result(ts, subseq_len)
    n = ts.length
    m = n - subseq_len + 1
    profile = [Float::INFINITY] * m
    indices = [0] * m
    
    (0..m-1).each do |i|
      subseq = ts[i, subseq_len]
    
      (i+1..m-1).each do |j|
        distance = euclidean_distance(subseq, ts[j, subseq_len])
        if distance < profile[j]
          profile[j] = distance
          indices[j] = i
        end
        if distance < profile[i]
          profile[i] = distance
          indices[i] = j
        end
      end
    end
    
    [profile, indices]
  end
    
  def euclidean_distance(x, y)
    Math.sqrt((0...x.length).inject(0) { |sum, i| sum + (x[i] - y[i])**2 })
  end
  
  def find_repeated_patterns(profile, indices, min_dist, min_length)
    repeated_patterns = []
    n = indices.length
    
    (0..n-1).each do |i|
      if indices[i] + min_length < n && profile[i] < min_dist
        j = indices[i] + 1
      
        while j < n && indices[j] < i + min_length
          j = j + 1
        end
      
        if j < n && indices[j] == i && j - i >= min_length
          repeated_patterns.push([i, j])
        end
      end
    end
  
    repeated_patterns
  end
end