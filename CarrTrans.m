Coupled = 1; % on
% Coupled = 0; % off
TwoCarriers = 1; % on
% TwoCarriers = 0; % off
RC = 1; % on 
% RC = 0; % off 

nx = 201;
l = 1e-6;

x = linspace(0,l,nx);
dx = x(2)-x(1);
xm = x(1:nx-1) + 0.5*dx;

% Nd = 1e16 * 1e6; % Const. 1/cm3 (100 cm/m)^3
Nd = linspace(1e16,20e16,nx) * 1e6; % Linear gradient from 1e6 to 20e16
NetDoping = ones(1,nx).*Nd; % doping

x0 = l/2;
nw = l/20;
npDisturbance = 1e16*1e6*exp(-((x-x0)/nw).^2);
% npDisturbance = 0; % disturbance off

LVbc = 0;
RVbc = 0;

TStop = 14200000*1e-18;
PlDelt = 100000*1e-18;

% PlotYAxis = {[-1e-15 2e-15] [-2e-9 2e-9] [-1.5e-12 1.5e-12]...
%     [1e22 2e22] [0 1e22] [0 20e43]...
%     [-20e33 15e33] [-2.5e34 2e34] [-1.1e8 1.1e8] ...
%     [-1e8 1e8] [-10e-3 10e-3] [0 2e22]};
PlotYAxis = {[-0.1 0.1] [-1e5 20e5] [-1e4 1e4]...% Edited fro linear gradient
    [0 2e23] [-0.1e22 1e22] [-1e44 10e44]...
    [-5e33 5e33] [-1e34 1e34] [-1.1e9 1.1e9] ...
    [-5e7 5e7] [-15e-3 15e-3] [-0.5e23 2.5e23]};

doPlotImage = 0;
PlotFile = 'Gau2CarRC.gif';
