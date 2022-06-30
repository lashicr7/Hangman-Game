#!/usr/local/bin/perl

@words=("computer","radio","calculator","teacher","bureau","police","geometry","president","subject","country","enviroment","classroom","animals","province","month","politics","puzzle","instrument","kitchen","language","vampire","ghost","solution","service","software","virus25","security","phonenumber","expert","website","agreement","support","compatibility","advanced","search","triathlon","immediately","encyclopedia","endurance","distance","nature","history","organization","international","championship","government","popularity","thousand","feature","wetsuit","fitness","legendary","variation","equal","approximately","segment","priority","physics","branche","science","mathematics","lightning","dispersion","accelerator","detector","terminology","design","operation","foundation","application","prediction","reference","measurement","concept","perspective","overview","position","airplane","symmetry","dimension","toxic","algebra","illustration","classic","verification","citation","unusual","resource","analysis","license","comedy","screenplay","production","release","emphasis","director","trademark","vehicle","aircraft","experiment");

$start=1;

@letters=("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z");

sub display{
    ($tries)=@_;
    print "     ________\n";
    print "     |      |\n";
    if($tries>=1){
    print "     |      O\n";}
    else{
    print "     |       \n";}
    if($tries==2){
    print "     |      |\n";}
    else {if($tries==3){
    print "     |     \\|\n";}
    else {if($tries>3){
    print "     |     \\|/\n";}
    else{
    print "     |       \n";}}}
    if($tries>=2){
    print "     |      | \n";}
    else{
    print "     |       \n";}
    if($tries==5){
    print "     |     /\n";}
    elsif($tries==6){
    print "     |     / \\ \n";}
    else{
    print "     |\n"}
    print "     |\n";
    print "     |\n";
    print "_____|___\n";
}
sub inputchck{
($in)=@_;
for($i=0;$i<$length;$i++){
            if(@letters[$i] eq $in){
               return 1;
            }
else{return 0;}
        }}
        #Can be used if we provide other than alphabet inputs
while ($start==1){
    print "\n\n";
    $que=@words[rand(49)];
    @word=split //,$que;
    $length=length($que);
    $bodyparts=6;
    $correct=0;
    $guess='';
    @guesses=();
    @answer=();
    for($i=0;$i<$length;$i++){
        unshift @answer,'-';
    }
    while($bodyparts>0 && $correct<$length){
        print ("Here is your word:",@answer,"\n");
        print ("Guess So far:","@guesses\n");
        $play=1;
        while($play==1){
            $play=0;
            print "Pick a letter:";
            $guess=<STDIN>;
            chomp $guess;        
       
            foreach $_ (@guesses){
                if ($_ eq $guess){
                    print "Letter already picked\n";
                    $play=1;
                    next;
                }
            }
    
}
        push @guesses,$guess;
        $start=0;
        for($i=0;$i<$length;$i++){
            if(@word[$i] eq $guess){
                @answer[$i]=@word[$i];
                $start=1;
                $correct++;
            }
        }
        if($start==0 ){
            $bodyparts--;
            print "Bad Guess!!\n";
        }
        elsif($correct<$length){
            print "Good Guess!!\n";
        }
display(6-$bodyparts);
        print "Chances left = $bodyparts\n\n";
    
}

    
    if($bodyparts==0){
        print "You have been hanged.\nThe word was $que\n.Game Over\n";
    }
    else{
        print "You have been spared.\nThe word you guessed ($que) is correct.\nGame Over\n"
    }
    $replay=1;
    while($replay==1){
        print "Would you like to try again (1/0):";
        $start=<STDIN>;
        chomp $start;
        if($start eq "1" || $start eq "0"){$replay=0;}
        else{print "Invalid input\n";}
    }
}
