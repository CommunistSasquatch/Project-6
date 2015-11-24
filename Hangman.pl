## Assignment: Project 4
## Author: Joe Barbercheck (mothman147@gmail.com)
## Version: 11.9.15.0
## Purpose: Hangman!

use 5.14.1;
use warnings;

my (@words, @splitWord, @emptySpace, @correctGuess);
my ($randomWord, $chosenAnswer, $continueInt, $guess, $counter, $wrongCounter);

use constant WORDSIN => "./words.txt";
use constant NO => 0;
use constant YES => 1;
use constant MAX_LOSS => 6;

sub main {
     @splitWord = [0];
     @emptySpace = [0];
     @correctGuess = [0]; 
          setContinueInt();
          readData();
          pickWord();
          seperateWord();
          setSpaces();
          while ($continueInt == YES ){
          printWord();
          makeGuess();
          checkForWin();
          
     }

}

main();

sub setSpaces {
     my $size = @splitWord;
     my $counter = 0;
     for (my $i = 0; $i < $size; $i++){
          $emptySpace[$i] = "_";
     }
}

sub makeGuess {
     my $size = @splitWord;
     $counter = 0;
     my $correct = 0;
     print "\nWhat letter would you like to guess? :";
     chomp ($guess = <STDIN>);
     if ($guess =~ /[0-9]/) {
          print "Not a letter!";
          $guess = ();
     } else {
          for (my $j = 0; $j < $size; $j++){
               if ($guess eq $splitWord[$j]){
                    $correctGuess[$j] = $guess;
                    $counter++;
               }  
          }

          for (my $i = 0; $i < $size; $i++){
               if ($guess eq $splitWord[$i]){
                    $emptySpace[$i] = $guess;
                    $correct = 1;
                    
               } 
          }
          
           if ($correct != 1 ) {
               $wrongCounter++;
               if ($wrongCounter >= $size){
                    print "FAIL";
               }
           }
           
     }
     
}

sub setContinueInt {
	if (!(defined $continueInt)) { 
		print "Would you like to play a game of hangman?! (0=no, 1=yes) ";
		chomp ($continueInt = <STDIN>);
	} else {
		$continueInt = YES;
	}
}



sub seperateWord {
    my $size = @splitWord;
     @splitWord = split(//, $chosenAnswer);
}

sub readData {
     my $IN;
	@words = ();
	my $counter = 0;
	open ($IN, '<', WORDSIN);
	while (<$IN>) {
		chomp ($words[$counter] = $_);
		$counter++;
	}
	close $IN;
}

sub pickWord {
     my $size = @words;
	$randomWord = (int (rand ($size)));
     $chosenAnswer = $words[$randomWord];
     
}


sub printWord {
     my $size = @splitWord;
     for (my $i = 0; $i < $size; $i++){
          print "$emptySpace[$i] ";
     }
     
}

sub checkForWin{
     
          my $size = @correctGuess;
          if (@correctGuess eq @splitWord){
               print "You Won!";
               sleep 2;
          }
        
}