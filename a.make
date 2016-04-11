Usually finding the method to use to solve the inverse kinematics of a nR robot is a difficult problem as no effective analytic method has been identified so far.

一般来说，很难去找到一个求解nR机器人逆运动学的方法，因为到目前为止，没有一个有效的分析方法出现。

目前，我们很难找到一个有效的分析方法去分析nR机器人，因此很难找到一个通用的方法去求解其逆运动学。

This article uses asemi-analytic method and a general method to solve the spatial nR robot inverse kinematics problem.
这篇文章使用半解析的方法和一个通用的方法，去解决空间nR机器人逆运动学的问题。

It overcomes the numerical method's limitations related to accuracy with a real-time aspect
克服数值法的有关的精度和实时向的限制。

Initially, conformal geometric space theory was used to establish general kinematic equations.
最初，利用保角几何空间理论去建立一般的运动学方程。

Based on that, the weighted space vector projection method was used to analyze the relationship between the robot spatial rotation angles and the value of the space vector projection.
基于此，加权向量的空间投影的方法用作去分析机器人空间转动的角度和空间向量投影的值的关系。

The weighted value of every joint's projection on the end-effector vector was treated as the basis for changing the robot end's orientation.
在末执行器每一个关节映射的加权值被当做基础在改变机器人的最后的方向。

By determining the weighted value of every joint's projection on the end-effector vector, it was possible to achieve the semi-analytic inverse kinematic solution. 
在决定每一个关节的权值映射在末端执行器向量，这个可能去实现半分析的逆运动学的解决方案。

Finally, to prove the validity and feasibility of the theory it was tested with aspecial 6R robot.
最后，为了证明这个理论是有效的，而且是可行的。最后将用专用的6R机器人做测试。

With the current wide range of applications of industrial robot techniques, the application of the 6R serial mechanisms is of great significance.
随着工业机器人技术的广泛应用，6R串联机构的应用有着很重要的意义。

The inverse kinematics in serial mechanisms, which plays a crucial role in the robotics, is a prerequisite of serial robot control.
在串联机构中，在机器人中扮演者很重要角色的逆运动学在串联机器人的控制中十分重要。

It is directly related to tasks like off-line programming,path planning,and realtime control.
它直接和机器人运动任务-例如离线编程，路径规划，还有实时控制有关。

The final position and orientation can only be fully programmed and controlled through the using of inverse kinematics to transform the position and orientation of the joint variables.
最终的位置和姿态只能是通过使用逆运动学去改变关节变量的位置和姿态进行完全编程和控制。

The inverse kinematics of 6R serial mechanisms, which belongs to the same question as the inverse kinematics of 7R, is the most difficult issue in the kinematics of serial mechanisms and is regarded as the Mount Everest in kinematic analysis of spatial mechanisms
在系列机械的运动学中，6R串联机构的逆运动学，同样属于相同问题的7R机器的逆运动学，是特别难的问题，而且在空间机器的运动学分析里面，它被视为珠穆朗玛峰。

Researchers worldwide have carried out much useful exploration and research. The approaches used in the study of
inverse kinematics of 6R serial mechanisms can be divided into the analytical and numerical methods
全世界的研究人员已经开始施行许多有用的研究和探究，这些在研究6R串联机器人的逆运动的方法可以分为分析法和数值法。

Generally, the analytic solutions are difficult to obtain due to the multi-parameters, nonlinearity and coupling of the solutions, and the algebra equations involved in the inverse kinematics of 6R serial manipulators 。
一般来说，由于解决方案包含多参数，非线性，耦合性。因此用分析法难以获得其结果，而且代数等式涉及6R串联机器人逆运动学。

The analytical method is suitable for 6R serial manipulators with special geometry parameters and the theoretical solution can be achieved through vector, spiral and Lie algebraic methods.
拥有特殊几何参数的6R串联机构，非常适合分析法。而且通过向量，螺旋，李代数的方法，理论上的解决方案可以成功的。

The analytical method is accurate and able to find all solutions. However, it needs massive algebra and matrix operations as well as complicated derivation
分析法是很准确的，而且可以找到所有解。然后他需要海量的代数计算还有矩阵操作，同样也需要复杂的推导。

Furthermore, it is necessary for the manipulator position and orientation to have decoupling characteristics or the characteristic polynomial to have an order of less than four Ref. [3] 
此外，为了去解耦特征，他必须需要机构的位置和姿态，或者特征多项式少于4个次数。

brought quaternions into kinematics research of spatial serial manipulators. 
空间串联机构运动学研究引入四元素。

It solved a classic problem of 6R robot inverse kinematics
他解决了6R机器人逆运动学经典的问题

