function homework2
a=0.5; V=1; init=rand(1,6).*(2*pi);
tin=[0 25]; %time interval
[t,x]=ode23(@equations,tin,[init zeros(1,12)]);
function dx=equations(t,x)
 dx=zeros(18,1);
 dx(1)=a*(x(3)-x(1));
 dx(2)=a*(x(1)-x(2))+a*(x(6)-x(2));
 dx(3)=a*(x(1)-x(3))+a*(x(2)-x(3));
 dx(4)=a*(x(2)-x(4));
 dx(5)=a*(x(3)-x(5));
 dx(6)=a*(x(4)-x(6))+a*(x(5)-x(6));
 dx(7:12)=cos(x(1:6));
 dx(13:18)=sin(x(1:6));
end
theta=x(:,1:6);
figure(1)
plot(t,theta,'LineWidth',2)
title('Plot for Heading vs. Time')
ylabel('Heading (\theta)')
xlabel('Time in seconds')
legend({'theta1','theta2','theta3','theta4','theta5','theta6'})
figure(2)
plot(x(:,7:12),x(:,13:18),'LineWidth',2)
title('Plot for position vs. time')
xlabel('x-axis')
ylabel('y-axis')
legend({'x1','x2','x3','x4','x5','x6'})
end