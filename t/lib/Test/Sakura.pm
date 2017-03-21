# Copyright (C) Guiquan Zhang (guiquanz)

package Test::Sakura;

use Test::Base -Base;
use POSIX ();
use IPC::Run ();


our @EXPORT = qw( run_tests );

sub run_tests () {

    for my $block (Test::Base::blocks()) {
        run_test($block);
    }

}

sub bail_out (@) {
    Test::More::BAIL_OUT(@_);
}

sub parse_cmd ($) {
    my $cmd = shift;
    my @cmd;

    while (1) {
        if ($cmd =~ /\G\s*"(.*?)"/gmsc) {
            push @cmd, $1;

        } elsif ($cmd =~ /\G\s*'(.*?)'/gmsc) {
            push @cmd, $1;
        
        } elsif ($cmd =~ /\G\s*(\S+)/gmsc) {
            push @cmd, $1;
        
        } else {
            last;
        }
    }

    return @cmd;
}

sub run_test ($) {
    my $block = shift;
    my $name = $block->name;

    my $timeout = $block->timeout() || 10;
    my $opts = $block->opts;
    my $args = $block->args;

    my $cmd = "./tcc -B./ -I/usr/local/include -I./t -D_ANSI_SOURCE -run";

    if (defined $opts) {
        $cmd .= " $opts";
    }

    my $tccfile;
    if (defined $block->src) {
        $tccfile = POSIX::tmpnam() . ".c";
        open my $out, ">$tccfile" or 
            bail_out("cannot open $tccfile for writing: $!");
        print $out ($block->src);
        close $out;

        $cmd .= " $tccfile";
    }

    if (defined $args) {
    	$cmd .= " $args";
    }

    # warn "CMD: $cmd\n";

    my @cmd = parse_cmd($cmd);

    my ($out, $err);

    eval {
        IPC::Run::run(\@cmd, \undef, \$out, \$err,
                      IPC::Run::timeout($timeout));
    };

    if ($@) {

        if ($@ =~ /timeout/) {

            if (!defined $block->expect_timeout) {
                fail("$name: sakura process timeout");
            }

        } else {
            fail("$name: failed to run command [$cmd]: $@");
        }
    }

    my $ret = ($? >> 8);

    if (defined $tccfile) {
        unlink $tccfile;
    }

    if (defined $block->out) {
        is $out, $block->out, "$name - stdout eq okay";
    }

    my $regex = $block->out_like;
    if (defined $regex) {
        if (!ref $regex) {
            $regex = qr/$regex/ms;
        }
        like $out, $regex, "$name - stdout like okay";
    }

#    if (defined $block->err) {
#        is $err, $block->err, "$name - stderr eq okay";
#    }

    $regex = $block->err_like;
    if (defined $regex) {
    	if (!ref $regex) {
    	    $regex = qr/$regex/ms;
    	}
    	like $err, $regex, "$name - stderr like okay";
    }

#    my $exp_ret = $block->ret;
#    if (!defined $exp_ret) {
#        $exp_ret = 0;
#    }

#    is $ret, $exp_ret, "$name - exit code okay";
}

1;

