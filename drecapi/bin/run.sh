rm  -f ./drec.pid
ruby ./src/drec.rb  > ./drec.log  2>&1  &
echo $! > ./drec.pid
