curr_level = int(input("Current Level: "))
target_level = int(input("Target Level: "))
total_exp = 0

if curr_level < target_level:
    for x in range(curr_level, target_level):
        total_exp += x * 70 + 600
    
    hr = total_exp // 60 // 60
    min = total_exp // 60 % 60
    sec = total_exp % 60
    print("Total Exp required:", total_exp, "Time required:", hr, "h", min, "m", sec, "s")
else:
    print("Target Level must larger than Current Level")