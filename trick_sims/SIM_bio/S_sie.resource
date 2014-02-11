set trick_enums(CHECKPOINT_TYPE) {CHKPNT_PRE_INIT	CHKPNT_POST_INIT	CHKPNT_RUN_TIME	CHKPNT_SAFESTORE	CHKPNT_END}
set trick_enums(DR_Buffering) {DR_Buffer	DR_No_Buffer	DR_Ring_Buffer	DR_Thread_Buffer}
set trick_enums(DR_Byte_Order) {DR_Native	DR_Big_Endian	DR_Little_Endian}
set trick_enums(DR_Destination) {DR_None	DR_Disk	DR_Disk_Buffered	DR_Memory	DR_Printer}
set trick_enums(DR_Format) {DR_Binary	DR_Ascii	DR_Fixed_Ascii}
set trick_enums(DR_Freq) {DR_Always	DR_Changes	DR_Changes_Step}
set trick_enums(Euler_Seq) {Roll_Pitch_Yaw	Roll_Yaw_Pitch	Pitch_Yaw_Roll	Pitch_Roll_Yaw	Yaw_Roll_Pitch	Yaw_Pitch_Roll}
set trick_enums(Exec_Clock) {Gettimeofday	GMT	EXTERNAL}
set trick_enums(Flag) {Off	On	No	Yes	False	True	Disconnect	Connect	Inactive	Active	Stop	Go	Low	High	Disable	Enable	TRUE	FALSE	Open	Closed	OFF	ON	NO	YES	INACTIVE	ACTIVE	BACKWARD	FORWARD	BAD	GOOD}
set trick_enums(ImpExpEnable) {IMPEXP_OFF	IMPEXP_ON	EXPORT_ONLY	IMPORT_ONLY}
set trick_enums(Input_Oper) {Input_Oper_Add	Input_Oper_Sub	Input_Oper_Mult	Input_Oper_Div	Input_Oper_Mod	Input_Oper_LShift	Input_Oper_RShift	Input_Oper_And	Input_Oper_Or	Input_Oper_Xor}
set trick_enums(Integrator) {Euler	Euler_Cromer	Nystrom_Lear_2	Runge_Kutta_2	Modified_Midpoint_4	Runge_Kutta_4	Runge_Kutta_Gill_4	Runge_Kutta_Fehlberg_45	Runge_Kutta_Fehlberg_78	ABM_Method	User_Defined}
set trick_enums(Language) {Language_C	Language_CPP	Language_Java}
set trick_enums(MS_SYNC_TYPE) {No_sync	Master_sync	Slave_sync}
set trick_enums(PANEL_SIZE) {Panel_Size_Normal	Panel_Size_Lite	Panel_Size_Ultralite}
set trick_enums(PROCESS_TYPE) {PARENT	ASYNC_CHILD	AMF_CHILD	SCHED_CHILD}
set trick_enums(Realtime_Process_ID) {Clock	Master	Child_1	Child_2	Child_3	Child_4	Child_5	Child_6	Child_7	Child_8	Child_9	Child_10	Child_11	Child_12	Child_13	Child_14	Child_15	Child_16}
set trick_enums(Regula_Falsi) {Decreasing	Any	Increasing}
set trick_enums(SIM_COMMAND) {NoCmd	InitPhaseCmd	FreezeCmd	RunCmd	LdChckCmd	DmpChckCmd	DataRecOnCmd	DataRecOffCmd	RealtimeCmd	NonRealCmd	ExitCmd}
set trick_enums(SIM_MODE) {Initialization	Freeze	LdChck	DmpChck	Step	Run	Exit}
set trick_enums(TCCommBlocking) {TC_COMM_BLOCKIO	TC_COMM_NOBLOCKIO	TC_COMM_TIMED_BLOCKIO	TC_COMM_ALL_OR_NOTHING}
set trick_enums(TCCommFlag) {TC_COMM_FALSE	TC_COMM_TRUE	TC_COMM_NO	TC_COMM_YES	TC_COMM_DISABLED	TC_COMM_ENABLED}
set trick_enums(TRICK_FILE_PERMS) {Trick_R_OK	Trick_W_OK	Trick_X_OK	Trick_F_OK}
set trick_enums(TRICK_GSL_TYPE) {TRICK_GSL_GAUSS	TRICK_GSL_FLAT	TRICK_GSL_POISSON}
set trick_enums(TRICK_MALF_JOB_ACTION) {Trick_Malf_Job_Off	Trick_Malf_Job_On	Trick_Malf_Job_Call	Trick_Malf_Input_Action}
set trick_enums(TRICK_MONTE_EXIT_STATUS) {TRICK_MONTE_NOT_COMPLETE	TRICK_MONTE_COMPLETE	TRICK_MONTE_CORED	TRICK_MONTE_TIMEDOUT	TRICK_MONTE_NO_PERM}
set trick_enums(TRICK_MONTE_VAR_TYPE) {TRICK_MONTE_VAR_FILE	TRICK_MONTE_VAR_RANDOM	TRICK_MONTE_VAR_FIXED	TRICK_MONTE_VAR_CALC}
set trick_enums(TRICK_REMOTE_SHELL) {TRICK_SSH	TRICK_RSH	TRICK_USER_REMOTE_SH}
set trick_enums(TrickErrorLevel) {TRICK_ERROR_ALL	TRICK_ERROR_TRIVIAL	TRICK_ERROR_ADVISORY	TRICK_ERROR_CAUTION	TRICK_ERROR_WARNING	TRICK_ERROR_ALERT	TRICK_ERROR_FATAL	TRICK_ERROR_ABORT	TRICK_ERROR_SILENT}
set trick_enums(Wave_Form) {Pulse	Ramp	Square	Square_Doublet	Triangle	Triangle_Doublet	Sine	Noise	Gauss_Noise	User_Wave}
set trick_enums(rand_generator) {UNIFORM_RND_1	UNIFORM_RND_TRIPLE	GAUSS_RND_PSEUDO	GAUSS_RND_BELL	RND_NUM_1}
set trick_enums(udp_kind_type) {TC_UDP_SINGLE	TC_UDP_BROADCAST	TC_UDP_MULTICAST}
set trick_enums(uniform_generator) {LCG1	TRIPLE}

set trick_variables(sys.exec) \
{Declared in S_define	EXECUTIVE	InputAndOutput	--	data_structure_address	0	in	job}

set trick_variables(sys.job) \
{Job Scheduling Info	JOBDATA	InputAndOutput	--	data_structure_address	1	3	in	NULL}

set trick_templates(ALLOC_STATS.alloc_current) \
{Current dynamic memory usage	int	InputAndOutput	--	other	0	num_alloc_current}

set trick_templates(ALLOC_STATS.num_alloc_current) \
{Number of allocations	int	InputAndOutput	--	other	0	alloc_max}

set trick_templates(ALLOC_STATS.alloc_max) \
{Maximum dynamic memory usage	int	InputAndOutput	--	other	0	num_alloc_max}

set trick_templates(ALLOC_STATS.num_alloc_max) \
{Maximum dynamic memory usage	int	InputAndOutput	--	other	0	alloc_total}

set trick_templates(ALLOC_STATS.alloc_total) \
{Current dynamic memory usage	int	InputAndOutput	--	other	0	num_alloc_total}

set trick_templates(ALLOC_STATS.num_alloc_total) \
{Total number of allocations	int	InputAndOutput	--	other	0	NULL}

set trick_templates(DATA_RECORD.directory) \
{Full path to output directory	char*	InputAndOutput	--	other	0	terminate_on_bad_ref}

set trick_templates(DATA_RECORD.terminate_on_bad_ref) \
{Yes = Terminate sim when a parameter name can not be found, No = skip ref	Flag	InputAndOutput	--	enumerated	0	num_group}

set trick_templates(DATA_RECORD.num_group) \
{Num of data recording groups	int	InputAndOutput	--	other	0	group}

set trick_templates(DATA_RECORD.group) \
{Data Record group info	DR_GROUP	InputAndOutput	--	data_structure_address	1	0	record	next}

set trick_templates(DATA_RECORD.next) \
{Next call time for data rec	double	InputAndOutput	s	other	0	lp_command}

set trick_templates(DATA_RECORD.lp_command) \
{Deprecated	char*	InputOnly	--	other	0	dump_mem_job_name}

set trick_templates(DATA_RECORD.dump_mem_job_name) \
{Deprecated	char*	InputOnly	--	other	0	dr_byte_order}

set trick_templates(DATA_RECORD.dr_byte_order) \
{Deprecated	DR_Byte_Order	InputOnly	--	enumerated	0	NULL}

set trick_templates(DR_GROUP.record) \
{Yes = record data, No = do not record data	Flag	InputAndOutput	--	enumerated	0	user_alloc}

set trick_templates(DR_GROUP.user_alloc) \
{Yes = data is allocated by user - init after initialization jobs No = normal data	Flag	InputAndOutput	--	enumerated	0	struct_extract_bits}

set trick_templates(DR_GROUP.struct_extract_bits) \
{Yes = add extracted bitfields to end of struct recording No = bitfields not extracted	Flag	InputAndOutput	--	enumerated	0	name}

set trick_templates(DR_GROUP.name) \
{Unique name for group output data file	char*	InputAndOutput	--	other	0	format}

set trick_templates(DR_GROUP.format) \
{Output format, binary or ascii	DR_Format	InputAndOutput	--	enumerated	0	freq}

set trick_templates(DR_GROUP.freq) \
{Determines frequency of recording data record to destination device	DR_Freq	InputAndOutput	--	enumerated	0	start}

set trick_templates(DR_GROUP.start) \
{Start time for data recording	double	InputAndOutput	s	other	0	cycle}

set trick_templates(DR_GROUP.cycle) \
{Cycle time for data recording	double	InputAndOutput	s	other	0	ref}

set trick_templates(DR_GROUP.ref) \
{Parameter name list defining the data record	char*	InputAndOutput	--	other	1	0	change_ref}

set trick_templates(DR_GROUP.change_ref) \
{List defining the parameters that cause data record when changed	char*	InputAndOutput	--	other	1	0	buffering}

set trick_templates(DR_GROUP.buffering) \
{Buffering option	DR_Buffering	InputAndOutput	--	enumerated	0	max_records_ring}

set trick_templates(DR_GROUP.max_records_ring) \
{maximum number of records to save in the ring buffer if equal to 0, will be calculated by max_buffer_size/record_size	int	InputAndOutput	--	other	0	next}

set trick_templates(DR_GROUP.next) \
{Next simulation elasped time to record a new record	double	InputAndOutput	s	other	0	max_buffer_size}

set trick_templates(DR_GROUP.max_buffer_size) \
{Maximum size to hold in memory before writing	int	InputAndOutput	--	other	0	destination}

set trick_templates(DR_GROUP.destination) \
{Deprecated	DR_Destination	InputOnly	--	enumerated	0	single_prec_only}

set trick_templates(DR_GROUP.single_prec_only) \
{Yes = record all doubles as floats	Flag	InputAndOutput	--	enumerated	0	max_file_size}

set trick_templates(DR_GROUP.max_file_size) \
{Deprecated	int	InputOnly	--	other	0	memory_size}

set trick_templates(DR_GROUP.memory_size) \
{Deprecated	int	InputOnly	--	other	0	ascii_location}

set trick_templates(DR_GROUP.ascii_location) \
{Deprecated	int	InputOnly	--	other	2	0	0	ascii_float_format}

set trick_templates(DR_GROUP.ascii_float_format) \
{'C' printf format for floats, only used if format == DR_Ascii	char*	InputOnly	--	other	0	ascii_double_format}

