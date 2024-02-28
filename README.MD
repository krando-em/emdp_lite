# EMDP Lite - Setup Notes
## Description
This respository contains generic SQL models for basic core reporting based on emDP platform. The platforms, their dimensions and metrics as well as the reporting models represent common data needs. This opionated collection is what we are calling **emDP Lite**



## Setup Instructions
### Gather Platform Requirments and Credentials
Every accoutn activates a slightly different mix of platforms for their media. Prior to setting up emDP it's important to understand what platforms will need to be configured for data extraction and how those platforms need to be authenticated.
### Configure AdVerity Connectors
Using the models in this repository, configure each platform with the metrics and dimensions in the corresponding BASE model. These metrics are considered "core" metrics and should cover most use cases.
### Connect AdVerity Datastreams to emDP & Configure Feeds
- Any datastreams configured in AdVerity will need to also be configured in the emDP portal. The two systems are linked via a datastream ID.
- Once connected, feeds will need to be created that set the extraction schedule as well as update logic.

### Apply Models
- In your analytics BigQuery project, use the models in this repo to create views for common reporting tasks. 
-  **Notes**:
    - The generic table references in the FROM clause for every model will need to be updated to reference the base tables in your particular emDP project.
    - Channel and Cross-Channel models will need non-applicable platforms deleted or commented out.

## Links
- emDP Portal
- emDP Training Modules
- emDP 
