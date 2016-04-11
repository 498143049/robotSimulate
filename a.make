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
随着工业机器人技术的广泛应用，6R系列的机器人的应用有着很重要的意义。

The inverse kinematics in serial mechanisms, which plays a crucial role in the robotics, is a prerequisite of serial robot control.
在一系列机械中，在机器人中扮演者很重要角色的逆运动学在机器人的控制中十分重要。

It is directly related to tasks like off-line programming,path planning,and realtime control.
它直接和机器人运动任务-例如离线编程，路径规划，还有实时控制有关。

The final position and orientation can only be fully programmed and controlled through the using of inverse kinematics to transform the position and orientation of the joint variables.
最终的位置和姿态只能是通过使用逆运动学去改变关节变量的位置和姿态进行完全编程和控制。

The inverse kinematics of 6R serial mechanisms, which belongs to the same question as the inverse kinematics of 7R, is the most difficult issue in the kinematics of serial mechanisms and is regarded as the Mount Everest in kinematic analysis of spatial mechanisms
在系列机械的运动学中，6R系列机器的逆运动学，同样属于相同问题的7R机器的逆运动学，是特别难的问题，而且在空间机器的运动学分析里面，它被视为珠穆朗玛峰。

Researchers worldwide have carried out much useful exploration and research. The approaches used in the study of
inverse kinematics of 6R serial mechanisms can be divided into the analytical and numerical methods
全世界的研究人员已经开始施行许多有用的研究和探究，这些在研究6R系列机器的逆运动的方法可以分为分析法和数值法。

Generally, the analytic solutions are difficult to obtain due to the multi-parameters, nonlinearity and coupling of the solutions, and the algebra equations involved in the inverse kinematics of 6R serial manipulators 。
一般来说，


The analytical method is suitable for 6R serial manipulators with special geometry parameters and the theoretical solution can be achieved through vector, spiral and Lie algebraic methods.

The analytical method is accurate and able to find all solutions. However, it needs massive algebra and matrix operations as well as complicated derivation
Furthermore, it is necessary for the manipulator' position and orientation to have decoupling characteristics or the characteristic polynomial to have an order of less than four
Ref. [3] brought quaternions into kinematics research of spatial serial manipulators. It solved a classic problem of 6R robot inverse kinematics
A decomposable method was presented in Ref. [4]

However, itis only suitable for certain specialcircumstances, suchasdecoupling

The approaches usedin themathematical modeling of the inverse kinematics of serial mechanisms mainly consist of the D–H matrix method, spherical trigonometry, real matrices method, dual numbers method, and so on

These methods have no versatility and lead to different inverse kinematics algorithms

Raghavan and Roth [5] constructed 14 basic equations with six inverse kinematics equations through vector operation. After an elimination operation,a 24-order equation of onevariable and up to 16 sets of inverse kinematics solutionswere obtained.

However, eight extraneous roots existed. 

Raghavan's method was improved by Manocha [6] who enhanced its stability and accuracy by adopting the matrix eigenvalue decomposition method

In order to settle the displacement analysis of a general spatial 7R mechanism, Ref. [7,8] eliminated extraneous roots by employing a plural method and matrix operation respectively. 

Based on early research,Ref.[9]classifiedtheinversekinematicsof6Rserialmechanismsintotwocategories

Inthefirstcategory,thesolutiontothe inverse kinematics of 6R robots meets the Pieper criteria when using the closed solution

In the other, the orders of the target matrix obtained by Manocha were lowered from 24 to 16. When this was done the efficiency and stability were improved

In addition, the Newton–Raphson iterative algorithm was employed to solve the inverse kinematics issues that did not satisfy the Pieper Criterion.