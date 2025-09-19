/*
the piece has the following synths:
1. synth name:
purpose of synth
inputs (controls):
input 1: name
input 1: purpose
input 1: input sources

input 2: name
input 2: purpose
input 2: input sources
...
output:
output 1: name
output 1: purpose
output 1: output destination
...
*/


~sourcesynth1 = {
		| i1 = 0, amp1 = 0.1, i2 = 0, amp2 = 0.1, freq = 440,
	     freqmodamp = 200, freqmodfreq = 7, freqmodmid = 1000 |
	var sine1,  saw1, square1, src;
	var sine2,  saw2, square2;
	var freqmod, freqmodlo, freqmodhi;
	sine1 = SinOsc.ar(440,0,0.1);
	saw1 = LFSaw.ar(440, 0, 0.1);
	square1 = LFPulse.ar(440, 0, 0.5, 0.1);
	sine2 = SinOsc.ar(660,0,0.1);
	saw2 = LFSaw.ar(660, 0, 0.1);
	square2 = LFPulse.ar(660, 0, 0.5, 0.1);
	//[sine, saw, square];
	//[sine, saw, square];
	src =(Select.ar(i1,[sine1, saw1, square1])*amp1) +
		(Select.ar(i2,[sine2, saw2, square2])*amp2);

	freqmodlo = freqmodmid - (freqmodamp / 2);
	freqmodhi = freqmodmid + (freqmodamp / 2);
	freqmod = SinOsc.kr(freqmodfreq).range(freqmodlo,freqmodhi);
	LPF.ar(src, freqmod)
}.play
~sourcesynth1.set(\amp1,1,\amp2,1,\freqmodamp, 44);

(
var w , amp1 = 0.1, amp2 = 0.1, freq = 440;

w = Window("osc1", Rect(100, 100, 400, 300));
w.view.keyDownAction = { |view, char, modifiers, unicode, keycode|
    "Key pressed: % (char), Keycode: % (keycode), Unicode:%".format(char, keycode, unicode).postln;
	switch (char)
	{$1}
	{~sourcesynth1.set(\i1,0);}
	{$2}
	{~sourcesynth1.set(\i1,1);}
	{$3}
	{~sourcesynth1.set(\i1,2);}
	{$-}
	{amp1 = amp1 - 0.1 max: 0;
		~sourcesynth1.set(\amp1,amp1);}
	{$=}
	{amp1 = amp1 + 0.1;
		~sourcesynth1.set(\amp1,amp1);}
	{$4}
	{~sourcesynth1.set(\i2, 0);}
	{$5}
	{~sourcesynth1.set(\i2, 1);}
	{$6}
	{~sourcesynth1.set(\i2, 2);}
	{$O}
	{amp2 = amp2 - 0.1 max: 0;
		~sourcesynth1.set(\amp2,amp2);}
	{$P}
	{amp2 = amp2 + 0.1;
		~sourcesynth1.set(\amp2,amp2);}
};
w.view.mouseWheelAction = { | view, x, y, modifiers, xDelta, yDelta |
	[view, x, y, modifiers, xDelta, yDelta].postln;
	freq = freq + (yDelta * 10) max: 50;
	freq.postln;
	~sourcesynth1.set(\freq, freq);
};
w.front;
)


