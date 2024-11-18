clear ; close all ; clc ;

data = readmatrix('학습데이터_최종의최종.xlsx') ;


% Vehicle sprung mass = data(:,1) ;
% Distance of sprung mass C.G. fom front axle = data(:,2);
% Distance of sprung mass C.G. fom rear axle = data(:,3);
% Front track width = data(:,4);
% Rear track width = data(:,5);
% Height of sprung mass C.G from ground = data(:,6);
% Vehicle total mas = data(:,7);
% Distance of vehicle C.G. from front axle = data(:,8);
% Distance of vehicle C.G. from rear axle = data(:,9);
% Pitch moment of inertia = data(:,10);
% Roll moment of inertia = data(:,11);
% Yaw moment of inertia = data(:,12);
% Front left unsprung mass = data(:,13);
% Front right unsprung mass = data(:,14);
% Rear left unsprung mass = data(:,15);
% Rear right unsprung mass = data(:,16);
% Wheel moment of inertia = data(:,17) ;
% Front left suspension stiffness = data(:,18) ;
% Front right suspension stiffnes = data(:,19) ;
% Rear left suspension stiffness	 = data(:,20) ;
% Rear right suspension stiffness = data(:,21) ;
% Front left suspension damping coefficent = data(:,22) ;
% Front right suspension damping coefficent = data(:,23) ;
% Rear left suspension damping coefficient = data(:,24) ;
% Rear right suspension damping coefficient = data(:,25) ;
% Gravitional acceleration = data(:,26) ;
% Wheel radius = data(:,27) ;
% Front right tire stiffness = data(:,28) ;
% Front left tire stiffness = data(:,29) ;
% Rear left tire stiffness = data(:,30) ;
% Rear right tire stiffness = data(:,31) ;

simloop = length(data(1:5,1)) ;
% simloop = length(data(1:26,1));
simtime = 31 ;
samtime = 0.001 ;

for n = 1 : 1 : simloop

    Ms = data(n,1) ;
    a = data(n,2) ;
    b = data(n,3) ;
    wf = data(n,4) ;
    wr = data(n,5) ;
    h = data(n,6) ;
    mt = data(n,7) ;
    Lf = data(n,8) ;
    Lr = data(n,9) ;
    Ip = data(n,10) ;
    Ir =data(n,11) ;
    Jz = data(n,12) ;
    mufl = data(n,13) ;
    mufr = data(n,14) ;
    murl = data(n,15) ;
    murr = data(n,16) ;
    Iw = data(n,17) ;
    Ksfl = data(n,18) ; % spring stif
    Ksfr = data(n,19) ;
    Ksrl = data(n,20) ;
    Ksrr = data(n,21) ; 
    Csfl = data(n,22) ; % damping coeff
    Csfr = data(n,23) ;
    Csrl = data(n,24) ;
    Csrr = data(n,25) ;
    g = data(n,26) ;
    Rw = data(n,27) ;
    Ktfl = data(n,28) ; % tire stiffness
    Ktfr = data(n,29) ;
    Ktrl = data(n,30) ;
    Ktrr = data(n,31) ;


    sim('dof14model_rev.mdl');

    StrWheel(:,n) = str_wheel_input ;
    BodySlip(:,n) = body_slip * 180 / pi ;
    Ay(:,n) = ay / 9.806 ;

    str_wheel_input = str_wheel_input ;
    body_slip = body_slip * 180 / pi ;
    ay = ay / 9.806 ;

    ay_039 = min(find(ay>=0.39)) ;
    ay_041 = min(find(ay>=0.41)) ;

    p1 = polyfit( ay(ay_039:ay_041), str_wheel_input(ay_039:ay_041), 1) ;
    p2 = polyfit( ay(ay_039:ay_041), body_slip(ay_039:ay_041), 1) ;

    USG(n,1) = p1(1) ;
    SSG(n,1) = p2(1) ;
    MaxAy(n,1) = max(ay) ;
    fprintf('%d\n',n);

end

learning_data_input = data ; % 행 : 차량 + 타이어 버전 , 열 : 차량 + 타이어 파라미터
learning_data_output = [ USG SSG MaxAy ] ; % 행 : 차량 + 타이어 버전 , 열 : 해석 결과 기반 성능 지표
