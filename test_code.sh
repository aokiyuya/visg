#uslocabibash


echo "test1 help msg"
visg -h > test1
visg --help > test2
diff test1 test2
if [ $? = 0 ]; then
	echo "completed"
	rm test1 test2
else
	echo "something wrong"
	exit 1
fi


echo "test2 version msg"
visg -v > test1
visg --version > test2
diff test1 test2
if [ $? = 0 ]; then
	echo "completed"
	rm test1 test2
else
	echo "something wrong"
	exit 1
fi

echo "test3 simple imput and yyppp"
vim -es '+norm iaaaa' '+norm yyppp' '+%p|q!' > ans
visg +'norm iaaaa' +'norm yyppp' > result
diff ans result
if [ $? = 0 ]; then
	echo "completed"
	rm ans result
else
	echo "something wrong"
	exit 1
fi

echo "test4 open a file"
echo "teststring" > testfile
visg testfile +'norm yyppp' > result
vim -es testfile +'norm yyppp' +%p +q! >ans
diff ans result
if [ $? = 0 ]; then
	echo "completed"
	rm -f ans result
else
	echo "something wrong"
	exit 1
fi

echo "test5 use pipe (simple string)"
echo "teststring" | visg +'norm yyppp' > result
echo "teststring" | vim -es /dev/stdin +'norm yyppp' +'%p|q!' > ans
diff ans result
if [ $? = 0 ]; then
	echo "completed"
	rm ans result
else
	echo "something wrong"
	exit 1
fi

echo "test6 use pipe (multi row string)"
seq 10 | visg +'3,5!tac' > result
seq 10 | vim -es /dev/stdin +'3,5!tac' +'%p|q!' > ans
diff ans result
if [ $? = 0 ]; then
	echo "completed"
	rm ans result
else
	echo "something wrong"
	exit 1
fi

echo "test7 given too many script"
echo +'norm i'{1..10} | xargs visg > /dev/null
if [ $? = 1 ]; then
	echo "completed"
else
	echo "something wrong"
	exit 1
fi

echo "test8 read rc file"
vim -u rc -es +'norm ooo' +'%p|q!' > ans
visg -r rc +'norm ooo' > result
diff ans result
if [ $? = 0 ]; then
	echo "completed"
	rm ans result
else
	echo "something wrong"
	exit 1
fi

echo "test9 read rc file and open file"
vim -u rc -es testfile +'norm ooo' +'%p|q!' > ans
visg -r rc testfile +'norm ooo' > result
diff ans result
if [ $? = 0 ]; then
	echo "completed"
	rm ans result
else
	echo "something wrong"
	exit 1
fi





exit 0

