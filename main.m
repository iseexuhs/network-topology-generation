%   <<----------------˵��-------------------------->>
%   name: main function for topology generation.
%   author: xhs  Github ID:iseexuhs
%   date: 2018-08-17
%   run on MATLAB R2016R
%   welcome to star this repository. ^_^
%   <<--------------------------------------------->>

%ע�⣺
%��������ѭ�����ڵ���һ�廯ģʽ�ĵ���ͨ�Ŵ���������ܹ��о�������ԭ��
%�������Ԫ����17*2M��������Ԫ����42*2M(��ͳһ)��
%��ԴԤ��������30%
%���Ļ�����2.5Gbps�����뻷����622Mbps�����ܵĴ���Ϊ1008*2M��

%���䣺
%���ǽ�����ͨ�������Լ�ͨ���豸��2.5G����10G��
%�豸�ɱ���622M��28.5��2.5G��43��
%ͨ���ڽӾ�����߹������󣬽���������ͼ��MATLAB��gplot�������ɡ�
%1�������ȫ��Ϊ622M���豸��ͨ�����ʣ�
%2���ų������ȫ��Ϊ2.5G�������
%3��һ���ֽ����ﵽ2.5G��ͨ�����ʣ���������Ԫ���622M
%4��һ���ֽ����Ŀǰ��Ȼû�ﵽ2.5G��ͨ�����ʣ�����Ϊ���Ժ��豸�������ǣ�����2.5G���豸����һ���ֲ���622M���豸��2.5G��622M�ķ���ɸ��ݵ���ģ�͡�
%������������������ų���2���������1�ֺ�3��4��ͨ���豸�ɱ����𣬵�3��4��ͨ������ģ��ȷ��������ͬ�ĵ�����2.5G��622M�ı�����һ����

%����ԭ��
%1��ͨ����������ԴԤ��������30%��  
%2�����Ĳ�ڵ�����������ȫ��վ������15%��
%3�����Ĳ㵥վ��ⷽ���˳���8����
%4�����Ļ�������·��ӦΪ����·�ɡ�
%5�����뻷������վ����������7��ʱ��ѡ��2.5G���ʣ�������7��վ��Ļ���ĩ�˷�֧����ѡ��622M���ʡ�


%������
clear
clc
get_parameters;
%���ֲ�ͬ�����ϵ��
Area_model = 1;
model_matrix=[0.5 0.45 0.4];

if flag
    display('��������')
else
    return
end
%display('SDH����ͨ��������һ�廯�������');
%core_node=input('�����������Ԫ����������Enter����');%������Ԫ��������
%sub_node=input('����������Ԫ����������Enter����');%����Ԫ��������
sub_net=[];%���뻷��Ԫ�����洢����
subb_net=[];



if core_node<core_range(1)
        display('������Ԫ����С��3�����޷�������')
        return
   
elseif core_node>core_range(end)
        display('���������վ������С�ڵ���6����ԭ������Ϊ�����������')
        return
elseif sub_node==0
        display('��ʵ�ʿ��ǣ�����Ԫ����Ӧ����0��')
        return
end

if core_range(1)<=core_node && core_node<=core_range(end) && sub_node>0
    
    for k=1:length(core_range)
        if core_node==core_range(k)&&sub_node>sub_range(k)
            display('����Ԫ������������,�����´�����Դ���㣡') %2.5G����£��籨����������������Ԫ�ֱ�Ϊ3��4��5ʱ���������Ԫ��������޷ֱ�Ϊ34��31��29
        
            return   %���������������ƣ����˳�����
        end
    end
end

%������������������ϣ�˵������������ʾ��Ӧ��Ϣ
display('��Ԫ��������,�Ƽ���������Ϊ(�ڵ�������7����������2.5G�豸,�������ɱ�����Ϊ2.5G��622M)��')  %��������������
sub_i=1;
subb_i=1;
flag3=1;

if strcmp(NET_speed,'2.5G') %�ַ����ȽϺ���
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
            sub_net(sub_i)=7; %���뻷����Ԫ�����洢
            sub_i=sub_i+1;
            sub_node=sub_node-7; 
        end
        if sub_node~=0
            if sub_node<3
                subb_net(subb_i)=sub_node;  %�ж�����Ԫ�����Ƿ������ܹ�����7
            else
                sub_net(sub_i)=sub_node;
            end
        
        else
            sub_i=sub_i-1;
        end
        
   end
   if isempty(subb_net)
        
        display(['1�����Ĳ�1������Ԫ����Ϊ',num2str(core_node),'����']);
        display(['2�������',num2str(length(sub_net)),'������Ԫ�����ֱ�Ϊ',num2str(sub_net),'����'])  %�������뻷����Ԫ������ʾ 
   else
        flag3=0;
        display(['1�����Ĳ�1������Ԫ����Ϊ',num2str(core_node),'����']);
        display(['2��С����',num2str(length(sub_net)),'������Ԫ�����ֱ�Ϊ',num2str(sub_net),'����'])  %�������뻷����Ԫ������ʾ 
        display(['3�������',num2str(length(subb_net)),'������Ԫ�����ֱ�Ϊ',num2str(subb_net),'����'])  %�������뻷����Ԫ������ʾ
   end
    display('�������˽ṹ��ͼ��ʾ��')  
    network_generation;
elseif strcmp(NET_speed,'10G')
    display('������')
end
