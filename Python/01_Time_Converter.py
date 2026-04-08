# 01_Time_Converter.py

# Converts minutes to human-readable formats

minutes = int(input("Enter minutes: "))

hours = minutes // 60
mins = minutes % 60

if hours > 0 and mins > 0:
    h_label = "hr" if hours == 1 else "hrs"
    print(f"{hours} {h_label} {mins} minutes")
elif hours > 0:
    h_label = "hr" if hours == 1 else "hrs"
    print(f"{hours} {h_label}")
else:
    print(f"{mins} minutes")