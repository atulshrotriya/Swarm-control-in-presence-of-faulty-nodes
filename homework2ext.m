function homework2ext
a=[0.1 0.6 0.8 0.7 0.6 0.5 0.9 0.4 -0.5]; V=1; init=rand(1,6).*(2*pi);
tin=[0 25]; %time interval
for i=1:1:9
    if a(i)>=0
        a(i)=a(i);
    else
        a(i)=0;
%         a(i)=abs(a(i));
    end
end
[t,x]=ode23(@equations,tin,[init zeros(1,12)]);
function dx=equations(t,x)
 dx=zeros(18,1);
 dx(1)=a(1)*(x(3)-x(1));
 dx(2)=a(2)*(x(1)-x(2))+a(3)*(x(6)-x(2));
 dx(3)=a(4)*(x(1)-x(3))+a(5)*(x(2)-x(3));
 dx(4)=a(6)*(x(2)-x(4));
 dx(5)=a(7)*(x(3)-x(5));
 dx(6)=a(8)*(x(4)-x(6))+a(9)*(x(5)-x(6));
 dx(7:12)=cos(x(1:6));
 dx(13:18)=sin(x(1:6));
end
theta=x(:,1:6);
figure(1)
plot(t,theta)
figure(2)
plot(x(:,7),x(:,13),x(:,8),x(:,14),x(:,9),x(:,15),x(:,10),x(:,16),x(:,11),x(:,17),x(:,12),x(:,18))
end