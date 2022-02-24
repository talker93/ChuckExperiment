// SinOsc sinewave => dac;

// 440 => sinewave.freq;
// 1000::ms => now;
// 600 => sinewave.freq;
// 1000::ms => now;

// 1.0 => float d;

// <<< Math.sqrt( 2.0 ) >>>;
// <<< Math.sin( Math.PI / 2.0) >>>;
// <<< Math.pow(2.0, 1.0) >>>;


// while(d < 128) 
// {
//     500::ms => now;
//     (d+1) => d;
    
//     <<< Math.pow(2.0, ((d-69) / 12)) * 440 >>>;
//     ( Math.pow(2.0, ((d-69) / 12) ) * 440) => sinewave.freq;
// }


// demo0.ck
// basic demo showing time and duration

// 5::second + now => time later;

// while( now < later )
// {
//     <<<now>>>;
//     1::second => now;
// }

// <<<now>>>;


// write some stuff
FileIO fout;

// open for write
fout.open( "out.txt", FileIO.WRITE );

// test
if( !fout.good() )
{
    cherr <= "can't open file for writing..." <= IO.newline();
    me.exit();
}

// write some stuff
fout <= 1 <= " " <= 2 <= " " <= "foo" <= IO.newline();

fout <= 3 <= " " <= 4 <= " " <= "box" <= IO.newline();

// close the thing
fout.close();

// computer key input, with sound
// KBHit kb;

// // patch
// Impulse i => BiQuad f => dac;
// // set the filter's pole radius
// .99 => f.prad;
// // set equal gain zeros
// 1 => f.eqzs;
// // initialize float variable
// 0.0 => float v;
// // set filter gain
// .5 => f.gain;

// 11 => int c;

// // time-loop
// while( 1 )
// {
//     // wait on event
//     kb => now;
//     // generate impulse
//     1.0 => i.next;

//     // set filtre freq
//     kb.getchar() => int c => Std.mtof => f.pfreq;
//     // print int value
//     <<< "ascii:", c >>>;
//     if(c == 121) {<<<"You choose Yes? Press Enter key to confirm.">>>;}
//     if(c == 110) {<<<"You choose No? Press Enter key to confirm.">>>;}
//     if(c == 10) break;
// }