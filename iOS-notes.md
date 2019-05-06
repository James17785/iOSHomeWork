///Swift
1. Auto layout, 自动布局包括xib stotrybaord 和代码布局
storyboard
 1) 不同设备同时预览, 按住option，然后按menu > Preview(1) > Main.storyboard (Preview)，就能打开用于预览的assistant editor。
 2) 用control+drag方法来添加spacing constraint。
 3) 图片适用png格式, 图片倍率@2x, @3x, 一般情况适用2倍图
 4) 多个视图在一起不方便选择时，可以用 shift + 右击
 
 代码布局
 代码布局一般会引用第三方库CocoaPods
 1) CocoaPods 安装 : https://www.cnblogs.com/YangFuShun/p/7976811.html
 2) CocoaPods使用:
 在工程中创建一个Podfile文件: touch Podfile
 使用vim编辑Podfile文件: vim Podfile --> i, e.g.
         platform :ios, '7.0'
         target 'MyApp' do
         pod 'AFNetworking', '~> 3.1.0'
         end
 编辑完成后先按左上角的esc键，再按：键，再输入wq，点击回车，就保存并退出去了
 终端输入：$ pod install
 使用的时候引入: import SnapKit
3) 更新约束的时候
makeConstraints和updateConstraints两者的本质区别：makeConstraints是制作约束，在原来的基础上再添加另外的约束，updateConstraints是更新约束，改变原有约束，约束不会增加，没经过updateConstraints处理的保持原有约束，经过处理就更新约束，约束不会减少，snapkit不会产生警告
4) 重做约束（remakeConstraints）
之前所有的约束条件将不再起作用,要重新添加

2. UITableView

1) UITableViewCell
UITableView由UITableViewCell组成，UITabelViewCell负责显示数据。

UITableView的每一行，即每一个UITableViewCell显示一条项目。

UITableViewCell对象的数量不受限制，仅由设备内存决定。

UITableViewCell类定义了单元格在UITableView中的属性和行为。

创建 UITableViewCell 的时候，你可以自定义一个 cell ，或者使用系统预定义的几种格式。系统预定义的 cell 提供了 textLabel、detailTextLabel属性和imageView属性用来设置cell的内容和图片。样式由UITableViewCellStyle枚举来控制：

.default
包含一个左侧的可选图像视图，和一个左对齐的标签对象。

.value1
包含一个左侧的可选视图和一个左对齐的标签对象，在单元格右侧还有一个灰色、右对齐的标签对象。

.value2
包含一个左侧、右对齐的蓝色文字标签对象和一个右侧的左对齐的标签对象。

.subtitle
包含一个左侧的可选图像视图，和一个左对齐的标签对象，在这个标签对象下方，还有一个字体较小的标签对象。

2) 创建一个UITableView
创建UITableView，首先是实例化一个UITableView对象，还要涉及到它的代理UITabelViewDataSource、UITableViewDelegate，在UITableViewDataSource代理方法中定义UITableViewCell的样式。
tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath):
初始化和复用指定索引位置的UITableViewCell，必须实现。

tableView(_ tableView: UITableView, numberOfRowsInSection section: Int):
设置某一章节（section）中的单元格数量，必须实现。

UITableViewDataSource
实现数据源协议定义中的方法，从而设置章节中cell的个数，以及对cell进行初始化和复用设置。
UITableView中的索引路径包括两个元素，第一个元素section是表格的章节序号，第二个元素row表示章节中的行序号。

还添加了UITableViewDelegate代理协议，它的主要作用是提供一些可选的方法，用来控制表格的选择、指定章节的头和尾的显示、单元格内容的复制和粘贴以及协助完成单元格的排序等功能。

3)UITableView 复用机制
dequeueReusableCell方法的作用是从单元格对象池中获取指定类型并可复用的单元格对象。
style参数: 枚举常量，用于表示单元格的样式。
reuseIdentifier: 作为一个字符串类型的参数，它用来标识具有相同类型的、可复用的单元格。对于相同类型的单元格，需要使用相同的reuseIdentifier参数。

4) 自定义UITableViewCell
一般对于相对复杂一些的显示内容，我们会创建一个UITableViewCell的类文件。

5) 添加索引和章节（Section）
先来看一下索引需要用到的代理方法：

