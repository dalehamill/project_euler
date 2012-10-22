load 'common.rb'
def p44
    pents = (1..10000).reduce({}){|h,n| h[n*(3*n-1)/2] = n; h}
    min = nil
    pents.keys.each do |j|
      (pents.keys - [j]).each do |k|
        if pents[j+k] && pents[(j-k).abs] && (!min || min > (j-k).abs)
          puts "new winners: #{j} and #{k}"
          min = (j-k).abs
        end
      end
    end
    min
end

# Pentagonal numbers are generated by the formula, Pn=n(3n1)/2. The first ten pentagonal numbers are:
# 1, 5, 12, 22, 35, 51, 70, 92, 117, 145, ...
# It can be seen that P4 + P7 = 22 + 70 = 92 = P8. However, their difference, 70  22 = 48, is not pentagonal.
# Find the pair of pentagonal numbers, Pj and Pk, for which their sum and difference is pentagonal and D = |Pk - Pj| is minimised; what is the value of D?