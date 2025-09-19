# SuperCollider-Final-Assignment-Code-and-Markdown
final assignment Gkouras Ioannis TX2019001

This project implements a simplified Moog-inspired synthesizer using the SuperCollider programming language (sclang) as a means of practicing digital sound synthesis techniques.
The design focuses on three fundamental components of additive synthesis:

-Oscillator Configuration
The system provides a choice among three canonical oscillator waveforms: sinusoidal, sawtooth, and square. 
The selected oscillator generates a predefined pitch, while a secondary oscillator is automatically tuned one octave higher, 
thereby reinforcing the harmonic structure of the output signal.

-Spectral Shaping via Low-Pass Filtering
Following oscillator selection, users may adjust amplitude levels and apply spectral filtering through a custom low-pass filter module.
The cutoff frequency of this filter can be interactively controlled in real time using mouse-wheel input, thereby enabling continuous timbral modification ranging from attenuated 
(darker) to enhanced (brighter) spectra.

-Low-Frequency Oscillation (LFO) Modulation
To extend the system’s expressive capacity, an additional low-frequency oscillator is integrated.
Users may specify its frequency, expressed in oscillation cycles per second, by providing a numeric input to the parameter freqmodamp. 
This modulation source enables dynamic transformations of the sound over time.

Overall, the project demonstrates a pedagogical approach to synthesizer design by reducing the complexity of a Moog synthesizer to its essential functions, thereby facilitating
a deeper understanding of oscillator behavior, filtering, and modulation within the SuperCollider environment. 
I found the development process both engaging and rewarding, and I intend to expand the system on a larger scale in the future. 
Potential extensions include the implementation of envelope generators for more detailed amplitude shaping, polyphony for multi-voice synthesis, integration of MIDI control
for external hardware interfacing, and the incorporation of additional synthesis techniques such as frequency modulation (FM) or wavetable synthesis.
These developments would not only broaden the sonic palette of the instrument but also provide a richer platform for exploring the principles of computer-based sound synthesis.