numberOfSections(in tableView: UITableView)
设置TableView中章节（Section的数量）不设置默认为1。

tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
在指定章节中，cell的个数。
-tableView(_ tableView: UITableView, titleForHeaderInSection section: Int)
设置章节标题文字，返回结果为字符串，如果返回为nil，则不显示标题。

sectionIndexTitles(for tableView: UITableView)
设置在表格右侧显示的索引序列的内容，返回结果为一个字符串数组

tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
TableViewCell初始化和复用

6) cell的选择和取消选择
UITableViewCellAccessoryType:

none
没有任何的样式

detailButton
右侧蓝色的圆圈，中间带叹号

detailDisclosureButton
右侧蓝色圆圈带叹号，它的右侧还有一个灰色向右的箭头

disclosureIndicator
右侧一个灰色的向右箭头

checkmark
右侧蓝色对号

7) cell的插入和删除
插入和删除设计到的两个代理方法：

tableView(_ tableView:, editingStyleForRowAt indexPath:)
确定编辑模式，Add or Delete

tableView(_ tableView:, commit editingStyle:, forRowAt indexPath:)
当执行编辑操作时，调用此方法

和一个开启TableView编辑模式的方法：
setEditing(_ editing:, animated:)
editing: 是否开启编辑状态
animated: 是否有动画效果

8) cell位置移动功能
移动功能同样设计到了两个代理方法：
tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath)
设置cell是否可移动

tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)
每次移动结束后会调用此方法
移动功能同样需要开启编辑模式setEditing(_: ,animated:)

9) table row 删除
在tableView(_:commit:forRowAt:)
tableView.deleteRows(at: [indexPath], with: .fade)

10) 用UITableViewRowAction为滑动产生更多动作
        let shareAction = UITableViewRowAction(style: .default, title: "Share", handler: {
            (action, indexPath) -> Void in
            // 3
            let defaultText = "Just checking in at " + self.restaurantNames[indexPath.row]
            let activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            self.present(activityController, animated: true, completion: nil)
        })

UIActivityViewController继承是UIViewController，提供一些服务，例如拷贝到剪贴板，分享内容到社交媒体，通过Messages发送项目等。

11) 定制table view 的样式
@IBOutlet var tableView:UITableView!

移除table view中空cell的分割线，在viewDidLoad中添加:
tableView.tableFooterView = UIView(frame: CGRect.zero)

改变分割线的颜色， 在viewDidLoad中添加:
tableView.separatorColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.8)


3. UIScrollView
1) 创建UIScrollView
let scrollView = UIScrollView(frame: view.bounds)

2) 为UIScrollView添加内容
3) UIScrollViewDelegate
4) UIPageControl

4. UIViewController
主要作用：在一个复杂的iOS应用中， 往往包含多个屏幕的内容，使用UIViewController可以方便管理众多的内容。
1) 视图控制器的生命周期：
alloc      
创建一个视图控制器对象，并分配内存空间。

init()
对视图控制器对象进行初始化。

loadView
如果从storyboard创建视图，则从storyboard中加载视图。

viewDidLoad
视图加入完成，可以进行一些自定义操作

viewWillAppear
视图即将要展示在屏幕上

viewDidAppear
视图已经站在屏幕上显示并完成渲染。

viewWillLayoutSubviews
视图即将布局其子视图

viewDidLayoutSubviews
视图已经完成子视图的布局

viewWillDisappear
视图即将从屏幕中消失

viewDidDisappear
视图已经从屏幕上消失

dealloc
视图被销毁

2) 创建一个UIViewController
UIViewController的职责是：对内管理与之关联的UIView，对外跟其他UIViewController通信和协调。
跳转 
	navigationController?.pushViewController(ViewController(), animated: true)
    // 另一种跳转方式
    present(ViewController(), animated: true, completion: nil)
back
		navigationController?.popViewController(animated: true)
        // 另一种跳转方式 成对出现
        dismiss(animated: true, completion: nil)

