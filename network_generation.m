%   <<----------------˵��-------------------------->>
%   name: network topolopgy generation.
%   author: xhs  Github ID:iseexuhs
%   date: 2018-08-17
%   run on MATLAB R2016R
%   welcome to star this repository. ^_^
%   <<--------------------------------------------->>

%��������
%clear;
%clc;
%�������
%core_node=6;
%sub_net=[4 3 4 5 3 4 ];
%subb_net=[2 0 2 2 2 2 2 2 2 1 2 0 2 ];
R=4;%���Ĳ�뾶
Rr=R+1.5;%С���Ĳ�뾶
Rrr=R+3; %�����뾶

%����Բ������β���
n=0:0.01:2*pi;
x1=R*cos(n);
y1=R*sin(n);
x2=Rr*cos(n);
y2=Rr*sin(n);
x3=Rrr*cos(n);
y3=Rrr*sin(n);
alf=linspace(pi/2,5/2*pi,core_node+1);
xz=R*cos(alf);
yz=R*sin(alf);
%���ƺ��Ĳ�
plot(xz,yz,'-gs','LineWidth',2);
hold on
%set(h,'LineWidth',2)
%���Ƹ���Բ1
plot(x1,y1,'--k');

%������������ڵ��λ��
for s=1:length(sub_net)
    position=[];
    for n=1:(sub_net(s)+2)
        if n==1
            position(n,1)=R*cos(pi/2+(s-1)*2*pi/core_node);
            position(n,2)=R*sin(pi/2+(s-1)*2*pi/core_node);
        elseif n==(sub_net(s)+2)
             position(n,1)=R*cos(pi/2+(s)*2*pi/core_node);
             position(n,2)=R*sin(pi/2+(s)*2*pi/core_node);
        else
            position(n,1)=Rr*cos(pi/2+2*pi/core_node*(s-1)+2*pi/core_node*(n-1)/(sub_net(s)+1));
            position(n,2)=Rr*sin(pi/2+2*pi/core_node*(s-1)+2*pi/core_node*(n-1)/(sub_net(s)+1));
        end
    end
    Nposition{s}=position;
end
%��ȡ�����ڵ��λ��
L=length(subb_net);
t=1;
if 0<=L && L<=sub_net(t)
for s=1:L
    
        position=[];
        if subb_net(s)==1
            position(1,:)=Nposition{1}((s+1),:);
            % position(2,:)=Rrr/Rr*(Nposition{1}((s5+1),:)+Nposition{1}((s5+2),:))/2;
            position(2,1)=Rrr*cos(pi/2+2*pi/core_node*s/(sub_net(1)+1));
            position(2,2)=Rrr*sin(pi/2+2*pi/core_node*s/(sub_net(1)+1));
        else
            for n=1:(subb_net(s)+2)
                if n==1
                    position(n,:)=Nposition{1}((s+1),:);
                elseif n==(subb_net(s)+2)
                    position(n,:)=Nposition{1}((s+2),:);
                else
                    position(n,1)=Rrr*cos(pi/2+2*pi/core_node*s/(sub_net(1)+1)+2*pi/core_node/(sub_net(1)+1)/(subb_net(s)+1)*(n-1));
                    position(n,2)=Rrr*sin(pi/2+2*pi/core_node*s/(sub_net(1)+1)+2*pi/core_node/(sub_net(1)+1)/(subb_net(s)+1)*(n-1));
                end
                
            end
        end
            Nsubposition{s}=position;
end
    %L=-1;
