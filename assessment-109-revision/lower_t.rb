# Write a one-liner to count the number of lower-case 't' characters in the following string:
statement = "The Flintstones Rock!"

p statement.split("").count("t")
# 2
p statement.scan("t")
# ["t", "t"]
p statement.scan("t").count
# 2
