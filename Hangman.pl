## Assignment: Project 4
## Author: Joe Barbercheck (mothman147@gmail.com)
## Version: 11.9.15.0
## Purpose: Hangman!

use 5.14.1;
use warnings;

my (@words, @splitWord, @guessedLetters);
my ($randomWord, $chosenAnswer, $continueInt);

use constant WORDSIN => "./words.txt";
use constant NO => 0;
use constant YES => 1;

sub main {
     @splitWord = [0];
     @guessedLetters = [0];
          setContinueInt();
          while ($continueInt == YES ){
          readData();
          pickWord();
          seperateWord();
          makeGuess();
          #printWord();
     }

}

main();

sub makeGuess {
     my $guess; 
     print "What letter would you like to guess? :";
     chomp ($guess = <STDIN>);
     if ($guess != /abc/) {
          print "You must choose a letter";
     }
     
}

sub setContinueInt{
	use constant "RULES" => 2;
	if (!(defined $continueInt)){
		$continueInt = 0;
	} while ($continueInt != 1){
		print ("\n\tWould You like to play a game of hangman? (0 for no 1 for yes)");
		chomp ($continueInt = <STDIN>);
		} if ($continueInt == 0){
			die;
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