# LabVIEW Model Deployment

This example shows how to use LabVIEW to deploy a compile simulation model to an Inverter Test System

Open the [Deployment Utility.lvproj](Deployment%20Utility.lvproj) and Open [Simulation Deployment Utility.vi](Simulation%20Deployment%20Utility.vi)

This VI will connect to a given target via WebDAV and will send the compiled model you select to the target. The path of the model on the target is then sent to the [ITS Web Service](WebService.md) and the model is started.
