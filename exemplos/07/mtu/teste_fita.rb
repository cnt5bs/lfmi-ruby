$: << "../..;../../../../lab"
require "07/mtu/FitaMTU"

# p1=/a+/
# p2=/b/
# p = /p1p2/
# q = /#{p1}#{p2}/
# f=FitaMTU.new(q)
# f.escrever("aab")
# print "Simbolo lido="
# puts f.ler()
# f.avancar()
# f.escrever("bbbabbbbbabbba")
# print "Simbolo lido="
# puts f.ler()
x = "abba".scan(/(bba)/)
puts x
y = /bba/.match("bba")
puts y
n = /bba/ =~ "bba"
puts n
n = /bba/ =~ "abba"
puts n
n = /bba/ =~ "aabba"
puts n
e = "abbbabba".gsub(/bba$/, "")
puts e
