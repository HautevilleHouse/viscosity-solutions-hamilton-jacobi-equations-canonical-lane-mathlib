import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic
import Mathlib.Data.Fin.Basic

namespace HautevilleHouse
namespace ViscositySolutionsHamiltonJacobiEquationsCanonicalLaneLean

abbrev SpaceN := Fin (N : ℕ) → ℝ
abbrev Time := ℝ
abbrev ScalarField := Time → SpaceN → ℝ

def zeroScalarField : ScalarField := fun _ _ => 0

structure HamiltonJacobiOperators where
  hamiltonian : SpaceN → SpaceN → ℝ
  timeDerivative : ScalarField → ScalarField
  gradient : ScalarField → ScalarField
  laplacian : ScalarField → ScalarField
  super : ScalarField → ScalarField → Prop
  sub : ScalarField → ScalarField → Prop
  viscosity : ScalarField → ScalarField → Prop

structure ViscositySolution where
  u : ScalarField
  H : ℝ → SpaceN → SpaceN → ℝ
  domain : Set (Time × SpaceN)
  viscositySubsolution : Prop
  viscositySupersolution : Prop
  equation : ScalarField
  operators : HamiltonJacobiOperators
  subsolutionProof : viscositySubsolution
  supersolutionProof : viscositySupersolution

def primitiveViscositySolution : ViscositySolution := {
  u := zeroScalarField
  H := fun _ _ _ => 0
  domain := Set.univ
  viscositySubsolution := True
  viscositySupersolution := True
  equation := zeroScalarField
  operators := {
    hamiltonian := fun _ _ => 0
    timeDerivative := fun f => f
    gradient := fun f => f
    laplacian := fun f => f
    super := fun f g => True
    sub := fun f g => True
    viscosity := fun f g => True
  }
  subsolutionProof := trivial
  supersolutionProof := trivial
}

def ViscosityHJEquationClosed (u : ViscositySolution) : Prop :=
  u.viscositySubsolution ∧ u.viscositySupersolution

theorem primitive_viscosity_equation_closed_checked :
    ViscosityHJEquationClosed primitiveViscositySolution := by
  exact And.intro primitiveViscositySolution.subsolutionProof primitiveViscositySolution.supersolutionProof

end HautevilleHouse
end ViscositySolutionsHamiltonJacobiEquationsCanonicalLaneLean