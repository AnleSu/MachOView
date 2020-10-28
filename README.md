
在fork的版本:V2.4.9121 基础之上进行修改，目前版本:V2.5.9276。修改内容如下：

- 1、增加拖拽的功能：

```
1、首次打开时，会显示初始界面，可直接往界面上拖动Mach-O文件；
2、每次拖动文件的最大数量是3个文件；
```

- 2、修复Xcode10.x的兼容性问题：

```
1、报错：'string' file not found
修改方案：C++标准库修改为libc++

2、crash: fwrite写入空值crash
修改方案：判空即可
```

- 3、其他修改：

```
1、部分 KVC 增加判空处理；
2、进度条更新代码放入主线程中；
3、修复可能存在内存泄漏的代码。

```

使用技巧

```
最快捷的打开方式(在终端或Alfred)
$open -a MachOView XX
$open -b MachOView XX

其次是
$open -b/-a MachOView 或 Alfred 或 点击图标
然后拖动Mach-O文件到已打开的初始页面上或程序坞(Dock)中的图标上
```

