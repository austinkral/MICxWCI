# A Moving Watercolor Illusion

## Introduction
**The watercolor illusion (WCI)** involves the perception of color where none physically exists.<sup>1,2,3</sup> For example, when white space is bordered by a dark purple outer line with a light orange inner line or fringe, the white space appears tinged by the color of the fringe (Figure 1). The WCI strongly influences perceptual organization and creates a strong figure-ground effect with the WCI regions perceived as figure. First reported by Pinna in 1987, research on the strength, spread, and figure-ground nature of the illusion has been under static conditions.

**The motion-induced contour (MIC)** involves the perception of a contours and surfaces where none physically exist. First reported by Klymenko & Weisstein in 1981, it arises from the horizontal rotation of a partially outlined wireframe cube in space, with the frontmost vertical edge removed, resulting in the perception of an illusory contour in place of the missing vertical edge.4 A simpler MIC stimulus using only two chevrons corresponding to the two closest edges of the cube (Figure 2) results in the perception two moving surfaces confined by the MIC at one end and illusory edges at the other.

<figure>
	<img src="/figures/figure1.png" alt="Figure 1: The watercolor illusion (left) and motion-induced contour (right)" style="height: auto; width: 100%;"/>
	<figcaption><p align="center"><em>Figure 1: The watercolor illusion (left) and motion-induced contour (right).</em></p><br/></figcaption>
</figure>

## Purpose
To determine whether the WCI occurs in spatiotemporally dynamic stimuli. MIC stimuli seemed like natural candidates for probing the limits of the watercolor illusion as they exhibit both real and illusory edges and inferred surfaces.

Two experiments were run to test the magnitude and spatial expanse of the WCI applied to MIC under both moving (Experiment 1a, N=20) and static (Experiment 1b, N=20) conditions. 

**Questions:**

1. Would motion constrain or enhance the WCI?

2. How might placement of fringe both inside and outside MIC stimuli influence the spatial expanse of the WCI, considering placement inside does in 3-D appearing static stimuli?<sup>5</sup>

<figure>
	<img src="/figures/figure2.png" alt="Figure 2: Seven stimuli displayed in Experiments 1a and 1b" style="height: auto; width: 100%;"/>
	<figcaption><p align="center"><em>Figure 2: Seven stimuli displayed in Experiments 1a and 1b.</em></p><br/></figcaption>
</figure>

## Methodology
Both studies consisted of two parts, neither of which had time constraints:

1. **Magnitude Estimation:** First, subjects viewed each of the seven stimuli three times each in random order and rated the magnitude of the illusory color in each display on a 7-point scale. Averages were taken from participants’ second and third ratings. 

2. **Handwritten Shading Measure:** Second, subjects viewed each of the seven stimuli once more, this time with the rating scales removed. Upon display of each stimulus, subjects were handed a white card with a black outline of the stimulus pictured on it and were instructed to shade in by hand any areas on the card which corresponded to regions of the on-screen stimulus where illusory color was perceived. This measure informed us about the perceived spatial expanse of the WCI.

<figure>
	<img src="/figures/figure3.png" alt="Figure 3: Example of rating scale display (left) and shading card (right)" style="height: auto; width: 100%;"/>
	<figcaption><p align="center"><em>Figure 3: Example of rating scale display (left) and shading card (right).</em></p><br/></figcaption>
</figure>

## Results
A 2 (display type: moving vs. static) x 7 (stimulus) two-way mixed ANOVA on WCI magnitude estimates treating stimulus as a within-subject variable and display type as a between-subjects variable found no significant main effects or interaction indicating motion had no effect on the magnitude of the WCI.

<figure>
	<img src="/figures/figure4.png" alt="Figure 4: Average WCI magnitude ratings for moving and static conditions (error bars = 95% CI)" style="height: auto; width: 100%;"/>
	<figcaption><p align="center"><em>Figure 4: Average WCI magnitude ratings for moving and static conditions (error bars = 95% CI).</em></p><br/></figcaption>
</figure>

<figure>
	<img src="/figures/figure5.png" alt="Figure 5: Heat maps where saturation represents the proportion of participants who reported illusory color in that region" style="height: auto; width: 100%;"/>
	<figcaption><p align="center"><em>Figure 5: Heat maps where saturation represents the proportion of participants who reported illusory color in that region.</em></p><br/></figcaption>
