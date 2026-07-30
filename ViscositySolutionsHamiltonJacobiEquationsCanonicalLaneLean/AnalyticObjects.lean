import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace ViscositySolutionsHamiltonJacobiEquationsCanonicalLaneLean

abbrev SpaceN := Fin 3 → ℝ
abbrev Time := ℝ
abbrev ScalarField := Time → SpaceN → ℝ

def zeroScalarField : ScalarField := fun _ _ => 0

structure HamiltonJacobiOperators where
  hamiltonian : ScalarField → SpaceN → ℝ → ℝ
  timeDerivative : ScalarField → ScalarField
  gradient : ScalarField → SpaceN → SpaceN
  laplacian : ScalarField → ScalarField

def primitiveOperators : HamiltonJacobiOperators := {
  hamiltonian := fun _ _ _ => 0
  timeDerivative := fun _ => zeroScalarField
  gradient := fun _ _ => 0
  laplacian := fun _ => zeroScalarField
}

structure ViscositySolution where
  u : ScalarField
  operators : HamiltonJacobiOperators
  isViscositySolution : Prop
  isContinuous : Prop

def primitiveSolution : ViscositySolution := {
  u := zeroScalarField
  operators := primitiveOperators
  isViscositySolution := True
  isContinuous := True
}

def HJEquation (H : HamiltonJacobiOperators) (u : ScalarField) : Prop :=
  H.timeDerivative u = fun t x => H.hamiltonian u t x

def ViscositySubsolution (u : ViscositySolution) : Prop :=
  ∀ φ : ScalarField, (∀ t x, (u.u t x - φ t x) ≤ 0) → HJEquation u.operators φ

def ViscositySupersolution (u : ViscositySolution) : Prop :=
  ∀ φ : ScalarField, (∀ t x, (u.u t x - φ t x) ≥ 0) → HJEquation u.operators φ

def ViscositySoulution (u : ViscositySolution) : Prop :=
  ViscositySubsolution u ∧ ViscositySupersolution u

theorem primitive_viscosity_solution_checks : ViscositySoulution primitiveSolution := by
  constructor
  · intro φ h
    unfold HJEquation
    simp [primitiveSolution, primitiveOperators, zeroScalarField]
  · intro φ h
    unfold HJEquation
    simp [primitiveSolution, primitiveOperators, zeroScalarField]

end ViscositySolutionsHamiltonJacobiEquationsCanonicalLaneLean
end HautevilleHouse