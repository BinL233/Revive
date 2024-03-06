import os
import shutil

def check_folder(path):
    if not os.path.exists(path):
        print("The path you entered does not exist.")
        return False
    
    return True

def extract(path, currRate, TargetRate):
    if not check_folder(path):
        return False

    # Sort by name
    sortedList = sorted(os.listdir(path))

    rate = currRate / TargetRate
    currFrame = 0

    for item in sortedList:
        if currFrame % rate == 0:
            currFrame += 1
            continue

        # Get item path
        item_path = os.path.join(path, item)

        if os.path.isfile(item_path):
            os.remove(item_path)
            print(f"File {item} has been deleted.")
        else:
            print(f"File {item} delete failed. No such file name.")

        currFrame += 1
    
    return True