set trick_templates(DR_GROUP.ascii_double_format) \
{'C' printf format for doubles, only used if format == DR_Ascii	char*	InputOnly	--	other	0	ascii_label}

set trick_templates(DR_GROUP.ascii_label) \
{label for ascii outputs, only used if format == DR_Ascii	char*	InputOnly	--	other	1	0	ascii_delimiter}

set trick_templates(DR_GROUP.ascii_delimiter) \
{Delimiter for separating ascii format fields, only used if format == DR_Ascii	char*	InputOnly	--	other	0	NULL}

set trick_templates(EXECUTIVE.in) \
{User supplied inputs	EXEC_IN	InputAndOutput	--	data_structure_address	0	sim_name	out}

set trick_templates(EXECUTIVE.out) \
{Executive output parameters	EXEC_OUT	InputAndOutput	--	data_structure_address	0	time	work}

set trick_templates(EXECUTIVE.work) \
{Executive workspace	EXEC_WORK	InputAndOutput	--	data_structure_address	0	clock_init	ip}

set trick_templates(EXECUTIVE.ip) \
{Run file input processor information	INPUT_PROCESSOR	InputAndOutput	--	data_structure_address	0	echo_input	rt_log}

set trick_templates(EXECUTIVE.rt_log) \
{Real-time jopb timing Data Recording	DATA_RECORD	InputAndOutput	--	data_structure_address	0	directory	record}

set trick_templates(EXECUTIVE.record) \
{Data Recording specification and handling	DATA_RECORD	InputAndOutput	--	data_structure_address	0	directory	monte}

set trick_templates(EXECUTIVE.monte) \
{Monte carlo batch running structure	MONTE_CARLO	InputAndOutput	--	data_structure_address	0	in	sim_com}

set trick_templates(EXECUTIVE.sim_com) \
{Simulation Control Panel	SIM_COM	InputAndOutput	--	data_structure_address	0	monitor_on	impexp}

set trick_templates(EXECUTIVE.impexp) \
{Import/Export connection devices	ImpExpConn	InputAndOutput	--	data_structure_address	0	enabled	error_handler}

set trick_templates(EXECUTIVE.error_handler) \
{Global Err handler for entire executive	TrickErrorHndlr	InputAndOutput	--	data_structure_address	0	report_level	NULL}

set trick_templates(EXEC_IN.sim_name) \
{String identifier for the simulation run	char*	InputAndOutput	--	other	0	enable_var_server}

set trick_templates(EXEC_IN.enable_var_server) \
{Yes = enables the variable server	Flag	InputAndOutput	--	enumerated	0	tv}

set trick_templates(EXEC_IN.tv) \
{On = turn on the tv (trick_view)	Flag	InputAndOutput	--	enumerated	0	mtv}

set trick_templates(EXEC_IN.mtv) \
{On = turn on the mtv (malf trick view)	Flag	InputAndOutput	--	enumerated	0	tv_input_file}

set trick_templates(EXEC_IN.tv_input_file) \
{Input file that contains vars for TV	char*	InputAndOutput	--	other	0	stripchart_input_file}

set trick_templates(EXEC_IN.stripchart_input_file) \
{Input file for stripcharting vars	char*	InputAndOutput	--	other	0	stripchart_sample_rate}

set trick_templates(EXEC_IN.stripchart_sample_rate) \
{Sampling for stripcharts	double	InputAndOutput	s	other	0	pre_init_checkpoint}

set trick_templates(EXEC_IN.pre_init_checkpoint) \
{Yes = chkpnt before init jobs	Flag	InputAndOutput	--	enumerated	0	post_init_checkpoint}

set trick_templates(EXEC_IN.post_init_checkpoint) \
{Yes = chkpnt immediately after init jobs	Flag	InputAndOutput	--	enumerated	0	end_checkpoint}

set trick_templates(EXEC_IN.end_checkpoint) \
{Yes = drop a checkpoint at the end of sim	Flag	InputAndOutput	--	enumerated	0	reduced_checkpoint}

set trick_templates(EXEC_IN.reduced_checkpoint) \
{Yes = Small chkpnt file, var = 0 not printed	Flag	InputAndOutput	--	enumerated	0	hexflt_checkpoint}

set trick_templates(EXEC_IN.hexflt_checkpoint) \
{Yes = print floats and doubles in their hex representation to allow an exact reload	Flag	InputAndOutput	--	enumerated	0	checkpoint_cpu_number}

set trick_templates(EXEC_IN.checkpoint_cpu_number) \
{cpu number for checkpoint child job	int	InputAndOutput	--	other	0	safestore_checkpoint}

set trick_templates(EXEC_IN.safestore_checkpoint) \
{Yes = take a periodic checkpoint	Flag	InputAndOutput	--	enumerated	0	safestore_period}

set trick_templates(EXEC_IN.safestore_period) \
{How long between safestore checkpoints	double	InputAndOutput	s	other	0	output_dir_timestamped}

set trick_templates(EXEC_IN.output_dir_timestamped) \
{record data into a separate timestamped directory	Flag	InputAndOutput	--	enumerated	0	enable_freeze}

set trick_templates(EXEC_IN.enable_freeze) \
{Yes = a <cntrl-C> initiates a simulation freeze instead of a simulation shutdown, the very next <cntrl-C> resumes the sim	Flag	InputAndOutput	--	enumerated	0	enable_init_pause}

set trick_templates(EXEC_IN.enable_init_pause) \
{Yes = enables S_define specs for pausing the initialization process. <cntrl-C> resumes the sim	Flag	InputAndOutput	--	enumerated	0	debugging}

set trick_templates(EXEC_IN.debugging) \
{Yes = Allow user to step frame by frame from sim_control panel	Flag	InputAndOutput	--	enumerated	0	enable_cpu_stats}

set trick_templates(EXEC_IN.enable_cpu_stats) \
{Yes = turn on cpu resource stats at term.	Flag	InputAndOutput	--	enumerated	0	echo_job}

set trick_templates(EXEC_IN.echo_job) \
{Echo names of called jobs flag	Flag	InputAndOutput	--	enumerated	0	frame_log}

set trick_templates(EXEC_IN.frame_log) \
{Yes = Log job timing information for each realtime frame	Flag	InputAndOutput	--	enumerated	0	trap_sigsegv}

set trick_templates(EXEC_IN.trap_sigsegv) \
{Yes = Trap SIGSEGV in master and child execs	Flag	InputAndOutput	--	enumerated	0	trap_sigbus}

set trick_templates(EXEC_IN.trap_sigbus) \
{Yes = Trap SIGBUS in master and child execs	Flag	InputAndOutput	--	enumerated	0	trap_sigfpe}

set trick_templates(EXEC_IN.trap_sigfpe) \
{Yes = Trap SIGFPE in master and child execs	Flag	InputAndOutput	--	enumerated	0	frame_log_max_samples}

set trick_templates(EXEC_IN.frame_log_max_samples) \
{maximum number of job time samples for high fidelity job execution data, only used when frame_log == Yes	double	InputAndOutput	--	other	0	frame_log_start_time}

set trick_templates(EXEC_IN.frame_log_start_time) \
{simulation time at which to start logging high fidelity job execution data, only used when frame_log == Yes	double	InputAndOutput	s	other	0	time_tic}

set trick_templates(EXEC_IN.time_tic) \
{Executive simulation time resolution	double	InputAndOutput	s	other	0	freeze_cycle}

set trick_templates(EXEC_IN.freeze_cycle) \
{Freeze processing cycle time	double	InputAndOutput	s	other	0	initialization_passes}

set trick_templates(EXEC_IN.initialization_passes) \
{Number of initialization passes to execute	int	InputAndOutput	--	other	0	met_ref}

set trick_templates(EXEC_IN.met_ref) \
{Mission Elapse time start value	GMTTIME	InputAndOutput	--	data_structure_address	0	day	gmt_ref}

set trick_templates(EXEC_IN.gmt_ref) \
{GMT time start value	GMTTIME	InputAndOutput	--	data_structure_address	0	day	stack_trace}

set trick_templates(EXEC_IN.stack_trace) \
{print stack trace if signal fault	Flag	InputAndOutput	--	enumerated	0	attach_debugger}

set trick_templates(EXEC_IN.attach_debugger) \
{Attach debugger in case of signal fault	Flag	InputAndOutput	--	enumerated	0	debugger_command}

set trick_templates(EXEC_IN.debugger_command) \
{debugger command	char*	InputAndOutput	--	other	0	use_deprecated_features}

set trick_templates(EXEC_IN.use_deprecated_features) \
{True = deprecated features on	Flag	InputAndOutput	--	enumerated	0	ms_sync}

set trick_templates(EXEC_IN.ms_sync) \
{Master, Slave or no sync indicator	MS_SYNC_TYPE	InputAndOutput	--	enumerated	0	sync_wait_limit}

set trick_templates(EXEC_IN.sync_wait_limit) \
{Maximum time sim will wait for sync signal before reporting error	double	InputAndOutput	s	other	0	sync_port_offset}

set trick_templates(EXEC_IN.sync_port_offset) \
{Offset added to last three digits of pid to get port on which a sim listens for slaves to connect on	int	InputAndOutput	--	other	0	sync_error_terminate}

set trick_templates(EXEC_IN.sync_error_terminate) \
{Yes = Sim should terminate on sync error No = report sync error and continue	Flag	InputAndOutput	--	enumerated	0	new_slaves}

set trick_templates(EXEC_IN.new_slaves) \
{Number of new dynamic slaves awaiting sync	int	InputAndOutput	--	other	0	slave_cnt}

set trick_templates(EXEC_IN.slave_cnt) \
{Number of slaves defined	int	InputAndOutput	--	other	0	slaves}

set trick_templates(EXEC_IN.slaves) \
{Slave-specific connection data	SLAVE	InputAndOutput	--	data_structure_address	1	16	machine_name	activate_slave}

set trick_templates(EXEC_IN.activate_slave) \
{Yes = Sim should activate a slave	Flag	InputAndOutput	--	enumerated	1	16	remote_shell}

set trick_templates(EXEC_IN.remote_shell) \
{Type shell to bring slave up with	TRICK_REMOTE_SHELL	InputAndOutput	--	enumerated	0	user_remote_shell}

set trick_templates(EXEC_IN.user_remote_shell) \
{user defined remote shell command, only used when remote_shell = TRICK_USER_REMOTE_SH	char*	InputAndOutput	--	other	0	remote_shell_args}

set trick_templates(EXEC_IN.remote_shell_args) \
{optional arguments to use with remote shell command	char*	InputAndOutput	--	other	0	rt_clock}

set trick_templates(EXEC_IN.rt_clock) \
{Executive real-time clock option	Exec_Clock	InputAndOutput	--	enumerated	0	rt_clock_ratio}

set trick_templates(EXEC_IN.rt_clock_ratio) \
{Ratio of desired sim time to real-time; i.e. 2.0 = sim executes 2 times faster than realtime, 0.1 = sim executes 10 times slower than real-time	double	InputAndOutput	--	other	0	rt_nap}

set trick_templates(EXEC_IN.rt_nap) \
{Flag to turn on/off napping for multi process job completion and dependency checking	Flag	InputAndOutput	--	enumerated	0	rt_itimer}

set trick_templates(EXEC_IN.rt_itimer) \
{Flag to turn on itimer signal for realtime overrun/underrun checking	Flag	InputAndOutput	--	enumerated	0	rt_exttimer}

set trick_templates(EXEC_IN.rt_exttimer) \
{Flag to turn on external timer signal for realtime overrun/underrun checking	Flag	InputAndOutput	--	enumerated	0	rt_itimer_pause}

