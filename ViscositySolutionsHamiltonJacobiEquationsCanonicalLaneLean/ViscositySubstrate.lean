import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic
import Mathlib.Analysis.Calculus.Deriv

namespace HautevilleHouse
namespace ViscositySolutionsHamiltonJacobiEquationsCanonicalLaneLean

abbrev Space (n : ℕ) := Fin n → ℝ
abbrev Time := ℝ
abbrev ScalarField (n : ℕ) := Time → Space n → ℝ
typealias Hamiltonian (n : ℕ) = Space n → (Space n → ℝ) → ℝ

structure HJBSolution (n : ℕ) where
  u : ScalarField n
  H : Hamiltonian n
  initialCond : ℝ

def zeroScalarField (n : ℕ) : ScalarField n := fun _ _ => 0

structure ViscosityOperators (n : ℕ) where
  superjet : ScalarField n → Time → Space n → Set (ℝ × Space n)
  subjet : ScalarField n → Time → Space n → Set (ℝ × Space n)
  hamiltonianEval : Hamiltonian n
  superjetConsistent : ∀ (u : ScalarField n) (t : Time) (x : Space n), (u t x) = 0  -- placeholder

structure ViscosityFlow (n : ℕ) where
  u : ScalarField n
  H : Hamiltonian n
  operators : ViscosityOperators n
  viscosityParam : ℝ

end HautevilleHouse
end ViscositySolutionsHamiltonJacobiEquationsCanonicalLaneLean
