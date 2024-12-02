MATLAB Code
This code models and simulates the behavior of a secure surveillance system using motion and temperature sensors along with an alarm-triggering mechanism.

Secure_Surveillance_System.m
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
Documentation
Project Description
The Secure Environment Surveillance System is designed to enhance security by integrating motion and temperature sensors with an alarm system. This MATLAB simulation evaluates sensor data and triggers an alarm when motion is detected or when the temperature exceeds a predefined threshold.

Workflow
Motion Detection: Randomly simulates motion presence (binary: 0 or 1).
Temperature Monitoring: Generates random temperature values with a threshold of 40°C.
Alarm Activation: Triggers an alarm when:
Motion is detected.
Temperature exceeds the threshold.
Visualization:
Motion sensor data.
Temperature variations with threshold indication.
Alarm status.
Graph Interpretations
Motion Sensor Data:

A stem plot showing motion detection over time (0 for no motion, 1 for motion).
Indicates areas of activity within the monitored environment.
Temperature Sensor Data:

A line plot showing temperature fluctuations.
Includes a threshold line to identify critical temperature breaches.
Alarm Status:

A stem plot indicating alarm activation.
Demonstrates system response to motion and temperature conditions.
Applications
Hospitals:

Monitor restricted areas and ensure patient safety.
Detect fires or unauthorized access.
Campuses:

Secure entrances, laboratories, and server rooms.
Ensure safety in case of emergencies.
Smart Cities:

Integrate with other security systems for public safety.
Results Displayed in MATLAB Command Window
Total Time Simulated: Shows the duration of the simulation.
Motion Events Detected: Indicates the number of instances motion was detected.
High Temperature Events: Highlights critical temperature breaches.
Alarm Triggered: Summarizes the number of times the alarm was activated.
