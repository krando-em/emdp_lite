# EMDP Lite - Setup Notes
## Description
This respository contains generic SQL models for basic core reporting based on emDP platform. The platforms, their dimensions and metrics as well as the reporting models represent common data needs. This opionated collection and approach is what we are calling **emDP Lite**.

![emDP Lite System Relationships](/Assets/arch.png)

## Roadmap
| Phase 	| Goals                         	    |    Status   	|
|-------	|:------------------------------------------------------:	|:-----------:	|
| 1     	| Validate approach, learn platform, incorporate basic models        	| In Progress 	|
| 2     	| Models w/ Transformation (Prisma etc) + trial dbt 	| Planned     	|
| 3     	| MVP for Account Migration                              	| Planned     	|


## Assumptions
This document assumes **basic familiarity with the emDP platform**. Please following the training guide outlined [here](https://data-platform-community.choreograph.com/hc/en-us/articles/5411095490588-emDP-Training-Curriculum). Designed and maintained by Choreograph, this training path consists of a combination of interactive learning modules and written documentation. It currently represents the quickest and most complete method to learn the basics of the platform.

## Setup Instructions
### Gather Platform Requirments and Credentials
Every account activates a slightly different mix of platforms for their media. Prior to setting up emDP it's important to understand what platforms will need to be configured for data extraction and how those platforms need to be authenticated.

### Configure AdVerity Connectors
Using the models in this repository, configure each platform with the metrics and dimensions in the corresponding BASE model. These metrics are considered "core" metrics and should cover most use cases.  

You will also need to apply an "enrichment" to the datastream in the platform to prepare the column names for ingestion into BigQuery. The "Avro" enrichment should be used to replace whitespace characters and symbols to "_" which BigQuery can read.

### Connect AdVerity Datastreams to emDP & Configure Feeds
- Any datastreams configured in AdVerity will need to also be configured in the emDP portal. The two systems are linked via a datastream ID.
- Once connected, feeds will need to be created that set the extraction schedule as well as update logic.

### Apply Models
- In your analytics BigQuery project, use the models in this repo to create views for common reporting tasks. 
-  **Notes**:
    - The generic table references in the FROM clause for every model will need to be updated to reference the base tables in your particular emDP project.
    - Channel and Cross-Channel models will need non-applicable platforms deleted or commented out.

## Links
- [emDP AdVerity](https://adverity.odp.groupm.tech/datastreams/list/)
- [emDP Portal](https://odp.groupm.tech/#/feeds)
- [emDP Documentation](https://data-platform-community.choreograph.com/hc/en-us/categories/4862048008860)
- [emDP Training Path](https://data-platform-community.choreograph.com/hc/en-us/articles/5411095490588-emDP-Training-Curriculum)

