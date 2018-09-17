#配置仓库个人基本信息
git config --global user.name "..."
git config --global user.email "..."
//--global参数，表明这台机器的所有git仓库都使用这个配置
#创建版本库
git init
//初始化仓库
git add <file>	//把修改文件添加到暂存区
git commit -m <message>	//把暂存区的内容提交到当前分支
#版本控制
git status	//工作区状态
git diff	//修改内容
git log		//提交日志
git reset --hard HEAD^	//回退到上一个版本（^,~100）
git reflog	//记录每一次命令（commit id）
git reset --hard <commit id>	//回退到commit id版本位置
git checkout -- <file>	//撤销修改，让文件回到最近一次git commit或git add时的状态
git rm <file>
//rm <file>
git commit -m "..."		//删除文件

git checkout -- <file>	//撤销删除

#远程仓库管理
ssh-keygen -t rsa -C "email"		//生成id_rsa,id_rsa.pub(公钥)
//github添加公钥

*上传
//github创建项目
git remote add origin <github_link>
git push -u origin master //上传master分支

*克隆(原理：从远程克隆时，git自动把本地的master分支和远程的master分支分支对应起来，并且远程仓库的默认名称为origin)
//找到github项目和link
git clone <github_link>

#分支管理
git checkout -b dev		//创建dev分支并切换到此分支
//git branch dev
//git checkout dev
git branch				//查看当前分支

git merge dev			//用于合并指定分支到当前分支
git branch -d dev		//删除dev分支(git branch -D dev:-D,强制删除)

#解决冲突
//当git无法自动合并分支时，就必须首先解决冲突（解决冲突就是把git合并失败的文件手动编辑为我们希望的内容，再提交）
git log --graph --pretty==oneline --abbrev-commit	//	查看分支合并情况
git log --graph

git merge --no-ff -m '...' dev		//禁用Fast forward

#Bug分支
//stash:把当前工作现场“储藏”起来，等以后恢复现场后继续工作
git stash		//保存当前修改
git stash list	//查看保存的信息
*恢复保存
git stash apply
git stash drop

//git stash pop	//恢复并删除git stash list信息

git stash apply <stash@{0}>		//恢复指定stash

git remote -v		//查看远程库信息,-v显示更详细信息

git pull 			//抓取远程的新提交

#标签管理
git tag v1.0		//创建标签,-d删除标签
git tag

git push origin --tags	//推送本地标签到远程

#配置别名
git config --global alias.co checkout
