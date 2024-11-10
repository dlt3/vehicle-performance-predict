clear ; close all ; clc ;

path = uigetdir();
List = dir(path) ;

cd(path);

for n  = 3 : 28

    eval(erase(join(["D = readtable('", num2str(n), ".csv') ; "])," "));

    temp = table2array(D) ;
    ay_ind = min(strmatch('Ay',D.Properties.VariableNames));
    str_ind = min(strmatch('Steer_SW',D.Properties.VariableNames));
    beta_ind = min(strmatch('Beta',D.Properties.VariableNames));
    ay  = temp(:, ay_ind) ;
    str_wheel_input  = temp(:, str_ind) ;
    body_slip  = temp(:, beta_ind) ;

    StrWheel(:,n-2) = str_wheel_input ;
    BodySlip(:,n-2) = body_slip ;
    Ay(:,n-2) = ay ;

    % str_wheel_input = str_wheel_input * 180 / pi ;
    % body_slip = body_slip * 180 / pi ;
    % ay = ay / 9.806 ;

    ay_039 = min( find(ay>=0.39) ) ;
    ay_041 = min( find(ay>=0.41) ) ;

    p1 = polyfit( ay(ay_039:ay_041), str_wheel_input(ay_039:ay_041), 1) ;
    p2 = polyfit( ay(ay_039:ay_041), body_slip(ay_039:ay_041), 1) ;

    USG(n-2,1) = p1(1) ;
    SSG(n-2,1) = p2(1) ;
    MaxAy(n-2,1) = max(ay) ;

end

data_output = [ USG SSG MaxAy ] ; % 행 : 차량 + 타이어 버전 , 열 : 해석 결과 기반 성능 지표