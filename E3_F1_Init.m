%% 
%{
ABOUT: Initialization for Simulink model
DATE: February 25, 2022
VERSION: 1.0

LICENSE: Copyright Leonam Pecly, Keyvan Hashtrudi-Zaad and Queen's University. MREN 348: Introduction to Robotics is available under an
Ontario Commons License (https://vls.ecampusontario.ca/wp-content/uploads/2021/01/Ontario-Commons-License-1.0.pdf).
Third-party copyright material is not considered part of the project for the purposes of licensing.
%}
%%
clear; clc;

%% QArm Parameters
QArm_Parameters
Torque2Voltage = (1./QArm.eta) .* (QArm.Rm./QArm.Km);

%% Control Settings
wn = [7.6 7.6 7.6 7.6];
zeta = 1;

%% Partitioning Approach
Ieff = [0.3 0.49 0.18 0.0018];
Beff = [-0.4810    0.0682    3.7731   -0.0059];
Kp = [57.76 57.76 57.76 57.76];
Kd = [15.2 15.2 15.2 15.2];

