import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovLemmaCanonicalLaneLean

structure MarkovAdmittedObject where
  stateSpace : Type u
  transitionKernel : stateSpace → stateSpace → ℝ
  isStochastic : ∀ s, (∑' t, transitionKernel s t) = 1 ∧ transitionKernel s t ≥ 0
  initialDistribution : stateSpace → ℝ
  initialIsProb : (∑' s, initialDistribution s) = 1 ∧ initialDistribution s ≥ 0
  conclusion : Prop

structure AdmissibleClass where
  object : MarkovAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  MarkovWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end MarkovChainsDiscreteTimeMarkovLemmaCanonicalLaneLean
end HautevilleHouse