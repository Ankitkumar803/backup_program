#README
#The value of n for the number of days should be configurable using a shell variable $MODPERIOD
#run "export MODPERIOD=n"  , n is number of days. and after that run "make" command
usage:
	@echo "Usage report:"
	@du --time -a -h
list:
	@echo "files that are modified within last 5 days:"
	@find -mtime -$$MODPERIOD -printf "%c %p\n"



backup:
	@mkdir ../Backup;\
	echo "Backing up files in one level up directory: \n"
	@for n in `find -mtime -$$MODPERIOD` ;do \
	cp -R -v $$n ../Backup/;\
	done;\
	var=$$(date +"%FORMAT_STRING");\
	now=$$(date +"-%d%b%Y");\
	echo "\nCompressing backed up files into .tar :"  $$now  "\n";\
	tar -zcvf ../Backup$$now.tar ../Backup;\

