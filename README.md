# simple_pulsar_example
This is a simple pulsar example that I have put together using a bunch of LLMs
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
```mermaid
graph TD;
    A[WebSocket Client] -->|Sends Message| B["WebSocket API (Pulsar)"];
    B -->|Process Message| C["Message Broker (Pulsar)"];
    C -->|Deliver Message| D[WebSocket Consumer];
    D -->|Acknowledges Message| C;
    C -->|Confirm Delivery| B["WebSocket API (Pulsar)"];
    B -->|Send Acknowledgment| A[WebSocket Client];
    B -->|Monitor Connection| E[Heartbeat & Latency Monitoring];
    E -->|Monitor Health| F[Performance Metrics];
    F -->|Optimize Operations| C;
    A -.->|Detect Connection Failure| G[WebSocket Error Handling];
    G -->|Alert Client| A;
```
```mermaid
graph TD;
    A[WebSocket Client] -->|Sends Message| B["WebSocket API (Pulsar)"];
    B -->|Process Message| C["Message Broker (Pulsar)"];
    C -->|Deliver Message| D[WebSocket Consumer];
    D -->|Acknowledges Message| C;
    C -->|Confirm Delivery| B;
    B -->|Send Acknowledgment| A;
    B -->|Monitor Connection| E[Heartbeat & Latency Monitoring];
    E -->|Monitor Health| F[Performance Metrics];
    F -->|Optimize Operations| C;
    B -->|Error Handling & Connection Issues| G[WebSocket Error Handling];
    G -->|Alert Client| A;
```
```mermaid
graph LR;
    A[WebSocket Client] -->|Sends Message| B["WebSocket API (Pulsar)"];
    B -->|Process Message| C["Message Broker (Pulsar)"];
    C -->|Deliver Message| D[WebSocket Consumer];
    D -->|Acknowledges Message| C;
    C -->|Confirm Delivery| B;
    B -->|Send Acknowledgment| A;
    
    %% Monitoring and Error Handling
    B -->|Monitor Connection| E[Heartbeat & Latency Monitoring];
    E -->|Monitor Health| F[Performance Metrics];
    F -->|Optimize Operations| C;
    B -->|Error Handling & Connection Issues| G[WebSocket Error Handling];
    G -->|Alert Client| A;
```
```mermaid
graph LR;
    %% Define colors
    classDef client fill:#f9f,stroke:#333,stroke-width:2px;
    classDef pulsar fill:#bbf,stroke:#333,stroke-width:2px;
    classDef consumer fill:#fbf,stroke:#333,stroke-width:2px;
    classDef monitoring fill:#cce5ff,stroke:#007bff,stroke-width:2px;
    classDef error fill:#ffcccc,stroke:#ff0000,stroke-width:2px;

    %% Web Client
    A[WebSocket Client]:::client -->|Sends Message| B["WebSocket API (Pulsar)"]:::pulsar;

    %% Pulsar Super Block
    subgraph Pulsar_Components [Pulsar Components]
        direction TB
        B -->|Process Message| C["Message Broker (Pulsar)"]:::pulsar;
        C -->|Deliver Message| D[WebSocket Consumer]:::consumer;
        D -->|Acknowledges Message| C;
        C -->|Confirm Delivery| B;
        B -->|Send Acknowledgment| A; 
    end

    %% Monitoring and Error Handling
    B -->|Monitor Connection| E[Heartbeat & Latency Monitoring]:::monitoring;
    E -->|Monitor Health| F[Performance Metrics]:::monitoring;
    F -->|Optimize Operations| C;

    B -->|Error Handling & Connection Issues| G[WebSocket Error Handling]:::error;
    G -->|Alert Client| A; 
```

