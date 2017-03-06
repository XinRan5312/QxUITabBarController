# QxUITabBarController
仿微信  QQ首页tab  
http://blog.csdn.net/watertekhqx/article/details/59518971
http://blog.csdn.net/watertekhqx/article/details/60139447

我们在xib或者storyBoard中创建布局的时候，一般会给每个控件一个tag，意义就像Android的每个view的id，然后通过跟布局文件的.viewWithTag(tag)等价于android的findViewByid(id).
      用过Android的程序猿都知道，android的视图结构是Window--DectView--ContentView很简单，平时我们看到的和操作的部件其实都是ContentView上的一个个的布局控件，比如Button，ImageView等；同样IOS也有自己的视图结构：就是Window套UITabBarController，UITabBarController套UINavigationController, UINavigationController套UIViewController，NavigationBar和ToolBar，而我们平时操作的控件大部分都是UIViewController，NavigationBar和ToolBar上布局的控件。
      UITabBarController的基本属性：
    - (void)viewDidLoad { [super viewDidLoad];
//1.创建标签控制器 
UITabBarController *tab = [[UITabBarController alloc]init];
//2.创建相应的子控制器（viewcontroller）
FirstViewController *firstVC = [FirstViewController new];
firstVC.navigationItem.title = @"通讯录"; 
firstVC.tabBarItem.title = @"通讯录";
firstVC.tabBarItem.image = [UIImage imageNamed:@"12-eye"];
UINavigationController *firstNC = [[UINavigationController alloc]initWithRootViewController:firstVC];
SecondViewController *secondVC = [SecondViewController new]; 
secondVC.navigationItem.title = @"朋友圈";
//设置标签名称 secondVC.tabBarItem.title = @"朋友圈";
//可以根据需求设置标签的的图标 
secondVC.tabBarItem.image = [UIImage imageNamed:@"21-skull"]; 
UINavigationController *secondNC = [[UINavigationController alloc]initWithRootViewController:secondVC];
//3.添加到控制器 //特别注意：管理一组的控制器(最多显示五个,多余五个的话,包括第五个全部在更多模块里面,并且可以通过拖拽方式进行顺序编辑); 
NSArray *array = @[firstNC,secondNC] 
tab.viewControllers = array;
//设置标签栏文字和图片的颜色 
tab.tabBar.tintColor = [UIColor orangeColor]; 
//设置标签栏的颜色
tab.tabBar.barTintColor = [UIColor blackColor]; 
//设置标签栏风格(默认高度49)
tab.tabBar.barStyle = UIBarStyleBlack; 
//设置初始状态选中的下标 
tab.selectedIndex = 3;

以上是用代码创建我们的UITabBarViewController创建我们的tabBar对应的ViewControllers大家可以很明显的看到他们都是，包装成UINavigationController后再付给UITabBarViewController，表示一个个的tabBar，同样我们也可以在storyBoard中直接通过拉拽segue设置一个个的tabBar，如下图：
选中TabBarController视图最顶上的第一个小圆点，使用control键连接新建的视图各种ViewController，用这种方式新建segue，
选择Relationship Segue下的view controllers，不断的重复这几个操作就可以一个个创建完成tabBar。
