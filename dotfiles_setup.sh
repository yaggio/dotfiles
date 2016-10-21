#!/bin/sh

if [ `uname` = "Darwin" ]; then
  #mac
  home_dir="/Users/yajima/"
elif [ `uname` = "Linux" ]; then
  #linux
  home_dir="/home/yajima/"
fi

files="${home_dir}dotfiles/dots/"

for file in `find ${files} -maxdepth 1`
do
  echo ${file}
  echo `basename ${file}`
  file_name=`basename ${file}`
  # ディレクトリ
  if [ ${file_name} = "." ] ; then
	  echo "Pass"
    continue;
  elif [ ${file_name} = ".." ] ; then
	  echo "Pass"
    continue;
  elif [ ${file_name} = ".git" ] ; then
	  echo "Pass"
    continue;
  elif [ ${file_name} = "dots" ] ; then
	  echo "Pass"
    continue;
  else
    echo $file_name
    if [ -L "${home_dir}${file_name}" ] ; then
      echo "already shimlink : pass"
      continue;
    fi
    if [ -e "${home_dir}${file_name}" -a ! -L "${home_dir}${file_name}" ] ; then
      echo "already file !!! ${home_dir}$file_name"
      mv ${home_dir}${file_name} "${home_dir}${file_name}.old"
    fi

    ln -s ${file} ${home_dir}
    echo "ln -s ${file} ${home_dir}"
  fi
done
