# The watercolor illusion applied to motion-induced illusory contours

## Background
The watercolor illusion (WCI) causes a non-colored area enclosed by a contrasting border and inner fringe to appear slightly tinged by the color of the inner fringe and was first demonstrated by Pinna et al. in their paper “Surface color from boundaries: A new watercolor illusion” (2001).

<img src="/images/WCI.png" alt="Watercolor illusion example" style="height: auto; width: 50%;"/>

The motion-induced illusory contour arises from the horizontal rotation of a partially outlined wireframe cube in space, with the frontmost vertical edge removed. This phenomenon was first observed by Weisstein and Klymenko in their paper “The motion-induced contour” (1981).

<img src="/images/MIC.png" alt="Motion-induced illusory contour example" style="height: auto; width: 50%;"/>

## Methods
For the present study, motion-induced illusory contour animations were created using <a href="https://processing.org/" target="_blank">Processing 5</a>, an OpenGL-compatible graphics package for the Java programming language. The partial wireframe cubes were rendered in purple and displayed on a white background. An inset orange fringe was added to test whether the WCI would still be induced in moving stimuli. The partial cubes are then rotated back and forth within a forty-six-degree range across the XY-plane. Each test case will be displayed to research subjects for a fixed duration, all of whom will be vision tested to verify they have normal or corrected-to-normal vision and normal color vision. Subjects will then be asked to indicate whether or not the stimulus appeared tinged to them and, if so, rate the intensity of the perceived color on a 7-point scale. In trials where color spreading is present, they will also be asked to indicate what the boundaries of the tinged region were.

## Expected Results

<figure>
	<img src="/images/renderPlain.gif" alt="Figure 1: MIC vs. MIC + WCI" style="height: auto; width: 100%;"/>
	<figcaption>Figure 1: MIC vs. MIC + WCI<br/></figcaption>
</figure>


The combination of the motion-induced illusory contour with the watercolor illusion demonstrates for the first time that the color spreading induced by the WCI can be replicated in moving stimuli, thus proving that it is spatiotemporally dynamic (Figure 1). Furthermore, the striped test case (depicted below) demonstrates two kinds of illusory edges, the first formed at the frontmost “corner” and induced by motion, and the second formed by the premature termination of the orange fringe (Figure 2). The latter result is consistent with static results obtained by Hale and Brown (2021), further supporting the conclusion that the WCI is spatiotemporally dynamic.

<figure>
	<img src="/images/renderStripes.gif" alt="Figure 2: MIC + WCI stripes" style="height: auto; width: 100%;"/>
	<figcaption>Figure 2: MIC + partial WCI</figcaption>
</figure>


More unexpectedly, color spreading persists when the orange fringe is extended beyond the bounds of the purple edges. Typically, color spreading as a result of the WCI is limited to areas immediately bounded by a contrasting border and fringe, suggesting that color filling-in should not be observed past the termination of the purple border. One possible explanation for the phenomenology referenced above is offered by Grossberg’s FACADE model of figure-ground perception (Grossberg 1994), which postulates a boundary contour system (BCS), a motion boundary contour system (MBCS), and a feature contour system (FCS) that all work in tandem to produce coherent perceptions of 3-D objects. In the example below, it is possible that interactions between the MBCS and FCS cause the perception of a continuous surface extending beyond the purple edges, thus providing another mechanism (beyond the WCI) by which color spreading may occur.

<figure>
	<img src="/images/renderOverhang.gif" alt="Figure 3: MIC + WCI overhang" style="height: auto; width: 100%;"/>
	<figcaption>Figure 3: MIC + overhanging WCI</figcaption>
</figure>

## References
1. Erlikhman, G., Fu, M., Dodd, M. D., & Caplovitz, G. P. (2019). The motion-induced contour revisited: Observations on 3-D structure and illusory contour formation in moving stimuli. Journal of Vision, 19(1), 1-17.
2. Grossberg, S. (1994). 3-D vision and figure-ground separation by visual cortex. Perception & Psychophysics, 55(1), 48-120.
3. Hale, R. G., & Brown, J. M. (2021). Influence of context on spatial expanse of color spreading in the watercolor illusion. Atten Percept Psychophys, 83(8), 3201-3215.
4. Kellman, P. J. Visual perception of objects and boundaries: A four-dimensional approach. (2003). In Perceptual organization in vision: Behavioral and neural perspectives, 155–204.
5. Klymenko, V., & Weisstein, N. (1981). The motion-induced contour. Perception, 10, 627-636.
6. Klymenko, V., & Weisstein, N. (1983). The edge of an event: Invariants of a moving illusory contour. Perception & Psychophysics, 34(2), 140-148.
7. Pinna, B., Brelstaff, G., & Spillman, L. (2001). Surface color from boundaries: a new “watercolor” illusion. Vision Research, 41, 2669-2676.
8. Pinna, B., & Grossberg, S. (2005). The watercolor illusion and neon color spreading: a unified analysis of new cases and neural mechanisms. J. Opt. Soc. A., 22(10), 2207-2221.
9. Yin, C., Kellman, P. J., & Shipley, T. F. (2000). Surface integration influences depth discrimination. Vision Research, 40, 1969-1978.

## Acknowledgments
Thanks to:
- <a href="https://jov.arvojournals.org/article.aspx?articleid=2720950" target="_blank">Gennady Erlikhman and Gideon P. Caplovitz (2019)</a> for allowing me to reference the source code for their MATLAB implementation of MIC stimuli.
- <a href="https://sudhan.dev/" target="_blank">Sudhan Chitgopkar</a> for introducing me to <a href="https://processing.org/" target="_blank">Processing</a> and for help in troubleshooting.