set trick_templates(EXEC_IN.rt_itimer_pause) \
{Flag to turn on pause() instead of spinloop for itimer interupts at realtime_check_dt	Flag	InputAndOutput	--	enumerated	0	rt_itimer_frame}

set trick_templates(EXEC_IN.rt_itimer_frame) \
{Time increment to check for overruns with itimer of simulation	double	InputAndOutput	s	other	0	rt_software_frame}

set trick_templates(EXEC_IN.rt_software_frame) \
{Time increment to check realtime status of simulation	double	InputAndOutput	s	other	0	rt_sync_frame}

set trick_templates(EXEC_IN.rt_sync_frame) \
{Time increment to check M/S sync status of simulation	double	InputAndOutput	s	other	0	enable_init_stepping}

set trick_templates(EXEC_IN.enable_init_stepping) \
{Flag to turn on init phase stepping	Flag	InputAndOutput	--	enumerated	0	rt_max_overrun_cnt}

set trick_templates(EXEC_IN.rt_max_overrun_cnt) \
{Maximum number of consecutive overrun conditions before shutdown	int	InputAndOutput	--	other	0	rt_max_overrun_time}

set trick_templates(EXEC_IN.rt_max_overrun_time) \
{Maximum overrun time before Sim shutdown	double	InputAndOutput	s	other	0	rt_overrun_freeze}

set trick_templates(EXEC_IN.rt_overrun_freeze) \
{Enter FREEZE mode on an overrun condition	Flag	InputAndOutput	--	enumerated	0	rt_enable_clock_reset}

set trick_templates(EXEC_IN.rt_enable_clock_reset) \
{On = enable clock resetting on every itimer frame	Flag	InputAndOutput	--	enumerated	0	user_dr_writer}

set trick_templates(EXEC_IN.user_dr_writer) \
{On = enable trick_dr_writer function	Flag	InputAndOutput	--	enumerated	0	synchronous_dr_writer}

set trick_templates(EXEC_IN.synchronous_dr_writer) \
{On = Yes = always call every real-time frame	Flag	InputAndOutput	--	enumerated	0	rt_cpu_number}

