import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovLemmaCanonicalLaneLean

structure StateSpace where
  carrier : Type u
  countable : Prop

def finiteOrCountable (S : StateSpace) : Prop :=
  S.countable

structure TransitionKernel (S : StateSpace) where
  p : S.carrier → S.carrier → ℝ
  nonneg : ∀ x y, 0 ≤ p x y
  sumsToOne : ∀ x, ∑' (y : S.carrier), p x y = 1

structure MarkovChainPackage (S : StateSpace) where
  kernel : TransitionKernel S
  initialDistribution : S.carrier → ℝ
  initialNonneg : ∀ x, 0 ≤ initialDistribution x
  initialSumsToOne : ∑' (x : S.carrier), initialDistribution x = 1

structure StateSpaceEvidence (S : StateSpace) where
  countableClosed : S.countable

def StateSpaceClosed (S : StateSpace) : Prop :=
  S.countable

theorem state_space_closed_from_evidence (S : StateSpace) (E : StateSpaceEvidence S) :
  StateSpaceClosed S := E.countableClosed

end MarkovChainsDiscreteTimeMarkovLemmaCanonicalLaneLean
end HautevilleHouse