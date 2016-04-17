Usually finding the method to use to solve the inverse kinematics of a nR robot is a difficult problem as no effective analytic method has been identified so far.
目前，我们很难找到一个有效的分析方法去分析nR机器人，因此很难找到一个通用的方法去求解其逆运动学。

This article uses asemi-analytic method and a general method to solve the spatial nR robot inverse kinematics problem.
这篇文章使用半解析的方法和一个通用的方法，去解决空间nR机器人逆运动学的问题。

It overcomes the numerical method's limitations related to accuracy with a real-time aspect
这个方法克服数值法的有关的精度和实时向的限制。

Initially, conformal geometric space theory was used to establish general kinematic equations.
最初，利用保角几何空间理论去建立一般的运动学方程。

Based on that, the weighted space vector projection method was used to analyze the relationship between the robot spatial rotation angles and the value of the space vector projection.
在此基础上，使用加权空间矢量投影法分析机器人空间转动角度和空间向量投影的值之间的关系。

The weighted value of every joint's projection on the end-effector vector was treated as the basis for changing the robot end's orientation.
对于末执行器向量，各关节投影的加权值被看做改变机器人末端的姿态基础向量。

By determining the weighted value of every joint's projection on the end-effector vector, it was possible to achieve the semi-analytic inverse kinematic solution. 
对于末端执行器向量，通过确定各关节的投影权值，这才可能实现半分析的求运动学逆解。

Finally, to prove the validity and feasibility of the theory it was tested with a special 6R robot.
最后，为了证明这个理论是有效的，而且是可行的。最后将用专用的6R机器人做测试。

With the current wide range of applications of industrial robot techniques, the application of the 6R serial mechanisms is of great significance.
随着工业机器人技术的广泛应用，6R串联机构的应用有着很重要的意义。

The inverse kinematics in serial mechanisms, which plays a crucial role in the robotics, is a prerequisite of serial robot control.
在串联机构中，逆运动学，在机器人学中扮演者重要角色通用在机器人控制中是必要的。

It is directly related to tasks like off-line programming,path planning,and realtime control.
它直接和机器人运动任务-例如离线编程，路径规划，还有实时控制有关。

The final position and orientation can only be fully programmed and controlled through the using of inverse kinematics to transform the position and orientation of the joint variables.
最终的位置和姿态只能是通过使用逆运动学去改变关节变量的位置和姿态，以此进行编程和控制。

The inverse kinematics of 6R serial mechanisms, which belongs to the same question as the inverse kinematics of 7R, is the most difficult issue in the kinematics of serial mechanisms and is regarded as the Mount Everest in kinematic analysis of spatial mechanisms
在串联机构运动学中，6R串联机构的逆运动学，拥有相同问题的7R的逆运动学，是非常难的问题，而且在空间机器的运动学分析里面，它被视为珠穆朗玛峰。

Researchers worldwide have carried out much useful exploration and research. The approaches used in the study of
inverse kinematics of 6R serial mechanisms can be divided into the analytical and numerical methods
全世界的研究人员已经开始施行许多有用的研究和探究，这些在研究6R串联机器人的逆运动的方法可以分为分析法和数值法。

Generally, the analytic solutions are difficult to obtain due to the multi-parameters, nonlinearity and coupling of the solutions, and the algebra equations involved in the inverse kinematics of 6R serial manipulators 。
一般来说，由于分析法包含多参数，非线性，耦合性。因此用分析法难以获得其结果，而且代数方程涉及6R串联机构逆运动学。

The analytical method is suitable for 6R serial manipulators with special geometry parameters and the theoretical solution can be achieved through vector, spiral and Lie algebraic methods.
拥有特殊几何参数的6R串联机构，非常适合分析法。而且通过向量，螺旋，李代数的方法，理论上可以成功地获得其解。

The analytical method is accurate and able to find all solutions. However, it needs massive algebra and matrix operations as well as complicated derivation
分析法是很准确的，而且可以找到所有解。但是它需要海量的代数计算还有矩阵操作，同样也需要复杂的推导。

Furthermore, it is necessary for the manipulator position and orientation to have decoupling characteristics or the characteristic polynomial to have an order of less than four Ref. [3] 
此外，它必须需要操作器的位置和姿态，去解耦特征多项式，或者特征多项式小于4阶。