</figure>

## Discussion
1. **Would motion constrain or enhance the WCI?**

   a. Motion had no influence on WCI magnitude and a negligible influence on its spatial expanse as shown in Figure 5.

2. **How might placement of fringe both inside and outside MIC stimuli influence the spatial expanse of the WCI?**

   a. Placement of incomplete fringe inside the MIC stimuli (e.g., stimuli 3 & 4) influenced the spatial expanse of the WCI like Hale & Brown (2021), creating an illusory colored edge containing the WCI between the incomplete fringe.

   b. Placement of fringe by itself outside the MIC stimuli (e.g., stimuli 5-7) resulted in the discovery of * **a new type of WCI effect with color spreading in regions bounded only by the color fringe** *.

The results related to fringe placement outside the MIC stimuli are surprising. It was not certain that the strength of the inferred surfaces in the MIC would be sufficient to enable the WCI to appear in regions lacking the contrasting border and inner fringe thought necessary to induce the illusion (e.g., stimuli 5-7). It remains to be shown which feature or features of the present stimuli explain the phenomenology reported. Most importantly, what implications does this have for current models of boundary and surface formation?

Recent work by Cohen-Duwek and Spitzer suggests that oriented double-opponent receptive fields (RFs) receive chromatic input from opponent RFs, yielding spatio-oriented-chromatic edge detectors in the early stages of visual processing which set the stage for the assimilative processes occurrent in the chromatic WCI.<sup>6</sup> While their model has been shown to be highly effective at predicting the phenomenology of color filling-in in the standard case (contrasting border and inner fringe), it is unclear whether it is sufficient to explain the filling-in of regions bounded by fringe but lacking a contrasting border. It is likely that global context, particularly the coincidence of the isolated fringe with the MIC edges, plays a central role. If this is the case, altering the rotation direction and orientation of the isolated fringe might inhibit or eliminate this effect.

## References and Acknowledgments
Thanks to:
- <a href="https://jov.arvojournals.org/article.aspx?articleid=2720950" target="_blank">Gennady Erlikhman and Gideon P. Caplovitz (2019)</a> for sharing the source code for their MATLAB implementation of MIC stimuli.<sup>7</sup>
- <a href="https://sudhan.dev/" target="_blank">Sudhan Chitgopkar</a> for introducing me to <a href="https://processing.org/" target="_blank">Processing</a> and for help in troubleshooting.

1. Pinna, B. (1987). Un effetto di colorazione. In V. Majer, M. Maeran, and M. Santinello, Il laboratorio e la città. XXI Congresso degli Psicologi Italiani, 158.
2. Pinna, B., Brelstaff, G., & Spillman, L. (2001). <a href="https://www.sciencedirect.com/science/article/pii/S0042698901001055" target="_blank">Surface color from boundaries: a new “watercolor” illusion</a>. Vision Research, 41, 2669-2676.
3. Broerse, J.; O'Shea, R. P. (1995). <a href="https://www.sciencedirect.com/science/article/pii/0042698994001315" target="_blank">Local and global factors in spatially-contingent coloured aftereffects</a>. Vision Research. 35 (2): 207–226.
4. Klymenko, V., & Weisstein, N. (1981). <a href="https://journals.sagepub.com/doi/10.1068/p100627" target="_blank">The motion-induced contour</a>. Perception, 10, 627–636.
5. Hale, R. G., & Brown, J. M. (2021). <a href="https://link.springer.com/article/10.3758/s13414-021-02306-0" target="_blank">Influence of context on spatial expanse of color spreading in the watercolor illusion</a>. Attention, Perception, & Psychophysics, 83(8), 3201-3215. 
6. Cohen-Duwek, H. & Spitzer, H. (2019). <a href="https://www.frontiersin.org/articles/10.3389/fnins.2019.00225/full" target="_blank">A compound computational model for filling-in processes triggered by edges: watercolor illusions</a>. Frontiers in Neuroscience, 13, Article 225.
7. Erlikhman, G., Fu, M., Dodd, M. D., & Caplovitz, G. P. (2019). <a href="https://jov.arvojournals.org/article.aspx?articleid=2720950" target="_blank">The motion-induced contour revisited: Observations on 3-D structure and illusory contour formation in moving stimuli</a>. Journal of Vision, 19(1), 1-17.