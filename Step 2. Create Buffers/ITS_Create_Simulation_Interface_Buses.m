% Create buses for data passed to/from NI Inverter Test System and 
% Simulink models

VeristandToSimulinkChannelCount = 32;
SimulinkToVeristandChannelCount = 32;
FPGAHardwareConfiguration="ITS_eHSx64_Dual_PMSM_VDQ_IO_7868R";

Ts=1/20e3;

%
% CREATE EV_SIMULINK_INPUTS BUS
%

clear elems;
c = int32(0);

switch FPGAHardwareConfiguration
    case "ITS_eHSx64_Dual_PMSM_VDQ_IO_7868R"

    for m = 1:2

        channel_prefix = 'In';
        element_prefix = append('PMSM',sprintf('%1d',m),'_');

        c = c+1;
        elems(c) = Simulink.BusElement;
        elems(c).Name = append(channel_prefix,sprintf('%03d_',c),element_prefix,'CurrentPhaseA_A');

        c = c+1;
        elems(c) = Simulink.BusElement;
        elems(c).Name = append(channel_prefix,sprintf('%03d_',c),element_prefix,'CurrentPhaseB_A');

        c = c+1;
        elems(c) = Simulink.BusElement;
        elems(c).Name = append(channel_prefix,sprintf('%03d_',c),element_prefix,'CurrentPhaseC_A');

        c = c+1;
        elems(c) = Simulink.BusElement;
        elems(c).Name = append(channel_prefix,sprintf('%03d_',c),element_prefix,'VoltageAveragePhaseA_V');

        c = c+1;
        elems(c) = Simulink.BusElement;
        elems(c).Name = append(channel_prefix,sprintf('%03d_',c),element_prefix,'VoltageAveragePhaseB_V');

        c = c+1;
        elems(c) = Simulink.BusElement;
        elems(c).Name = append(channel_prefix,sprintf('%03d_',c),element_prefix,'VoltageAveragePhaseC_V');

        c = c+1;
        elems(c) = Simulink.BusElement;
        elems(c).Name = append(channel_prefix,sprintf('%03d_',c),element_prefix,'ThreePhaseActivePower_W');

        c = c+1;
        elems(c) = Simulink.BusElement;
        elems(c).Name = append(channel_prefix,sprintf('%03d_',c),element_prefix,'ThreePhaseReactivePower_VAR');

        c = c+1;
        elems(c) = Simulink.BusElement;
        elems(c).Name = append(channel_prefix,sprintf('%03d_',c),element_prefix,'DirectStatorCurrentId_A');

        c = c+1;
        elems(c) = Simulink.BusElement;
        elems(c).Name = append(channel_prefix,sprintf('%03d_',c),element_prefix,'QuadratureStatorCurrentIq_A');

        c = c+1;
        elems(c) = Simulink.BusElement;
        elems(c).Name = append(channel_prefix,sprintf('%03d_',c),element_prefix,'MechanicalAngle_deg');

        c = c+1;
        elems(c) = Simulink.BusElement;
        elems(c).Name = append(channel_prefix,sprintf('%03d_',c),element_prefix,'ElectricalAngle_deg');

        c = c+1;
        elems(c) = Simulink.BusElement;
        elems(c).Name = append(channel_prefix,sprintf('%03d_',c),element_prefix,'Torque_Nm');

        c = c+1;
        elems(c) = Simulink.BusElement;
        elems(c).Name = append(channel_prefix,sprintf('%03d_',c),element_prefix,'ResolverSine');

        c = c+1;
        elems(c) = Simulink.BusElement;
        elems(c).Name = append(channel_prefix,sprintf('%03d_',c),element_prefix,'ResolverCosine');

        c = c+1;
        elems(c) = Simulink.BusElement;
        elems(c).Name = append(channel_prefix,sprintf('%03d_',c),element_prefix,'ResolverCarrier');

        c = c+1;
        elems(c) = Simulink.BusElement;
        elems(c).Name = append(channel_prefix,sprintf('%03d_',c),element_prefix,'ResolverAngle_deg');

        c = c+1;
        elems(c) = Simulink.BusElement;
        elems(c).Name = append(channel_prefix,sprintf('%03d_',c),element_prefix,'Speed_RPM');

        c = c+1;
        elems(c) = Simulink.BusElement;
        elems(c).Name = append(channel_prefix,sprintf('%03d_',c),element_prefix,'TotalTorque_Nm');

        c = c+1;
        elems(c) = Simulink.BusElement;
        elems(c).Name = append(channel_prefix,sprintf('%03d_',c),element_prefix,'BackEMFPhaseA_V');

        c = c+1;
        elems(c) = Simulink.BusElement;
        elems(c).Name = append(channel_prefix,sprintf('%03d_',c),element_prefix,'BackEMFPhaseB_V');

        c = c+1;
        elems(c) = Simulink.BusElement;
        elems(c).Name = append(channel_prefix,sprintf('%03d_',c),element_prefix,'BackEMFPhaseC_V');

    end

    element_prefix = 'Measurements_';

    c = c+1;
    start_index = c;
    count = 64;
    end_index = start_index+count-1;

    for c = start_index:end_index
        elems(c) = Simulink.BusElement;
        str_Name = append(channel_prefix,sprintf('%03d_',c),element_prefix,sprintf('%03d',c-start_index+1));
        elems(c).Name = str_Name;    
    end

    element_prefix = 'AnalogOutputs_';

    c = c+1;
    start_index = c;
    count = 18;
    end_index = start_index+count-1;

    for c = start_index:end_index
        elems(c) = Simulink.BusElement; 
        str_Name = append(channel_prefix,sprintf('%03d_',c),element_prefix,sprintf('%03d',c-start_index+1));
        elems(c).Name = str_Name; 
    end

    element_prefix = 'AnalogInputs_';

    c = c+1;
    start_index = c;
    count = 6;
    end_index = start_index+count-1;

    for c = start_index:end_index
        elems(c) = Simulink.BusElement;
        elems(c).Name = append(channel_prefix,sprintf('%03d_',c),element_prefix,sprintf('%03d',c-start_index+1));
    end

    c = c+1;
    elems(c) = Simulink.BusElement;
    elems(c).Name = append(channel_prefix,sprintf('%03d_',c),element_prefix,'DigitalInputs_001to032');

    c = c+1;
    elems(c) = Simulink.BusElement;
    elems(c).Name = append(channel_prefix,sprintf('%03d_',c),element_prefix,'Reserved');

    c = c+1;
    elems(c) = Simulink.BusElement;
    elems(c).Name = append(channel_prefix,sprintf('%03d_',c),element_prefix,'PMSM_AB_Encoders');

    c = c+1;
    elems(c) = Simulink.BusElement;
    elems(c).Name = append(channel_prefix,sprintf('%03d_',c),element_prefix,'DigitalOutputs_001to016');
    
    otherwise
        ME = MException('CreateSimulinkInterfaceBuses:noFPGAHardwareConfiguration', ...
        'FPGA Hardware Configuration \"%s\" not found.',FPGAHardwareConfiguration);
        throw(ME)
