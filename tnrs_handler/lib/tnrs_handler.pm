package tnrs_handler;
use tnrs_resolver qw(process);
use Dancer ':syntax';
use Parallel::ForkManager;
use JSON;
use Digest::MD5 qw(md5_hex);

our $VERSION = '1.0';

my $config_file_path = "../handler_config.json";
my $cfg              = init($config_file_path);

my $adapters_file = $cfg->{adapters_file};
my $host          = $cfg->{host};
my $storage       = $cfg->{storage};
my $tempdir       = $cfg->{tempdir};
my $MAX_PIDS      = $cfg->{MAX_PIDS};        #not currently used

my $n_pids = 0;

sub init {
	my $config_file = shift;
	open( my $CFG, "<$config_file" )
	  or die "Cannot load handler configuration file $config_file: $!";
	my @cfg = (<$CFG>);
	close $CFG;
	my $cfg_ref = decode_json( join '', @cfg );
	my $host = $cfg_ref->{host};
	$host = "$host:" . $cfg_ref->{port};
	$cfg_ref->{host} = $host;

	my $tempdir = $cfg_ref->{tempdir};

	#Creates the tempdir
	mkdir $tempdir;

	#Wipe the tempdir clean
	eval {
		opendir( my $DIR, $tempdir ) || die "can't opendir $tempdir: $!";
		my @files = grep ( !/^\.+$/, readdir $DIR );
		closedir $DIR;
		for (@files) {
			my $k = unlink "$tempdir/$_";
		}
	};
	mkdir $cfg_ref->{storage};
	return $cfg_ref;
}

#TODO: Date format (in tnrs_resolver)
#TODO: Add cache
#TODO: Add spellchecker
#TODO: File support
#TODO: Job cancel
#TODO: Auto redirects


#Information
get '/' => sub {
	my $message = qq{
Welcome to TNRastic, the Phylotastic Taxonomic Name Resolution Service.

Submit a list of scientific names to obtain the accepted name across various taxonomic sources.

Usage:
/submit
	POST a list of scientific names to the service and retrieve a token.
	Parameters: 
		-query:	newline separated list of scientific names
	Returns: JSON object containing a token to access the results.
	Example: $host/submit?query=Panthera+tigris%0AEutamias+minimus%0AMagnifera+indica%0AHumbert+humbert

/retrieve/<token>
	GET the result of a TNRastic query.
	Returns: JSON object containing the accepted names.
	Example: $host/retrieve/b6356e63f0c39d58066c1e772e24ff6f	
	
		
To learn more, please visit http://www.evoio.org/wiki/Phylotastic/TNRS.
			
	};
	return $message;
};

#Status
any [ 'get', 'post' ] => '/status' => sub {
	return encode_json( { "status" => "OK" } );
};

#Submit
#any [ 'post', 'get' ] => '/submit' => sub {
get '/submit' => sub {
	
	my $para = request->params;

	if ( !defined($para)  ) {
		status 'bad_request';
		return encode_json(
			{ "message" => "Please specify a list of newline separated names" }
		);
	}

	elsif($para->{query}) {
		my $names = $para->{query};
		my $fn = md5_hex( $names, time );
		open( my $TF, ">$tempdir/$fn.tmp" ) or _error_code('generic');
		print $TF $names;
		close $TF;
		my $status = _submit("$tempdir/$fn.tmp");
		my $uri    = "$host/$fn";
		my $date   = localtime;
		my $json   = {
			"submit date" => $date,
			token         => $fn,
			uri           => "$host/retrieve/$fn",
			message       =>
"Your request is being processed. You can retrieve the results at $host/retrieve/$fn."
		};
		return encode_json($json);
	}
};

#TODO: file support
#any [ 'post', 'get' ] => '/submit' => sub {
#
#	elsif ( defined($para->{file})  ){
#	
#		
#		
#	}
#}

#Retrieve
get '/retrieve/:job_id' => sub {
	my $job_id = param('job_id');
	if ( -f "$storage/$job_id.json" ) {
		open( my $RF, "<$storage/$job_id.json" ) or _error_code("generic");
		my @tmp = (<$RF>);
		close($RF);
		return join '', @tmp;    #is already JSON
	}
	elsif ( -f "$tempdir/$job_id.tmp" ) {

	#TODO: add test for freshness: if request is older then 24h, then return 404
		status 'accepted';
		return encode_json(
			{ "message" => "Job $job_id is still being processed." } );
	}
	else {
		status 'not_found';
		return encode_json(
			{ "message" => "Error. Job $job_id doesn't exits." } );
	}

};

#TODO: file support
#stage
#sub _stage {
#		my $names = $para->{query};
#		my $fn = md5_hex( $names, time );
#		open( my $TF, ">$tempdir/$fn.tmp" ) or _error_code('generic');
#		print $TF $names;
#		close $TF;
#		my $status = _submit("$tempdir/$fn.tmp");
#		my $uri    = "$host/$fn";
#		my $date   = localtime;
#		my $json   = {
#			"submit date" => $date,
#			token         => $fn,
#			uri           => "$host/retrieve/$fn",
#			message       =>
#"Your request is being processed. You can retrieve the results at $host/retrieve/$fn."
#		};
#		return $json;
#}

#Error handling
sub _error_code {
	status 'internal_server_error';
	return encode_json(
		{ "message" => "General error. Please try again later" } );

}

#Forks a process to interrogate the TNRSs 
sub _submit {
	$SIG{CHLD} = "IGNORE"; #Avoids zombie processes
	my $filename = shift;
	fork and return; #Spawn a child process and returns to the http handler fuction 
	
	#Following code run by the children
	
	my $pid = $$; #PID of the child process

	#	$n_pids++;
	#	if ( $n_pids >= $MAX_PIDS ) {
	#		sleep $n_pids * 10;
	#	}
	process($filename,$adapters_file,$storage);
	  
	#	$n_pids--;
	
	kill 9, $pid; #Process commit suicide

}

true;
