## 文件结构
    | - Startup (Windows的系统文件夹，其中文件会在启动后运行)
        | - OpenApps.ahk (快捷键打开应用)
        | - Settings.ahk (包含一些设定)
        | - ShowCPS.ahk (一个展示鼠标点击次数的窗口)
        | - WindowManager.ahk (快捷键管理窗口)
    | - StartupImages (存放着脚本使用的图片)
        | - ShowCPS.png (ShowCPS.ahk的背景图片)
    | - attatchments (存放着README.md用到的图片)
    | - README.md (本文件)


## 详细介绍

#### OpenApps.ahk
![Pasted image 20230110103248.png](attatchments/Pasted%20image%2020230110103248.png)
* 使用 Win+Alt+某键 打开常用应用

#### Settings.ahk
![Pasted image 20230110103555.png](attatchments/Pasted%20image%2020230110103555.png)
* 将NumLock锁定为开启
* 将右Alt对应到鼠标左键，将右Ctrl对应到鼠标右键

#### ShowCPS.ahk
![Pasted image 20230110103822.png](attatchments/Pasted%20image%2020230110103822.png)
![Pasted image 20230110103933.png](attatchments/Pasted%20image%2020230110103933.png)
* 创建一个GUI，记录鼠标左右键的每秒和累计点击次数 
	* 每秒点击次数指前一秒内的总点击次数，每0.1秒更新一次
	* 累计点击次数指窗口运行期间的总点击次数
* 窗口保持在顶部，不会被覆盖
* 可以用鼠标左键拖动窗口
* 窗口有75%的不透明度
* 可以通过在任务栏中右键关闭ShowCPS.ahk来关闭窗口
* 窗口时不时地会闪烁，应该是文字框的问题，未找到解决办法
* 每秒点击次数超过99，累计点击次数超过99999时会穿模
	* 每秒点击次数超过99，人类无法做到
	* 累计点击次数超过99999也不纳入考虑范围内
* 玩游戏时千万不能点到它，会切换窗口，未找到解决办法
* Fun Facts
	* 玩一局PvZ泳池无尽大概会点1300次左键，10次右键，左键CPS在最忙的时候会达到5或6
    * 今天用了大半天的电脑，没有玩游戏，目前左键累计点击次数为6995，右键为128 (没想到左右键点击次数差别如此之大)

#### WindowManager.ahk
![Pasted image 20230110105214.png](attatchments/Pasted%20image%2020230110105214.png)
* Win+Ctrl+方向键 移动窗口
* Win+Ctrl+Numpad0 放大缩小窗口
* Win+Ctrl+NumpadDot 最小化窗口
* Win+Ctrl+Backspace或Delete 关闭窗口
