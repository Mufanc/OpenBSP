if [ $$ -eq 1 ]; then
    make "$@"
else
    docker run --device /dev/ttyUSB0 -v "$PWD:/host" --rm mufanc/openbsp:latest "$@"
fi
