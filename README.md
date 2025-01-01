# Simple Pulsar Example
This is a basic example that I have put together using a bunch of LLMs to demonstrate the use of pulsar. In this simple example we stream video from a client web camera to a pulsar node and retrieve it using another client. 

### Why use pulsar? 
When developing a service that involves streaming data or running inference over a stream, it's common to have a single stream consumed by multiple services or clients. **Apache Pulsar** is a perfect fit for this scenario. It's cloud-native, scalable, and designed to handle high-bandwidth data like audio and video streams, ensuring efficient real-time delivery to all consumers. Also, what kind of communication protocols do we use to realize a streaming inference service? And what are the pros and cons? Websockets seem to hit the sweet spot as of now. 

| **Feature**              | **REST**                          | **WebSockets**                        | **WebRTC**                          |
|--------------------------|-----------------------------------|---------------------------------------|-------------------------------------|
| **Latency**              | High (due to HTTP request/response cycle) | Low (persistent connection)           | Very Low (peer-to-peer communication) |
| **Packet Loss Handling** | Not inherently built-in          | Some built-in retry mechanisms        | Built-in FEC (Forward Error Correction) |
| **Throughput**           | Moderate (suitable for low-frequency requests) | High (suitable for continuous streams) | Very High (optimized for video/audio) |
| **Scalability**          | Limited (each request is independent) | Good (one-to-many communication)      | Limited (peer-to-peer, scaling challenges) |
| **Reliability**          | Low (stateless, no built-in retries) | Moderate (retries possible)           | High (reliable peer-to-peer delivery) |
| **Use Case Suitability** | Simple request/response tasks     | Real-time messaging, WebSockets apps  | Real-time video/audio communication |
| **Security**             | Easy (via HTTPS)                  | Moderate (WebSocket security mechanisms) | High (end-to-end encryption)         |
| **Ease of Implementation** | Very Easy (standard API calls)    | Moderate (requires WebSocket handling) | Complex (peer-to-peer setup)        |


### Below are the key aspects of Pulsar's WebSocket support:
1. WebSocket API
    Efficient Messaging: Pulsar provides a dedicated WebSocket API for real-time message production and consumption. It supports JSON-formatted messages, optimized for web applications.
2. Configuration Flexibility
    Session Timeout Management: The webSocketSessionIdleTimeoutMillis parameter allows fine-grained control over idle connection timeouts, ensuring efficient connection management.
3. Performance Monitoring
    Heartbeat and Latency: Pulsar Heartbeat tools continuously assess WebSocket connection availability and measure end-to-end latency, enabling proactive performance monitoring.
4. Scalability
    Distributed Architecture: Pulsar's distributed design can scale to handle a large number of concurrent WebSocket connections, supporting high-throughput applications without degradation in performance.

### A simplied view of the architecture:
```mermaid
graph LR;
    A[WebSocket Client] -->|Sends Message| B["WebSocket API (Pulsar)"];
    B -->|Process Message| C["Message Broker (Pulsar)"];
    C -->|Deliver Message| D[WebSocket Consumer];
    D -->|Acknowledges Message| C;
    C -->|Acknowledge Request| B;
    B -->|Send Acknowledgment| A;
    B -->|Monitor Connection| E[Heartbeat & Latency Monitoring];
    E -->|Monitor Health| F[Performance Metrics];
    F -->|Optimize Operations| C;
```

### Use
   1. Launch the Pulsar node:

   ```bash
   sh start_pulsar_node.sh
   ```

   2. Create a pulsar topic for the video stream
   ```bash
   docker exec -it pulsar bash bin/pulsar-admin topics create persistent://public/default/video-stream
   ```
