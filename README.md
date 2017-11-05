<div dir="ltr">
<div>This is the matlab code I wrote for my Bachelor Thesis (Musical Pitch Detection). Previously, I uploaded it on mathworks website and now it is exactly on github.</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div><a href="https://sites.google.com/site/amirsoleimanibajestani/project/pitch-detection/GUI.jpg?attredirects=0"><img src="https://sites.google.com/site/amirsoleimanibajestani/_/rsrc/1405843402880/project/pitch-detection/GUI.jpg?height=257&amp;width=320" alt="" width="320" height="257" border="0" /></a></div>
</div>
<div dir="ltr">&nbsp;</div>
<p>Musical Pitch or Pitch is something like as "C C# D Eb ..." determined by the first peak of a sound in the frequency domain. Most of the time, the first peak is the highest one, so it is easy to recognize by just finding the maximum of the signal (<em>max(abs(fft(signal)))</em>). But in some instrument such as Violin, Cello, <a href="http://en.wikipedia.org/wiki/Kamancheh" rel="nofollow">Kamancheh</a>, etc the first peak is not always the highest one. Therefore, another method must be used. This phenomenon is one of the reasons for the hardship of playing violin (your ears cannot recognize the first peak very easily too).</p>
<div>I applied an intelligent method to find musical pitches. I recorded some sounds from Violin, Ney and Kamancheh (two Iranian Music Instruments) . Then by sampling and dividing samples into regions with and without peaks, I trained a neural network to recognize peaks. After that I devised a plan to check Harmonics to find the first peak.</div>
<div>It seems that by this method, we can determine all other peaks and use in other applications.</div>
<div>Although, there are other methods but I think this is fast enough, easy and trainable!</div>
<div>Frequency domain of a sample of simple instrument like Ney</div>
<div>&nbsp;<a href="https://sites.google.com/site/amirsoleimanibajestani/project/pitch-detection/Ney.png?attredirects=0"><img src="https://sites.google.com/site/amirsoleimanibajestani/_/rsrc/1405843402880/project/pitch-detection/Ney.png?height=176&amp;width=200" alt="" width="200" height="176" border="0" /></a></div>
<div>
<div>Frequency domain of a sample of non-simple instrument&nbsp;like Kamancheh</div>
<div><a href="https://sites.google.com/site/amirsoleimanibajestani/project/pitch-detection/kamancheh.png?attredirects=0"><img src="https://sites.google.com/site/amirsoleimanibajestani/_/rsrc/1405843402880/project/pitch-detection/kamancheh.png?height=173&amp;width=200" alt="" width="200" height="173" border="0" /></a></div>
Samples with and without peak:</div>
<div>&nbsp;<a href="https://sites.google.com/site/amirsoleimanibajestani/project/pitch-detection/peak.png?attredirects=0"><img src="https://sites.google.com/site/amirsoleimanibajestani/_/rsrc/1405843402880/project/pitch-detection/peak.png?height=204&amp;width=320" alt="" width="320" height="204" border="0" /></a> <a href="https://sites.google.com/site/amirsoleimanibajestani/project/pitch-detection/nonpeak.png?attredirects=0"><img src="https://sites.google.com/site/amirsoleimanibajestani/_/rsrc/1405843402880/project/pitch-detection/nonpeak.png?height=204&amp;width=320" alt="" width="320" height="204" border="0" /></a></div>
<div>You can find some of my data&nbsp;here: <a href="https://sites.google.com/site/amirsoleimanibajestani/project/pitch-detection">https://sites.google.com/site/amirsoleimanibajestani/project/pitch-detection</a></div>
<div>&nbsp;</div>
<h4><strong>How To Run</strong></h4>
<p>Download all files or just zip file. Extract. In their directory:<br />to run, type in command window: pitch&nbsp;<br />(don't run the GUI file)</p>
