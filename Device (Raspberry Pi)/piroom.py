from gpiozero import MotionSensor
from firebase import firebase
from time import sleep

#Firebase settings, Initialize room info
DB_secret = 'q7bAYVPdP3JhFZdWozGxmHkaefaseutKrdJn3pKR'
authentication = firebase.FirebaseAuthentication(DB_secret,'piroom.ozu@gmail.com',True,True)
firebase = firebase.FirebaseApplication("https://piroom-f14c0.firebaseio.com/rooms", authentication)

# Limits
# Minutes * 6
CODE_YELLOW = 30 # 5 Minutes
CODE_GREEN = 60 # 10 Minutes 
# Status
room_status = 0
empty_count = 0

def check_movement(empty_count):
    temp_count = empty_count + 1
    print("Checking movement...")
    #Check room for certain seconds
    #If you detect a movement mark the room as full
    seconds = 50 # seconds * 10
    for _ in range (seconds):
        if pir.motion_detected:
            print("Movement")
            temp_count = 0
            break
        sleep(0.1)
    
    return temp_count

# Room Status 0 indicates there hasn't been a movement in the room for long time, so room is empty
# Room Status 1 indicates there hasn't been a movement recently but owner of the room might come again
# Room Status 2 indicates room is full
def update_database(empty_count):
    room_status = 2
    if empty_count >= CODE_YELLOW:
        room_status = 1
    if empty_count >= CODE_GREEN:
        room_status = 0
    #rooms/509A --> Update status   
    firebase.put("/rooms/509A","/status",room_status)
        
pir = MotionSensor(4) # Place of motion sensor OUT cable
control_frequency = 5 # Check movement at every 5 seconds , 5 seconds detection 5 seconds cooldown

print ("Getting Ready..")
sleep(3)
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
