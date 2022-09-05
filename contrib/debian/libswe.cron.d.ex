#
# Regular cron jobs for the libswe package.
#
0 4	* * *	root	[ -x /usr/bin/libswe_maintenance ] && /usr/bin/libswe_maintenance
