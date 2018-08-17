%   <<----------------说明-------------------------->>
%   name: input parameters.
%   author: xhs  Github ID:iseexuhs
%   date: 2018-08-17
%   run on MATLAB R2016R
%   welcome to star this repository. ^_^
%   <<--------------------------------------------->>


%global NET_speed core_range sub_range;
display('程序名称：SDH电力通信网地县一体化组网设计')
display('操作步骤：')
NET_speed=input('1、请输入通信设备传输速率（正确格式为2.5G或者10G），并按Enter键：','s');   %'s'限定输入为一字符串
core_node=input('2、请输入核心网元数量，并按Enter键：');%核心网元参数输入
sub_node=input('3、请输入子网元数量，并按Enter键：');%子网元参数输入
flag=1;
if strcmp(NET_speed,'2.5G') %字符串比较函数
    syms x;%x为核心网元的数量
    %format long
    core_max=floor(solve('42*x+17*17/3*x=1008*0.7')); %floor(x)取小于x的最大整数；ceil(x)取大于x的最小整数；round(x)取最接近x的整数
    %floor(a)
    core_range=3:1:core_max;  %核心网元数量阈值
    sub_range=floor((706-core_range.*42)/17);%子网元数量阈值

elseif strcmp(NET_speed,'10G')
    syms x;%x为核心网元的数量
    %format long
    core_max=floor(solve('150*x+17*17/3*x=4032*0.7')); %floor(x)取小于x的最大整数；ceil(x)取大于x的最小整数；round(x)取最接近x的整数
    %floor(a)
    core_range=3:1:core_max;  %核心网元数量阈值
    sub_range=floor((2824-core_range.*150)/17);%子网元数量阈值
else
    display('程序结果：')
    display('通信设备速率输入格式有误!可选速率为2.5G或10G')
    flag=0;
    %return;
end