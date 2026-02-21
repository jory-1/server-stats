#!/usr/bin/bash
# greeting
greeting(){
	figlet -w120 -fsmall "Server Performance Stats!";
	sleep 1;
}
cpu_usage(){
	echo "Cpu usage:"
	top -bn1 | grep "%Cpu(s):"| awk '{printf("User: %2.f%% \nSystem: %2.f%% \nAvailable: %2.f%%\n", $2 , $4, $8)}';
	echo ""
	sleep 1;
}
memory_usage(){
	echo "Memory usage:"
	free -h | awk '/Mem:/{printf("Used: %s \nTotal: %s \nPercentage: %.f%% \n", $3, $2, $3/$2 * 100.0 )}';
	echo ""
	sleep 1;
}
disk_usage(){
	echo "Disk Usage";
	df -h --total | awk '/total/{printf("Used %s \nTotal: %s\nFree: %s \nPercentage: %s\n", $2,$3,$4,$5)}';
	echo "";
	sleep 1;
}
top_5_procs_by_cpu(){
	echo "Top 5 processes sorted by Cpu Usage";
	ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -6;
	echo "";
	sleep 1;
}
top_5_procs_by_mem(){
	echo "Top 5 processes sorted by Memory Usage";
	ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -6;
	echo "";
}
main(){
greeting
cpu_usage
memory_usage
disk_usage
top_5_procs_by_cpu
top_5_procs_by_mem
}
main
