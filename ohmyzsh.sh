# 使用国内镜像站安装Oh-My-Zsh
git clone https://mirror.nju.edu.cn/git/ohmyzsh.git
cd ohmyzsh/tools
REMOTE=https://mirror.nju.edu.cn/git/ohmyzsh.git sh install.sh
cd ../..
rm -rdf ohmyzsh

# 将Oh-My-Zsh远程设成国内镜像站
git -C $ZSH remote set-url origin https://mirror.nju.edu.cn/git/ohmyzsh.git
git -C $ZSH pull
