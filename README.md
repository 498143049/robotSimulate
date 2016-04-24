#Simple manipulator kinematics simulation system
###Introduce
*		Developing Simple manipulator kinematics simulation system in matlab R2012b
*		**the developed functions contain kinematics 、inverse kinematics、Planning path、the show of graphics、route shows**

###Characteristic
   1.	Program and data are separated，so,when you simulate new one ,only add data and config file which is describes the data attribute 。so the program is high scalability
   2.	Program is designed adopted MVC design ideas。
   3.	Formulate function sloving the manipulator of inverse kinematics,to speed up the running of function  because of specialization 
   4.	Adopted improvement DH parameters method

###Start
<pre><code>Input SetupGui to matlab,then program is started.</code></pre>


##The introducment of function
<pre><code>SetupGui.m SetupUp funtion</code></pre>
###View：
<pre><code>gui.m ：            It decides the  mian layout 
gui_init.m :       It set the init value of the joint ,and add evnt to the button</code></pre>

###Control:
<pre><code>Forward_kinmatics_caculate.m     Forward kinmatics function   
inverse_kinematics.m            Common inverse kinematics function 
inverse_kinematics_*.m          Spacily inverse kinematics function
move.m                          Control track function  </code></pre>

###Model
<pre><code>loadData.m  Read *.json data and get matlab struture function
p_json.m    Prase json data function 
stlread.m   Prase stl data  function</code></pre>
###The introduce  of interface 

####configFile Interface
**use json format **
<pre><code>1.	defaultView    the defaultvalue of View 
2.	axis            the value of axis 
3.	inversefun      inverse funciton name 
4.	RobotName       the title name
5.	link            the attribute 
	1.	fileName    the path of file
    2.	type        joint type：base、transfrom、rotate
    3.	DHParametes DH DHParametes ,use improvement method。
        formula:   ![formula](http://7xt8mz.com2.z0.glb.clouddn.com/a.jpg)
    4.	RANGE       the range of joint value </code></pre>
####Kinematics Interface
<pre><code>function [A,status]=yourfuctionName(x,y,z)
end
A：set the value of joint if four DOF A=[0,0,0,0] format，6DOF A=[0,0,0,0,0,0];
status: is exist value;status=1，exist ;status=0，not exist;
x,y,z：the set coordinate value 
</code></pre>
###annotation
<pre><code>tmat_in.m apply to analyze the special inverse kinematics
analyze.m apply to analyze the special inverse kinematics</code></pre>



#简易机械臂运动学仿真系统
###简介
*	开发出一个简易运动学仿真系统，其中测试、开发的matlab版本号为R2012b。
*   **实现的功能有运动学，逆运动学、轨迹规划、图形展示、轨迹显示**。

###特点:
   1.	程序是和数据分离的，因此，只要加入数据文件，仿真机器人只要有json描述，符合程序的接口即可。可以定制性很高
   2.	程序设计采用的MVC的设计思想。
   3.	自定义机械臂的逆解函数，通过特殊化加快求解的速度;
   4.	采用改进式DH方法

###启动:
　　<pre><code>在maltab 里面输入SetupGui，便可以启动程序。</code></pre>

###函数文件说明
<pre><code>SetupGui.m 启动文件。入口函数</code></pre>
####视图层：
<pre><code>gui.m ：           文件界面的整体布局，其中负责是程序大体的排布。
gui_init.m :       其中负责函数出事值的设定以及按键函数的绑定</code></pre>

####控制层：
<pre><code>inverse_kinematics.m            正运动学处理函数
Forward_kinmatics_caculate.m    通过逆运动学处理函数
inverse_kinematics_*.m          专用逆运动学处理函数（自定义）
move.m                          轨迹控制函数  </code></pre>

####模型层：
<pre><code>loadData.m  读取*.json 数据。生成模型
p_json.m    读取json的函数。
stlread.m   读取STL文件的函数 </code></pre>

###接口说明

####配置文件说明
**采用的是json 格式**
<pre><code>1.	defaultView    初始观测角度 可以不填默认值:
2.	axis            坐标轴的高度
3.	inversefun      特点逆解的函数名，可以不填。不填则调用通解函数。
4.	RobotName       显示title 的文件名
5.	link            关节的属性
	1.	fileName    文件的路径地址
    2.	type        关节的类别：有基座(base）、转动(transfrom)、旋转(rotate)
    3.	DHParametes DH参数,采用的是改进式参数。公式如图  ![公式](http://7xt8mz.com2.z0.glb.clouddn.com/a.jpg)
    4.	RANGE       关节旋转的范围</code></pre>
####逆运动学接口
<pre><code>function [A,status]=yourfuctionName(x,y,z)
end<pre><code>
A：表示计算出给的关节的值如果是4自由度则为[0,0,0,0]，6自由度为[0,0,0,0,0,0];
status: 表示否是解 status=1，有解;status=0，无解;
x,y,z：给的的坐标值	
</code></pre>
###注释
<pre><code>tmat_in.m  产生齐次方程的函数文件，用于分析特殊情况
analyze.m  用于分析特殊解法的函数</code></pre>
