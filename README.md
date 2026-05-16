# cmie2026_final
https://github.com/ssmith8503/cmie2026_final 

## Performance of a Simplified Three-Box Carbon Cycle Model
*Introduction*
This model is a simplified three-box carbon cycle representation based on the framework of Sarmiento & Toggweiler (1984) [1], representing exchanges between the atmosphere, surface ocean, and deep ocean carbon reservoirs. The model is solved using both a Euler method and a fourth-order Runge–Kutta (RK4) scheme to approximate the ordinary differential equations. The model uses three state variables for the carbon inventories (in GtC) in each reservoir, initialized using values consistent with Sarmiento & Gruber (2006) [2]. The air–sea carbon exchange in the model is based on the flux formula described by Feely et al. (2001), where CO2 flux is proportional to the product of gas transfer velocity, solubility, and the air–sea partial pressure difference (F = k · s · ΔpCO₂). In reduced box-model formulations, this physics is aggregated into an effective linear exchange coefficient kas​, which represents wind-driven gas transfer and solubility effects. Using the wind-dependent gas transfer formulation of Wanninkhof (1992, 2014), a representative global mean wind speed of U10=6.64 m s−1 yields a gas transfer velocity of k=12.0. Converting this into a box-model exchange coefficient through solubility and mixed-layer depth scaling gives an effective atmospheric–surface exchange rate of 0.0054. Anthropogenic emissions are imposed as an external forcing term following a simple exponential growth model. The emissions are calibrated to early industrial-era fossil fuel emissions with E0=5 GtC/yr and growth rate g=0.008g [3]. To represent additional terrestrial uptake and slow geochemical sinks, a linear damping term is included.


*Results*
The model reproduces expected qualitative dynamics of a three-box carbon system, including gradual atmospheric CO2 accumulation, early adjustment response from the surface ocean, and deep ocean descent. However, the magnitude of carbon redistribution across reservoirs is larger than observed in standard box-model formulations, suggesting sensitivity to parameter scaling and flux coefficient calibration. The model yields a final atmospheric concentration of approximately 2947.8 ppm after 200 years, which is substantially higher than present-day values and consistent with long-horizon high-emission projections around ~2000 ppm by 2250 [4]. Overall, the results capture the general expected behavior of carbon transfer among reservoirs but highlight the limitations of simplified exchange representations for carbon modeling. This model did not employ nonlinear ocean uptake processes, biological pumps, and temperature-dependent solubility effects. 


*Sensitivity Analysis*
Sensitivity analysis shows that increasing the atmosphere–surface ocean exchange coefficient kas​ produces a smooth, exponential-like decline in peak atmospheric CO₂, reflecting more efficient transfer of carbon from the atmosphere into the surface ocean as gas exchange increases. In contrast, the surface–deep ocean exchange ksd peaks in atmospheric CO₂ initially increases slightly and reaches a maximum around ksd=0.03, before decreasing exponentially for larger values. This sharpness suggests sensitivity to parameter scaling and the limitations of representing complex ocean circulation processes using a single linear exchange coefficient. 


*Monte Carlo Simulations*
The Monte Carlo ensemble of 100 perturbed simulations exhibits increasing spread over time, with initially tight confidence intervals that widen to approximately 500–1000 GtC by the end of the 200-year simulation. This behavior suggests that uncertainty propagates through time in this model, though the stabilizing exchange processes between reservoirs may be keeping the uncertainties bounded.

 
*Conclusion*
The 3-box carbon model in this study generally reproduces expected qualitative carbon redistribution under increasing emissions, though atmospheric CO₂ is overestimated relative to standard benchmarks. Sensitivity analysis shows strong dependence on exchange parameters, and Monte Carlo simulations indicate bounded but increasing uncertainty over time due to parameter variability. Overall, the model is a good starting point, but is limited by its simplified structure, which omits nonlinear ocean uptake, biological pump processes, and temperature-dependent solubility effects. Additionally, the coefficients used in the model were global averages (such as wind speed and ocean salinity). Modern carbon models often employ 15 or more state variables to help capture these complex relationships, including carbonate biogeochemical reactions, phytoplankton photosynthesis, and carbon isotopes [5]. In future studies, these model improvements should be explored to help create more realistic carbon forecasts.

[1] Sarmiento, J. L., & Toggweiler, J. R. (1984). A new model for the role of the oceans in determining atmospheric PCO₂. Nature, 308(5960), 621–624. https://doi.org/10.1038/308621a0
[2] Feely, R. A., Sabine, C. L., Takahashi, T., & Wanninkhof, R. (2001). Uptake and storage of carbon dioxide in the oceans: The global CO₂ survey. Oceanography, 14(4), 18–32. https://www.pmel.noaa.gov/pubs/outstand/feel2331/maps.shtml
[3] Friedlingstein, P., O’Sullivan, M., Jones, M. W., Andrew, R. M., et al. (2023). Global carbon budget 2023. Earth System Science Data, 15, 5301–5369. https://essd.copernicus.org/articles/15/5301/2023/ 
[4] Yale Environment 360. (2023). How the world passed a carbon threshold of 400 ppm—and why it matters. https://e360.yale.edu/features/how-the-world-passed-a-carbon-threshold-400ppm-and-why-it-matters
[5] National Oceanography Centre (NOC). (n.d.). Carbon model details documentation. https://projects.noc.ac.uk/jmodels/documentation/carbon-model/carbon-model-details





