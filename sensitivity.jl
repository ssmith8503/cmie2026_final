include("carbon_model.jl")
include("solver.jl")

function run_model(kas_val, ksd_val)
    # RUN THE MODEL (carbon component)
    function carbon_system_local(C, t)
        Ca = C[1]
        Cs = C[2]
        Cd = C[3]
        dCa = E(t) - kas_val*(Ca - Cs)
        dCs = kas_val*(Ca - Cs) - ksd_val*(Cs - Cd)
        dCd = ksd_val*(Cs - Cd)
        return [dCa, dCs, dCd]
    end

    # params
    C0 = [Ca0, Cs0, Cd0]
    tspan = (0.0, 200.0)
    dt = 1.0
    times, C = rk4_solver(carbon_system_local, C0, tspan, dt)
    return times, C
end

# Sensitivity analysis: atmsphere

function sensitivity_kas(kas_list, ksd_fixed)
    results = Vector{Tuple{Float64, Vector{Float64}, Matrix{Float64}}}()
    for kas_val in kas_list
        t, C = run_model(kas_val, ksd_fixed)
        push!(results, (kas_val, t, C))
    end
    return results
end

# Sensitivity: Surface rate
function sensitivity_ksd(ksd_list, kas_fixed)
    results = Vector{Tuple{Float64, Vector{Float64}, Matrix{Float64}}}()
    for ksd_val in ksd_list
        t, C = run_model(kas_fixed, ksd_val)
        push!(results, (ksd_val, t, C))
    end
    return results
end

function summary_metrics(times, C)
    # give metrics for sensitivity analysis
    Ca = C[1, :]
    peak = maximum(Ca)
    final = Ca[end]
    time_to_peak = times[argmax(Ca)]
    return peak, final, time_to_peak
end

# Monte carlo sims
function monte_carlo_runs(Nruns)
    # taken from hw 5
    tspan = (0.0, 200.0)
    dt = 1.0
    times = collect(tspan[1]:dt:tspan[2])
    ntime = length(times)
    Ca_results = zeros(Nruns, ntime)
    for i = 1:Nruns
        # random perturbation
        kas_rand = kas * (1 + 0.1*randn())
        ksd_rand = ksd * (1 + 0.1*randn())
        function carbon_system_mc(C, t)
            Ca, Cs, Cd = C
            dCa = E(t) - kas_rand*(Ca - Cs)
            dCs = kas_rand*(Ca - Cs) -
                  ksd_rand*(Cs - Cd)
            dCd = ksd_rand*(Cs - Cd)
            return [dCa, dCs, dCd]
        end
        C0 = [Ca0, Cs0, Cd0]
        t, C = rk4_solver(carbon_system_mc,
                          C0,
                          tspan,
                          dt)
        Ca_results[i, :] = C[1, :]
    end
    return times, Ca_results
end

function run_and_summarize(kas_val, ksd_val)
    t, C = run_model(kas_val, ksd_val)
    return summary_metrics(t, C)
end

