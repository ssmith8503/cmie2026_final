

# Euler
function euler_solver(f, C0, tspan, dt)
    # taken from hw8
    t0, tf = tspan
    times = collect(t0:dt:tf)
    n = length(times)
    C = zeros(length(C0), n)
    C[:,1] = C0

    for i = 1:n-1
        t = times[i]
        C[:,i+1] = C[:,i] + dt .* f(C[:,i], t)

    end
    return times, C
end

# RK4
function rk4_solver(f, C0, tspan, dt)
    # taken from hw8
    t0, tf = tspan
    times = collect(t0:dt:tf)
    n = length(times)
    C = zeros(length(C0), n)
    C[:,1] = C0

    for i = 1:n-1
        t = times[i]
        k1 = f(C[:,i], t)
        k2 = f(C[:,i] + 0.5*dt .* k1,
               t + 0.5*dt)
        k3 = f(C[:,i] + 0.5*dt .* k2,
               t + 0.5*dt)
        k4 = f(C[:,i] + dt .* k3,
               t + dt)
        C[:,i+1] = C[:,i] + (dt/6.0) .* (k1 + 2k2 + 2k3 + k4)
    end
    return times, C
end