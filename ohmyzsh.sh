# 克隆Oh-My-Zsh仓库
git clone https://mirror.nju.edu.cn/git/ohmyzsh.git

# 进入工具目录
cd ohmyzsh/tools

# 使用国内镜像站安装Oh-My-Zsh
REMOTE=https://mirror.nju.edu.cn/git/ohmyzsh.git sh install.sh

# 返回上级目录
cd ../..

# 删除Oh-My-Zsh仓库
rm -rf ohmyzsh

# 设置Oh-My-Zsh远程仓库为国内镜像
git -C $ZSH remote set-url origin https://mirror.nju.edu.cn/git/ohmyzsh.git

# 拉取最新更新
git -C $ZSH pull

# 克隆autoupdate插件
git clone https://mirror.nju.edu.cn/git/autoupdate-oh-my-zsh-plugins.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/autoupdate

# 克隆autosuggestions插件
git clone https://mirror.nju.edu.cn/git/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# 克隆syntax-highlighting插件
git clone https://mirror.nju.edu.cn/git/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# 自动替换.zshrc文件中插件配置的函数
replace_plugins_in_zshrc() {
    # 指定.zshrc文件的路径
    local zshrc_file="$HOME/.zshrc"
    # 新的插件配置
    local new_plugins="plugins=(git autoupdate z zsh-autosuggestions zsh-syntax-highlighting)"

    # 检查.zshrc文件是否存在
    if [ -e "$zshrc_file" ]; then
        # 在.zshrc中查找并替换插件配置
        sed -i "s/plugins=(git)/$new_plugins/g" "$zshrc_file"
        echo "插件配置已更新为：$new_plugins"
    else
        echo ".zshrc文件不存在，请确保Oh-My-Zsh已安装并配置完成。"
    fi
}

# 调用函数以替换插件配置
replace_plugins_in_zshrc

# 启用.zshrc配置
source ~/.zshrc
echo ".zshrc文件中的配置已启用。"
