##                              design-pattern4j                 

### .**Introduction**

**设计模式**:一套被反复使用的,多数人知晓的,经过分类编写的,通用代码设计经验的总结出来的开发设计模式。使用设计模式可以提高,代码复用性,可读性,健壮性,可靠性.......等positive的修饰词 !

**wikipedia**:（Design Patterns: Elements of Reusable Object-Oriented Software）是软件工程领域有关软件设计的一本书，提出和总结了对于一些常见软件设计问题的标准解决方案，称为软件设计模式.

**GoF**:四人帮,Erich Gamma, Richard Helm , Ralph Johnson，John Vlissides（Gang of Four）.

### .**categories**

设计模式,通常总结分为23种,3类:

##### 创建型模式(Creational)

创建实例相关,划分为两组：类创建模式及对象创建模式.

.类创建模式:在实例化过程中有效的使用类之间的继承关系.

.对象创建模式:使用代理来完成其任务.

| factory-method | abstract-factory | singleton |  builder   | prototype |
| :------------: | :--------------: | :-------: | :--------: | :-------: |
|  工厂方法模式  |   抽象工厂模式   | 单例模式  | 建造者模式 | 原型模式  |

###### >>>>>>extension:  Object Pool 对象池模式

##### 结构型模式(Structural)

结构型是关于类及对象复合关系的

|  adapter   | decorator  |  proxy   |  facade  |  bridge  | composite | flyweight |
| :--------: | :--------: | :------: | :------: | :------: | :-------: | :-------: |
| 适配器模式 | 装饰器模式 | 代理模式 | 外观模式 | 桥接模式 | 组合模式  | 享元模式  |

###### >>>>>extension:  Private Class Data 私有类数据模式

##### 行为型模式(Behavioral)

关于对象之间如何通讯的

| strategy | template-method |  observer  |  iterator  | chain-of-responsibility |
| :------: | :-------------: | :--------: | :--------: | :---------------------: |
| 策略模式 |  模板方法模式   | 观察者模式 | 迭代子模式 |       责任链模式        |

| command  |  memento   |  state   |  visitor   |  mediator  | interpreter |
| :------: | :--------: | :------: | :--------: | :--------: | :---------: |
| 命令模式 | 备忘录模式 | 状态模式 | 访问者模式 | 中介者模式 | 解释器模式  |

###### >>>>extension:  Null Object 空对象模式

### .**principle**

设计模式原则: 总原则－开闭原则

1、单一职责原则 (Single Responsibility Principle)

2、里氏替换原则（Liskov Substitution Principle）

3、依赖倒转原则（Dependence Inversion Principle）

4、接口隔离原则（Interface Segregation Principle）

5、迪米特法则（Demeter Principle）

6、合成复用原则（Composite Reuse Principle）