else
    while 0<L && L>sub_net(t)
        if t==1
            for s=1:sub_net(t)
    
        position=[];
        if subb_net(s)==1
            position(1,:)=Nposition{t}((s+1),:);
            % position(2,:)=Rrr/Rr*(Nposition{1}((s5+1),:)+Nposition{1}((s5+2),:))/2;
            position(2,1)=Rrr*cos(pi/2+2*pi/core_node*(t-1)+2*pi/core_node*s/(sub_net(t)+1));
            position(2,2)=Rrr*sin(pi/2+2*pi/core_node*(t-1)+2*pi/core_node*s/(sub_net(t)+1));
        else
            for n=1:(subb_net(s)+2)
                if n==1
                    position(n,:)=Nposition{t}((s+1),:);
                elseif n==(subb_net(s)+2)
                    position(n,:)=Nposition{t}((s+2),:);
                else
                    position(n,1)=Rrr*cos(pi/2+2*pi/core_node*s/(sub_net(t)+1)+2*pi/core_node/(sub_net(t)+1)/(subb_net(s)+1)*(n-1));
                    position(n,2)=Rrr*sin(pi/2+2*pi/core_node*s/(sub_net(t)+1)+2*pi/core_node/(sub_net(t)+1)/(subb_net(s)+1)*(n-1));
                end
                
            end
        end
            %if t==1
                Nsubposition{s}=position;
            %else
                %Nsubposition{sum(sub_net(1,1:(t-1)))+s}=position;
            %end
            end
             
            
             %t������1�����
        else
       for s=1:sub_net(t)
    
        position=[];
        if subb_net(sum(sub_net(1,1:(t-1)))+s)==1
            position(1,:)=Nposition{t}((s+1),:);
            % position(2,:)=Rrr/Rr*(Nposition{1}((s5+1),:)+Nposition{1}((s5+2),:))/2;
            position(2,1)=Rrr*cos(pi/2+2*pi/core_node*(t-1)+2*pi/core_node*s/(sub_net(t)+1));
            position(2,2)=Rrr*sin(pi/2+2*pi/core_node*(t-1)+2*pi/core_node*s/(sub_net(t)+1));
        else
            for n=1:(subb_net(sum(sub_net(1,1:(t-1)))+s)+2)
                if n==1
                    position(n,:)=Nposition{t}((s+1),:);
                elseif n==(subb_net(sum(sub_net(1,1:(t-1)))+s)+2)
                    position(n,:)=Nposition{t}((s+2),:);
                else
                    position(n,1)=Rrr*cos(pi/2+2*pi/core_node*(t-1)+2*pi/core_node*s/(sub_net(t)+1)+2*pi/core_node/(sub_net(t)+1)/(subb_net(sum(sub_net(1,1:(t-1)))+s)+1)*(n-1));
                    position(n,2)=Rrr*sin(pi/2+2*pi/core_node*(t-1)+2*pi/core_node*s/(sub_net(t)+1)+2*pi/core_node/(sub_net(t)+1)/(subb_net(sum(sub_net(1,1:(t-1)))+s)+1)*(n-1));
                end
                
            end
        end
            %if t==1
               % Nsubposition{s}=position;
            %else
               Nsubposition{sum(sub_net(1,1:(t-1)))+s}=position;  
            %end
       end
      
        end
        L=L-sub_net(t);
        t=t+1;
        if L<=sub_net(t)&&L>0
            for s=1:L
    
                position=[];
                if subb_net(sum(sub_net(1,1:(t-1)))+s)==1
                    position(1,:)=Nposition{t}((s+1),:);
                    % position(2,:)=Rrr/Rr*(Nposition{1}((s5+1),:)+Nposition{1}((s5+2),:))/2;
                    position(2,1)=Rrr*cos(pi/2+2*pi/core_node*(t-1)+2*pi/core_node*s/(sub_net(t)+1));
                    position(2,2)=Rrr*sin(pi/2+2*pi/core_node*(t-1)+2*pi/core_node*s/(sub_net(t)+1));
                else
                    for n=1:(subb_net(sum(sub_net(1,1:(t-1)))+s)+2)
                        if n==1
                            position(n,:)=Nposition{t}((s+1),:);
                        elseif n==(subb_net(sum(sub_net(1,1:(t-1)))+s)+2)
                            position(n,:)=Nposition{t}((s+2),:);
                        else
                             position(n,1)=Rrr*cos(pi/2+2*pi/core_node*(t-1)+2*pi/core_node*s/(sub_net(t)+1)+2*pi/core_node/(sub_net(1)+1)/(subb_net(sum(sub_net(1,1:(t-1)))+s)+1)*(n-1));
                             position(n,2)=Rrr*sin(pi/2+2*pi/core_node*(t-1)+2*pi/core_node*s/(sub_net(t)+1)+2*pi/core_node/(sub_net(1)+1)/(subb_net(sum(sub_net(1,1:(t-1)))+s)+1)*(n-1));
                        end
                
                    end
                end
               Nsubposition{sum(sub_net(1,1:(t-1)))+s}=position; 
            end
            
        end
    end
end
%subb_net=[3 5 6 6 8]   
for s=1:length(subb_net)
    if subb_net(s)==1
       subb_matrix=[0 1;1 0];
    else
       subb_matrix=zeros(2+subb_net(s));
       for n=1:(2+subb_net(s))
            if n==1
                subb_matrix(1,1+1)=1;
            elseif n==(2+subb_net(s))
                subb_matrix((2+subb_net(s)),(1+subb_net(s)))=1;
            else
                subb_matrix(n,n-1)=1;
                subb_matrix(n,n+1)=1;
            end
       end
    end
    Nsubmatrix{s}=subb_matrix;
