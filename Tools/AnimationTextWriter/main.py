import textWriter
import json

def main():
    speciesID = input("Id: ")
    action = input("Action: ")
    startID = input("Start frame of animation: ")
    endID = input("End frame of animation: ")
    interval = input("Interval: ")

    print(json.dumps(textWriter.create(speciesID, action, startID, endID, interval)))

if __name__ == "__main__":
    main()