brought quaternions into kinematics research of spatial serial manipulators. 
文献在空间串联机构运动学研究引入四元素。

It solved a classic problem of 6R robot inverse kinematics
他解决了6R机器人逆运动学经典的问题

A decomposable method was presented in Ref. [4]
在参考4中提出了一个分解法

However, it is only suitable for certain special circumstances, such as decoupling
然而这个仅仅使用于某一特殊的情况，例如解耦。

The approaches used in the mathematical modeling of the inverse kinematics of serial mechanisms mainly consist of the D–H matrix method, spherical trigonometry, real matrices method, dual numbers method, and so on
在串联机构的逆运动学的数学模型中，主要由DH矩阵，球面三角学，真正的矩阵方法，双重数学方法，还有其他方式构成。

These methods have no versatility and lead to different inverse kinematics algorithms
这些方法没有通用性，导致有不同的逆运动学算法。

Raghavan and Roth [5] constructed 14 basic equations with six inverse kinematics equations through vector operation.
Raghavan and Roth 通过向量操作，用6个逆运动学等式，构造14个基础方程。

After an elimination operation,a 24-order equation of one variable and up to 16 sets of inverse kinematics solutions were obtained.
进行消元操作后，获得到单变量24阶方程，和高达16套逆运动学的解

However, eight extraneous roots existed. 
然而，8个额外根存在。

Raghavan's method was improved by Manocha [6] who enhanced its stability and accuracy by adopting the matrix eigenvalue decomposition method
Manocha改进了Raghavan的方法，他通过代用矩阵特征值分解法，提高了其稳定性和准确性。

In order to settle the displacement analysis of a general spatial 7R mechanism, Ref. [7,8] eliminated extraneous roots by employing a plural method and matrix operation respectively. 
文献采用复数的方法和矩阵的运算去祛除增根，以此解决7R空间机构的位移分析。

Based on early research,Ref.[9]classified the inverse kinematics of 6R serial mechanisms into two categories
基于早期研究，文献9将6R串联机构逆运动学解分为2个类别

In the first category,the solution to the inverse kinematics of 6R robots meets the Pieper criteria when using the closed solution
在第一类中，6R机器人的逆运动学的解满足Pieper条件，当使用封闭解时。

In the other, the orders of the target matrix obtained by Manocha were lowered from 24 to 16. When this was done the efficiency and stability were improved
在另一个分类中，当它的效率和稳定性得到提高时，Manocha获得到的目标矩阵的阶次可以达到在24到16之间。

In addition, the Newton–Raphson iterative algorithm was employed to solve the inverse kinematics issues that did not satisfy the Pieper Criterion.
此外，Newton–Raphson 迭代算法用了解决不满足Pieper条件的逆运动学问题。

As for 6R serial robots in real operations, an inverse kinematics solution, which can meet certain task requirements and the position and orientation requirements of the end-effector, is needed。
至于6R串联机器人的实际操作，一个逆运动学的解决方案是需要的。能够满足任务需求，而且满足末端执行器的位置和姿态。

To this end, a variety of approaches has been presented. A common method is separating a i , α i and s i , θ i , which are in the D–H parameters of each joint of a 6R series manipulator.
最后，一系列方法被提出，一个通用的方法是分离6R串联机构各关节的DH（4个参数）参数。

For the 6R series manipulator kinematics structures, the solution matrix is composed of two independent homogeneous and linear equations that use the methods of dual quaternion and Lie algebra
对于6R串联机构的运动学结构，矩阵的解由使用了双四元素和李代数的线性齐次方程组构成。

The 16 inverse kinematics solutions for each joint angle are obtained by iterating and eliminating the two equations
通过迭代和消除这个2个等式去获得到16个各关节角度的运动学的逆解。

Qiao et al. [10] and Rocco et al. [11–14] obtained the numerical solution for the inverse kinematics of a general 6R series manipulator using dual quaternion theory and Lie groups, and Lie algebras and other methods, respectively.
Qiao and Rocco 分别使用双四元素理论，李群，李代数等其他方法，获取通用6R串联机构的逆运动学的数值解。

The introduction of genetic algorithms and neural networks is another numerical method that is commonly used with the issue of inverse kinematics
遗传和神经网络算法的引入是另一种常用的获得逆运动学数值解的方法。

