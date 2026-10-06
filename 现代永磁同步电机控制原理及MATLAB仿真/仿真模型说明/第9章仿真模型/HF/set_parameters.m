%% Parameters of the motor
Pw_n = 1;                                                                   % The nominal power of the SM (kW)
Ull_n = 380;                                                                % The nominal line-line voltage (Vrms)
I_n = 2;                                                                    % The nominal current (A)
f_n = 50;                                                                   % The nominal frequency (Hz)
N_n = 1500;                                                                 % The nominal rotation speed of motor (rad.min^-1)                                                       
p = 2;                                                                      % Pole pairs
T_n = 5;                                                                    % The nominal torque of motor (N.m)

Rs = 0.91;                                                                  % The stator resistance (ohm)
Ld = 3.96e-3;                                                               % The d-axis inductance (H)
Lq = 7.96e-3;                                                               % The q-axis inductance (H)
Ls = (Ld+Lq)/2;                                                             % The stator inductance (H)
Flux = 0.446;                                                               % The peak value of flux-linkage established by magnets (Wb)                                                           
Jm = 0.074;                                                                 % Inertia of the rotor (kg.m^2)
Fr = 0.008;                                                                 % Friction factor (N.m.s)

%% Parameters of the frequency converter and power net
fpwm = 10e3;                                                                % The frequency of the pwm (Hz)
Udc = 600;                                                                  % The line-line voltage of power net (Vrms)

%% Simulation parameters
Tcur = 1/fpwm;                                                              % Sample time in current loop (s)
Tsim = Tcur/500;%Tcur;                                                                % Sample time for simulation (s)

%% Controller limiter
T_max = T_n*1.5;                                                            % Maximum torque (Nm)
i_max = I_n*2.0*sqrt(2);                                                    % Maximum current (A)
u_max = Udc/sqrt(3);                                                        % Maximum voltage (V)

%% High frequency injection parameters
f_HF = 1000;                                                                 % Injection signal frequency (Hz)
v_HF = 20;                                                                  % Injection signal amplitude (V)
bw_BPF = 100;                                                               % Bandpass filter bandwidth (Hz)







