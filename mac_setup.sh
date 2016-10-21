# !/bin/sh

# 1. Xcode install 手動
xcode-select --install
sudo xcodebuild -license

# 2. homebrew install
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew upgrade
brew update
brew doctor

# 3. いろいろ持ってくる
git clone https://github.com/yaggio/dotfiles.git

cd dotfiles/apps/
brew bundle



#4.設定
#dock
#省エネ スリープ時間
#キーボード ショートカット sptllight検索 off
