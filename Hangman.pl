## Assignment: Project 4
## Author: Joe Barbercheck (mothman147@gmail.com)
## Version: 11.9.15.0
## Purpose: Hangman!

use 5.14.1;
use warnings;

my (@words, @splitWord, @guessedLetters);
my ($randomWord, $chosenAnswer, $continueInt, $guess);

use constant WORDSIN => "./words.txt";
use constant NO => 0;
use constant YES => 1;

sub main {
     @splitWord = [0];
     @guessedLetters = [0];
          setContinueInt();
          readData();
          pickWord();
          seperateWord();
          while ($continueInt == YES ){
          printSpaces();
          makeGuess();
          #printWord();
     }

}

main();

sub printSpaces {
     my $size = @splitWord;
     my $counter = 0;
     my @emptySpace = [0];
     for (my $i = 0; $i < $size; $i++){
          $emptySpace[$i] = "_";
     }
     
     for (my $i = 0; $i < $size; $i++){
          print "$emptySpace[$i] ";
     }
     
}

sub makeGuess {
     print "\nWhat letter would you like to guess? :";
     chomp ($guess = <STDIN>);
     if ($guess =~ /[0-9]/) {
          print "Not a letter!";
          $guess = ();
     } else {
          

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
          print "$splitWord[$i]\n";
     }
     
}