A decomposable method was presented in Ref. [4]
在参考4中提出了一个可分解的方法

However, it is only suitable for certain special circumstances, such as decoupling
然而这个仅仅使用于某一特殊的情况，例如解耦。

The approaches used in the mathematical modeling of the inverse kinematics of serial mechanisms mainly consist of the D–H matrix method, spherical trigonometry, real matrices method, dual numbers method, and so on
在串联机构的逆运动学的数学模型中，主要途径由DH矩阵，球面三角学，真正的矩阵方法，双重数学方法。还有其他。

These methods have no versatility and lead to different inverse kinematics algorithms
这些方法没有多样化，不同的逆运动学算法。

Raghavan and Roth [5] constructed 14 basic equations with six inverse kinematics equations through vector operation.
Raghavan and Roth 通过向量操作，用6个逆运动学等式，构造14个基础等式。

After an elimination operation,a 24-order equation of one variable and up to 16 sets of inverse kinematics solutions were obtained.
进行消元操作后，获得到单变量24阶方程，和高达16套逆运动学的解

However, eight extraneous roots existed. 
然而，8个额外根存在。

Raghavan's method was improved by Manocha [6] who enhanced its stability and accuracy by adopting the matrix eigenvalue decomposition method
Manocha改进了Raghavan的方法，他通过代用矩阵特征值分解法，提高了其稳定性和准确性。

In order to settle the displacement analysis of a general spatial 7R mechanism, Ref. [7,8] eliminated extraneous roots by employing a plural method and matrix operation respectively. 
为了解决7R空间机构的位移分析，文献采用复数的方法和矩阵的运算去祛除增根。

Based on early research,Ref.[9]classified the inverse kinematics of 6R serial mechanisms into two categories
基于早期研究，文献9将6R串联机构逆运动学解分为2个类别

In the first category,the solution to the inverse kinematics of 6R robots meets the Pieper criteria when using the closed solution
在第一类中，当使用封闭解时，6R机器人的逆运动学的解满足Pieper条件。

In the other, the orders of the target matrix obtained by Manocha were lowered from 24 to 16. When this was done the efficiency and stability were improved
在另一个分类中，当它的效率和稳定性得到提高时，Manocha获得到的目标矩阵的阶次可以达到在24到16之间。

In addition, the Newton–Raphson iterative algorithm was employed to solve the inverse kinematics issues that did not satisfy the Pieper Criterion.
此外，Newton–Raphson 迭代算法用了解决不满足Pieper条件的逆运动学问题。

As for 6R serial robots in real operations, an inverse kinematics solution, which can meet certain task requirements and the position and orientation requirements of the end-effector, is needed。
至于6R串联机器人的实际操作，一个逆运动学的解决方案是需要的。能够满足任务需求，而且满足末端执行器的位置和姿态。

To this end, a variety of approaches has been presented. A common method is separating a i , α i and s i , θ i , which are in the D–H parameters of each joint of a 6R series manipulator.
最后，一系列方法被提出，一个通用的方法是分离，6R串联机构每一个关节的DH参数。

For the 6R series manipulator kinematics structures, the solution matrix is composed of two independent homogeneous and linear equations that use the methods of dual quaternion and Lie algebra


The 16 inverse kinematics solutions for each joint angle are obtained by iterating and eliminating the two equations

Qiao et al. [10] and Rocco et al. [11–14] obtained the numerical solution for the inverse kinematics of a general 6R series manipulator using dual quaternion theory and Lie groups, and Lie algebras and other methods, respectively.

The introduction of genetic algorithms and neural networks is another numerical method that is commonly used with the issue of inverse kinematics

The constraints, such as the feed value of the angle of the joint, will be set. The target function is the difference between the solution and the target. Based on that, the algorithms mentioned above can achieve the best fit of the feed value
 Chiddarwar and Babu [15] compared the effect of forecast and conventional neural network algorithms on the solving efficiency;while,KKökeretal.[16]propose daneural networkalgorithmfortheinversekinematicsof3DOFrobotsbytakingvelocity andaccelerationintoconsideration
Kalraetal.[17]andChapelleetal.[18]presentedanalgorithmfortheinversekinematicsof6DOFrobots based on a genetic algorithm
. Hammour et al. [19] planned the trajectory of the 6R manipulator using a continuous genetic algorithm;

 and Zha [20] employed a genetic algorithm to search for the minimum eigenvalue of the surface that the position and orientation vector of the end of the actuator formed to obtain the optimal trajectory planning.
Based on the research experiences of other scholars, this paper focuses on the multi-rotating joint robot and proposes an approach for the fast solving of the inverse kinematics issues utilizing conformal geometric space theory and the space vector projection method.