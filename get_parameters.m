%   <<----------------˵��-------------------------->>
%   name: input parameters.
%   author: xhs  Github ID:iseexuhs
%   date: 2018-08-17
%   run on MATLAB R2016R
%   welcome to star this repository. ^_^
%   <<--------------------------------------------->>


%global NET_speed core_range sub_range;
display('�������ƣ�SDH����ͨ��������һ�廯�������')
display('�������裺')
NET_speed=input('1��������ͨ���豸�������ʣ���ȷ��ʽΪ2.5G����10G��������Enter����','s');   %'s'�޶�����Ϊһ�ַ���
core_node=input('2�������������Ԫ����������Enter����');%������Ԫ��������
sub_node=input('3������������Ԫ����������Enter����');%����Ԫ��������
flag=1;
if strcmp(NET_speed,'2.5G') %�ַ����ȽϺ���
    syms x;%xΪ������Ԫ������
    %format long
    core_max=floor(solve('42*x+17*17/3*x=1008*0.7')); %floor(x)ȡС��x�����������ceil(x)ȡ����x����С������round(x)ȡ��ӽ�x������
    %floor(a)
    core_range=3:1:core_max;  %������Ԫ������ֵ
    sub_range=floor((706-core_range.*42)/17);%����Ԫ������ֵ

elseif strcmp(NET_speed,'10G')
    syms x;%xΪ������Ԫ������
    %format long
    core_max=floor(solve('150*x+17*17/3*x=4032*0.7')); %floor(x)ȡС��x�����������ceil(x)ȡ����x����С������round(x)ȡ��ӽ�x������
    %floor(a)
    core_range=3:1:core_max;  %������Ԫ������ֵ
    sub_range=floor((2824-core_range.*150)/17);%����Ԫ������ֵ
else
    display('��������')
    display('ͨ���豸���������ʽ����!��ѡ����Ϊ2.5G��10G')
    flag=0;
    %return;
end