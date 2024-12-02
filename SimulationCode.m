% Clear workspace
clear; clc;

% Parameters
time_duration = 20; % Simulation time in seconds
motion_trigger = randi([0, 1], 1, time_duration); % Random motion detection (1 = motion detected)
temperature_data = 20 + randn(1, time_duration); % Random temperature data around 20°C
temperature_threshold = 30; % Temperature alert threshold in °C

% Initialize system states
camera_state = zeros(1, time_duration); % 0 = off, 1 = on
alarm_state = zeros(1, time_duration); % 0 = off, 1 = on

% Simulation logic
for t = 1:time_duration
    if motion_trigger(t) == 1
        camera_state(t) = 1; % Activate camera
        disp(['Motion detected at time ', num2str(t), ' seconds. Camera ON.']);
    end
    
    if temperature_data(t) > temperature_threshold
        alarm_state(t) = 1; % Trigger alarm
        disp(['High temperature detected at time ', num2str(t), ...
              ' seconds. Alarm Activated. Temp: ', num2str(temperature_data(t)), '°C']);
    end
end

% Visualization
figure;
subplot(3,1,1);
stem(motion_trigger, 'LineWidth', 1.5);
title('Motion Sensor Output');
xlabel('Time (s)'); ylabel('Motion Detected (0/1)'); grid on;

subplot(3,1,2);
plot(temperature_data, '-o', 'LineWidth', 1.5);
hold on;
yline(temperature_threshold, 'r--', 'Threshold');
title('Temperature Sensor Data');
xlabel('Time (s)'); ylabel('Temperature (°C)'); grid on;

subplot(3,1,3);
plot(camera_state, 'g', 'LineWidth', 1.5);
hold on;
plot(alarm_state, 'r', 'LineWidth', 1.5);
legend('Camera State', 'Alarm State');
title('System States');
xlabel('Time (s)'); ylabel('State (0/1)'); grid on;

disp('Simulation Complete.');
