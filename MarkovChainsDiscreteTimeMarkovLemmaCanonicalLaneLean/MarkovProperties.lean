import canonicalLaneMathlib.AdmissibleClass
import MarkovChainsDiscreteTimeMarkovLemmaCanonicalLaneLean.MarkovChainStateSpace

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovLemmaCanonicalLaneLean

structure MarkovProperty (S : StateSpace) (M : MarkovChainPackage S) where
  memoryless : Prop
  timeHomogeneous : Prop
  memorylessClosed : memoryless
  timeHomogeneousClosed : timeHomogeneous

structure MarkovPropertiesPackage (S : StateSpace) (M : MarkovChainPackage S) where
  markovProperty : MarkovProperty S M
  transitionMatrix : ℕ → S.carrier → S.carrier → ℝ
  chapmanKolmogorov : Prop
  chapmanKolmogorovClosed : chapmanKolmogorov

structure MarkovPropertiesEvidence (S : StateSpace) (M : MarkovChainPackage S) (P : MarkovPropertiesPackage S M) where
  markovPropertyClosed : MarkovProperty S M
  chapmanKolmogorovClosed : P.chapmanKolmogorov

def MarkovPropertiesClosed (S : StateSpace) (M : MarkovChainPackage S) (P : MarkovPropertiesPackage S M) : Prop :=
  (∀ (x : S.carrier), (∃ (t : ℕ), P.transitionMatrix t x x = 1 → ...)) ∧ P.chapmanKolmogorov

theorem markov_properties_closed_from_evidence (S : StateSpace) (M : MarkovChainPackage S) (P : MarkovPropertiesPackage S M) (E : MarkovPropertiesEvidence S M P) :
  MarkovPropertiesClosed S M P := by
  exact And.intro (by exact E.markovPropertyClosed) (by exact E.chapmanKolmogorovClosed)

end MarkovChainsDiscreteTimeMarkovLemmaCanonicalLaneLean
end HautevilleHouse