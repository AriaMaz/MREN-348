%% q2.m - Plotting Friction Profile for Each Joint Based on Torque Error
%{
ABOUT: This script loads the computed torque error and necessary data from 'E1_Data.mat',
       computes the necessary dynamics (e.g., velocity), and plots the friction profile for each joint.
DATE: February 25, 2022
VERSION: 1.0
%}

clear; clc;

%% Load Required Data and Parameters
load('E1_Data.mat'); % Load all variables from E1_Data.mat

%% Initialize Variables and Load QArm Parameters
QArm_Parameters; % Assuming this function sets up necessary QArm parameters
sample_rate = 10;
i_s = 100;
i_e = round(length(q.signals.values)*0.95/sample_rate)*sample_rate-1;

%% Adjust Phi to Theta and Compute Velocity
theta = q.signals.values(i_s:i_e,1:4) - [0, pi/2-QArm.beta, QArm.beta, 0]; % Maps Phi to Theta
Ts = q.time(2) - q.time(1); % Assuming consistent sampling, calculate sample time

% Preallocate velocity and acceleration arrays
vel = zeros(size(theta));
accel = zeros(size(theta));

% Compute velocity (and acceleration if needed) for each joint
for k = 1:4 % For each joint
    theta_raw = downsample(theta(:,k), sample_rate);
    theta_raw_interp = interp(theta_raw, sample_rate);
    
    [p, v, a] = f_PVA_CD(theta_raw_interp, Ts, 50, 24); % Assuming this function is defined elsewhere
    vel(:, k) = v; % Store computed velocity
    accel(:, k) = a; % Store computed acceleration
end

%% Assuming Torque_e is already computed or loaded directly
% Placeholder for logic to load or compute Torque_e
% If Torque_e needs to be recomputed or loaded, include those steps here.

%% Plot Friction Profiles for Each Joint
figure(2); clf; % Clear figure window and create a new one
for k = 1:4
    subplot(2, 2, k);
    % Ensure vel and Torque_e are available for plotting
    plot(vel(:,k), Torque_e(:,k), 'o-');
    grid on;
    title(['Joint ', num2str(k), ' Friction Profile']);
    xlabel('Velocity [rad/s]');
    ylabel('Torque Error [N]');
end