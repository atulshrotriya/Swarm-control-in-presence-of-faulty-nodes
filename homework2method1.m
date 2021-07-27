function homework2method1
a=0.5; V=1; init=rand(1,6).*(2*pi);
tin=[0 25]; %time interval
A=[0 0 0.5 0 0 0;0.5 0 0 0 0 0.5;0.5 0.5 0 0 0 0;0 0.5 0 0 0 0;0 0 0.5 0 0 0;0 0 0 0.5 0.5 0];
D=[0.5 0 0 0 0 0;0 1 0 0 0 0;0 0 1 0 0 0;0 0 0 0.5 0 0;0 0 0 0 0.5 0;0 0 0 0 0 1];
L=D-A;
[t,x]=ode23(@equations,tin,[init zeros(1,12)]);
function dx=equations(t,x)
 dx=zeros(18,1);
 dx(1:6)=-L*x(1:6);
 dx(7:12)=V.*cos(x(1:6));
 dx(13:18)=V.*sin(x(1:6));
end
theta=x(:,1:6);
figure()
plot(t,theta, 'LineWidth',2)
figure()
plot(x(:,7:12),x(:,13:18),'LineWidth',2)
end