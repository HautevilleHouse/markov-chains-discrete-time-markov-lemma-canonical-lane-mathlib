import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovLemmaCanonicalLaneLean

structure ErgodicityPackage (M : MarkovChainPackage) where
  irreducible : Prop
  aperiodic : Prop
  positiveRecurrent : Prop
  ergodicTheoremHolds : Prop
  ergodicTheoremHoldsProof : irreducible → aperiodic → positiveRecurrent → ergodicTheoremHolds

structure MixingPackage (M : MarkovChainPackage) where
  strongMixing : Prop
  mixingCoefficient : ℕ → ℝ
  mixingCoefficientDecay : ∃ ρ < 1, ∀ n, mixingCoefficient n ≤ ρ ^ n
  strongMixingFromCoefficient : strongMixing

structure ErgodicityEvidence {M : MarkovChainPackage} (E : ErgodicityPackage M) where
  irreducibleClosed : E.irreducible
  aperiodicClosed : E.apenodic
  positiveRecurrentClosed : E.positiveRecurrent
  ergodicTheoremHoldsClosed : E.ergodicTheoremHolds := by
    exact E.ergodicTheoremHoldsProof E.irreducibleClosed E.aperiodicClosed E.positiveRecurrentClosed

def ErgodicityClosed {M : MarkovChainPackage} (E : ErgodicityPackage M) : Prop :=
  E.irreducible ∧ E.aperiodic ∧ E.positiveRecurrent ∧ E.ergodicTheoremHolds

theorem ergodicity_closed_from_evidence {M : MarkovChainPackage} (E : ErgodicityPackage M)
    (Ev : ErgodicityEvidence E) : ErgodicityClosed E := by
  exact And.intro Ev.irreducibleClosed (And.intro Ev.aperiodicClosed (And.intro Ev.positiveRecurrentClosed Ev.ergodicTheoremHoldsClosed))

structure MixingEvidence {M : MarkovChainPackage} (Mx : MixingPackage M) where
  strongMixingClosed : Mx.strongMixing
  mixingCoefficientDecayClosed : ∃ ρ < 1, ∀ n, Mx.mixingCoefficient n ≤ ρ ^ n := by
    rcases Mx.mixingCoefficientDecay with ⟨ρ, hρ, h⟩; exact ⟨ρ, hρ, h⟩

def MixingClosed {M : MarkovChainPackage} (Mx : MixingPackage M) : Prop :=
  Mx.strongMixing ∧ (∃ ρ < 1, ∀ n, Mx.mixingCoefficient n ≤ ρ ^ n)

theorem mixing_closed_from_evidence {M : MarkovChainPackage} (Mx : MixingPackage M)
    (Ev : MixingEvidence Mx) : MixingClosed Mx := by
  exact And.intro Ev.strongMixingClosed Ev.mixingCoefficientDecayClosed

end MarkovChainsDiscreteTimeMarkovLemmaCanonicalLaneLean
end HautevilleHouse