5. UITabBarController
1) 创建一个UIViewController
2) 实现UITabBarController
	let tabBarController = UITabBarController()
    // tabBarController的主题颜色
    tabBarController.tabBar.tintColor = UIColor.init(colorLiteralRed: 9/255.0, green: 187/255.0, blue: 7/255.0, alpha: 1)
    // tabBarController的子视图控制器集合
    tabBarController.viewControllers = [wechat,addressBook,find,mine]
    // 添加到rootViewController
    window?.rootViewController = tabBarController

我们可以去掉状态栏:
在General中有一个Hide status bar的单选框，勾选，info.plist中会新增一条Status bar is initially hidden ,然后在下面再添加一条View controller-based status bar appearance，就可以了，这个是有自动补全的，所以不用担心拼错。然后再跑一下项目看一下，没有状态栏了。

3) 修改UITabBarController的索引
在使用TabBarController时，一般打开APP会默认呈现的是第一个Tab的viewController
tabBarController.selectedIndex = 2 //索引是从0开始

4) Tab图标上方显示角标
当项目收到推送时，app的icon上面会出现小红点，并且数字会+1，在项目里，只要设置子视图控制器的tabBarItem的badgeValue属性就可以了：
 wechat.tabBarItem.badgeValue = "10"

6. UINavigationController
1) UINavigationController导航条控制器用于显示多屏并具有一定层次结构的内容，是构建分层应用的主要工具。
2) 创建一个UINavigationController
window?.rootViewController = UINavigationController(rootViewController: FirstViewController())
3) 导航栏的显示和隐藏
我们可以在viewWillAppear()中设置视图控制器的navigationController的navigationBarHidden属性来设置导航栏的隐藏和显示。
override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
a. navigationBarHidden ()方法有两个参数，第一个参数表示是否隐藏导航栏，第二个属性表示是否需要动画效果。
4) 导航栏样式
		// 添加导航条上方的提示，这个属性被设置后，导航栏的高度将增加到74
        navigationItem.prompt = "正在使用您的位置..."
        // 设置导航栏不透明
        navigationController?.navigationBar.isTranslucent = false
        // 设置导航条样式
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        // 设置导航栏关键元素颜色，tintColor属性是View专门用来指定所包含的关键元素的颜色
        navigationController?.navigationBar.tintColor = UIColor.white
        // 设置导航栏背景图片
        navigationController?.navigationBar.setBackgroundImage(UIImage(named:""), for: .any, barMetrics: .default)
        
        // 设置导航栏 title 的 Font
        navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName:UIFont.boldSystemFont(ofSize: 18)]
        // 设置导航栏 title 的 Color
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        
        // 设置导航栏阴影部分图片，也就是导航栏下面那条细线
        navigationController?.navigationBar.shadowImage = UIImage(named:"")
        // 设置导航栏阴影颜色
        navigationController?.navigationBar.layer.shadowColor = UIColor.green.cgColor
        // 设置导航栏阴影偏移
        navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 10)
        // 设置导航栏阴影透明度
        navigationController?.navigationBar.layer.shadowOpacity = 0.2

5) 导航控制器和标签控制器
6) 创造Navigation Controller
选中Restaurant Table View Controller然后点击菜单栏中的Editor > Embed in > Navigation Controller；生成了新的一Scene（Navigation Controller Scene）。

iOS 10中有几种sugue类型：
Show：新的view controller将被添加view controller栈的顶部。跳转的页面有Navigation bar，并且有返回原来页面的返回按钮。这是非常常用的的类型。
Show detail：在view controller栈中，新的view controller将被替代原来的view controller。跳转的页面没有Navigation bar，也没有返回原来页面的返回按钮。
Present modally：新页面将以动画形式从底部出现到覆盖整个手机屏幕。这种形式最常见的列子是iOS自带的日历应用
Present as popover：以带有箭头锚点的弹框显示。通常使用的iPad应用中

通过segues传递数据
segue管理view controller之间的过渡。当segue触发时，storyboard会通知源view controller（如RestaurantTableViewController）调用方法prepare(for:sender:)，可以通过此方法传递数据。segues 很多的时候,最好给segue一个唯一identifier
在RestaurantTableViewController中添加prepare

7) 定制Navigation Bar的样式
通过UINavigationBar.appearance()修改Navigation Bar的样式。

8)修改Status Bar样式
在Info.plist中添加一个key为View controller-based status bar appearance，值为NO。然后application(_:didFinishLaunchingWithOptions:)中添加：UIApplication.shared.statusBarStyle = .lightContent。