end

FPGAToSimulinkChannelCount=c;

element_prefix = 'VeristandToSimulink_';

c = c+1;
start_index = c;
count = VeristandToSimulinkChannelCount;
end_index = start_index+count-1;

for c = start_index:end_index
    elems(c) = Simulink.BusElement;
    elems(c).Name = append(channel_prefix,sprintf('%03d_',c),element_prefix,sprintf('%03d',c-start_index+1));
end

SimulinkInputBus = Simulink.Bus;
SimulinkInputBus.Elements = elems;
SimulinkInputBusChannelCount=c;

disp(sprintf('\nSimulinkInputBusChannelCount = %d',SimulinkInputBusChannelCount))

for n = 1:c
    disp(elems(n).Name)
end

% Create bus for data passed from Simulink to FPGA (SimulinkOutputBus)

start_index = 1;
end_index = start_index+64-1;


%
% CREATE EV_SIMULINK_OUTPUTS BUS
%

clear elems;
c = int32(0);

for m = 1:2
    
    channel_prefix = 'Out';
    element_prefix = append('PMSM',sprintf('%1d',m),'_');

    c = c+1;
    elems(c) = Simulink.BusElement;
    elems(c).Name = append(channel_prefix,sprintf('%03d_',c),element_prefix,'MechanicalModelMode_Speed0Torque1');

    c = c+1;
    elems(c) = Simulink.BusElement;
    elems(c).Name = append(channel_prefix,sprintf('%03d_',c),element_prefix,'Speed_RPM');

    c = c+1;
    elems(c) = Simulink.BusElement;
    elems(c).Name = append(channel_prefix,sprintf('%03d_',c),element_prefix,'LoadTorque_Nm');
   
