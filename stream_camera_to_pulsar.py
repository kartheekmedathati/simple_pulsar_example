import cv2
import pulsar

# Initialize Pulsar client
client = pulsar.Client('pulsar://localhost:6650')
producer = client.create_producer('persistent://public/default/video-stream')

# Open webcam
cap = cv2.VideoCapture(0)

while True:
    # Capture frame-by-frame
    ret, frame = cap.read()
    
    if not ret:
        break
    
    # Encode the frame as JPEG
    _, buffer = cv2.imencode('.jpg', frame)
    
    # Send the frame to Pulsar
    producer.send(buffer.tobytes())
    
    # Display the resulting frame (optional)
    cv2.imshow('Webcam Stream', frame)

    # Break the loop on 'q' key press
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

# Release the capture and close the client
cap.release()
cv2.destroyAllWindows()
producer.close()
client.close()



