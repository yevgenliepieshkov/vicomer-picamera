import numpy as np
import cv2
import time
import picamera
import requests
import io

print "Success!!Hello"

stream = io.BytesIO()

while True:

    with picamera.PiCamera() as camera:
        camera.resolution = (640, 480)
        camera.capture('image1.jpg')
        time.sleep(1)
        face_cascade = cv2.CascadeClassifier('/usr/local/share/OpenCV/haarcascades/haarcascade_frontalface_alt.xml')
        img = cv2.imread('image1.jpg')
        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
        faces = face_cascade.detectMultiScale(gray, 1.3, 5)

        for (x, y, w, h) in faces:
            ct = time.asctime()
            payload = {'face': 1}
            print 'face:1'


print 'Picture taken'