The constraints, such as the feed value of the angle of the joint, will be set. 
例如，关节角度的给定量的约束将会给定

The target function is the difference between the solution and the target.
目标函数是解与目标的差值。

Based on that, the algorithms mentioned above can achieve the best fit of the feed value
基于此以上提到的算法可以获得最佳给定量

Chiddarwar and Babu [15] compared the effect of forecast and conventional neural network algorithms on the solving efficiency;
Chiddarwar and badu 比较传统神经网络算法的预测效果和效率。

while,KKökeretal.[16]proposed a neural network algorithm for the inverse kinematics of 3DOF robots by taking velocity and acceleration into consideration
同样，KKökeretal考虑速度和加速度，从而为3自由度机器人逆运动学提出了一个神经网络算法。

Kalraetal.[17]and Chapelleetal.[18] presented an algorithm for the inverse kinematics of 6DOF robots based on a genetic algorithm
Kalraetal 和 Chapelleetal 提出一个基于遗传算法去解决6自动度机器人的逆运动学.

. Hammour et al. [19] planned the trajectory of the 6R manipulator using a continuous genetic algorithm;
Hammours使用连续遗传算法去使用规划6R机构的路径。

and Zha [20] employed a genetic algorithm to search for the minimum eigenvalue of the surface that the position and orientation vector of the end of the actuator formed to obtain the optimal trajectory planning.
还有，zha 采用遗传算法去搜索末端执行器的位置和姿态的面部最小的特征值，以获取最优路径。

Based on the research experiences of other scholars, this paper focuses on the multi-rotating joint robot and proposes an approach for the fast solving of the inverse kinematics issues utilizing conformal geometric space theory and the space vector projection method.
基于其他学者的研究经验，这篇文章研究集中于多旋转关节机器人和提出利用包角空间理论和空间向量映射理论的方法去快速解决逆运动学解的问题。

第二章

Establishment of kinematic equations using conformal geometric space theory
使用保角空间理论建立逆运动学的等式

Geometry representation in conformal space
在保形空间的几何表示

Conformal geometric space theory was proposed by Li [21], and it has become a mainstream part of the international geometric algebra.
Li提出了保角几何空间理论，而且它变成了主流的国际几何代数学。

Conformal geometric algebra (CGA), a new branch of Clifford algebra, is an algebra representation and computing system that is based on advanced geometric invariants
保角几何代数(CGA)，Clifford代数学的新分支，是代表表示，基于高级几何不变量的计算系统。

Liao [22] established the kinematic equations of the 6R manipulator and simplified the equations using CGA and Dixon resultant elimination, respectively, and then the 6R robot inverse position issue was successfully solved.
Liao建立6R机构的运动学方程，而且分别的利用CGA简化方程和利用Dixon剔除不需要的结果，6R机器人的逆位置的问题就被成功解决了。

In 4-dimensional projective geometric algebra, and its extension 5-dimensional conformal geometric algebra, both spheres and circles can be used in the computing as basic algebraic variables
在4维度投影的几何代数，或者扩展到5维度保角几何代数，通用球和圆可以在计算中做为基础的几何变量

The representation of conformal geometric algebra entities is shown in Table 1.
代表保角空间的实体如表格1所示。

Where x and n denote geometries in 3D space,
这就是x，n在三维空间的代表

e i (i = 1, 2, 3) denotes three basic unit vectors in 3D and where e 0 represents the origin while e ∞ refers to the infinity; r is radius of sphere; d is the distance from plane to origin.
在3D空间中E表示3个基础单位向量，e0代表原点，e无穷指的是无线。r是球的半径。d是是平面到原点的距离

Computation of distance and angle in conformal space
保形空间的距离角度计算

The geometries presented in Table 1 can be represented by vectors. The distance can be derived based on the fact that the inner product of vectors is a scalar.
在表一的几何参数可以通过向量代替，其距离可以基于向量的尺寸而得到具体的数值。

The vector form of the conformal geometric algebra can be written as:
组成保角几何代数的向量可以写作

where s = s 1 e 1 + s 2 e 2 + s 3 e 3 , while s 4 and s 5 are defined in Table 2.
当S4和S5等于表2的定义的时候，s=s1.....
s i denotes different spherical, and {π i } denotes different plane. Both definitions in the table are dual.The algorithm for the unit vector in the conformal geometric algebra is shown as follows:
s表示不同的球体，而且{}表示不同的平面，在表格中是对偶的，在保角空间几何中，单位向量的算法如下所示。

