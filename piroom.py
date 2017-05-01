from gpiozero import MotionSensor
from firebase import firebase
from time import sleep

#Firebase settings, Initialize room info
DB_secret = 'q7bAYVPdP3JhFZdWozGxmHkaefaseutKrdJn3pKR'
authentication = firebase.FirebaseAuthentication(DB_secret,'piroom.ozu@gmail.com',True,True)
firebase = firebase.FirebaseApplication("https://piroom-f14c0.firebaseio.com/rooms", authentication)

#Status
room_status = 0
empty_count = 0

def check_movement(empty_count):
    temp_count = empty_count + 1
    print("Checking movement")
    #Check room for certain seconds
    #If you detect a movement mark it room as full
    seconds = 50 # seconds * 10
    for _ in range (seconds):
        if pir.motion_detected:
            print("Movement")
            temp_count = 0
            break
        sleep(0.1)
    
    return temp_count
    
def update_database(empty_count):
    room_status = 2
    if empty_count >= 6:
        room_status = 1
    if empty_count >= 12:
        room_status = 0
    #rooms/509A --> Update status   
    firebase.put("/rooms/509A","/status",room_status)
        
pir = MotionSensor(4) # Place of motion sensor OUT cable
control_frequency = 5 # Check movement at every 5 seconds

print ("Getting Ready..")
sleep(2)
print ("Ready to detect")

try:
    while True:
        empty_count = check_movement(empty_count)
        update_database(empty_count)
        print("Empty Count : %i" %empty_count)
        print("Cooldown")
        sleep(control_frequency)
    
except KeyboardInterrupt:
    print ("Exitting..")
    pir.close()

pir.close()
