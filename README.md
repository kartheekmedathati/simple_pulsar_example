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
```mermaid
graph LR;
    %% Define colors
    classDef client fill:#e0f7fa,stroke:#006064,stroke-width:2px;  %% Light cyan for client
    classDef pulsar fill:#c8e6c9,stroke:#388e3c,stroke-width:2px;  %% Light green for Pulsar components
    classDef consumer fill:#ffe0b2,stroke:#ff6f00,stroke-width:2px; %% Light orange for consumer
    classDef monitoring fill:#bbdefb,stroke:#1976d2,stroke-width:2px; %% Light blue for monitoring
    classDef error fill:#ffccbc,stroke:#d32f2f,stroke-width:2px; %% Light red for error handling

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

```mermaid
graph LR;
    %% Define Styles
    classDef clientStyle fill:#ffcc00,stroke:#000000,stroke-width:2px;
    classDef apiStyle fill:#66ccff,stroke:#000000,stroke-width:2px;
    classDef brokerStyle fill:#99ff99,stroke:#000000,stroke-width:2px;
    classDef consumerStyle fill:#ff9966,stroke:#000000,stroke-width:2px;
    classDef monitorStyle fill:#cccccc,stroke:#000000,stroke-width:2px;
    classDef errorStyle fill:#ff6666,stroke:#000000,stroke-width:2px;

    %% Nodes
    A[WebSocket Client]:::clientStyle -->|Sends Message| B[WebSocket API (Pulsar)]:::apiStyle;
    B -->|Process Message| C[Message Broker (Pulsar)]:::brokerStyle;
    C -->|Deliver Message| D[WebSocket Consumer]:::consumerStyle;
    D -->|Acknowledges Message| C;
    C -->|Confirm Delivery| B;
    B -->|Send Acknowledgment| A;
    
    %% Monitoring and Error Handling
    B -->|Monitor Connection| E[Heartbeat & Latency Monitoring]:::monitorStyle;
    E -->|Monitor Health| F[Performance Metrics]:::monitorStyle;
    F -->|Optimize Operations| C;
    B -->|Error Handling & Connection Issues| G[WebSocket Error Handling]:::errorStyle;
    G -->|Alert Client| A;

    %% Styling Definitions for Flow Lines
    class A,B,C,D,E,F,G clientStyle,apiStyle,brokerStyle,consumerStyle,monitorStyle,errorStyle;
```