The inner product of S and S′ can be obtained by:
S和S’d的内积可以定义如下

The standardized inner product of the dual geometry can be employed to represent the angle between the two geometries.
可以采用双几何图形的标准化内积来表示两个几何之间的角度。

In conformal geometric algebra, the angle between two objects o 1 , o 2 like two lines or two planes can be computed using inner product of their normalized dualities.
在保角几何代数中，o1,o2之间的角度像2根线，或者平面，可以使用它们标准的二元内积计算其值。

General kinematic equations of the robot
一般运动学机器人方程

The kinematic model of the nR serial robot is shown in Fig. 1. 
nR串联机器人的运动学模型如图1所示

It is composed from n revolute joints and rigid linkages.
它是由n个转动关节和刚性连杆组成。

J i (i = 1,2⋯n) denotes the rotational axis of the i-th joint; 
Ji代表第I个关节的的旋转轴

L i (i = 0,1,2⋯n) is the i-th rigid body; Σ i (i = 1,2⋯n) represents the coordinate system fixed with L i ; 
Li是第i个刚体，Ei代表固定在Li的坐标系统

Σ 0 stands for the base coordinate system; 
E0 代表基础系统坐标。

a i (i = 0,1,2⋯n) is the vector which start from the i-th rotational joint center and points to the (i + 1)-th rotational joint center; 
ai是向量，开始由第i个关节的旋转中心指向i+1个旋转关键的中心。

β i is the angle between a i − 1 and a i ;

被他 是ai-1和ai间接的角度
and θ i is the rotation angle of the i-th rotational joint. 
theat 是一个旋转关节的旋转角度。

Due to the fixed joint parameters and the fixed numerical relation between β i and θ i , the norm of a i ,determined by the shape of rigid body L i , stays unchanged. 
由于固定的关节参数，还有被他和斯塔之间固定的角度，a的标准由刚体LI决定，因此保持不变。

While it changes with the rotation angle, it can be represented as a i (β i );
当旋转角度发生变化的时候，通过可以用ai或者被他i代替。

 P i (i = 1,2⋯n)is the space vector of the intersection point of vector a i and vector J i 
pi 是ai与ji的交点空间向量。

As shown in Fig. 1, the position vector of the end of the robot can be represented as:
正如图1所展示的，机器人末端的位置向量可由以下代替。

Since the end of the robot meets not only the location requirements but also the orientation requirements, a n (β n ) remains fixed and the vector of the rotation axis of the joint, J n , can be determined. 
由于机器人末端，不仅满足位置需求，而且还要满足姿态需求，再加上a，b人家保持不限，因此旋转关节轴向量可以确定下来。

Besides, a 0 can be determined due to the fixity of L 0 .
此外，由于L0是固定的，a0也可以被确定下来

Therefore, the issue of inverse kinematics is transformed into how to determine the vector angle a k (k = 1, 2 ⋯ n − 1).
此外，逆运动学的问题被转化为如何解除关节的向量K。

The inverse kinematics equation can be established based on conformal geometric space theory and Eq. (5):
逆运动学方程可以通过保角几何空间理论建立，如等式5

The relation between β i and θ i is shown in Fig. 2, and Eq. (8) can be obtained.
被他和theta的关系如图2所示，基于此，方程8可以建立。

h i , k i (i = 1,2⋯n) are fixed structure parameters and can be measured.
HI，ki的结构参数是可以被测量的。


第三章

Weighted space vector projection method
加权空间矢量投影法

Space vector projection method
空间矢量投影法

Using the space vector projection method, the vector value can be determined intuitively and quickly. 
通过使用加权空间矢量投影法，矢量的值可以直观地快速地得到。

According to Eq. (6), p n , a 0 and a n are known. Therefore, Eq. (9) can be established based on the space vector projection method:
根据等式6，PN a0 还有an是已知的，因此，等式9可以基于空间矢量投影法建立

where κ i (i = 0,1,⋯n) is the ratio of the projection of a i (i = 0,2,⋯n) on p n and the length of a i (i = 0,1,⋯n), which is a signed number
K是a投影在p上的比例，而且是a长度的符号值。

