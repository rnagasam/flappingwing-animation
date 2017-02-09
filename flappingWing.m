%% Simple Animation of an ornithopter
% Performs the forward kinematics for the flapping wing mechanism
% and provides an animation
clear; clc;
lengths = [0.006 0.02 0.015 0.02 0.015]; 
theta1 = (45*pi/180):0.1:(450*pi/180);
d = [0.15 0.21].*0.1; d_l = [-0.15 0.21].*0.1;
wing = 0.033;

A_r = -2*d(1)*lengths(3) + 2*lengths(1)*lengths(3).*cos(theta1);
B_r = -2*d(2)*lengths(3) + 2*lengths(1)*lengths(3).*sin(theta1);
C_r = d(1)^2+d(2)^2+lengths(1)^2+lengths(3)^2-lengths(2)^2-...
    2*lengths(1).*(d(2).*sin(theta1)+d(1).*cos(theta1));

A_l = 2*lengths(1)*lengths(5).*cos(theta1) - 2*lengths(5)*d_l(1);
B_l = 2*lengths(1)*lengths(5).*sin(theta1) - 2*lengths(5)*d_l(2);
C_l = d_l(1)^2+d_l(2)^2+lengths(5)^2+lengths(1)^2-lengths(4)^2-...
    2*lengths(1).*(d_l(1).*cos(theta1)+d_l(2).*sin(theta1));

theta3 = 2*atan2(-B_r-sqrt(B_r.^2-C_r.^2+A_r.^2),C_r-A_r);
theta2 = atan2(d(2)-lengths(3).*sin(theta3)-lengths(1).*sin(theta1),...
    d(1)-lengths(3).*cos(theta3)-lengths(1).*cos(theta1));
theta5 = 2*atan2(-B_l+sqrt(B_l.^2-C_l.^2+A_l.^2),C_l-A_l);
theta4 = atan2(d_l(2)-lengths(5).*sin(theta5)-lengths(1).*sin(theta1),...
    d_l(1)-lengths(5).*cos(theta5)-lengths(1).*cos(theta1));

l1 = lengths(1); l2 = lengths(2); l3 = lengths(3); l4 = lengths(4);
l5 = lengths(5);
for i=1:size(theta1,2)
    clf;
    hold on
    plot([0 l1*cos(theta1(i))],[0 l1*sin(theta1(i))],'r');
    plot([l1*cos(theta1(i)) l1*cos(theta1(i))+l2*cos(theta2(i))],[l1*sin(theta1(i)) ...
        l1*sin(theta1(i))+l2*sin(theta2(i))],'r');
    plot([l1*cos(theta1(i))+l2*cos(theta2(i)) l1*cos(theta1(i))+l2*cos(theta2(i))+l3*cos(theta3(i))],...
        [l1*sin(theta1(i))+l2*sin(theta2(i)) l1*sin(theta1(i))+l2*sin(theta2(i))+l3*sin(theta3(i))],'r')
    plot([l1*cos(theta1(i)) l1*cos(theta1(i))+l4*cos(theta4(i))],[l1*sin(theta1(i)) ...
        l1*sin(theta1(i))+l4*sin(theta4(i))],'r');
    plot([l1*cos(theta1(i))+l4*cos(theta4(i)) l1*cos(theta1(i))+l4*cos(theta4(i))+l5*cos(theta5(i))],...
        [l1*sin(theta1(i))+l4*sin(theta4(i)) l1*sin(theta1(i))+l4*sin(theta4(i))+l5*sin(theta5(i))],'r')
    plot([l1*cos(theta1(i))+l2*cos(theta2(i))+l3*cos(theta3(i)) l1*cos(theta1(i))+l2*cos(theta2(i))+...
        l3*cos(theta3(i))+wing*cos(theta3(i))],[l1*sin(theta1(i))+l2*sin(theta2(i))+l3*sin(theta3(i)) ...
        l1*sin(theta1(i))+l2*sin(theta2(i))+l3*sin(theta3(i))+wing*sin(theta3(i))],'k','LineWidth',2);
    plot([l1*cos(theta1(i))+l4*cos(theta4(i))+l5*cos(theta5(i)) l1*cos(theta1(i))+l4*cos(theta4(i))+...
        l5*cos(theta5(i))+wing*cos(theta5(i))],[l1*sin(theta1(i))+l4*sin(theta4(i))+l5*sin(theta5(i)) ...
        l1*sin(theta1(i))+l4*sin(theta4(i))+l5*sin(theta5(i))+wing*sin(theta5(i))],'k','LineWidth',2);
    axis([-0.5 0.5 -0.5 0.5].*0.1)
    axis equal
    pause(0.01);
end
