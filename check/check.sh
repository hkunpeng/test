#!/bin/sh

#管理员邮箱账号数组
adminEmailArray=("leo.huang@easyhealthcarecorp.com1")
#不能修改的文件数组
fileNameArray=("Podfile" "pod.sh" )
#修改的文件 git diff --cached --name-only --diff-filter=ACM --
names=$(git diff --cached --name-only --diff-filter=ACM --)
if [ -n "${1}" ]; then
    names="${1}"
fi

email=$(git config user.email)

log() {
    CURRENT=$(date "+%Y-%m-%d %H:%M:%S")
    LOG_INFO="[${YELLOW}pre-commit${PLAIN}] -> [${GREEN}${CURRENT}${PLAIN}] --> ${1}"
    echo ${LOG_INFO}
}

error() {
    log "[${RED}ERROR${PLAIN}] ---> $1"
}

info() {
    log "[${GREEN}INFO${PLAIN}] ---> $1"
}

canModify() {
    if [[ ${names} == *$1* ]]; then
        error "你没有权限修改文件：$1, 请联系文件拥有人：${adminEmailArray[*]}"
        return 0
    fi
    return 1
}

checkFiles() {
    for value in ${fileNameArray[@]}
    do
        canModify $value
        result=$?
        if [ ${result} -eq 0 ]; then
         return 0
        fi
    done;
    return 1
}

main() {
    info "当前用户: $email"
    info "你修改了文件: $names" 

    checkFiles
    result=$?
    if [ ${result} -eq 0 ]; then
        info '没有权限修改，即将退出'
        exit 1
    fi
}

main

exit 0
