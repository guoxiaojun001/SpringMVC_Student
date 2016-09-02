# SpringMVC_Student
一个简单的学生管理系统

采用Springmvc + ibatis

本地安装好mysql

1、创建好数据库，以及写好数据库的mapping文件

2、之后给相关业务bean创建好dao层，以及service和相关实现

3、书写controller负责相关业务的处理，以及页面的跳转

4、创建jsp页面文件，以及在页面接收相关参数



在控制层，利用Strtus2标签功能，在Action中直接与jsp页面上的数据进行交互。在调用业务逻辑层应用时，
Struts2提供了对Sping的支持。开发人员需要完成对struts.xml的配置工作和对各个Action类的编写。
    在业务逻辑层，利用Spring框架的依赖注入实现对业务逻辑类和DAO类的实例托管；在事务处理方面，
	利用Spring提供的面向切面的事务处理功能，使对数据的事务控制脱离于数据访问接口实现；在对象关系映射方面，
	利用Spring对数据库连接池的托管和对iBatis框架的支持。开发人员需要完成对数据源的配置、
	对不同模块所对应的application*.xml文件的配置，以及对业务逻辑接口的定义和业务逻辑实现的编写。
     在持久层，利用iBatis提供的半自动化对象关系映射的实现，开发人员需要编写具体的sql语句，
	 为系统设计提供了更大的自由空间。另外，开发人员需要完成对SqlMapConfig.xml和*SqlMap.xml的配置，以及对DAO接口的定义和DAO接口的实现。
在各层之间进行交换的过程中，利用数据传输类进行数据的传递和交互。其中，数据传输类与数据库表一一对应。




首先，大家只要理解了MVC。其实所有的MVC 框架都是大同小异的。

无非是用户页面通过HttpServletRequest向后台传值。框架的配置文件会通过Request中的URL格式
和参数找到相对应的Action（Spring mvc中叫Controller）。Action执行完成后或者返回一个新的页面或者只
返回一些数据。可以放在Request中或者Session中在页面中取得。然后页面继续其他功能。（个人理解！）

先看一下Spring MVC 的处理流程：


1.客户发出请求request,DispatchServlet（Spring 的前端控制器）负责统一分发请求到Spring控制器（Controller）。
2.统一分发之前，需要借助于handlermapping对象定位到具体的Spring控制器（Controller）。
3.Spring控制器处理DispatchServlet分发过来的的请求，执行业务逻辑或调用业务逻辑组件。
4.一旦控制器处理完客户请求，则返回一个ModelAndView 对象给DispatchServlet前端控制器.,
ModelAndView 对象包含数据模型和视图信息（很明显Model和View）。
5．DispatchServlet询问视图解析器，查找相应视图。
6．由某具体视图为用户显示页面。

 spring框架使用的是分层的注解。
    持久层：@Repository；
    服务层：@Service
    控制层：@Controller
	
	
7. web.xml 的加载顺序是：context-param -> listener -> filter -> servlet ，
	而同个类型之间的实际程序调用的时候的顺序是根据对应的 mapping 的顺序进行调用的 
	
 spring上下文载入监听器（ContextLoaderListener），确保web服务启动时，spring已经完成初始化 
 
 
 
 ContextLoaderListener 加载时会把 除controller以外的东西。 spring-mvc的配置文件，加载
 
 
 DispatcherServlet 加载时会加载controller相关的东西，SpringMVC-servlet.xml 里面的东西
