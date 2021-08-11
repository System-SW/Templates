## USAGE-KOR
```
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
```
sudo vim에서도 같은 설정으로 사용하고 싶을 때
```
sudo su
cp ~/.vimrc /root
cp -r ~/.vim_runtime /root/
```
넘버링 사용하고 싶을 때
```
echo 'set number' >> ~/.vimrc
```

## USAGE-ENG
```
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
```
If you want to use this configuration with sudo mode, follow next steps
```
sudo su
cp ~/.vimrc /root/
cp -r ~/.vim_runtime /root/
```
If you want to use numbering
```
echo 'set number' >> ~/.vimrc
```

## REQUIREMENT

#### Ubuntu 20.04, Vim
Ubuntu : [Ubuntu official website](https://ubuntu.com/)<br>

Vim : ```sudo apt install vim```
## REFERENCE :
original github : [vim config](https://github.com/amix/vimrc)
