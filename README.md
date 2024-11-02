# vehicle-performance-predict
Comparative analysis of performance of handling control model and AI-based prediction model

## Overview
- 차량 동력학 책을 공부하면서 기존의 제어 시스템에 대한 이해도를 향상시키고자 함.
- Matlab을 활용한 14자유도의 핸들링 제어 모델을 만들어 AI 기반의 예측모델과 성능 비교 분석을 진행

## Vehicle Parameters
1) vehicle sprung mass(kg) 
2) Distance of sprung mass C.G. from front axle(m) 
3) Distance of sprung mass C.G from rear axle(m): 3) - 2)
4) Front track width (m)
5) Rear track width (m)
6) Height of sprung mass C.G. from rground (m)
7) Vehicle total mass (kg) 
8) Distance of vehicle C.G. from front axle (m) 
9) Distance of vehicle C.G. from rear axle (m)  : 3) - 2)
10) Pitch moment of inertia (kgm^2) 
11) Roll moment of inertia (kgm^2) 
12) Yaw moment of inertia (kgm^2) 
13) Front left unsprung mass (kg) 
14) Front right unsprung mass (kg) 
15) Rear left unsprung mass (kg) 
16) Rear right unsprung mass (kg) 
17) Wheel radius (m) 
18) Wheel moment of inertia (kgm^2) 
19) Front left suspension stiffness (N/m) 
20) Front right suspension stiffness (N/m) 
21) Rear left suspension stiffness (N/m) 
22) Rear right suspension stiffness (N/m) 
23) Front left suspension damping coefficient (Nsec/m) 
24) Front right suspension damping coefficient (Nsec/m) 
25) Rear left suspension damping coefficient (Nsec/m) 
26) Rear right suspension damping coefficient (Nsec/m) 
27) Front right tire stifness (N/m) 
28) Front left tire stifness (N/m) 
29) Rear right tire stifness (N/m) 
30) Rear right tire stifness (N/m) 
31) Gravitional acceleration (ms^-2)

## Vehicle Model
-. a hatch 2017
-. a hatch osg
-. b hatch 2017
-. b hatch osg
-. b sport car
-. c hatch
-. d minivan
-. d sedan
-. d suv v9
-. e sedan
-. e suv
-. european van
-. large european van
-. exotic car, mid engine mt
-. exoti racecar, mid-eng.: MT w/Var. gains
-. f sedan
-. pikcup, compact
-. pickup, full size  10 개
-. utility truck

## Dataset Detail

- vehicle parameter data
![image](https://github.com/user-attachments/assets/a910f86f-9248-451f-8c6d-0416b35b11f5)

- Matlab Simulink model(14 degree model)
![image](https://github.com/user-attachments/assets/afeb50d7-1ded-4213-b1ae-55b33dae7cc3)
![image](https://github.com/user-attachments/assets/42fadc30-6b8e-4deb-9352-3628ff38271f)





- 



