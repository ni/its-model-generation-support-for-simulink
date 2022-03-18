# Inverter Test System Simulation Service

The ni Inverter Test System installs an HTTP service to the NI Linux-RT target which allows a client to monitor, start and stop a simulation model deployed to the test system. These examples show a few ways in which a user can build a client to interact with that server and the Inverter Test System.

## Inverter Test System Simulation Service Description

## Server

The server is hosted on the NI Linux-RT target and is started when a user deploys a VeriStand system definition with the Inverter Test System Toolkit's Simulation Service custom device. Visit the [Inverter Test System Suite](https://www.ni.com/pdf/manuals/378623a.html) readme for details on how to install the Inverter Test System Suite and Toolkit.

Once deployed the service will be hosted at the following URL

`http://<Target Hostname or IP>:8080/simulation/v1/`

### Endpoints

**start-model**

HTTP Verb: POST

`http://<Target Hostname or IP>:8080/simulation/v1/start-model`

This endpoint will command the Simulation Service to begin executing a model. The following is an example of the data to send to this endpoint.
```json
{
  "ModelPath": "/path/to/your/model.so",
  "SLXRTLibraryPath": "/c/ni-rt/VeriStand/Custom Devices/NI/Simulation Service/libslxrt.so",
  "ExternalModePort": 17725,
  "SubrateMaxPriority": 74,
  "SubrateCPUAffinity": -1
}
```

You must send all of these elements; however, it's likely you'll only need to change the ModelPath. The other elements are defaults and work for most normal operation.

**stop-model**

HTTP Verb: GET

`http://<Target Hostname or IP>:8080/simulation/v1/stop-model`

There is no data to send or receive. If a model was running it will stop.

**status**

HTTP Verb: GET

`http://<Target Hostname or IP>:8080/simulation/v1/status`

This will reflect any errors which occurred during the previous step of the model. The following is an example of the data returned by this endpoint.
```json
{
    "State":"",
    "Configured":false,
    "Error":false,
    "Error Code":0
}
```

State is an enum with the following options:

  * Running - Model is executing
  * Stopped - Model is not executing, waiting on a start-model
  * Configuring - Service is configuring (should be a very short time)
  * Stopping Model - Model is stopping (should be a very short time)
  * Stopping Loop - The service is stopping
  * Error