set trick_templates(EXEC_IN.rt_cpu_number) \
{CPU # array for sim processs: clock-0,Master-1,childs-1+n	int	InputAndOutput	--	other	1	0	rt_lock_to_cpu}

set trick_templates(EXEC_IN.rt_lock_to_cpu) \
{Lock process (clock,master,childs) to cpu number specified in rt_cpu_number	Flag	InputAndOutput	--	enumerated	1	0	rt_isolate_proc}

set trick_templates(EXEC_IN.rt_isolate_proc) \
{call to isolate CPU from other processes	Flag	InputAndOutput	--	enumerated	1	0	rt_restrict_proc}

set trick_templates(EXEC_IN.rt_restrict_proc) \
{call to restrict CPU from other processes	Flag	InputAndOutput	--	enumerated	1	0	rt_nonpreempt_proc}

set trick_templates(EXEC_IN.rt_nonpreempt_proc) \
{call to run non-preemptively from OS scheduler on CPU	Flag	InputAndOutput	--	enumerated	1	0	rt_lock_memory}

set trick_templates(EXEC_IN.rt_lock_memory) \
{Lock process (clock,master,childs) into memory	Flag	InputAndOutput	--	enumerated	1	0	rt_nond_pri}

set trick_templates(EXEC_IN.rt_nond_pri) \
{Call to set process to nondegrading priority.	Flag	InputAndOutput	--	enumerated	1	0	rt_priority}

set trick_templates(EXEC_IN.rt_priority) \
{priority to set if rt_nond_pri = Yes , the highest priority is 1, and the priority goes down as the number goes up - 2,3,4,...	int	InputAndOutput	--	other	1	0	rt_semaphores}

set trick_templates(EXEC_IN.rt_semaphores) \
{Mutex for each child - On/Off	Flag	InputAndOutput	--	enumerated	1	0	shutdown_wait_async}

set trick_templates(EXEC_IN.shutdown_wait_async) \
{wait for async jobs to finish at shutdown	Flag	InputAndOutput	--	enumerated	0	NULL}

set trick_templates(EXEC_OUT.time) \
{Current simulation time	double	InputAndOutput	s	other	0	time_gmt}

set trick_templates(EXEC_OUT.time_gmt) \
{Current wall clock time at top of frame	double	InputAndOutput	s	other	0	total_overrun}

set trick_templates(EXEC_OUT.total_overrun) \
{Total number of times job cue entered an overrun condition during execution	int	InputAndOutput	--	other	0	pre_sync_overruns}

set trick_templates(EXEC_OUT.pre_sync_overruns) \
{Total number of times job cue entered an overrun condition solely due to the local math models	int	InputAndOutput	--	other	0	ref_time}

set trick_templates(EXEC_OUT.ref_time) \
{executive internal clock ref time - used to compute relative freeze_time	double	InputAndOutput	--	other	0	gmt}

set trick_templates(EXEC_OUT.gmt) \
{GMT structure - used if Exec_Clock = GMT/CTE	GMT_STRUCT	InputAndOutput	--	data_structure_address	1	18	secs	frame_job_time}

set trick_templates(EXEC_OUT.frame_job_time) \
{Execution times in each frame for each job	double	InputAndOutput	s	other	1	0	frame_sched_times}

set trick_templates(EXEC_OUT.frame_sched_times) \
{Job scheduling execution time in each frame for each process	double	InputAndOutput	s	other	1	0	frame_sched_time}

set trick_templates(EXEC_OUT.frame_sched_time) \
{Total job scheduling execution time in each frame for all processes	double	InputAndOutput	s	other	0	amf_wait_time}

set trick_templates(EXEC_OUT.amf_wait_time) \
{Total time waiting for amf jobs in exec_job_schedule	double	InputAndOutput	s	other	0	child_start_wait_time}

set trick_templates(EXEC_OUT.child_start_wait_time) \
{Total time waiting for children to finish in exec_job_schedule	double	InputAndOutput	s	other	0	child_complete_wait_time}

set trick_templates(EXEC_OUT.child_complete_wait_time) \
{Total time waiting for children to finish in exec_job_schedule	double	InputAndOutput	s	other	0	depends_on_wait_time}

set trick_templates(EXEC_OUT.depends_on_wait_time) \
{Total time waiting for depends jobs during exec_job_schedule	double	InputAndOutput	s	other	0	frame_overrun_time}

set trick_templates(EXEC_OUT.frame_overrun_time) \
{Realtime frame overrun/underrun time, > 0 indicates overrun, < 0 indicates underrun	double	InputAndOutput	s	other	0	frame_overrun_cnt}

set trick_templates(EXEC_OUT.frame_overrun_cnt) \
{Number of consecutive overrun conditions	int	InputAndOutput	--	other	0	data_rec_time}

set trick_templates(EXEC_OUT.data_rec_time) \
{Time duration for data recording to take place per realtime frame.	double	InputAndOutput	s	other	0	slave_sync_time}

set trick_templates(EXEC_OUT.slave_sync_time) \
{Time duration for slave to wait on master during a master/slave sync	double	InputAndOutput	s	other	0	master_sync_time}

set trick_templates(EXEC_OUT.master_sync_time) \
{Time duration for master to sync with all slaves	double	InputAndOutput	s	other	0	itimer_freq}

set trick_templates(EXEC_OUT.itimer_freq) \
{deprecated	double	InputAndOutput	s	other	0	alloc_stats}

set trick_templates(EXEC_OUT.alloc_stats) \
{memory allocation statistics	ALLOC_STATS	InputAndOutput	--	data_structure_address	0	alloc_current	NULL}

set trick_templates(EXEC_WORK.clock_init) \
{Clock time for simulation initialization	double	InputAndOutput	s	other	0	clock_time}

set trick_templates(EXEC_WORK.clock_time) \
{Current clock time	double	InputAndOutput	s	other	0	cpu_init}

set trick_templates(EXEC_WORK.cpu_init) \
{CPU usage time at executive initialization	double	InputAndOutput	s	other	0	cpu_start}

set trick_templates(EXEC_WORK.cpu_start) \
{CPU usage time at cyclic sim process startup	double	InputAndOutput	s	other	0	cpu_time}

set trick_templates(EXEC_WORK.cpu_time) \
{Current CPU usage time	double	InputAndOutput	s	other	0	met_sec_ref}

set trick_templates(EXEC_WORK.met_sec_ref) \
{MET reference seconds	double	InputAndOutput	s	other	0	gmt_sec_ref}

set trick_templates(EXEC_WORK.gmt_sec_ref) \
{GMT reference seconds	double	InputAndOutput	s	other	0	restart}

set trick_templates(EXEC_WORK.restart) \
{Yes = simulation is in a restart condition	Flag	InputAndOutput	--	enumerated	0	mode}

set trick_templates(EXEC_WORK.mode) \
{Simulation control mode	SIM_MODE	OutputOnly	--	enumerated	0	exec_command}

set trick_templates(EXEC_WORK.exec_command) \
{mode set by sim	SIM_COMMAND	InputAndOutput	--	enumerated	0	init_pause}

set trick_templates(EXEC_WORK.init_pause) \
{Yes = Sim currently in initialization pause state	Flag	InputAndOutput	--	enumerated	0	initialization_pass}

set trick_templates(EXEC_WORK.initialization_pass) \
{Current initialization pass: 0 = initialization complete 1 = first pass, 2 = second pass, and so on	int	InputAndOutput	--	other	0	freeze_command}

set trick_templates(EXEC_WORK.freeze_command) \
{Yes = Start sim in Freeze	Flag	InputAndOutput	--	enumerated	0	sim_start}

set trick_templates(EXEC_WORK.sim_start) \
{Simulation input start time	double	InputAndOutput	s	other	0	next_realtime_check}

set trick_templates(EXEC_WORK.next_realtime_check) \
{Next sim time for realtime status check	double	InputAndOutput	s	other	0	next_itimer_check}

set trick_templates(EXEC_WORK.next_itimer_check) \
{Next sim time for itimer pause check	double	InputAndOutput	s	other	0	rt_software_frame_saved}

set trick_templates(EXEC_WORK.rt_software_frame_saved) \
{Saved software frame for rt/nonrt moding	double	InputAndOutput	s	other	0	itimer_frame_cnt}

set trick_templates(EXEC_WORK.itimer_frame_cnt) \
{itimer frame counter used to sync clock	long	InputAndOutput	--	other	0	frame_last_time}

set trick_templates(EXEC_WORK.frame_last_time) \
{Last clock_time() value used for job timing, for each process	double	InputAndOutput	--	other	1	0	xtra_derivative}

set trick_templates(EXEC_WORK.xtra_derivative) \
{optional run derivative job after the last integration job per delta time	Flag	InputAndOutput	--	enumerated	0	sim_rt_ratio}

set trick_templates(EXEC_WORK.sim_rt_ratio) \
{Simulation Time to Real Time ratio	double	InputAndOutput	s	other	0	event_malf_broadcast}

set trick_templates(EXEC_WORK.event_malf_broadcast) \
{Turn on/off broadcasting of events & malfs being fired	Flag	InputAndOutput	--	enumerated	0	trick_version}

set trick_templates(EXEC_WORK.trick_version) \
{trick version string	char	InputAndOutput	--	other	1	64	trick_major_version}

set trick_templates(EXEC_WORK.trick_major_version) \
{trick major version number	int	InputAndOutput	--	other	0	trick_minor_version}

set trick_templates(EXEC_WORK.trick_minor_version) \
{trick minor version number	int	InputAndOutput	--	other	0	verify_input}

set trick_templates(EXEC_WORK.verify_input) \
{Verify input runstream syntax flag	Flag	InputAndOutput	--	enumerated	0	cmdline_name}

set trick_templates(EXEC_WORK.cmdline_name) \
{Name of sim from the cmdline	char	InputAndOutput	--	other	1	256	run_dir}

set trick_templates(EXEC_WORK.run_dir) \
{Run directory name "RUN_<unique_tag>"	char	InputAndOutput	--	other	1	256	include_dir}

set trick_templates(EXEC_WORK.include_dir) \
{Directory name for #include in input file	char	InputAndOutput	--	other	1	256	default_dir}

set trick_templates(EXEC_WORK.default_dir) \
{Directory name for S_default.dat and Default_Data files	char	InputAndOutput	--	other	1	256	output_dir}

set trick_templates(EXEC_WORK.output_dir) \
{Directory name to hols S_job_execution, chkpnt_* files, and the rt logging files	char	InputAndOutput	--	other	1	256	input_file}

set trick_templates(EXEC_WORK.input_file) \
{Simulation input data file name	char	InputAndOutput	--	other	1	256	chck_filename}

set trick_templates(EXEC_WORK.chck_filename) \
{file name for specific checkpoint files	char*	InputAndOutput	--	other	0	checkpoint_time}

set trick_templates(EXEC_WORK.checkpoint_time) \
{Time for simulation checkpoint dump	double	InputAndOutput	s	other	0	next_safestore_time}

set trick_templates(EXEC_WORK.next_safestore_time) \
{next time for safestore checkpoint	double	InputAndOutput	s	other	0	terminate_time}

set trick_templates(EXEC_WORK.terminate_time) \
{Time for simulation termination	double	InputAndOutput	s	other	0	freeze_time}

set trick_templates(EXEC_WORK.freeze_time) \
{Current simulation freeze time	double	InputAndOutput	s	other	0	automated_sim}

set trick_templates(EXEC_WORK.automated_sim) \
{Automatically start Sim, then exit when done flag	Flag	InputAndOutput	--	enumerated	0	event_evaluate_tgo}

set trick_templates(EXEC_WORK.event_evaluate_tgo) \
{1 = Evaluate Event time to go function	int	InputAndOutput	--	other	0	event_fired}

set trick_templates(EXEC_WORK.event_fired) \
{1 = Event has been scheduled to be fired	Flag	InputAndOutput	--	enumerated	0	event_tgo}

set trick_templates(EXEC_WORK.event_tgo) \
{Time to go 'till next event firing	double	InputAndOutput	s	other	0	integ_time}

set trick_templates(EXEC_WORK.integ_time) \
{Time internal to state integration	double	InputAndOutput	s	other	0	integ_time_end}

set trick_templates(EXEC_WORK.integ_time_end) \
{Time to be at when state integration step is complete, used for event processing	double	InputAndOutput	s	other	0	num_event_fired}

set trick_templates(EXEC_WORK.num_event_fired) \
{Total number of events fired	int	InputAndOutput	--	other	0	job_call_time}

set trick_templates(EXEC_WORK.job_call_time) \
{Next scheduled job call time	double	InputAndOutput	s	other	0	job_select}

set trick_templates(EXEC_WORK.job_select) \
{Index of current job in all_jobs[] for each process	int	InputAndOutput	--	other	1	0	job_complete}

set trick_templates(EXEC_WORK.job_complete) \
{Job completion flags	Flag	InputAndOutput	--	enumerated	1	0	job_que}

set trick_templates(EXEC_WORK.job_que) \
{Job ques for each master / child process	int	InputAndOutput	--	other	2	0	0	job_que_id}

set trick_templates(EXEC_WORK.job_que_id) \
{Current job for master / child process	int	InputAndOutput	--	other	1	0	num_all_job}

set trick_templates(EXEC_WORK.num_all_job) \
{Number of scheduled jobs	int	InputAndOutput	--	other	0	num_job}

set trick_templates(EXEC_WORK.num_job) \
{Number of scheduled jobs	int	InputAndOutput	--	other	0	num_jobs_on_que}

set trick_templates(EXEC_WORK.num_jobs_on_que) \
{Number of jobs on queue for master / childs	int	InputAndOutput	--	other	1	0	start_child_queue}

set trick_templates(EXEC_WORK.start_child_queue) \
{Yes = Child process has jobs to execute, start the child process	int	InputAndOutput	--	other	1	0	child_complete}

set trick_templates(EXEC_WORK.child_complete) \
{Yes = Child frame processing is complete	Flag	InputAndOutput	--	enumerated	1	0	environment_first}

set trick_templates(EXEC_WORK.environment_first) \
{Deprecated	Flag	InputOnly	--	enumerated	0	num_child}

set trick_templates(EXEC_WORK.num_child) \
{Number of child processes configured	int	InputAndOutput	--	other	0	current_phase}

set trick_templates(EXEC_WORK.current_phase) \
{Current Phase being executed by the exec	short	InputAndOutput	--	other	0	max_phase}

set trick_templates(EXEC_WORK.max_phase) \
{Current Phase being executed by the exec	short	InputAndOutput	--	other	0	process_type}

set trick_templates(EXEC_WORK.process_type) \
{Process type parent, async, amf, sched	PROCESS_TYPE	InputAndOutput	--	enumerated	1	0	dr_cpu_number}

set trick_templates(EXEC_WORK.dr_cpu_number) \
{CPU # for data writer	int	InputAndOutput	--	other	0	var_server_tag}

set trick_templates(EXEC_WORK.var_server_tag) \
{string tag for var server port	char	InputAndOutput	--	other	1	32	var_serve_listen_dev}

set trick_templates(EXEC_WORK.var_serve_listen_dev) \
{variable server listen device	TCDevice	InputAndOutput	--	data_structure_address	0	disabled	var_serve_nh_listen_dev}

set trick_templates(EXEC_WORK.var_serve_nh_listen_dev) \
{no handshake variable server listen device	TCDevice	InputAndOutput	--	data_structure_address	0	disabled	main_multicast_address}

set trick_templates(EXEC_WORK.main_multicast_address) \
{main thread multicast address	char*	InputAndOutput	--	other	0	main_multicast_port}

set trick_templates(EXEC_WORK.main_multicast_port) \
{main thread multicast port	int	InputAndOutput	--	other	0	max_var_servers}

set trick_templates(EXEC_WORK.max_var_servers) \
{Maximum number of variable server	int	InputAndOutput	--	other	0	var_serve_broadcast}

set trick_templates(EXEC_WORK.var_serve_broadcast) \
{Turn on/off broadcasting of variable server port	Flag	InputAndOutput	--	enumerated	0	slave_sync_at_init}

set trick_templates(EXEC_WORK.slave_sync_at_init) \
{Flag passed to slave from synchronization master to inform slave if master is already at run. If so, slave will bypass initialization sync	Flag	InputAndOutput	--	enumerated	0	sync_port}

set trick_templates(EXEC_WORK.sync_port) \
{Port on which Master establishes synchronization communication with slaves	int	InputAndOutput	--	other	0	next_sync_check}

set trick_templates(EXEC_WORK.next_sync_check) \
{Next sim time for M/S sync status check	double	InputAndOutput	s	other	0	sync}

set trick_templates(EXEC_WORK.sync) \
{Multiprocess synchronization comm data	TCDevice	InputAndOutput	--	data_structure_address	1	16	disabled	slave_activated}

set trick_templates(EXEC_WORK.slave_activated) \
{Yes = Slave has been started	Flag	InputAndOutput	--	enumerated	1	16	checkpoint_type}

set trick_templates(EXEC_WORK.checkpoint_type) \
{Type of chkpnt are we dumping (e.g. pre-init, post-init, run-time, end)	CHECKPOINT_TYPE	InputAndOutput	--	enumerated	0	checkpoint_file_name}

set trick_templates(EXEC_WORK.checkpoint_file_name) \
{file name for checkpoint	char	InputAndOutput	--	other	1	256	save_send_hs_buffer}

set trick_templates(EXEC_WORK.save_send_hs_buffer) \
{Yes means write saved send_hs msgs to a file	Flag	InputAndOutput	--	enumerated	0	save_var_server_msgs}

set trick_templates(EXEC_WORK.save_var_server_msgs) \
{Yes means also log incoming var server cmds to send_hs file	Flag	InputAndOutput	--	enumerated	0	send_hs_buffering}

set trick_templates(EXEC_WORK.send_hs_buffering) \
{Buffering option	DR_Buffering	InputAndOutput	--	enumerated	0	send_hs_buffer_size}

set trick_templates(EXEC_WORK.send_hs_buffer_size) \
{user supplied size of buffer area	long	InputAndOutput	--	other	0	NULL}

set trick_templates(GMTTIME.day) \
{Day of the year, 0 .. 364	int	InputAndOutput	--	other	0	hour}

set trick_templates(GMTTIME.hour) \
{Hour of the day, 0 .. 23	int	InputAndOutput	--	other	0	min}

set trick_templates(GMTTIME.min) \
{Minute of the hour, 0 .. 59	int	InputAndOutput	--	other	0	sec}

set trick_templates(GMTTIME.sec) \
{Seconds of the hour 0.0 .. 59.99999999	double	InputAndOutput	--	other	0	NULL}

set trick_templates(GMT_STRUCT.secs) \
{Seconds after the minute - usecs res.	double	InputAndOutput	--	other	0	min}

set trick_templates(GMT_STRUCT.min) \
{Minutes after the hour - [0, 59]	int	InputAndOutput	--	other	0	hour}

set trick_templates(GMT_STRUCT.hour) \
{Hour since midnight - [0, 23]	int	InputAndOutput	--	other	0	day}

set trick_templates(GMT_STRUCT.day) \
{Days since January 1 - [0, 365]	int	InputAndOutput	--	other	0	y_secs}

set trick_templates(GMT_STRUCT.y_secs) \
{Total seconds in the year	double	InputAndOutput	--	other	0	NULL}

set trick_templates(INPUT_PROCESSOR.echo_input) \
{Echo Initialization Data flag	Flag	InputAndOutput	--	enumerated	0	debug}

set trick_templates(INPUT_PROCESSOR.debug) \
{Debug lex/yacc flag	int	InputAndOutput	--	other	0	print_deprecated}

set trick_templates(INPUT_PROCESSOR.print_deprecated) \
{print messages if variable is deprecated	Flag	InputAndOutput	--	enumerated	0	s_default_inc}

set trick_templates(INPUT_PROCESSOR.s_default_inc) \
{S_default_data.d found?	Flag	InputAndOutput	--	enumerated	0	param_read}

set trick_templates(INPUT_PROCESSOR.param_read) \
{True if param read and now on rhs of equation	Flag	InputAndOutput	--	enumerated	0	malf_head}

set trick_templates(INPUT_PROCESSOR.malf_head) \
{Head of malfunction list	TRICK_MALF	InputAndOutput	--	data_structure_address	2	0	0	name	malf_tail}

set trick_templates(INPUT_PROCESSOR.malf_tail) \
{Tail of malfunction list	TRICK_MALF	InputAndOutput	--	data_structure_address	2	0	0	name	last_malf_mod}

set trick_templates(INPUT_PROCESSOR.last_malf_mod) \
{Sim time of last malfunction modification	double	InputAndOutput	s	other	1	0	NULL}

set trick_templates(ImpExpConn.enabled) \
{Flag to enable connections.	ImpExpEnable	InputAndOutput	--	enumerated	1	0	NULL}

set trick_templates(JOBDATA.in) \
{User Inputs	JOBDATA_IN	InputAndOutput	--	data_structure_address	0	job_class	work}

set trick_templates(JOBDATA.work) \
{Job scheduler workspace	JOBDATA_WORK	InputAndOutput	--	data_structure_address	0	next	NULL}

set trick_templates(JOBDATA_IN.job_class) \
{Job module classification	int	InputAndOutput	--	other	0	phase}

set trick_templates(JOBDATA_IN.phase) \
{job phase	short	InputAndOutput	--	other	0	cycle}

set trick_templates(JOBDATA_IN.cycle) \
{Job scheduled cycle time	double	InputAndOutput	s	other	0	job_depend}

set trick_templates(JOBDATA_IN.job_depend) \
{Job dependency id numbers	int	InputAndOutput	--	other	1	0	name}

set trick_templates(JOBDATA_IN.name) \
{Job source code name	char*	InputAndOutput	--	other	0	old_style_name}

set trick_templates(JOBDATA_IN.old_style_name) \
{Old Job source code name	char*	InputAndOutput	--	other	0	tag}

set trick_templates(JOBDATA_IN.tag) \
{Tag to uniq. identify and group jobs	char*	InputAndOutput	--	other	0	num_job_depend}

set trick_templates(JOBDATA_IN.num_job_depend) \
{Num of job dependencies	int	InputAndOutput	--	other	0	start}

set trick_templates(JOBDATA_IN.start) \
{Job scheduled start time	double	InputAndOutput	s	other	0	stop}

set trick_templates(JOBDATA_IN.stop) \
{Job scheduled stop time	double	InputAndOutput	s	other	0	process_id}

set trick_templates(JOBDATA_IN.process_id) \
{Process specifier for distribution	Realtime_Process_ID	InputAndOutput	--	enumerated	0	job_count}

set trick_templates(JOBDATA_IN.job_count) \
{Job count (id)	int	InputAndOutput	--	other	0	job_select}

set trick_templates(JOBDATA_IN.job_select) \
{Job select is index into all_jobs array	int	InputAndOutput	--	other	0	enabled}

set trick_templates(JOBDATA_IN.enabled) \
{No = do not call job	Flag	InputAndOutput	--	enumerated	0	NULL}

set trick_templates(JOBDATA_WORK.next) \
{Next job call time for scheduler	double	InputAndOutput	s	other	0	amf_next}

set trick_templates(JOBDATA_WORK.amf_next) \
{Only used for asynchronous_mustfinish jobs. Time to check for the completion of the job.	double	InputAndOutput	s	other	0	before_malf_triggers}

set trick_templates(JOBDATA_WORK.before_malf_triggers) \
{list of malfunction triggers to check before job	TRICK_MALF_TRIGGER	InputAndOutput	--	data_structure_address	1	0	enabled	after_malf_triggers}

set trick_templates(JOBDATA_WORK.after_malf_triggers) \
{list of malfunction triggers to check before job	TRICK_MALF_TRIGGER	InputAndOutput	--	data_structure_address	1	0	enabled	before_malf_vars}

set trick_templates(JOBDATA_WORK.before_malf_vars) \
{list of variables to set before job	TRICK_MALF_VAR	InputAndOutput	--	data_structure_address	1	0	param_name	after_malf_vars}

set trick_templates(JOBDATA_WORK.after_malf_vars) \
{list of variables to set after job	TRICK_MALF_VAR	InputAndOutput	--	data_structure_address	1	0	param_name	before_malf_jobs}

set trick_templates(JOBDATA_WORK.before_malf_jobs) \
{list of jobs to manipulate before job	TRICK_MALF_JOB	InputAndOutput	--	data_structure_address	1	0	job_name	after_malf_jobs}

set trick_templates(JOBDATA_WORK.after_malf_jobs) \
{list of jobs to manipulate after job	TRICK_MALF_JOB	InputAndOutput	--	data_structure_address	1	0	job_name	NULL}

set trick_templates(MONTE_CARLO.in) \
{Not Specified	MONTE_INPUT	InputAndOutput	--	data_structure_address	0	activate	work}

set trick_templates(MONTE_CARLO.work) \
{Not Specified	MONTE_WORK	InputAndOutput	--	data_structure_address	0	run_dir	NULL}

set trick_templates(MONTE_CARLO_RUN.run_num) \
{Run num from input file	int	InputAndOutput	--	other	0	vars}

set trick_templates(MONTE_CARLO_RUN.vars) \
{Run data will be held in strings	char*	InputAndOutput	--	other	1	0	current_dispatch}

set trick_templates(MONTE_CARLO_RUN.current_dispatch) \
{Slave index this run is dispached to	int	InputAndOutput	--	other	0	number_tries}

set trick_templates(MONTE_CARLO_RUN.number_tries) \
{Number of times this run has been dispatched	int	InputAndOutput	--	other	0	exit_status}

set trick_templates(MONTE_CARLO_RUN.exit_status) \
{exit status of run	TRICK_MONTE_EXIT_STATUS	InputAndOutput	--	enumerated	0	start_time}

set trick_templates(MONTE_CARLO_RUN.start_time) \
{start time of monte carlo runs	double	InputAndOutput	--	other	0	end_time}

set trick_templates(MONTE_CARLO_RUN.end_time) \
{end time of monte carlo runs	double	InputAndOutput	--	other	0	NULL}

set trick_templates(MONTE_INPUT.activate) \
{Yes = This is a monte carlo run	Flag	InputAndOutput	--	enumerated	0	dryrun}

set trick_templates(MONTE_INPUT.dryrun) \
{Yes = This is a monte carlo dry-run	Flag	InputAndOutput	--	enumerated	0	use_input_data}

set trick_templates(MONTE_INPUT.use_input_data) \
{Use the data in the monte input file	Flag	InputAndOutput	--	enumerated	0	preparse}

set trick_templates(MONTE_INPUT.preparse) \
{Yes = Preparsing state for the M_* files	Flag	InputAndOutput	--	enumerated	0	localhost_as_remote}

set trick_templates(MONTE_INPUT.localhost_as_remote) \
{Yes = Treat the localhost as remote	Flag	InputAndOutput	--	enumerated	0	sequential_runs}

set trick_templates(MONTE_INPUT.sequential_runs) \
{Yes = Monte will wait for current run to complete before starting next run	Flag	InputAndOutput	--	enumerated	0	timeout}

set trick_templates(MONTE_INPUT.timeout) \
{maximum time to wait for unit to finish	double	InputAndOutput	s	other	0	input_files}

set trick_templates(MONTE_INPUT.input_files) \
{Monte carlo input files	char*	InputAndOutput	--	other	1	0	current_file}

set trick_templates(MONTE_INPUT.current_file) \
{Current input file	char*	InputAndOutput	--	other	0	num_runs}

set trick_templates(MONTE_INPUT.num_runs) \
{If there isn't a monte carlo input file, number of runs must be specified	int	InputAndOutput	--	other	0	slaves}

set trick_templates(MONTE_INPUT.slaves) \
{monte carlo slaves	MONTE_SLAVE	InputAndOutput	--	data_structure_address	1	0	disable	max_tries}

set trick_templates(MONTE_INPUT.max_tries) \
{optional job retry limit. defaults to zero.	int	InputAndOutput	--	other	0	user_cmd_string}

set trick_templates(MONTE_INPUT.user_cmd_string) \
{added to ssh to provide user env, etc	char*	InputAndOutput	--	other	0	NULL}

set trick_templates(MONTE_RANGE.start_run) \
{starting run	int	InputAndOutput	--	other	0	end_run}

set trick_templates(MONTE_RANGE.end_run) \
{ending run	int	InputAndOutput	--	other	0	NULL}

set trick_templates(MONTE_SLAVE.disable) \
{Set to true to disable	int	InputAndOutput	--	other	0	remote_shell}

set trick_templates(MONTE_SLAVE.remote_shell) \
{Shell cmd to start slave	TRICK_REMOTE_SHELL	InputAndOutput	--	enumerated	0	user_remote_shell}

set trick_templates(MONTE_SLAVE.user_remote_shell) \
{User defined shell cmd to start slave when remote_shell = TRICK_USER_REMOTE_SH	char*	InputAndOutput	--	other	0	remote_shell_args}

set trick_templates(MONTE_SLAVE.remote_shell_args) \
{optional arguments to use with remote shell command	char*	InputAndOutput	--	other	0	multiplier}

set trick_templates(MONTE_SLAVE.multiplier) \
{Multiplier of speed of machine	double	InputAndOutput	--	other	0	machine_name}

set trick_templates(MONTE_SLAVE.machine_name) \
{Remote connection hostname	char*	InputAndOutput	--	other	0	sim_path}

set trick_templates(MONTE_SLAVE.sim_path) \
{Remote program directory pathname	char*	InputAndOutput	--	other	0	S_main_name}

set trick_templates(MONTE_SLAVE.S_main_name) \
{Remote program name	char*	InputAndOutput	--	other	0	current_run}

set trick_templates(MONTE_SLAVE.current_run) \
{Current run dispatched to the slave	int	InputAndOutput	--	other	0	num_dispatches}

set trick_templates(MONTE_SLAVE.num_dispatches) \
{Num runs dispatched to slave	int	InputAndOutput	--	other	0	num_results}

set trick_templates(MONTE_SLAVE.num_results) \
{Num runs accomplished by slave	int	InputAndOutput	--	other	0	cpu_time}

set trick_templates(MONTE_SLAVE.cpu_time) \
{Total cpu time used	double	InputAndOutput	--	other	0	NULL}

set trick_templates(MONTE_VAR.name) \
{Variable name for input into S_main	char*	InputAndOutput	--	other	0	unit}

set trick_templates(MONTE_VAR.unit) \
{Corresponding unit for variable name	char*	InputAndOutput	--	other	0	var_type}

set trick_templates(MONTE_VAR.var_type) \
{Type of variable , file, random, calculated	TRICK_MONTE_VAR_TYPE	InputAndOutput	--	enumerated	0	fixed_value}

set trick_templates(MONTE_VAR.fixed_value) \
{String coresponding to fixed value in monte input file	char*	InputAndOutput	--	other	0	randist}

set trick_templates(MONTE_VAR.randist) \
{Random distribution structure	TRICK_GSL_RANDIST	InputAndOutput	--	data_structure_address	1	0	type	NULL}

set trick_templates(MONTE_WORK.run_dir) \
{Not Specified	char	InputAndOutput	--	other	1	256	fp}

set trick_templates(MONTE_WORK.fp) \
{Not Specified	FILE*	InputAndOutput	--	other	0	num_vars}

set trick_templates(MONTE_WORK.num_vars) \
{Total number variables in all M_* files	int	InputAndOutput	--	other	0	num_file_data_vars}

set trick_templates(MONTE_WORK.num_file_data_vars) \
{Number of FILE_DATA variables in current M_* file	int	InputAndOutput	--	other	0	num_vals}

set trick_templates(MONTE_WORK.num_vals) \
{Number of provided data points for each run	int	InputAndOutput	--	other	0	starting_index}

set trick_templates(MONTE_WORK.starting_index) \
{Starting index for setting run variables	int	InputAndOutput	--	other	0	current_index}

set trick_templates(MONTE_WORK.current_index) \
{Current index for setting run variables	int	InputAndOutput	--	other	0	vars_in}

set trick_templates(MONTE_WORK.vars_in) \
{List of inputs into S_main	MONTE_VAR	InputAndOutput	--	data_structure_address	1	0	name	num_vars_in}

set trick_templates(MONTE_WORK.num_vars_in) \
{Number of provided runs	int	InputAndOutput	--	other	0	curr_run}

set trick_templates(MONTE_WORK.curr_run) \
{Current run 0..num_runs	int	InputAndOutput	--	other	0	num_runs}

set trick_templates(MONTE_WORK.num_runs) \
{Max. number of runs currently queued	int	InputAndOutput	--	other	0	actual_num_runs}

set trick_templates(MONTE_WORK.actual_num_runs) \
{Actual number of runs executed after ranges applied	int	InputAndOutput	--	other	0	num_ranges}

set trick_templates(MONTE_WORK.num_ranges) \
{number of ranges in list	int	InputAndOutput	--	other	0	run_ranges}

set trick_templates(MONTE_WORK.run_ranges) \
{Range of runs to actually execute	MONTE_RANGE	InputAndOutput	--	data_structure_address	1	0	start_run	num_results}

set trick_templates(MONTE_WORK.num_results) \
{Number of results received	int	InputAndOutput	--	other	0	actual_num_results}

set trick_templates(MONTE_WORK.actual_num_results) \
{Actual number of results received after ranges applied	int	InputAndOutput	--	other	0	result_run}

set trick_templates(MONTE_WORK.result_run) \
{Current run number of result from slave	int	InputAndOutput	--	other	0	runs}

set trick_templates(MONTE_WORK.runs) \
{Run data	MONTE_CARLO_RUN	InputAndOutput	--	data_structure_address	1	0	run_num	sync_listen_dev}

set trick_templates(MONTE_WORK.sync_listen_dev) \
{Monte carlo listen device	TCDevice	InputAndOutput	--	data_structure_address	0	disabled	data_listen_dev}

set trick_templates(MONTE_WORK.data_listen_dev) \
{Monte carlo listen device	TCDevice	InputAndOutput	--	data_structure_address	0	disabled	sync_conn}

set trick_templates(MONTE_WORK.sync_conn) \
{Monte carlo connection device	TCDevice	InputAndOutput	--	data_structure_address	0	disabled	data_conn}

set trick_templates(MONTE_WORK.data_conn) \
{Monte carlo connection device	TCDevice	InputAndOutput	--	data_structure_address	0	disabled	num_slaves}

set trick_templates(MONTE_WORK.num_slaves) \
{Num of slaves calculated from input file allocation	int	InputAndOutput	--	other	0	num_active_slaves}

set trick_templates(MONTE_WORK.num_active_slaves) \
{Num of slaves that are working	int	InputAndOutput	--	other	0	lineno}

set trick_templates(MONTE_WORK.lineno) \
{Line number in M_* input file	int	InputAndOutput	--	other	0	start_time}

set trick_templates(MONTE_WORK.start_time) \
{Start time of monte carlo runs	double	InputAndOutput	--	other	0	end_time}

set trick_templates(MONTE_WORK.end_time) \
{End time of monte carlo runs	double	InputAndOutput	--	other	0	NULL}

set trick_templates(SIM_COM.monitor_on) \
{flag used to turn on X panel monitor which is an Asynchronous separate X process	Flag	InputAndOutput	--	enumerated	0	monitor_off}

set trick_templates(SIM_COM.monitor_off) \
{flag used to turn off X panel monitor when the simulation ends	Flag	InputAndOutput	--	enumerated	0	quiet}

set trick_templates(SIM_COM.quiet) \
{used to limit messages to hs panel	Flag	InputAndOutput	--	enumerated	0	panel_size}

set trick_templates(SIM_COM.panel_size) \
{flag used to initialize the sim_control size	PANEL_SIZE	InputAndOutput	--	enumerated	0	panel_x_pos}

set trick_templates(SIM_COM.panel_x_pos) \
{X screen placement for sim control panel	int	InputAndOutput	--	other	0	panel_y_pos}

set trick_templates(SIM_COM.panel_y_pos) \
{Y screen placement for sim control panel	int	InputAndOutput	--	other	0	timeout}

set trick_templates(SIM_COM.timeout) \
{timeout for connecting the control panel	double	InputAndOutput	s	other	0	bind_complete}

set trick_templates(SIM_COM.bind_complete) \
{flag used to indicate HS port is ready	Flag	InputAndOutput	--	enumerated	0	redirect_hs}

set trick_templates(SIM_COM.redirect_hs) \
{flag used redirection of hs to Master sync	Flag	InputAndOutput	--	enumerated	0	data_rec_status}

set trick_templates(SIM_COM.data_rec_status) \
{flag used to indicate current data record on/off status	Flag	InputAndOutput	--	enumerated	0	redirect_host}

set trick_templates(SIM_COM.redirect_host) \
{host name for hs redirect	char	InputAndOutput	--	other	1	80	command}

set trick_templates(SIM_COM.command) \
{Simulation control mode	SIM_COMMAND	InputAndOutput	--	enumerated	0	user_freeze_time}

set trick_templates(SIM_COM.user_freeze_time) \
{Freeze simulation at this time	double	InputAndOutput	s	other	0	filename}

set trick_templates(SIM_COM.filename) \
{Filename for checkpoints	char	InputAndOutput	--	other	1	256	send_hs_device}

set trick_templates(SIM_COM.send_hs_device) \
{device for send_hs messages	TCDevice	InputAndOutput	--	data_structure_address	0	disabled	NULL}

set trick_templates(SLAVE.machine_name) \
{Remote connection hostname	char*	InputAndOutput	--	other	0	machine_display}

set trick_templates(SLAVE.machine_display) \
{X Display name	char*	InputAndOutput	--	other	0	export_sim_name}

set trick_templates(SLAVE.export_sim_name) \
{Name Target for input exporting	char*	InputAndOutput	--	other	0	sim_path}

set trick_templates(SLAVE.sim_path) \
{Remote program dir pathname	char*	InputAndOutput	--	other	0	S_main_name}

set trick_templates(SLAVE.S_main_name) \
{Remote program name	char*	InputAndOutput	--	other	0	S_main_args}

set trick_templates(SLAVE.S_main_args) \
{Remote program cmd line args	char*	InputAndOutput	--	other	1	25	mode}

set trick_templates(SLAVE.mode) \
{Mode of slave	int	InputAndOutput	--	other	0	overruns}

set trick_templates(SLAVE.overruns) \
{Overrun timeouts per slave	int	InputAndOutput	--	other	0	NULL}

set trick_templates(TCDevice.disabled) \
{Connection enabled flag	TCCommFlag	InputAndOutput	--	enumerated	0	disable_handshaking}

set trick_templates(TCDevice.disable_handshaking) \
{Set this to skip handshaking in tc_connect and tc_accept.	TCCommFlag	InputAndOutput	--	enumerated	0	blockio_limit}

set trick_templates(TCDevice.blockio_limit) \
{Block I/O timeout limit	double	InputAndOutput	s	other	0	blockio_type}

set trick_templates(TCDevice.blockio_type) \
{E.g. spinloops	TCCommBlocking	InputAndOutput	--	enumerated	0	client_id}

set trick_templates(TCDevice.client_id) \
{client id, other side. Set by tc_accept.	int	InputAndOutput	--	other	0	client_tag}

set trick_templates(TCDevice.client_tag) \
{client tag, other side. User specified. Defaults if unspecified.	char	InputAndOutput	--	other	1	80	error_handler}

set trick_templates(TCDevice.error_handler) \
{error handler. User specified. Defaults if unspecified.	TrickErrorHndlr	InputAndOutput	--	data_structure_address	1	0	report_level	hostname}

set trick_templates(TCDevice.hostname) \
{Hostname of server/client. User specified.	char*	InputAndOutput	--	other	0	port}

set trick_templates(TCDevice.port) \
{TCP/IP Port number. User specified.	int	InputAndOutput	--	other	0	mcast_group}

set trick_templates(TCDevice.mcast_group) \
{Multicast group address. User specified.	char*	InputAndOutput	--	other	0	udp_kind}

set trick_templates(TCDevice.udp_kind) \
{Kind of UDP to do	udp_kind_type	InputAndOutput	--	enumerated	0	net_addr}

set trick_templates(TCDevice.net_addr) \
{Of the form 192.52.206.255; for UDP broadcast	char*	InputAndOutput	--	other	0	NULL}

set trick_templates(TRICK_GSL_RANDIST.type) \
{Type of distribution desired	TRICK_GSL_TYPE	InputAndOutput	--	enumerated	0	seed}

set trick_templates(TRICK_GSL_RANDIST.seed) \
{Seed	long	InputAndOutput	--	other	0	sigma}

set trick_templates(TRICK_GSL_RANDIST.sigma) \
{Std. dev for gauss distrib	double	InputAndOutput	--	other	0	mu}

set trick_templates(TRICK_GSL_RANDIST.mu) \
{mean for gauss/poisson distribution	double	InputAndOutput	--	other	0	min}

set trick_templates(TRICK_GSL_RANDIST.min) \
{Minimum value in range	double	InputAndOutput	--	other	0	max}

set trick_templates(TRICK_GSL_RANDIST.max) \
{Maximum value in range	double	InputAndOutput	--	other	0	rel_min}

set trick_templates(TRICK_GSL_RANDIST.rel_min) \
{Minimun is a relative minimum	int	InputAndOutput	--	other	0	rel_max}

set trick_templates(TRICK_GSL_RANDIST.rel_max) \
{Maximum is a relative maximum	int	InputAndOutput	--	other	0	NULL}

set trick_templates(TRICK_MALF.name) \
{malfunction name from the input file	char*	InputAndOutput	--	other	0	trigger_head}

set trick_templates(TRICK_MALF.trigger_head) \
{head of triggers	TRICK_MALF_TRIGGER	InputAndOutput	--	data_structure_address	1	0	enabled	var_head}

set trick_templates(TRICK_MALF.var_head) \
{head of variables to malfunction	TRICK_MALF_VAR	InputAndOutput	--	data_structure_address	1	0	param_name	job_head}

set trick_templates(TRICK_MALF.job_head) \
{head of jobs to manipulate when malfunctioning	TRICK_MALF_JOB	InputAndOutput	--	data_structure_address	1	0	job_name	next}

set trick_templates(TRICK_MALF.next) \
{next malfunction	TRICK_MALF_struct	InputAndOutput	--	data_structure_address	1	0	name	NULL}

set trick_templates(TRICK_MALF_JOB.job_name) \
{job to manipulate	char*	InputAndOutput	--	other	0	job_count}

set trick_templates(TRICK_MALF_JOB.job_count) \
{job id	int	InputAndOutput	--	other	0	activated}

set trick_templates(TRICK_MALF_JOB.activated) \
{malfuction activated	Flag	InputAndOutput	--	enumerated	0	activation_time}

set trick_templates(TRICK_MALF_JOB.activation_time) \
{time when malfunction activated	double	InputAndOutput	s	other	0	insertion}

set trick_templates(TRICK_MALF_JOB.insertion) \
{0 = before job , 1 = after job	int	InputAndOutput	--	other	0	job_index}

set trick_templates(TRICK_MALF_JOB.job_index) \
{all_jobs index of insertion job	int	InputAndOutput	--	other	0	insert_job_name}

set trick_templates(TRICK_MALF_JOB.insert_job_name) \
{job where malf inserted	char*	InputAndOutput	--	other	0	delay}

set trick_templates(TRICK_MALF_JOB.delay) \
{seconds to delay before activation	double	InputAndOutput	s	other	0	action}

set trick_templates(TRICK_MALF_JOB.action) \
{action to do when activated	TRICK_MALF_JOB_ACTION	InputAndOutput	--	enumerated	0	input_action}

set trick_templates(TRICK_MALF_JOB.input_action) \
{event-style action code block	char*	InputAndOutput	--	other	0	next}

set trick_templates(TRICK_MALF_JOB.next) \
{next malf job in malfunction	TRICK_MALF_JOB_struct	InputAndOutput	--	data_structure_address	1	0	job_name	jnext}

set trick_templates(TRICK_MALF_JOB.jnext) \
{next malf job in job list	TRICK_MALF_JOB_struct	InputAndOutput	--	data_structure_address	1	0	job_name	NULL}

set trick_templates(TRICK_MALF_JOB_struct.job_name) \
{job to manipulate	char*	InputAndOutput	--	other	0	job_count}

set trick_templates(TRICK_MALF_JOB_struct.job_count) \
{job id	int	InputAndOutput	--	other	0	activated}

set trick_templates(TRICK_MALF_JOB_struct.activated) \
{malfuction activated	Flag	InputAndOutput	--	enumerated	0	activation_time}

set trick_templates(TRICK_MALF_JOB_struct.activation_time) \
{time when malfunction activated	double	InputAndOutput	s	other	0	insertion}

set trick_templates(TRICK_MALF_JOB_struct.insertion) \
{0 = before job , 1 = after job	int	InputAndOutput	--	other	0	job_index}

set trick_templates(TRICK_MALF_JOB_struct.job_index) \
{all_jobs index of insertion job	int	InputAndOutput	--	other	0	insert_job_name}

set trick_templates(TRICK_MALF_JOB_struct.insert_job_name) \
{job where malf inserted	char*	InputAndOutput	--	other	0	delay}

set trick_templates(TRICK_MALF_JOB_struct.delay) \
{seconds to delay before activation	double	InputAndOutput	s	other	0	action}

set trick_templates(TRICK_MALF_JOB_struct.action) \
{action to do when activated	TRICK_MALF_JOB_ACTION	InputAndOutput	--	enumerated	0	input_action}

set trick_templates(TRICK_MALF_JOB_struct.input_action) \
{event-style action code block	char*	InputAndOutput	--	other	0	next}

set trick_templates(TRICK_MALF_JOB_struct.next) \
{next malf job in malfunction	TRICK_MALF_JOB_struct	InputAndOutput	--	data_structure_address	1	0	job_name	jnext}

set trick_templates(TRICK_MALF_JOB_struct.jnext) \
{next malf job in job list	TRICK_MALF_JOB_struct	InputAndOutput	--	data_structure_address	1	0	job_name	NULL}

set trick_templates(TRICK_MALF_TRIGGER.enabled) \
{trigger enabled (copied fromo TRICK_MALF)	Flag	InputAndOutput	--	enumerated	0	fired}

set trick_templates(TRICK_MALF_TRIGGER.fired) \
{Turned on when trigger fired	Flag	InputAndOutput	--	enumerated	0	fired_from_input}

set trick_templates(TRICK_MALF_TRIGGER.fired_from_input) \
{Override from input file	Flag	InputAndOutput	--	enumerated	0	hold}

set trick_templates(TRICK_MALF_TRIGGER.hold) \
{0 = trigger rechecked each frame and malfs may change on/off 1 = malf will stay on after trigger	Flag	InputAndOutput	--	enumerated	0	fired_trip_time}

set trick_templates(TRICK_MALF_TRIGGER.fired_trip_time) \
{time when trigger tripped (fired or cleared)	double	InputAndOutput	s	other	0	fired_time}

set trick_templates(TRICK_MALF_TRIGGER.fired_time) \
{time when trigger fired	double	InputAndOutput	s	other	0	fired_count}

set trick_templates(TRICK_MALF_TRIGGER.fired_count) \
{how many times trigger has fired	int	InputAndOutput	--	other	0	malf_name}

set trick_templates(TRICK_MALF_TRIGGER.malf_name) \
{name of malf that this trigger belongs to	char*	InputAndOutput	--	other	0	condition}

set trick_templates(TRICK_MALF_TRIGGER.condition) \
{condition statement	char*	InputAndOutput	--	other	0	job_name}

set trick_templates(TRICK_MALF_TRIGGER.job_name) \
{trigger job name to call	char*	InputAndOutput	--	other	0	job_count}

set trick_templates(TRICK_MALF_TRIGGER.job_count) \
{job id of trigger	int	InputAndOutput	--	other	0	insertion}

set trick_templates(TRICK_MALF_TRIGGER.insertion) \
{0 = before job , 1 = after job	int	InputAndOutput	--	other	0	job_index}

set trick_templates(TRICK_MALF_TRIGGER.job_index) \
{all_jobs index of insertion job	int	InputAndOutput	--	other	0	insert_job_name}

set trick_templates(TRICK_MALF_TRIGGER.insert_job_name) \
{job where malf inserted	char*	InputAndOutput	--	other	0	var_list}

set trick_templates(TRICK_MALF_TRIGGER.var_list) \
{list of variables to fire with trigger	TRICK_MALF_VAR	InputAndOutput	--	data_structure_address	1	0	param_name	job_list}

set trick_templates(TRICK_MALF_TRIGGER.job_list) \
{list of jobs to manipulate with trigger	TRICK_MALF_JOB	InputAndOutput	--	data_structure_address	1	0	job_name	next}

set trick_templates(TRICK_MALF_TRIGGER.next) \
{next malf trigger in malfunction	TRICK_MALF_TRIGGER_struct	InputAndOutput	--	data_structure_address	1	0	enabled	jnext}

set trick_templates(TRICK_MALF_TRIGGER.jnext) \
{next malf trigger in job list	TRICK_MALF_TRIGGER_struct	InputAndOutput	--	data_structure_address	1	0	enabled	NULL}

set trick_templates(TRICK_MALF_TRIGGER_struct.enabled) \
{trigger enabled (copied fromo TRICK_MALF)	Flag	InputAndOutput	--	enumerated	0	fired}

set trick_templates(TRICK_MALF_TRIGGER_struct.fired) \
{Turned on when trigger fired	Flag	InputAndOutput	--	enumerated	0	fired_from_input}

set trick_templates(TRICK_MALF_TRIGGER_struct.fired_from_input) \
{Override from input file	Flag	InputAndOutput	--	enumerated	0	hold}

set trick_templates(TRICK_MALF_TRIGGER_struct.hold) \
{0 = trigger rechecked each frame and malfs may change on/off 1 = malf will stay on after trigger	Flag	InputAndOutput	--	enumerated	0	fired_trip_time}

set trick_templates(TRICK_MALF_TRIGGER_struct.fired_trip_time) \
{time when trigger tripped (fired or cleared)	double	InputAndOutput	s	other	0	fired_time}

set trick_templates(TRICK_MALF_TRIGGER_struct.fired_time) \
{time when trigger fired	double	InputAndOutput	s	other	0	fired_count}

set trick_templates(TRICK_MALF_TRIGGER_struct.fired_count) \
{how many times trigger has fired	int	InputAndOutput	--	other	0	malf_name}

set trick_templates(TRICK_MALF_TRIGGER_struct.malf_name) \
{name of malf that this trigger belongs to	char*	InputAndOutput	--	other	0	condition}

set trick_templates(TRICK_MALF_TRIGGER_struct.condition) \
{condition statement	char*	InputAndOutput	--	other	0	job_name}

set trick_templates(TRICK_MALF_TRIGGER_struct.job_name) \
{trigger job name to call	char*	InputAndOutput	--	other	0	job_count}

set trick_templates(TRICK_MALF_TRIGGER_struct.job_count) \
{job id of trigger	int	InputAndOutput	--	other	0	insertion}

set trick_templates(TRICK_MALF_TRIGGER_struct.insertion) \
{0 = before job , 1 = after job	int	InputAndOutput	--	other	0	job_index}

set trick_templates(TRICK_MALF_TRIGGER_struct.job_index) \
{all_jobs index of insertion job	int	InputAndOutput	--	other	0	insert_job_name}

set trick_templates(TRICK_MALF_TRIGGER_struct.insert_job_name) \
{job where malf inserted	char*	InputAndOutput	--	other	0	var_list}

set trick_templates(TRICK_MALF_TRIGGER_struct.var_list) \
{list of variables to fire with trigger	TRICK_MALF_VAR	InputAndOutput	--	data_structure_address	1	0	param_name	job_list}

set trick_templates(TRICK_MALF_TRIGGER_struct.job_list) \
{list of jobs to manipulate with trigger	TRICK_MALF_JOB	InputAndOutput	--	data_structure_address	1	0	job_name	next}

set trick_templates(TRICK_MALF_TRIGGER_struct.next) \
{next malf trigger in malfunction	TRICK_MALF_TRIGGER_struct	InputAndOutput	--	data_structure_address	1	0	enabled	jnext}

set trick_templates(TRICK_MALF_TRIGGER_struct.jnext) \
{next malf trigger in job list	TRICK_MALF_TRIGGER_struct	InputAndOutput	--	data_structure_address	1	0	enabled	NULL}

set trick_templates(TRICK_MALF_VAR.param_name) \
{parameter name	char*	InputAndOutput	--	other	0	activated}

set trick_templates(TRICK_MALF_VAR.activated) \
{malfuction activated	Flag	InputAndOutput	--	enumerated	0	activation_time}

set trick_templates(TRICK_MALF_VAR.activation_time) \
{time when malfunction activated	double	InputAndOutput	s	other	0	insertion}

set trick_templates(TRICK_MALF_VAR.insertion) \
{0 = before job , 1 = after job	int	InputAndOutput	--	other	0	job_index}

set trick_templates(TRICK_MALF_VAR.job_index) \
{all_jobs index of insertion job	int	InputAndOutput	--	other	0	insert_job_name}

set trick_templates(TRICK_MALF_VAR.insert_job_name) \
{job where malf inserted	char*	InputAndOutput	--	other	0	delay}

set trick_templates(TRICK_MALF_VAR.delay) \
{seconds to delay before activation	double	InputAndOutput	s	other	0	scale_factor}

set trick_templates(TRICK_MALF_VAR.scale_factor) \
{scale factor multiplied to value	double	InputAndOutput	--	other	0	bias}

set trick_templates(TRICK_MALF_VAR.bias) \
{offset bias added to value	double	InputAndOutput	--	other	0	override_values}

set trick_templates(TRICK_MALF_VAR.override_values) \
{override values	VALUE_LIST	InputAndOutput	--	data_structure_address	0	num_val	restore_prev_value}

set trick_templates(TRICK_MALF_VAR.restore_prev_value) \
{restore previous value when malf removed	Flag	InputAndOutput	--	enumerated	0	prev_value_saved}

set trick_templates(TRICK_MALF_VAR.prev_value_saved) \
{flag indicating previous value saved	Flag	InputAndOutput	--	enumerated	0	prev_value}

set trick_templates(TRICK_MALF_VAR.prev_value) \
{previous value of the variable	VALUE	InputAndOutput	--	data_structure_address	0	ll	next}

set trick_templates(TRICK_MALF_VAR.next) \
{next malf var in malfunction	TRICK_MALF_VAR_struct	InputAndOutput	--	data_structure_address	1	0	param_name	jnext}

set trick_templates(TRICK_MALF_VAR.jnext) \
{next malf var in job list	TRICK_MALF_VAR_struct	InputAndOutput	--	data_structure_address	1	0	param_name	NULL}

set trick_templates(TRICK_MALF_VAR_struct.param_name) \
{parameter name	char*	InputAndOutput	--	other	0	activated}

set trick_templates(TRICK_MALF_VAR_struct.activated) \
{malfuction activated	Flag	InputAndOutput	--	enumerated	0	activation_time}

set trick_templates(TRICK_MALF_VAR_struct.activation_time) \
{time when malfunction activated	double	InputAndOutput	s	other	0	insertion}

set trick_templates(TRICK_MALF_VAR_struct.insertion) \
{0 = before job , 1 = after job	int	InputAndOutput	--	other	0	job_index}

set trick_templates(TRICK_MALF_VAR_struct.job_index) \
{all_jobs index of insertion job	int	InputAndOutput	--	other	0	insert_job_name}

set trick_templates(TRICK_MALF_VAR_struct.insert_job_name) \
{job where malf inserted	char*	InputAndOutput	--	other	0	delay}

set trick_templates(TRICK_MALF_VAR_struct.delay) \
{seconds to delay before activation	double	InputAndOutput	s	other	0	scale_factor}

set trick_templates(TRICK_MALF_VAR_struct.scale_factor) \
{scale factor multiplied to value	double	InputAndOutput	--	other	0	bias}

set trick_templates(TRICK_MALF_VAR_struct.bias) \
{offset bias added to value	double	InputAndOutput	--	other	0	override_values}

set trick_templates(TRICK_MALF_VAR_struct.override_values) \
{override values	VALUE_LIST	InputAndOutput	--	data_structure_address	0	num_val	restore_prev_value}

set trick_templates(TRICK_MALF_VAR_struct.restore_prev_value) \
{restore previous value when malf removed	Flag	InputAndOutput	--	enumerated	0	prev_value_saved}

set trick_templates(TRICK_MALF_VAR_struct.prev_value_saved) \
{flag indicating previous value saved	Flag	InputAndOutput	--	enumerated	0	prev_value}

set trick_templates(TRICK_MALF_VAR_struct.prev_value) \
{previous value of the variable	VALUE	InputAndOutput	--	data_structure_address	0	ll	next}

set trick_templates(TRICK_MALF_VAR_struct.next) \
{next malf var in malfunction	TRICK_MALF_VAR_struct	InputAndOutput	--	data_structure_address	1	0	param_name	jnext}

set trick_templates(TRICK_MALF_VAR_struct.jnext) \
{next malf var in job list	TRICK_MALF_VAR_struct	InputAndOutput	--	data_structure_address	1	0	param_name	NULL}

set trick_templates(TRICK_MALF_struct.name) \
{malfunction name from the input file	char*	InputAndOutput	--	other	0	trigger_head}

set trick_templates(TRICK_MALF_struct.trigger_head) \
{head of triggers	TRICK_MALF_TRIGGER	InputAndOutput	--	data_structure_address	1	0	enabled	var_head}

set trick_templates(TRICK_MALF_struct.var_head) \
{head of variables to malfunction	TRICK_MALF_VAR	InputAndOutput	--	data_structure_address	1	0	param_name	job_head}

set trick_templates(TRICK_MALF_struct.job_head) \
{head of jobs to manipulate when malfunctioning	TRICK_MALF_JOB	InputAndOutput	--	data_structure_address	1	0	job_name	next}

set trick_templates(TRICK_MALF_struct.next) \
{next malfunction	TRICK_MALF_struct	InputAndOutput	--	data_structure_address	1	0	name	NULL}

set trick_templates(TrickErrorHndlr.report_level) \
{Err reporting level	TrickErrorLevel	InputAndOutput	--	enumerated	0	use_send_hs}

set trick_templates(TrickErrorHndlr.use_send_hs) \
{1=send_hs; else fprintf	int	InputAndOutput	--	other	1	9	report_stream}

set trick_templates(TrickErrorHndlr.report_stream) \
{Err reporting streams	FILE*	InputAndOutput	--	other	1	9	NULL}

set trick_templates(VALUE.ll) \
{long long	long	InputAndOutput	--	other	0	NULL}

set trick_templates(VALUE_LIST.num_val) \
{Number of values	int	InputAndOutput	--	other	0	v_data}

set trick_templates(VALUE_LIST.v_data) \
{Not Specified	V_DATA	InputAndOutput	--	data_structure_address	1	512	type	NULL}

set trick_templates(V_DATA.type) \
{value type	int	InputAndOutput	--	other	0	is_string_const}

set trick_templates(V_DATA.is_string_const) \
{1 = string type is a constant (can be freed after assignment)	char	InputAndOutput	--	other	0	value}

set trick_templates(V_DATA.value) \
{value	VALUE	InputAndOutput	--	data_structure_address	0	ll	NULL}


set trick_variables(dyn.organs) \
{Declared in S_define	ORGANS	InputAndOutput	--	data_structure_address	0	Cli	integ}

set trick_variables(dyn.integ) \
{Declared in S_define	INTEGRATOR	InputAndOutput	--	data_structure_address	0	option	job}

set trick_variables(dyn.job) \
{Job Scheduling Info	JOBDATA	InputAndOutput	--	data_structure_address	1	3	in	NULL}

set trick_templates(INTEGRATOR.option) \
{E.g. Euler, Runge_Kutta_2	Integrator	InputAndOutput	--	enumerated	0	init}

set trick_templates(INTEGRATOR.init) \
{1 = Init or Reinitialize Integrator derivatives and workspace	Flag	InputAndOutput	--	enumerated	0	num_state}

set trick_templates(INTEGRATOR.num_state) \
{Number of dependent variables to integrate	int	InputAndOutput	--	other	0	first_step_deriv}

set trick_templates(INTEGRATOR.first_step_deriv) \
{1 = Integrator always requires new derivatives for first intermediate step, 0 = integrator will use latest derivatives from last pass for the first intermediate step	Flag	InputAndOutput	--	enumerated	0	intermediate_step}

set trick_templates(INTEGRATOR.intermediate_step) \
{Intermediate step ID for integrators: 1st step = 0, and so on. e.g. Runge_Kutta_4 has 4 intermediate steps	int	InputAndOutput	--	other	0	counter}

set trick_templates(INTEGRATOR.counter) \
{Used to prime abm method	int	InputAndOutput	--	other	0	primed}

set trick_templates(INTEGRATOR.primed) \
{Flag to determine status in abm	int	InputAndOutput	--	other	0	state}

set trick_templates(INTEGRATOR.state) \
{Dependent states for each intermediate step	double	InputAndOutput	--	other	1	0	deriv}

set trick_templates(INTEGRATOR.deriv) \
{State derivative for each intermediate step; [i][j] i = step identifier, j = state variable identifier	double	InputAndOutput	--	other	2	0	0	deriv2}

set trick_templates(INTEGRATOR.deriv2) \
{Second state derivative for each intermediate step; [i][j] i = step identifier, j = state variable identifier	double	InputAndOutput	--	other	2	0	0	state_ws}

set trick_templates(INTEGRATOR.state_ws) \
{Dependent state variable workspace for each intermediate step: [i][j] i = step identifier, j = state variable identifier	double	InputAndOutput	--	other	2	0	0	stored_data}

set trick_templates(INTEGRATOR.stored_data) \
{Array stores the previously found values in the abm [i][j]: i = which previous step j = which state varialble	double	InputAndOutput	--	other	2	0	0	time}

set trick_templates(INTEGRATOR.time) \
{Current Simulation time through integrator	double	InputAndOutput	s	other	0	time_0}

set trick_templates(INTEGRATOR.time_0) \
{Sim time at beginning of step	double	InputAndOutput	s	other	0	NULL}

set trick_templates(ORGANS.Cli) \
{Concentration in liver	double	InputAndOutput	--	other	0	Clu}

set trick_templates(ORGANS.Clu) \
{Concentration in lung	double	InputAndOutput	--	other	0	Cm}

set trick_templates(ORGANS.Cm) \
{Concentration in tissue	double	InputAndOutput	--	other	0	dC_liver_dt}

set trick_templates(ORGANS.dC_liver_dt) \
{Concentration rate in liver	double	InputAndOutput	--	other	0	dC_lung_dt}

set trick_templates(ORGANS.dC_lung_dt) \
{Concentration rate in lung	double	InputAndOutput	--	other	0	dC_tissue_dt}

set trick_templates(ORGANS.dC_tissue_dt) \
{Concentration rate in medium tissue	double	InputAndOutput	--	other	0	params}

set trick_templates(ORGANS.params) \
{test	params_T	InputOnly	m	data_structure_address	0	Pli	rf}

set trick_templates(ORGANS.rf) \
{Dynamic event params for impact	REGULA_FALSI	InputAndOutput	--	data_structure_address	0	lower_set	connection}

set trick_templates(ORGANS.connection) \
{Socket connection for sending position	TCDevice	InputAndOutput	--	data_structure_address	0	disabled	NULL}

set trick_templates(REGULA_FALSI.lower_set) \
{Yes = Lower bounds has been set	Flag	InputAndOutput	--	enumerated	0	upper_set}

set trick_templates(REGULA_FALSI.upper_set) \
{Yes = Upper bounds has been set	Flag	InputAndOutput	--	enumerated	0	iterations}

set trick_templates(REGULA_FALSI.iterations) \
{Total num of iterations used to fire event	int	InputAndOutput	--	other	0	fires}

set trick_templates(REGULA_FALSI.fires) \
{Total num of times event fired	int	InputAndOutput	--	other	0	x_lower}

set trick_templates(REGULA_FALSI.x_lower) \
{Lower value from error func	double	InputAndOutput	--	other	0	t_lower}

set trick_templates(REGULA_FALSI.t_lower) \
{Time at lower val of err func	double	InputAndOutput	s	other	0	x_upper}

set trick_templates(REGULA_FALSI.x_upper) \
{Upper value from err function	double	InputAndOutput	--	other	0	t_upper}

set trick_templates(REGULA_FALSI.t_upper) \
{Time at upper value of err func	double	InputAndOutput	s	other	0	delta_time}

set trick_templates(REGULA_FALSI.delta_time) \
{Time to go	double	InputAndOutput	s	other	0	error}

set trick_templates(REGULA_FALSI.error) \
{New Error value from err func	double	InputAndOutput	--	other	0	last_error}

set trick_templates(REGULA_FALSI.last_error) \
{Last pass error value	double	InputAndOutput	--	other	0	last_tgo}

set trick_templates(REGULA_FALSI.last_tgo) \
{Last pass Time to go value	double	InputAndOutput	s	other	0	error_tol}

set trick_templates(REGULA_FALSI.error_tol) \
{Tolerance on error below which tgo=0	double	InputAndOutput	--	other	0	mode}

set trick_templates(REGULA_FALSI.mode) \
{Operating mode for regula falsi	Regula_Falsi	InputAndOutput	--	enumerated	0	function_slope}

set trick_templates(REGULA_FALSI.function_slope) \
{Operating mode for regula falsi	Regula_Falsi	InputAndOutput	--	enumerated	0	NULL}

set trick_templates(params_T.Pli) \
{liver P param	double	InputOnly	--	other	0	Plu}

set trick_templates(params_T.Plu) \
{lung P param	double	InputOnly	--	other	0	Qli}

set trick_templates(params_T.Qli) \
{liver Q param	double	InputOnly	--	other	0	Qlu}

set trick_templates(params_T.Qlu) \
{lung Q param	double	InputOnly	--	other	0	Qm}

set trick_templates(params_T.Qm) \
{tissue Q param	double	InputOnly	--	other	0	Vli}

set trick_templates(params_T.Vli) \
{liver V param	double	InputOnly	--	other	0	Vlu}

set trick_templates(params_T.Vlu) \
{lung V param	double	InputOnly	--	other	0	Vm}

set trick_templates(params_T.Vm) \
{tissue V param	double	InputOnly	--	other	0	Km_p_450}

set trick_templates(params_T.Km_p_450) \
{Km param	double	InputOnly	--	other	0	Vmax_p_450}

set trick_templates(params_T.Vmax_p_450) \
{Vmax p-450 param	double	InputOnly	--	other	0	Mli}

set trick_templates(params_T.Mli) \
{Mli param	double	InputOnly	--	other	0	Mlu}

set trick_templates(params_T.Mlu) \
{Mlu param	double	InputOnly	--	other	0	kinj}

set trick_templates(params_T.kinj) \
{Not Specified	double	InputAndOutput	--	other	0	NULL}