7. 国际化
如果项目已经完成开发,替换全局字符串为国际化宏 
Command+Shift+F，进入全局搜索引擎，切换为Replace模式，并把匹配模式改为Regular Expression。

Swift，请去掉@
@"[^"]*[\u4E00-\u9FA5]+[^"\n]*?"

生成多语言文件
首先，我们需要先新建所需语言的文件夹。
cd 工程目录
mkdir en.lproj
mkdir zh-Hans.lproj

然后，遍历所有.m文件，根据每个文件内的需要国际化的字符串生成key和value。
find . -name *.m | xargs genstrings -o en.lproj
find . -name *.m | xargs genstrings -o zh-Hans.lproj

此时，en.lproj和zh-Hans.lproj文件夹中就应该有了相应的Localizable.string文件了。
我们把这两个文件夹拖到工程里，然后在相应的Localizable.strings文件中，修改每个key所对应的value值就行了

应用名字本地化, 在 InfoPlist.strings 中加入如下代码:
CFBundleDisplayName = "第二课";

8. 开始用Swift开发iOS 10 - 13 Self Sizing Cells and Dynamic Type
使Cell自适应
tableView.estimatedRowHeight = 36.0    
tableView.rowHeight = UITableViewAutomaticDimension

estimatedRowHeight是cell的预计高度，这边就设置成原本prototype cell的高度。
UITableViewAutomaticDimension表示超过预计高度后自动适应高度。
修改Value label的numberOfLines属性为0，就是不限制行数

添加spacing约束, 这样不管value label是多少行，高度都会自适应了
当value label超过两行，文本显示出问题：
要给stack view添加两个上下的相等spcing约束。

Dynamic Type
Dynamic Type当在手机设置 >通用 > 辅助功能 > 更大字体设置字体大小时，app中的应用也相应的变化。
只要把字体设置成text style - Headline就会有Dynamic Type功能

9. 开始用Swift开发iOS 10 - 14 基础动画，模糊效果和Unwind Segue

10. 数据存储
NSKeyedArchiver: 归档(NSCoding)序列化
NSUserDefaults: 用来保存应用程序设置和属性, 用户保存的数据
NSFileManager: write的方式直接写入磁盘
SQLite: 采用SQLite数据库来存储数据

11. WKWebView
网络请求中,httpheadr 主要用于存储cookie 的信息, httpbody 主要用于传输用户提交的数据
一些常用属性方法
(1)loadRequest()  加载请求
(2)goBack()  网页后退
(3)goForward()  网页前进
(4)reload()  网页重新加载
(5)stopLoading()  网页停止加载
(6)title  网页标题
(7)canGoBack  网页是否能够后退
(8)canGoForward  网页是否能够前进
(9)estimatedProgress  网页加载中当前的进度

一般还要搭配使用到WKUIDelegate和WKNavigationDelegate

12. iOS应用架构
https://casatwy.com/iosying-yong-jia-gou-tan-kai-pian.html

999. Common
（control+⌘+space）表情 




yellow file, 参与编译
bule folder, 工程文件,

一些常用的第三方库:
pod  'SwiftRandom'
pod 'Alamofire'
pod 'OHHTTPStubs/Swift'
pod 'Moya/RxSwift'
pod 'HandyJSON'
pod 'SnapKit'
pod 'UIColor_Hex_Swift'
pod 'Kingfisher'        图片库
pod 'Toast-Swift'       loading icon
pod 'XCGLogger'     log 文件, 打印日志调试
pod 'RandomColorSwift'      
pod 'SwiftyJSON'


raml





NSUserDefaults
存储不太敏感的数据, 明文

NSKeyedArchiver 序列化
NSKeyedUnarchiver 反序列化
synchronize 立即保存

代码格式化
Ctrl + i


bounds and frame difference
origin API for constraints
collectionView


流程图 OmniGraffle
时序图 StarUML
dummy json,  PlistEdit Pro


CocoalPods 安装

ios 知识总结
https://blog.csdn.net/robinson_911/article/details/80647459
https://www.jianshu.com/p/e41e116837b5

API 查询
https://developer.apple.com/documentation/webkit/wkwebview




