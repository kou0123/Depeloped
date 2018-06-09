function addas(){
    if [ $# -eq 0 ]; then
        echo "addalias: argument is invalid." 1>&2
        return
    fi
    local wheretosave=`pwd`
    if [ $# -eq 2 ]; then
        wheretosave=$2
    fi
    alias $1='cd '$wheretosave
    local file_path=~/.newalias.txt
    local file=(`cat "${file_path}"`)
    local num=`expr ${#file[@]} - 1`
    echo $1 > ${file_path}
    echo `pwd` >> ${file_path}
    for i in `seq 0 ${num}`; do
        echo ${file[i]} >> ${file_path}
    done
}

function rmas(){
    if [ $# -ne 0 ]; then
        echo "rmalias: argument is invalid." 1>&2
        return
    fi

    # load aliases and count num
    local file_path=~/.newalias.txt
    local file=(`cat "${file_path}"`)
    local num=`expr ${#file[@]} - 1`
    num=`expr ${num} / 2`

    # ask an alias to be removed
    local cur_i0=0
    local cur_i1=0
    local cur_i2=1
    for i in `seq 0 ${num}`; do
        echo "${cur_i0}: ${file[cur_i1]}='cd ${file[cur_i2]}'"
        cur_i0=$(( cur_i0 + 1 ))
        cur_i1=$(( cur_i1 + 2 ))
        cur_i2=$(( cur_i2 + 2 ))
    done
    local aliasnum
    read -p "select target: " aliasnum

    # dump aliases to a file
    cur_i0=0
    cur_i1=0
    cur_i2=1
    local cur_flg=true
    for i in `seq 0 ${num}`; do
        if [ $cur_i0 -ne $aliasnum ]; then
            if $cur_flg; then
                echo ${file[$cur_i1]} > ${file_path}
                cur_flg=false
            else
                echo ${file[$cur_i1]} >> ${file_path}
            fi
            echo ${file[$cur_i2]} >> ${file_path}
        else
            unalias ${file[$cur_i1]}
        fi
        cur_i0=$(( cur_i0 + 1 ))
        cur_i1=$(( cur_i1 + 2 ))
        cur_i2=$(( cur_i2 + 2 ))
    done
}

cdls ()
{
    \cd "$@" && ls
}

alias cd="cdls"
alias addas='addas'
alias rmas='rmas'
alias g='git'
alias re='source ~/.bashrc'
alias rc='code ~/.bashrc'
alias gcf='code ~/.gitconfig'