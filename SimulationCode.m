% Secure Environment Surveillance System
% Designed for hospital and campus applications
clear; clc;

%% Parameters
% Simulation time
sim_time = 10; % seconds

% Motion sensor parameters
motion_detected = randi([0, 1], 1, sim_time); % Random motion detection (0: No motion, 1: Motion)

% Temperature sensor parameters
temperature = 20 + 5 * randn(1, sim_time); % Simulated temperature (mean: 20°C, std dev: 5°C)
temperature_threshold = 40; % Threshold for high temperature

% Alarm Initialization
alarm = zeros(1, sim_time);

%% Simulation Loop
for t = 1:sim_time
    % Check conditions for alarm activation
    if motion_detected(t) == 1 || temperature(t) > temperature_threshold
        alarm(t) = 1; % Trigger alarm
    else
        alarm(t) = 0; % No alarm
    end
end

%% Plotting Results
time = 1:sim_time;

% Motion detection plot
subplot(3, 1, 1);
stem(time, motion_detected, 'LineWidth', 1.5);
title('Motion Sensor Data');
xlabel('Time (s)'); ylabel('Motion Detected (0/1)');
grid on;

% Temperature plot
subplot(3, 1, 2);
plot(time, temperature, 'LineWidth', 1.5);
hold on;
yline(temperature_threshold, '--r', 'Temperature Threshold');
title('Temperature Sensor Data');
xlabel('Time (s)'); ylabel('Temperature (°C)');
grid on;

% Alarm plot
subplot(3, 1, 3);
stem(time, alarm, 'LineWidth', 1.5, 'MarkerFaceColor', 'r');
title('Alarm Status');
xlabel('Time (s)'); ylabel('Alarm (0/1)');
grid on;

%% Display Results in Command Window
disp('--- Simulation Results ---');
disp(['Total Time Simulated: ', num2str(sim_time), ' seconds']);
disp(['Motion Events Detected: ', num2str(sum(motion_detected))]);
disp(['High Temperature Events Detected: ', num2str(sum(temperature > temperature_threshold))]);
disp(['Alarm Triggered: ', num2str(sum(alarm)), ' times']);
