# Paramters
# NOAA k.... .39 * U10^2 , div by solubility and mixed layer depth
const kas = 0.0054     # atmosphere-surface exchange
const ksd = 0.02      # surface-deep exchange

# Sarmiento & Gruber 2006 vvv
const Ca0 = 589.0     # GtC atmosphere
const Cs0 = 900.0     # GtC  surface ocean
const Cd0 = 38000.0   # GtC deep ocean

# Friedlingstein et al. (2023),
const E0 = 5 # GtC/yr # according to 1958 estimate
const g = 0.008

const k_damp = 0.01 # atm sink

function E(t)
    return E0 * exp(g*(t))
end

# Carbon cycle ODE
function carbon_system(C, t)

    Ca, Cs, Cd = C

    # fluxes - taken from NOAA
    F_as = kas * (Ca - Cs)
    F_sd = ksd * (Cs - Cd)

    # atmosphere (state var 1) from Sarmiento 1986
    # added damping because the results were way too high
    dCa = E(t) - F_as - k_damp * (Ca - 589.0)

    # surface ocean (var 2)
    dCs = F_as - F_sd

    # deep ocean (var 3)
    dCd = F_sd

    return [dCa, dCs, dCd]
end