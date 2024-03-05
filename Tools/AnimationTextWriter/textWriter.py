import json

def create(speciesID, action, startID, endID, interval):
    data = []
    i = 0
    while i <= int(endID):
        fileName = speciesID + '_' + action + '_' + str(int(startID) + i).zfill(3)
        data.append(fileName)
        i += int(interval)
    
    return data
