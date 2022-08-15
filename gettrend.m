function [ksi,var]=gettrend(xobs,yobs)
AM=[xobs  ones(size(yobs))];
ksi=AM\yobs;
T6std=ones(size(xobs));
P=diag(T6std(:).^-2);
var=inv(AM'*P*AM);
est=var*AM'*P*yobs;
etilde=yobs-AM*est;
mp=2;
lenf=length(yobs);
sigma02hat=etilde'*P*etilde/(lenf-mp); %mp=2
stdi=sqrt(sigma02hat);
var=var*sigma02hat;

end
