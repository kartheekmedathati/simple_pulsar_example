import cv2
import pulsar
import numpy as np

# Initialize Pulsar client
client = pulsar.Client('pulsar://localhost:6650')
consumer = client.subscribe('persistent://public/default/video-stream', 'video-consumer')

while True:
    # Receive a message from the topic
    msg = consumer.receive()
    
    try:
        # Decode the message into an image array
        img_data = np.frombuffer(msg.data(), np.uint8)
        frame = cv2.imdecode(img_data, cv2.IMREAD_COLOR)
        
        # Display the resulting frame
        cv2.imshow('Received Video Stream', frame)

        # Acknowledge the message after processing it
        consumer.acknowledge(msg)

        # Break the loop on 'q' key press
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break

    except Exception as e:
        print(f"Error processing message: {e}")
        consumer.negative_acknowledge(msg)

# Close the client and destroy windows
consumer.close()
client.close()
cv2.destroyAllWindows()

