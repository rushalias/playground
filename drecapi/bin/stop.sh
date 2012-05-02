
if [ -e ./drec.pid ]
then
        pid=`cat ./drec.pid`
        echo "Stopping ${pid}" 
        kill -s SIGINT ${pid}
else
        echo "No drec.pid found, Nothing to stop"
fi
