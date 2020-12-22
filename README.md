# Variable-Gain Respiratory System

Mechanical ventilation is imperative for the patients facing difficulties in breathing by themselves. The scenario has become even more germane during the current COVD-19 time. The basic working method of a mechanical ventilator is quite straightforward – it increases the pressure to fill the lungs with air during an inspiration, and decreased subsequently to release the air from the lungs during expiration. However, maintaining the patient-ventilator synchrony is quite important as the ventilator should be able to accurately track the patient’s condition. To achieve accurate results i.e. rapid release and buildup of pressure, high-gain pressure controller is preferred. But to eliminate the oscillations partly, low-gain pressure controller is preferred. So there should be a tradeoff between a high-gain and a low-gain controller, for which the paper dealt with a variable-gain control method, which has been reproduced in this project following the analysis of the answers of the give questions. 

## Method
Here we reporduced some parts of the paper by Hunnekens et. al. [1] following the investigation of 8 given tasks.

## Tasks
1. Determining the transfer function of the respiratory system shown in Fig. 3.
2. Determining the overall transfer function of the closed loop control system shown in Fig. 4.
3. Sketching the root locus of the control system shown in Fig. 4 for 0<ki< of the integral controller C(s).
4. Reproducing the results shown in Fig. 7 for the combined feedback and feedforward control system. Discuss the necessity of both feedback and feedforward control.
5. Should we prefer a PI or a lag controller? Why or why not?
6. Designing the preferred linear controller in order to meet the specifications stated in page 166 between column 1 and 2.
7. Reproducing the results shown in Fig. 14 for linear and variable gain controllers. Finding the pros and cons of nonlinear control over linear control.
8. Discussing the performance of both linear and nonlinear control systems in presence of uncertainties such as different lung parameters, pressure drop etc.

## Description

* The **Tasks_1_to_6.m** shows the result for the first 6 tasks mentioned above. The necessary parameters have been selected from [1]. For the next tasks, Simulink is utilized. All the simulink models are presented in the **Simulink_Models** folder. **Figures** folder contains the necessary figures.

For details, please read the original paper [1].

![Result for the Combined Feedback and Feedforward system](https://github.com/ankangd/Variable-Gain-Respiratory-System/blob/main/Figures/Task_4_Qpat.png)

## Original Paper

The paper we followed here can be found [here (IEEE Link)](https://ieeexplore.ieee.org/document/8488683).

[1] B. Hunnekens, S. Kamps and N. Van De Wouw, "Variable-Gain Control for Respiratory Systems," in IEEE Transactions on Control Systems Technology, vol. 28, no. 1, pp. 163-171,    Jan. 2020, doi: 10.1109/TCST.2018.2871002.
