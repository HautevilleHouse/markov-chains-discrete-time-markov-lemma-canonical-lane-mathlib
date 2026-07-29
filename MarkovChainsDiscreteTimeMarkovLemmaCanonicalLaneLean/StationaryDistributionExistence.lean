import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovLemmaCanonicalLaneLean

structure StationaryDistributionExistencePackage (M : MarkovChainPackage) where
  stateSpaceFinite : Fintype M.stateSpace
  irreducible : Prop
  aperiodic : Prop
  existsUniqueStationary : Prop
  constructiveStationary : M.stateSpace → ℝ
  constructiveStationaryNonneg : ∀ s, constructiveStationary s ≥ 0
  constructiveStationarySum : ∑' s, constructiveStationary s = 1
  constructiveStationaryInvariant : ∀ s, constructiveStationary s = ∑' t, constructiveStationary t * M.transitionMatrix t s
  existenceProof : irreducible → aperiodic → existsUniqueStationary

structure StationaryDistributionExistenceEvidence {M : MarkovChainPackage}
    (S : StationaryDistributionExistencePackage M) where
  stateSpaceFiniteClosed : Fintype M.stateSpace := S.stateSpaceFinite
  irreducibleClosed : S.irreducible
  aperiodicClosed : S.aperiodic
  existsUniqueStationaryClosed : S.existsUniqueStationary := by
    exact S.existenceProof S.irreducibleClosed S.aperiodicClosed
  constructiveStationaryNonnegClosed : ∀ s, S.constructiveStationary s ≥ 0 := S.constructiveStationaryNonneg
  constructiveStationarySumClosed : ∑' s, S.constructiveStationary s = 1 := S.constructiveStationarySum
  constructiveStationaryInvariantClosed : ∀ s, S.constructiveStationary s = ∑' t, S.constructiveStationary t * M.transitionMatrix t s := S.constructiveStationaryInvariant

def StationaryDistributionExistenceClosed {M : MarkovChainPackage}
    (S : StationaryDistributionExistencePackage M) : Prop :=
  (Fintype M.stateSpace) ∧ S.irreducible ∧ S.aperiodic ∧ S.existsUniqueStationary ∧
  (∀ s, S.constructiveStationary s ≥ 0) ∧ (∑' s, S.constructiveStationary s = 1) ∧
  (∀ s, S.constructiveStationary s = ∑' t, S.constructiveStationary t * M.transitionMatrix t s)

theorem stationary_distribution_existence_closed_from_evidence {M : MarkovChainPackage}
    (S : StationaryDistributionExistencePackage M) (E : StationaryDistributionExistenceEvidence S) :
    StationaryDistributionExistenceClosed S := by
  exact And.intro E.stateSpaceFiniteClosed
    (And.intro E.irreducibleClosed (And.intro E.apenodicClosed
      (And.intro E.existsUniqueStationaryClosed (And.intro E.constructiveStationaryNonnegClosed
        (And.intro E.constructiveStationarySumClosed E.constructiveStationaryInvariantClosed)))))

end MarkovChainsDiscreteTimeMarkovLemmaCanonicalLaneLean
end HautevilleHouse