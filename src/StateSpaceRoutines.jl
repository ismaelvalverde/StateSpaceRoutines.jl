module StateSpaceRoutines

    using QuantEcon: solve_discrete_lyapunov
    using Distributions: Distribution, MvNormal, pdf
    using Roots: fzero

    export

        # filters/kalman_filter.jl
        kalman_filter,

        # filters/tempered_particle_filter
        tempered_particle_filter, initialize_state_draws, correction_selection!,
        resample, solve_inefficiency, mutation,

        # smoothers/
        hamilton_smoother, koopman_smoother, koopman_disturbance_smoother, carter_kohn_smoother, durbin_koopman_smoother

    const VERBOSITY = Dict(:none => 0, :low => 1, :high => 2)

    include("filters/kalman_filter.jl")
    include("filters/tempered_particle_filter/resample.jl")
    include("filters/tempered_particle_filter/correction_selection.jl")
    include("filters/tempered_particle_filter/solve_inefficiency.jl")
    include("filters/tempered_particle_filter/mutation.jl")
    include("filters/tempered_particle_filter/tempered_particle_filter.jl")

    include("smoothers/util.jl")
    include("smoothers/hamilton_smoother.jl")
    include("smoothers/koopman_smoother.jl")
    include("smoothers/carter_kohn_smoother.jl")
    include("smoothers/durbin_koopman_smoother.jl")

end
