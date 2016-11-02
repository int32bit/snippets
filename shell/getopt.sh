#!/bin/bash
# refer https://blog.linuxeye.com/389.html

# -o表示短选项，两个冒号表示该选项有一个可选参数，可选参数必须紧贴选项,如-carg 而不能是-c arg
# --long表示长选项
# "$@"在上面解释过
# -n:出错时的信息
# -- ：停止解析option，举一个例子比较好理解：
# 我们要创建一个名字为 "-f"的目录你会怎么办？
# mkdir -f #不成功，因为-f会被mkdir当作选项来解析，这时就可以使用
# mkdir -- -f 这样-f就不会被作为选项。

ARGS=$(getopt -o u:p::hv --long username,password:,help,version \
     -n 'error messages' $*)

echo ARGS=$ARGS

if [ $? != 0 ] ; then echo "Terminating..." >&2 ; exit 1 ; fi

# Note the quotes around `$TEMP': they are essential!
#set 会重新排列参数的顺序，也就是改变$1,$2...$n的值，这些值在getopt中重新排列过了
eval set -- "$ARGS" # 把ARGS变量的值重置命令参数

#经过getopt的处理，下面处理具体选项。

while :
do
    [ -z "$1" ] && break
    case "$1" in
        -v|--version)
            echo "Version: 1.0.0-alpha"
            shift ;;
        -h|--help)
            echo "Show Help messages."
            shift ;;
        -p|--password)
                # c has an optional argument. As we are in quoted mode,
                # an empty parameter will be generated if its optional
                # argument is not found.
                case "$2" in
                        "") echo "parse '--password', password not set."
                            shift 2 ;;
                        *)  echo "parse '--password', password value is '$2'."
                            shift 2 ;;
                esac ;;
        --)
            shift
            break ;;
        *) echo "Invalid option $1";
            shift;;
    esac
done
echo "Remaining arguments:"
for arg do
   echo $arg
done

