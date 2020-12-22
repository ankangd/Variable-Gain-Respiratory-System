%{ 
References:
  ---------
  @misc{Subah2020,
  author = {M. R. Subah, F. Sadik, K. Biswas, A. G. Dastider, S. A. Moon},
  title = {Variable-Gain Respiratory System},
  year = {2020},
  publisher = {GitHub},
  journal = {GitHub repository},
  howpublished = {\url{https://github.com/ankangd/Variable-Gain-Respiratory-System}},
  }
%}

clc;
clear;
close all;

%% -----Task 1: Determining H(s)----- %%
R_lung = 5/1000;
C_lung = 20;
R_leak = 60/1000;
R_hose = 4.5/1000;

A_h = - (1/R_hose + 1/R_leak)/(R_lung * C_lung * (1/R_lung + 1/R_hose + 1/R_leak));
B_h = (1/R_hose)/(R_lung * C_lung * (1/R_lung + 1/R_hose + 1/R_leak));
C_h = [(1/R_lung)/(1/R_lung + 1/R_hose + 1/R_leak); - (1/R_hose + 1/R_leak)/(R_lung * (1/R_lung + 1/R_hose + 1/R_leak))];
D_h = [(1/R_hose)/(1/R_lung + 1/R_hose + 1/R_leak); (1/R_hose)/(R_lung * (1/R_lung + 1/R_hose + 1/R_leak))];

s = tf('s');
Hs = C_h * inv(s-A_h) * B_h + D_h;

%% -----Task 2: Determining T(s)----- %%

%Determining B(s)
w_n = 2*pi*30;
zeta = 1;

Bs = w_n^2 / (s^2 + 2*zeta*w_n*s + w_n^2);

%Determining P(s)
Ps = Hs*Bs;

%Determining T(s) for a particular ki
ki = 0.4;
Cs = ki/s;

Ts1 = (Ps(1)*(Cs+1))/(1+Cs*Ps(1));
Ts2 = (Ps(2)*(Cs+1))/(1+Cs*Ps(1));

%% -----Task 3: Sketching the root locus----- %%
rlocus(Ps(1)/s)
xlim([-200 20]);
ylim([-300 300]);

%% -----Task 4: Reproducing Figure 7----- %%
%P_set = (15/s)*(exp(-s)-exp(-5*s)) + (5/s);
P_set = (64.9351/s^2)*(exp(-s)-exp(-1.231*s)) - (15/s)*exp(-5*s);

ki = [0 0.4 10];
Cs = ki/s;

%Outputs for k = 0
Ts1(1) = (Ps(1)*(Cs(1)+1))/(1+Cs(1)*Ps(1));
Ts2(1) = (Ps(2)*(Cs(1)+1))/(1+Cs(1)*Ps(1));
P_aw(1) = Ts1(1)*P_set;
Q_pat(1) = Ts2(1)*P_set;

%Outputs for k = 0.4
Ts1(2) = (Ps(1)*(Cs(2)+1))/(1+Cs(2)*Ps(1));
Ts2(2) = (Ps(2)*(Cs(2)+1))/(1+Cs(2)*Ps(1));
P_aw(2) = Ts1(2)*P_set;
Q_pat(2) = Ts2(2)*P_set;

%Outputs for k = 10
Ts1(3) = (Ps(1)*(Cs(3)+1))/(1+Cs(3)*Ps(1));
Ts2(3) = (Ps(2)*(Cs(3)+1))/(1+Cs(3)*Ps(1));
P_aw(3) = Ts1(3)*P_set;
Q_pat(3) = Ts2(3)*P_set;

%Plotting the outputs
figure
impulse(P_set, P_aw(1), P_aw(2), P_aw(3), 0:0.01:10);
legend('Pset', 'ki = 0', 'ki = 0.4', 'ki = 10');

figure
impulse(Q_pat(1)*60, Q_pat(2)*60, Q_pat(3)*60, 0:0.01:10);
legend('ki = 0', 'ki = 0.4', 'ki = 10');

%% -----Task 6: Designing preferred linear controller----- %%
ki = 4;
Cs = ki*(s+0.01)/s;

Ts1 = (Ps(1)*(Cs+1))/(1+Cs*Ps(1));
Ts2 = (Ps(2)*(Cs+1))/(1+Cs*Ps(1));
P_aw = Ts1*P_set;
Q_pat = Ts2*P_set;

figure
impulse(P_set, P_aw, 0:0.01:10);
legend('Pset', 'ki = 4');
ylim([0 25]);

figure
impulse(Q_pat, 0:0.01:10);
legend('ki = 4');