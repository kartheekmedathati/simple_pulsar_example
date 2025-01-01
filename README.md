# simple_pulsar_example
This is a basic example that I have put together using a bunch of LLMs to demonstrate the use of pulsar. In this simple example we stream video from a client web camera to a pulsar node and retrieve it using another client. 

## Why use pulsar? 
If we are developing a service that involves streaming data, it is common scenario where a single stream is consumed by multiple services or webclients, and apache pulsar seems to a be great cloud native choice for realizing a scalable, effective system that handle high bandwith data such as audio/video streams. Below are the key aspects of Pulsar's WebSocket support:
1. WebSocket API
    Efficient Messaging: Pulsar provides a dedicated WebSocket API for real-time message production and consumption. It supports JSON-formatted messages, optimized for web applications.
2. Configuration Flexibility
    Session Timeout Management: The webSocketSessionIdleTimeoutMillis parameter allows fine-grained control over idle connection timeouts, ensuring efficient connection management.
3. Performance Monitoring
    Heartbeat and Latency: Pulsar Heartbeat tools continuously assess WebSocket connection availability and measure end-to-end latency, enabling proactive performance monitoring.
4. Scalability
    Distributed Architecture: Pulsar's distributed design can scale to handle a large number of concurrent WebSocket connections, supporting high-throughput applications without degradation in performance.

A simplied view of the architecture:
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
