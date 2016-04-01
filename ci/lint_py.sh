#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# 如果 Git repo 不存在的话直接跳过检查
if [[ ! -e $DIR/../.git ]]; then
	echo 'no git repo, skip lint py'
	exit 0
fi

# 允许通过 MASTER_BRANCH 环境变量指定 master 分支名
[ -n "$MASTER_BRANCH" ] || MASTER_BRANCH=master

# 取出新增或修改的文件, 删除的就不用管了
git_diff_file_names=`git diff --name-status $MASTER_BRANCH | grep -E '^(A|M)' | cut -f 2`

pre-commit run --files $git_diff_file_names
