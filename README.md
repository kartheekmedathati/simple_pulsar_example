# simple_pulsar_example
This is a simple pulsar example that I have put together using a bunch of LLMs

```mermaid
graph LR;
    A[WebSocket Client] -->|Sends Message| B["WebSocket API (Pulsar)"];
    B -->|Process Message| C["Message Broker (Pulsar)"];
    C -->|Store Message| D[Topic Storage];
    D -->|Acknowledge Receipt| B;
    
    C -->|Deliver Message| E[WebSocket Consumer];
    E -->|Acknowledges Message| C;
    
    E -->|Send Acknowledgment| B;
    B -->|Send Acknowledgment to Client| A;

    subgraph Connection Monitoring
        F[Heartbeat & Latency Monitoring] 
        C -->|Monitor Connection Status| F;
        F -->|Provide Feedback on Delivery Status| G[Performance Metrics];
        G -->|Optimize Operations| C;
    end

    %% Connection-Level Acknowledgment
    C -->|Detect Delivery Failure| H[Connection-Level Acknowledgment];
    H -->|Notify Client of Failure| A;
```
