import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovLemmaCanonicalLaneLean

structure TransitionMatrixPackage (S : Type u) [Fintype S] where
  matrix : S → S → ℝ
  nonnegative : ∀ i j, matrix i j ≥ 0
  rowSumOne : ∀ i, ∑ j, matrix i j = 1

theorem transition_matrix_package_valid {S : Type u} [Fintype S] (T : TransitionMatrixPackage S) (i : S) (j : S) : T.matrix i j ≥ 0 := T.nonnegative i j

theorem transition_matrix_row_sum_one {S : Type u} [Fintype S] (T : TransitionMatrixPackage S) (i : S) : ∑ j, T.matrix i j = 1 := T.rowSumOne i

end MarkovChainsDiscreteTimeMarkovLemmaCanonicalLaneLean
end HautevilleHouse