end    

element_prefix = 'Sources_';

c = c+1;
start_index = c;
count = 64;
end_index = start_index+count-1;

for c = start_index:end_index
    elems(c) = Simulink.BusElement;
    elems(c).Name = append(channel_prefix,sprintf('%03d_',c),element_prefix,sprintf('%03d',c-start_index+1));
end

element_prefix = 'AnalogOutputs_';

c = c+1;
start_index = c;
count = 18;
end_index = start_index+count-1;

for c = start_index:end_index
    elems(c) = Simulink.BusElement;
    elems(c).Name = append(channel_prefix,sprintf('%03d_',c),element_prefix,sprintf('%03d',c-start_index+1));
end

c = c+1;
elems(c) = Simulink.BusElement;
elems(c).Name = append(channel_prefix,sprintf('%03d_',c),element_prefix,'SwitchCommands_001to032');

c = c+1;
elems(c) = Simulink.BusElement;
elems(c).Name = append(channel_prefix,sprintf('%03d_',c),element_prefix,'SwitchCommands_033to064');

c = c+1;
elems(c) = Simulink.BusElement;
elems(c).Name = append(channel_prefix,sprintf('%03d_',c),element_prefix,'DigitalOutputs_001to016');

c = c+1;
elems(c) = Simulink.BusElement;
elems(c).Name = append(channel_prefix,sprintf('%03d_',c),element_prefix,'Reserved');

SimulinkToFPGAChannelCount=c;

element_prefix = 'SimulinkToVeristand_';

c = c+1;
start_index = c;
count = SimulinkToVeristandChannelCount;
end_index = start_index+count-1;

for c = start_index:end_index
    elems(c) = Simulink.BusElement;
    elems(c).Name = append(channel_prefix,sprintf('%03d_',c),element_prefix,sprintf('%03d',c-start_index+1));
end

SimulinkOutputBus = Simulink.Bus;
SimulinkOutputBus.Elements = elems;
SimulinkOutputBusChannelCount=c;

disp(sprintf('\nSimulinkOutputBusChannelCount = %d',SimulinkOutputBusChannelCount))

for n = 1:c
    disp(elems(n).Name)
end

disp(sprintf('\nVeristandToSimulinkChannelCount,SimulinkToVeristandChannelCount = %d,%d',VeristandToSimulinkChannelCount,SimulinkToVeristandChannelCount))
disp(sprintf('\nFPGAToSimulinkChannelCount,SimulinkToFPGAChannelCount = %d,%d',FPGAToSimulinkChannelCount,SimulinkToFPGAChannelCount))
disp(sprintf('\nSimulink Inport Bus Name, Simulink Outport Bus Name: \"SimulinkInputBus\", \"SimulinkOutputBus\"'))
disp(sprintf('\nSimulinkInputBusChannelCount,SimulinkOutputBusChannelCount = %d,%d',SimulinkInputBusChannelCount,SimulinkOutputBusChannelCount))

%
% CLEAN UP
%

clear c count element_prefix elems end_index m n start_index str_Name