end
%�������������ڽӾ���
for s=1:length(sub_net)
    sub_matrix=zeros(2+sub_net(s));
    for n=1:(2+sub_net(s))
        if n==1
            sub_matrix(1,1+1)=1;
        elseif n==(2+sub_net(s))
            sub_matrix((2+sub_net(s)),(1+sub_net(s)))=1;
        else
            sub_matrix(n,n-1)=1;
            sub_matrix(n,n+1)=1;
        end
    end
    Nmatrix{s}=sub_matrix;
end

%С���Ĳ�gplot
for s=1:length(sub_net)
    gplot(Nmatrix{s},Nposition{s},'-r.');%set(h,'LineWidth',2
end
%�����gplot
for s=1:length(subb_net)
    gplot(Nsubmatrix{s},Nsubposition{s},'-r.')
end

%���Ĳ�ڵ��ע
for k=1:core_node
text(R*cos(pi/2+(k-1)*2*pi/core_node)+0.1,R*sin(pi/2+(k-1)*2*pi/core_node)+0.1,num2str(k),'color','b','fontsize',14)
end
%С���Ĳ�ڵ��ע
for s=1:length(sub_net)
    for n=1:sub_net(s)
        if s==1
            %text(Rr*cos(pi/2+2*pi/core_node*(s4-1)+2*pi/core_node*kk/(sub_net(s4)+1)),Rr*sin(pi/2+2*pi/core_node*(s4-1)+2*pi/core_node*kk/(sub_net(s4)+1)),num2str(kk+core_node),'color','b','fontsize',12)
            text(Nposition{s}((n+1),1)+0.2,Nposition{s}((n+1),2)-0.1,num2str(n+core_node),'color','b','fontsize',12)
        else
            %text(Rr*cos(pi/2+2*pi/core_node*(s4-1)+2*pi/core_node*kk/(sub_net(s4)+1)),Rr*sin(pi/2+2*pi/core_node*(s4-1)+2*pi/core_node*kk/(sub_net(s4)+1)),num2str(kk+core_node+sum(sub_net(1,1:(s4-1)))),'color','b','fontsize',12)
            text(Nposition{s}((n+1),1)+0.2,Nposition{s}((n+1),2)-0.1,num2str(n+core_node+sum(sub_net(1,1:(s-1)))),'color','b','fontsize',12)
            
        end
    end
end
%�����ڵ��ע
for s=1:length(subb_net)
    for n=1:subb_net(s)
        if s==1
            text(Nsubposition{s}((n+1),1)-0.3,Nsubposition{s}((n+1),2)+0.3,num2str(n+sum(core_node)+sum(sub_net)),'color','b','fontsize',8)
        else
            text(Nsubposition{s}((n+1),1)-0.3,Nsubposition{s}((n+1),2)+0.3,num2str(n+sum(core_node)+sum(sub_net)+sum(subb_net(1,1:(s-1)))),'color','b','fontsize',8)
        end
    end
end

%���Ƹ���Բ2��3
plot(x2,y2,'--k',x3,y3,'--k')
%ͼ�δ���
xlabel('����߳�')
ylabel('����߳�')
legend('���Ĳ�','����Բ','�����')
title('SDH����ͨ��������һ�廯��������ͼ','fontweight','bold')
axis 'equal';
axis([-10 10 -10 10])
%����ı���ע
if flag3
    text(-9.8,-7.5,['1�����Ĳ�1������Ԫ����Ϊ',num2str(core_node),'����'],'fontsize',9)
    text(-9.8,-8.5,['2�������',num2str(length(sub_net)),'������Ԫ�����ֱ�Ϊ',num2str(sub_net),'����','�ڵ�������7����������2.5G�豸,�������ɱ����䡣'],'fontsize',9)
else
    text(-9.8,-7.5,['1�����Ĳ�1������Ԫ����Ϊ',num2str(core_node),'����'],'fontsize',9)
    text(-9.8,-8.5,['2��С����',num2str(length(sub_net)),'������Ԫ�����ֱ�Ϊ',num2str(sub_net),'����','�ڵ�������7����������2.5G�豸,�������ɱ����䡣'],'fontsize',9)
    text(-9.8,-9.5,['3�������',num2str(length(subb_net)),'������Ԫ�����ֱ�Ϊ',num2str(subb_net),'����'],'fontsize',9)
end
%���ͼ�α���
hold off
    