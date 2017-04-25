from gpiozero import MotionSensor
from firebase import firebase
from time import sleep

#Firebase settings, Initialize room info
room_info = {'Name':'TEST', 'Status' : 0}
DB_secret = 'q7bAYVPdP3JhFZdWozGxmHkaefaseutKrdJn3pKR'
authentication = firebase.FirebaseAuthentication(DB_secret,'piroom.ozu@gmail.com',True,True)
firebase = firebase.FirebaseApplication("https://piroom-f14c0.firebaseio.com/rooms", authentication)
firebase.put('/rooms/1',1,room_info)

def check_movement(room_status):
    print("Checking movement")
    #Check room for certain seconds
    #If you detect a movement mark it room as full
    seconds = 50
    room_status = False
    for _ in range (seconds):
        if pir.motion_detected:
            print("Movement")
            room_status = True
            break
        sleep(0.1)
    
    return room_status

def update_database(room_status):
    status = 0
    if room_status:
        status = 1
    #rooms/b1/kat1 --> Update status   
    firebase.put("/rooms/1/1","/Status",status)
    
pir = MotionSensor(4) # Place of motion sensor OUT cable
control_frequency = 5 # Check movement at every 5 seconds

print ("Getting Ready..")
sleep(2)
print ("Ready to detect")

room_status = False

try:
    while True:
        room_status = check_movement(room_status)
        update_database(room_status)
        sleep(control_frequency)
    
except KeyboardInterrupt:
    print ("Exitting..")
    pir.close()

pir.close()
