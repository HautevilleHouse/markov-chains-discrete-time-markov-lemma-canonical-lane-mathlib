import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovLemmaCanonicalLaneLean

structure ErgodicTheoremPackage (P : TransitionMatrixPackage)
    (S : StationaryDistributionPackage P) (M : MarkovLemmaPackage P S) where
  timeAverageConvergence : Prop
  almostSureConvergence : Prop
  stationaryExpectationMatch : Prop
  timeAverageConvergenceTerm : timeAverageConvergence
  almostSureConvergenceTerm : almostSureConvergence
  stationaryExpectationMatchTerm : stationaryExpectationMatch

structure ErgodicTheoremEvidence (P : TransitionMatrixPackage)
    (S : StationaryDistributionPackage P) (M : MarkovLemmaPackage P S)
    (E : ErgodicTheoremPackage P S M) where
  timeAverageConvergenceClosed : E.timeAverageConvergence
  almostSureConvergenceClosed : E.almostSureConvergence
  stationaryExpectationMatchClosed : E.stationaryExpectationMatch

def ErgodicTheoremClosed (P : TransitionMatrixPackage)
    (S : StationaryDistributionPackage P) (M : MarkovLemmaPackage P S)
    (E : ErgodicTheoremPackage P S M) : Prop :=
  E.timeAverageConvergence ∧ E.almostSureConvergence ∧ E.stationaryExpectationMatch

theorem ergodic_theorem_closed_from_evidence (P : TransitionMatrixPackage)
    (S : StationaryDistributionPackage P) (M : MarkovLemmaPackage P S)
    (E : ErgodicTheoremPackage P S M) (Ev : ErgodicTheoremEvidence P S M E) :
    ErgodicTheoremClosed P S M E := by
  exact And.intro Ev.timeAverageConvergenceClosed (And.intro Ev.almostSureConvergenceClosed Ev.stationaryExpectationMatchClosed)

end MarkovChainsDiscreteTimeMarkovLemmaCanonicalLaneLean
end HautevilleHouse