SinOsc sinewave => dac;

20 => sinewave.freq;

1.0 => float d;
2.0 => float c;

<<< Math.sqrt( 2.0 ) >>>;
<<< Math.sin( Math.PI / 2.0) >>>;
<<< Math.pow(2.0, 1.0) >>>;


while(d < 128) 
{
    500::ms => now;
    (d+1) => d;
    
    <<< Math.pow(2.0, ((d-69) / 12)) * 440 >>>;
    ( Math.pow(2.0, ((d-69) / 12) ) * 440) => sinewave.freq;
}