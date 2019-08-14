```
   _____                .__     ____________   ____.__               
  /     \ _____    ____ |  |__  \_____  \   \ /   /|__| ______  _  __
 /  \ /  \\__  \ _/ ___\|  |  \  /   |   \   Y   / |  |/ __ \ \/ \/ /
/    Y    \/ __ \\  \___|   Y  \/    |    \     /  |  \  ___/\     / 
\____|__  (____  /\___  >___|  /\_______  /\___/   |__|\___  >\/\_/  
        \/     \/     \/     \/         \/                 \/        
```
A fork from MachOView to update and fix some bugs, mostly Mountain Lion & iOS 6 related.
Also some small changes to the original behaviour.

Original MachOView by psaghelyi at http://sourceforge.net/projects/machoview/.
Thanks to psaghelyi for his great work :-)

Latest versions are Lion+ only.
The LLVM disassembler was replaced with Capstone. This eliminates Clang/LLVM packages requirements.
The downside is that Capstone stops disassembling on bad instructions which means that for now data in code and jump tables data will create problems and __text section disassembly might be incomplete in binaries that contain such data.
Capstone improved disassembly on error but data in code locations are available in header so this can and should be improved.

A static Capstone library extracted from the official DMG is included in the repo.
If you want to be safe you should download Capstone and compile it yourself.

Now features the attach option to analyse headers of a running process.
To use this feature you will need to codesign the binary.
Follow this LLDB guide to create the certificate and then codesign MachOView binary.
https://llvm.org/svn/llvm-project/lldb/trunk/docs/code-signing.txt
The necessary entitlements are already added to Info.plist.

Be warned that this allows MachOView to have task_for_pid() privs under current under and control
every process from user running it.
The whole Mach-O parsing code needs to be reviewed and made more robust.

Enjoy,
fG!

-----------------------------------
-----------------------------------


在fork的版本:V2.4.9121 基础之上进行修改，目前版本:V2.5.9276。修改内容如下：

- 1、增加拖拽的功能。

```
1、首次打开时，会显示初始界面，可直接往界面上拖动Mach-O文件；
2、每次拖动文件的最大数量是3个文件；
虽然我一般都会用cmd+o打开文档，但是对于不经常使用的朋友来说，直接拖拽应该还是不错的体验。
```

- 2、修复Xcode10.x的兼容性问题；

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

**注：已生成一个可直接安装的pkg(Version:2.5.9276)文件，无需再自行编译，[点此下载MachOView](https://github.com/mythkiven/MachOView/raw/master/MachOView%202019-08-15%2001-08-07/MachOView.pkg)**

**md5:d218e9a42e2e891b47f205f4bcdc388f **

**sha1:7cb343666b4995c2d64781259a6a0522888c6498**
