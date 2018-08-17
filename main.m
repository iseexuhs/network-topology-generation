%   <<----------------说明-------------------------->>
%   name: main function for topology generation.
%   author: xhs  Github ID:iseexuhs
%   date: 2018-08-17
%   run on MATLAB R2016R
%   welcome to star this repository. ^_^
%   <<--------------------------------------------->>

%注意：
%本程序遵循《基于地县一体化模式的地区通信传输网网络架构研究》所述原则
%接入层网元带宽17*2M，核心网元带宽42*2M(待统一)；
%资源预留不低于30%
%核心环按照2.5Gbps，接入环按照622Mbps；则总的带宽为1008*2M；

%补充：
%考虑接入层的通信速率以及通信设备，2.5G还是10G。
%设备成本：622M，28.5万；2.5G，43万
%通过邻接矩阵或者关联矩阵，将网络拓扑图用MATLAB的gplot命令生成。
%1、接入层全部为622M的设备和通信速率；
%2、排除接入层全部为2.5G的情况。
%3、一部分接入层达到2.5G的通信速率，其他子网元组成622M
%4、一部分接入层目前虽然没达到2.5G的通信速率，但是为了以后设备升级考虑，采用2.5G的设备，另一部分采用622M的设备。2.5G和622M的分配可根据地区模型。
%对于以上四种情况，排除第2种情况，第1种和3、4种通过设备成本区别，第3和4种通过地区模型确定。即不同的地区，2.5G和622M的比例不一样。

%组网原则：
%1、通信网带宽资源预留不低于30%。  
%2、核心层节点数量不超过全网站点数量15%。
%3、核心层单站点光方向不宜超过8个。
%4、核心环网光缆路由应为独立路由。
%5、接入环（链）站点数量大于7个时宜选择2.5G速率，不大于7个站点的环和末端分支，可选择622M速率。


%主程序
clear
clc
get_parameters;
%区分不同地域的系数
Area_model = 1;
model_matrix=[0.5 0.45 0.4];

if flag
    display('程序结果：')
else
    return
end
%display('SDH电力通信网地县一体化组网设计');
%core_node=input('请输入核心网元数量，并按Enter键：');%核心网元参数输入
%sub_node=input('请输入子网元数量，并按Enter键：');%子网元参数输入
sub_net=[];%接入环网元数量存储矩阵
subb_net=[];



if core_node<core_range(1)
        display('核心网元数量小于3个，无法组网！')
        return
   
elseif core_node>core_range(end)
        display('不满足核心站点数量小于等于6个的原则，请拆分为多个核心网！')
        return
elseif sub_node==0
        display('从实际考虑，子网元数量应大于0！')
        return
end

if core_range(1)<=core_node && core_node<=core_range(end) && sub_node>0
    
    for k=1:length(core_range)
        if core_node==core_range(k)&&sub_node>sub_range(k)
            display('子网元数量超过上限,将导致带宽资源不足！') %2.5G情况下，如报告中所述，核心网元分别为3、4、5时，接入层网元的最大上限分别为34、31、29
        
            return   %如若超过带宽限制，则退出程序
        end
    end
end

%如果上述两个条件符合，说明参数合理，显示相应信息
display('网元参数合理,推荐组网方案为(节点数大于7的子网采用2.5G设备,其他按成本分配为2.5G或622M)：')  %参数合理的情况下
sub_i=1;
subb_i=1;
flag3=1;

if strcmp(NET_speed,'2.5G') %字符串比较函数
    if sub_node<=7
       sub_net(sub_i)=sub_node;
       
       sub_i=sub_i+1;
    else
        t=round(sub_node*model_matrix(Area_model));
        if t<3
           subb_net(subb_i)=t;
           subb_i=subb_i+1;
        else
            sub_net(sub_i)=t;
            sub_i=sub_i+1;
        end
        sub_node=sub_node-t;
        while(sub_node/7)>=1
            sub_net(sub_i)=7; %接入环子网元个数存储
            sub_i=sub_i+1;
            sub_node=sub_node-7; 
        end
        if sub_node~=0
            if sub_node<3
                subb_net(subb_i)=sub_node;  %判断子网元数量是否正好能够整除7
            else
                sub_net(sub_i)=sub_node;
            end
        
        else
            sub_i=sub_i-1;
        end
        
   end
   if isempty(subb_net)
        
        display(['1、核心层1个，网元数量为',num2str(core_node),'个。']);
        display(['2、接入层',num2str(length(sub_net)),'个，网元数量分别为',num2str(sub_net),'个。'])  %各个接入环子网元数量显示 
   else
        flag3=0;
        display(['1、核心层1个，网元数量为',num2str(core_node),'个。']);
        display(['2、小核心',num2str(length(sub_net)),'个，网元数量分别为',num2str(sub_net),'个。'])  %各个接入环子网元数量显示 
        display(['3、最外层',num2str(length(subb_net)),'个，网元数量分别为',num2str(subb_net),'个。'])  %各个接入环子网元数量显示
   end
    display('组网拓扑结构如图所示：')  
    network_generation;
elseif strcmp(NET_speed,'10G')
    display('待定！')
end
