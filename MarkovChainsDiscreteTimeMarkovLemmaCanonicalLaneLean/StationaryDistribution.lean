import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovLemmaCanonicalLaneLean

structure StationaryDistributionPackage {S : StateSpacePackage} {T : TransitionKernelPackage S}
    (M : DiscreteTimeMarkovChain S T) where
  stationaryMeasure : S.stateType → ℝ
  nonnegative : ∀ i, stationaryMeasure i ≥ 0
  sumOne : ∑' i, stationaryMeasure i = 1
  invariance : ∀ j : S.stateType, stationaryMeasure j = ∑' i, stationaryMeasure i * T.transitionMatrix i j
  nonnegativeTerm : ∀ i, stationaryMeasure i ≥ 0
  sumOneTerm : ∑' i, stationaryMeasure i = 1
  invarianceTerm : ∀ j : S.stateType, stationaryMeasure j = ∑' i, stationaryMeasure i * T.transitionMatrix i j

def StationaryDistributionClosed {S : StateSpacePackage} {T : TransitionKernelPackage S}
    {M : DiscreteTimeMarkovChain S T} (P : StationaryDistributionPackage M) : Prop :=
  (∀ i, P.stationaryMeasure i ≥ 0) ∧ (∑' i, P.stationaryMeasure i = 1) ∧
  (∀ j : S.stateType, P.stationaryMeasure j = ∑' i, P.stationaryMeasure i * T.transitionMatrix i j)

theorem stationary_distribution_closed_from_evidence
    {S : StateSpacePackage} {T : TransitionKernelPackage S}
    {M : DiscreteTimeMarkovChain S T} (P : StationaryDistributionPackage M) :
    StationaryDistributionClosed P :=
  And.intro P.nonnegativeTerm (And.intro P.sumOneTerm P.invarianceTerm)

end MarkovChainsDiscreteTimeMarkovLemmaCanonicalLaneLean
end HautevilleHouse