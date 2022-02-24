
// Question: whether the magnitude of last interval was bigger or not?

// ### Group 1 variable: changing rate

// 1. Sound: normal -> big, rate: 10%
// 2. Sound: normal -> big, rate: 20%
// 3. Sound: normal -> big, rate: 50%
// 4. Sound: normal -> small, rate: 10%
// 5. Sound: normal -> small, rate: 20%
// 6. Sound: normal -> small, rate: 50%

/////////////////// keyboard input function/////////////////
fun int keyInput() {
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
    0 => int a;
    <<<"What's the frequency of this sample?">>>;

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
        if(c == 121) {<<<"You choose Yes? Press Enter key to confirm.">>>; 121=>a;}
        if(c == 110) {<<<"You choose No? Press Enter key to confirm.">>>; 110=>a;}
        if(c == 10) {<<<"Thanks for your answer!\n\n\n">>>;}
        if(c == 10) break;
    }
    return a;
}
////////////////////////////////////////////////////////////////////

fun float midi2freq(int pitch) {
    ( Math.pow(2.0, ((pitch-69) / 12) ) * 440) => sinewave.freq;
    return frequncy;
}



<<<"Test start!\n\n\n">>>;

SinOsc sinewave => dac;

string answer[12];

440 => sinewave.freq;

for(0 => int i; i < 6; i++) {
    if(i==0) {<<<"Group1\n Now Listen to: 1-1">>>; midi2freq(69)=>sinewave.freq; 1000::ms=>now;}
    if(i==1) {<<<"Group1\n Now Listen to: 2-1">>>; midi2freq(50)=>sinewave.freq; 1000::ms=>now;}
    if(i==2) {<<<"Group1\n Now Listen to: 3-1">>>; midi2freq(88)=>sinewave.freq; 1000::ms=>now;}
    if(i==3) {<<<"Group2\n Now Listen to: 4-1">>>; midi2freq(69)=>sinewave.freq; 500::ms=>now;}
    if(i==4) {<<<"Group2\n Now Listen to: 5-1">>>; midi2freq(50)=>sinewave.freq; 500::ms=>now;}
    if(i==5) {<<<"Group2\n Now Listen to: 6-1">>>; midi2freq(88)=>sinewave.freq; 500::ms=>now;}
    if(i==6) {<<<"Group3\n Now Listen to: 1-1">>>; midi2freq(69)=>sinewave.freq; 200::ms=>now;}
    if(i==7) {<<<"Group3\n Now Listen to: 2-1">>>; midi2freq(50)=>sinewave.freq; 200::ms=>now;}
    if(i==8) {<<<"Group3\n Now Listen to: 3-1">>>; midi2freq(88)=>sinewave.freq; 200::ms=>now;}
    if(i==9) {<<<"Group4\n Now Listen to: 4-1">>>; midi2freq(69)=>sinewave.freq; 100::ms=>now;}
    if(i==10) {<<<"Group4\n Now Listen to: 5-1">>>; midi2freq(50)=>sinewave.freq; 100::ms=>now;}
    if(i==11) {<<<"Group4\n Now Listen to: 6-1">>>; midi2freq(88)=>sinewave.freq; 100::ms=>now;}
    sinewave =< dac;
    keyInput()=>answer[i];
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
for(0=>int i; i<6; i++) {
    fout <= answer[i] <= IO.newline();
}

// close the thing
fout.close();
///////////////////////////////////////////////////////////////////////////////

<<<"Listening finished, thank you!">>>;


