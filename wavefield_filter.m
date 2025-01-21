function [W_df]=wavefield_filter(W,Freq_list)
% Wavefield filtering function
% Input Variables:
% W - complexed wavefield [x,y,z,dir,freq,vibration]
% Output Variables:
% W_df - filtered wavefield
%
% Record of Revision
% Jan-21-2025===Shengyuan Ma===Orignal code 



Nf=0;
sigma=1;
D0 = [0.05,0.09];
rank = [1.5,0.00001];

W(isnan(W))=0;


n1=size(W,1);
n2=size(W,2);
n3=size(W,3);


k1 = -((0:n1-1)-fix(n1/2));
k2 = -((0:n2-1)-fix(n2/2));
k3 = -((0:n3-1)-fix(n3/2));

[XX,YY,ZZ]=ndgrid(k1,k2,k3);
XYZ_=cat(4,XX,YY,ZZ);
xyz=reshape(XYZ_,[length(XX(:)),3]);
xyz=xyz./sqrt(xyz(:,1).^2+xyz(:,2).^2+xyz(:,3).^2);


XYZ_=XYZ_/max(abs(XYZ_(:)));

dis = sqrt(XYZ_(:,:,:,1).^2 + XYZ_(:,:,:,2).^2++ XYZ_(:,:,:,3).^2);

FF=Freq_list/Freq_list(1);

Gp=D0(2)-D0(1);
G0=mean(D0);
p=G0*FF;
DF0=[p-Gp/2;p+Gp/2].';
% DF0=D0.*(FF.');

% D0 = [0.05,0.3]; rank = [3,1];
D0_1=reshape(DF0(:,1),[1,1,1,1,length(FF)]);
D0_2=reshape(DF0(:,2),[1,1,1,1,length(FF)]);
B_lp =  1./(1+ (dis./D0_2).^(2*rank(1)) );
% B_hp =  1./(1+ (D0_1./dis).^(2*rank(2)) );

% BP_filter =  (1-B_lp).*(1-B_hp);
BP_filter =  B_lp;
% BP_filter =  B_lp.*B_hp;

nlist=1:Nf;
phi_=(sqrt(5)-1)/2;
zn=linspace(0,1,Nf);
yn=sqrt(1-zn.^2).*cos(2*pi*nlist*phi_);
xn=sqrt(1-zn.^2).*sin(2*pi*nlist*phi_);
tn=cat(1,xn,yn,zn);
costheta=abs(xyz*tn);
mask=exp(-0.5* (acos(costheta)/sigma).^2 );
prho=reshape(mask,size(XX,1),size(XX,2),size(XX,3),Nf);
prho(isnan(prho))=0;

prho=prho/mean(prho(:))/Nf;
prho=reshape(prho,[n1,n2,n3,1,1,1,Nf]);

prho=prho.*BP_filter;
if Nf==0
    prho=BP_filter;
end

W_df=cifftn(cfftn(W,[1,2,3]).*prho,[1,2,3]);
end

function res = cfftn(x,dim)
% multiple dimentional fft
% Input Variables:
% x - image space data
% dim - dims for fft
% Output Variables:
% res - k space data
%
% Record of Revision
% Jan-21-2025===Shengyuan Ma===Orignal code 

res=x;
for m=1:length(dim)
    res = 1/sqrt(size(res,dim(m)))*fftshift(fft(ifftshift(res,dim(m)),[],dim(m)),dim(m));
end
end

function res = cifftn(x,dim)
% multiple dimentional ifft
% Input Variables:
% x - k space data
% dim - dims for ifft
% Output Variables:
% res - image space data
%
% Record of Revision
% Jan-21-2025===Shengyuan Ma===Orignal code 
res=x;
for m=1:length(dim)
    res = sqrt(size(res,dim(m)))*fftshift(ifft(ifftshift(res,dim(m)),[],dim(m)),dim(m));
end
end