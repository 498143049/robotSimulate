# robotSimulate
use matlab To simulate Robot
program is developed and tested  in matlab R2012b
input SetupGui to matlab,then program is started.
the second step,it needs load json file, which is describes the properties of stl filies.(1.The collection of the original point.2.the number of the point,3.type:base,rotation,translation 4.color 5 DH parameters 6 the limit :lower limit and upper limit)
because of data is separated from logic program,it can add any robot that is described by json file.

loadData.m load file
p_json.m make json file to matlab structure 
Stlread.m  read stl file to matlab array

测试、开发的matlab版本号为R2012b
在maltab 里面输入SetupGui，便可以启动程序。
第二步，需要加载json文件，json文件是描述在data文件下stl文件的属性.（1.原始数据的点集合 2.点的个数  pointNum 3. 类型  基座、旋转关节、滑动关节 4.颜色  5.DH参数  6.极限值）。
由于将数据与程序分离。因此，以后的仿真机器人只要有json描述，符合程序的接口即可。

程序设计采用的MVC的设计思想。目前只是将数据层分离出来。接下来的程序分离还需要在做。
##程序的函数说名
loadData.m 加载json文件。
p_json.m 将json文件转化matlab 的结构体
Stlread.m 读取stl文件

还需要做的。
如何动态确定坐标系的范围
增加运动轨迹及逆运动学等功能
增加显示机械臂的操作范围
分离代码。使得代码有MVC的设计规范
动态添加控制板的时候需要设计宽度

1.2016 4 10 解法应该有2中，找寻最优解
2.联动所有面板