When the structure, position, and orientation of the robot are determined, κ i (i = 1,2,⋯n) is relevant to β i (i = 1,⋯n) and κ i − 1 . 
当机器人的结构，位置，姿态已经决定的时，KI和被他而KI-1有关。

Then, Eq. (10) can be derived
之后，因此导出方程10.

The issue of inverse kinematics becomes how to determine κ i (i = 0,1,2⋯n) while meeting the constraints of the rotation axis vector of the joints. 
因此，逆运动学问题变为如何决定KI当满足关节旋转轴的角度约束是。

When the solution is unique, κ i (i = 0,1,2⋯n) is also unique. 
当解是唯一是，KI通用也是唯一的

For other situations, like multi solutions and redundant robots, obstacle avoidance and path planning can be implemented by adjusting κ i (i = 0,1,2⋯n). 
另一情况是，比如多解和冗余机器人，可以通过调整KI去实现障碍回避和路径规划。

Therefore,κ i (i = 0,1,2⋯n) is defined as the weighted value of the space vector to adjust the configuration of the robot.
因此，KI是做为调整机器人配置的加权空间向量的值。

This paper focuses on the basic inverse kinematics method, therefore, obstacle avoidance and path planning are beyond the discussion.
这篇文章主要讨论基础解逆运动学的方法，因此，回避障碍和路径规划部在考虑范围内。

3.2. Weighted value of space vector
加权空间向量的值

According to Eq. (10), there is an iterative relation among κ i (i = 0,1,2⋯n) under the constraints of β i (i = 0,1,⋯n), which is shown in Fig. 3. 
根据等式10，由图三所示，在由被他i的约束下，有一个关于KI迭代关系

The projection of a i − 1 on P n , κ i − 1 ‖a i − 1 ‖, and the rotation axis vector of the i-th joint can be determined once a i − 1 is known. 
ai-1在PN的投影，一旦ai-1是已知的，第i个关节的旋转轴向量就可以确定

Besides, based on the range of κ i ‖a i ‖, which is known, and the constraints, a i can be obtained.
除此之外，如果基于ki的范围和还有约束已知， 就可以等到ai

Along with β i and θ i , the inverse kinematics can be implemented. 
连同β i和 θ i ，逆运动学就求解完毕。

With regard to nR(n < 5) robots, they can directly obtain the analytical form of the inverse kinematics solutions based on the space vector projection method.
当nR机器人n<5时，它们可以直接获得基于空间向量投影方法逆运动学解的解析形式。

However, the inverse kinematics for nR robots requires the combination of the space vector projection and numerical methods.
然而，对于NRn大于4 机器人逆运动学需要的空间向量投影和数值方法的结合。

3.3. The relationship between vector projection and joint angle
关节角度和矢量投影的关系

The relationship between vector projection and joint angle is usually used in joint angle calculation such as, getting joint angle,finding robot's max projection configuration and matching work configuration etc. 
矢量投影和关节的角度的关系，一般用于关节角度的计算，有得到角度，找到机器人最大投影的配置，匹配工作配置等等。

Fig. 4 shows the relationship between vector projection and joint angle.
图4展示矢量投影与关节角度的关系

Points O i are on the revolute axis of each i revolute joint. 

They are calculated by D–H method. Plane τ is combined by initial joint vector a i and joint vector a i , which rotated specific degrees by joint axis J i (joint vector a i rotated by joint axis J i forms to a conical surface). 

Because robot's rigid link may not be vertical to joint axis J i , we can assume that point B and point F have thesame projection point A on joint axis J i .

So that the value of AB and AF are known. 

When joint angle is zero, a i 0 equals to a i , that is, O i B.

The projection points of Point B and Point F are point D and point G on orientation vector P n respectively.

Draw the GF's parallel line passing point D and we get point of intersection C.


It's known that DG is difference value Δ between a i 's projection value on vector P n ′ and a i 0 's projection value on vector P n′. 

The projection vector on plane τ of position and orientation vector P n intersects BC at point E. 

Since O i B, P n and plane τ are all known, we can get O i B and P n 's intersection angle α, P n and plane τ's intersection angle γ by space geometry theory.

Δ is known, and we can build the following equations when we are solving intersection angle θ.

By Eqs. (11)–(18), we can build the relationship between Δ and θ. When θ is known, we can get Δ by the relation showing in
Fig. 4.