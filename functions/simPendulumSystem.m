function [y,u] = simPendulumSystem(fis,g0,g1,h)
%  SIMPENDULUMSYSTEM Simulate pendulum system
% 
% Run simulink simulation with the given fuzzy controller, and record the angular 
% position and input force to the designated image.
arguments (Input)
    fis (1,1)
    g0 (1,1)
    g1 (1,1)
    h (1,1)
end
arguments (Output)
    y
    u
end
%% Start Simulink
simIn = Simulink.SimulationInput("pendulum_system");
simIn = setVariable(simIn,'g0',g0);
simIn = setVariable(simIn,'g1',g1);
simIn = setVariable(simIn,'h',h);
simIn = setVariable(simIn,'fis',fis);
out=sim(simIn);
%% Extract data
y_data = out.ScopeData.get("y").Values.Data(:,1);
y_time = out.ScopeData.get("y").Values.Time;
u_data = out.ScopeData.get("u").Values.Data(:,1);
u_time = out.ScopeData.get("u").Values.Time;
y = table(y_time,y_data,'VariableNames',{'Time (sec)','Angular posistion (rad)'});
u = table(u_time,u_data,'VariableNames',{'Time (sec)','Input force (N)'});
end