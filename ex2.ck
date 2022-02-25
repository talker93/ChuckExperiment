
// Question: whether the magnitude of last interval was bigger or not?

/////////////////// keyboard input function/////////////////
fun float keyInput(float in1, float in2, float in3) {
    KBHit kb;

    // patch
    Impulse i => BiQuad f => dac;
    // set the filter's pole radius
    .99 => f.prad;
    // set equal gain zeros
    1 => f.eqzs;
    // initialize float variable
    0.0 => float v;
    // set filter gain
    .5 => f.gain;

    11 => int c;
    0 => float a;
    <<<"What's the frequency of this sample? 1. "+in1+"Hz; 2. "+in2+"Hz; 3. "+in3+"Hz; (1/2/3)">>>;

    // time-loop
    while( 1 )
    {
        // wait on event
        kb => now;
        // generate impulse
        1.0 => i.next;

        // set filtre freq
        kb.getchar() => int c => Std.mtof => f.pfreq;
        // print int value
        // <<< "ascii:", c >>>;
        if(c == 49) {<<<"You choose "+in1+"Hz? Press Enter key to confirm.">>>; in1=>a;}
        if(c == 50) {<<<"You choose "+in2+"Hz? Press Enter key to confirm.">>>; in2=>a;}
        if(c == 51) {<<<"You choose "+in3+"Hz? Press Enter key to confirm.">>>; in3=>a;}
        if(c == 10) {<<<"Thanks for your answer!\n\n\n">>>;}
        if(c == 10) break;
    }
    return a;
}
////////////////////////////////////////////////////////////////////



SinOsc sinewave => dac;

// fun float midi2freq(int pitch) {
//     ( Math.pow(2.0, ((pitch-69) / 12) ) * 440) => float frequency;
//     return frequency;
// }

<<<"Test start!\n\n\n">>>;


float answer[12];

440 => sinewave.freq;

for(0 => int i; i < 12; i++) {
    if(i==0) {<<<"Group1\n Now Listen to: 1">>>; 293.67=>sinewave.freq; 1000::ms=>now; sinewave=<dac; keyInput(293.67, 440.0, 587.33)=>answer[i];}
    if(i==1) {<<<"Group1\n Now Listen to: 2">>>; 440.0=>sinewave.freq; 1000::ms=>now; sinewave=<dac; keyInput(293.67, 440.0, 587.33)=>answer[i];}
    if(i==2) {<<<"Group1\n Now Listen to: 3">>>; 587.33=>sinewave.freq; 1000::ms=>now; sinewave=<dac; keyInput(293.67, 440.0, 587.33)=>answer[i];}
    if(i==3) {<<<"Group2\n Now Listen to: 4">>>; 220.00=>sinewave.freq; 500::ms=>now; sinewave=<dac; keyInput(220.00, 261.63, 349.23)=>answer[i];}
    if(i==4) {<<<"Group2\n Now Listen to: 5">>>; 261.63=>sinewave.freq; 500::ms=>now; sinewave=<dac; keyInput(220.00, 261.63, 349.23)=>answer[i];}
    if(i==5) {<<<"Group2\n Now Listen to: 6">>>; 349.23=>sinewave.freq; 500::ms=>now; sinewave=<dac; keyInput(220.00, 261.63, 349.23)=>answer[i];}
    if(i==6) {<<<"Group3\n Now Listen to: 7">>>; 1046.5=>sinewave.freq; 200::ms=>now; sinewave=<dac; keyInput(1046.5, 783.99, 659.26)=>answer[i];}
    if(i==7) {<<<"Group3\n Now Listen to: 8">>>; 783.99=>sinewave.freq; 200::ms=>now; sinewave=<dac; keyInput(1046.5, 783.99, 659.26)=>answer[i];}
    if(i==8) {<<<"Group3\n Now Listen to: 9">>>; 659.26=>sinewave.freq; 200::ms=>now; sinewave=<dac; keyInput(1046.5, 783.99, 659.26)=>answer[i];}
    if(i==9) {<<<"Group4\n Now Listen to: 10">>>; 392.00=>sinewave.freq; 100::ms=>now; sinewave=<dac; keyInput(392.00, 130.81, 523.25)=>answer[i];}
    if(i==10) {<<<"Group4\n Now Listen to: 11">>>; 196.00=>sinewave.freq; 100::ms=>now; sinewave=<dac; keyInput(392.00, 196.00, 523.25)=>answer[i];}
    if(i==11) {<<<"Group4\n Now Listen to: 12">>>; 523.25=>sinewave.freq; 100::ms=>now; sinewave=<dac; keyInput(392.00, 196.00, 523.25)=>answer[i];}
    1::second=>now;
    sinewave => dac;
}

////////////////////// the write function//////////////////////////////////////
// write some stuff
FileIO fout;

// open for write
fout.open( "ex2.txt", FileIO.WRITE );

// test
if( !fout.good() )
{
    cherr <= "can't open file for writing..." <= IO.newline();
    me.exit();
}

// write some stuff
for(0=>int i; i<12; i++) {
    fout <= answer[i] <= IO.newline();
}

// close the thing
fout.close();
///////////////////////////////////////////////////////////////////////////////

<<<"Listening finished, thank you!">>>;


